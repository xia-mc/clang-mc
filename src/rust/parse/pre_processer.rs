use crate::objects::matrix_stack::MatrixStack;
use std::cell::{Ref, RefCell};
use std::collections::{HashMap, HashSet};
use std::fs::File;
use std::io::Read;
use std::path::{Path, PathBuf};
use std::rc::Rc;
use regex::Regex;

/// 目标文件 → (宏名 → (形参列表, 展开体))
type FuncMacroMap = HashMap<PathBuf, HashMap<String, (Vec<String>, String)>>;

/// 兼容对象宏 + 函数宏 + 多行宏的预处理器
#[derive(Clone)]
pub struct PreProcesser {
    include_dirs: RefCell<Vec<PathBuf>>,
    targets: Rc<RefCell<Vec<(PathBuf, String)>>>,
    processing: Rc<RefCell<HashSet<PathBuf>>>,
    defines: Rc<RefCell<HashMap<PathBuf, HashMap<String, String>>>>,
    func_macros: Rc<RefCell<FuncMacroMap>>,
    include_once: Rc<RefCell<HashSet<PathBuf>>>,
    bypass_include: Rc<RefCell<HashMap<PathBuf, HashSet<PathBuf>>>>,
}

impl PreProcesser {
    /* ---------- 构造 / 共享 ---------- */
    pub fn new() -> Self {
        Self {
            include_dirs: RefCell::new(Vec::new()),
            targets: Rc::new(RefCell::new(Vec::new())),
            processing: Rc::new(RefCell::new(HashSet::new())),
            defines: Rc::new(RefCell::new(HashMap::new())),
            func_macros: Rc::new(RefCell::new(HashMap::new())),
            include_once: Rc::new(RefCell::new(HashSet::new())),
            bypass_include: Rc::new(RefCell::new(HashMap::new())),
        }
    }
    pub fn clone(&self) -> Self {
        Self {
            include_dirs: self.include_dirs.clone(),
            targets: self.targets.clone(),
            processing: self.processing.clone(),
            defines: self.defines.clone(),
            func_macros: self.func_macros.clone(),
            include_once: self.include_once.clone(),
            bypass_include: self.bypass_include.clone(),
        }
    }

    /* ---------- 公开 API：输入 ---------- */
    pub fn add_include(&mut self, p: PathBuf) -> i32 {
        self.include_dirs.get_mut().push(p);
        0
    }
    pub fn add_target(&mut self, p: PathBuf) -> i32 {
        self.targets.borrow_mut().push((p.clone(), String::new()));
        self.defines.borrow_mut().insert(p.clone(), HashMap::new());
        self.func_macros.borrow_mut().insert(p.clone(), HashMap::new());
        self.bypass_include.borrow_mut().insert(p, HashSet::new());
        0
    }
    pub fn add_target_string(&mut self, p: String) -> i32 {
        self.targets.borrow_mut().push((PathBuf::new(), p));
        self.defines.borrow_mut().insert(PathBuf::new(), HashMap::new());
        self.func_macros.borrow_mut().insert(PathBuf::new(), HashMap::new());
        self.bypass_include.borrow_mut().insert(PathBuf::new(), HashSet::new());
        0
    }
    pub fn load(&mut self) -> i32 {
        for (p, s) in self.targets.borrow_mut().iter_mut() {
            if !s.is_empty() {
                continue;
            }
            if File::open(p).and_then(|mut f| f.read_to_string(s)).is_err() {
                return 0xff0;
            }
        }
        0
    }

    /* ---------- 行预处理：拼接反斜杠续行 ---------- */
    fn logical_lines<'a>(&self, code: &'a str) -> Vec<String> {
        let mut it = code.lines().peekable();
        let mut out = Vec::new();
        while let Some(l) = it.next() {
            let mut merged = l.trim_end().to_string();
            while merged.ends_with('\\') {
                merged.pop(); // 去掉行尾 '\'
                merged.push('\n');
                if let Some(next) = it.next() {
                    merged.push_str(next.trim_end());
                } else {
                    break;
                }
            }
            out.push(merged.trim().to_string());
        }
        out
    }

    /* ---------- 工具：拆分 #define ---------- */
    /// 返回 (key, value)。对函数宏，key 含完整形参表 `(a,b)`。
    fn split_define(&self, s: &str) -> (String, String) {
        let mut depth = 0usize;
        for (i, ch) in s.char_indices() {
            match ch {
                '(' => depth += 1,
                ')' => if depth > 0 { depth -= 1 },
                ' ' | '\t' if depth == 0 => {
                    let key = s[..i].to_string();
                    let val = s[i + 1..].trim().to_string();
                    return (key, val);
                }
                _ => {}
            }
        }
        (s.to_string(), String::new())
    }

    /* ---------- 行内函数宏展开 ---------- */
    fn try_expand_func_macro(&self, tgt: &Path, line: &str) -> Option<String> {
        let open = line.find('(')?;
        if !line.ends_with(')') {
            return None;
        }
        let name = line[..open].trim();
        let args_raw = &line[open + 1..line.len() - 1];
        let args: Vec<String> = if args_raw.trim().is_empty() {
            vec![]
        } else {
            args_raw
                .split(',')
                .map(|s| s.trim().to_string())
                .collect()
        };

        let map_all = self.func_macros.borrow();
        let (params, body) = map_all.get(tgt)?.get(name)?;
        if params.len() != args.len() {
            return None;
        }

        let mut expanded = body.clone();
        for (p, a) in params.iter().zip(args.iter()) {
            expanded = expanded.replace(p, a);
        }
        Some(expanded)
    }

    fn try_expand_obj_macros(&self, tgt: &Path, line: &str) -> String {
        let defines = self.defines.borrow();
        let map = match defines.get(tgt) {
            Some(m) if !m.is_empty() => m,
            _ => return line.to_owned(),
        };

        let mut out = line.to_owned();
        for (k, v) in map {
            // (^|[\s,])KEY([\s,]|$)   —— 无任何 look-around
            let pat = format!(
                r"(?P<pre>(^|[\s,])){}(?P<post>([\s,]|$))",
                regex::escape(k)
            );
            let re = Regex::new(&pat).unwrap();
            out = re
                .replace_all(&out, |caps: &regex::Captures| {
                    // 保留左右边界字符（可能为空）
                    format!("{}{}{}", &caps["pre"], v, &caps["post"])
                })
                .into_owned();
        }
        out
    }

    /* ---------- include 辅助 ---------- */
    fn get_code(&self, tgt: &Path, pb: &PathBuf) -> Result<String, i32> {
        match File::open(pb) {
            Ok(mut f) => {
                let mut s = String::new();
                if f.read_to_string(&mut s).is_err() {
                    return Err(0xff2);
                }
                self.handle_target(tgt, pb.as_path(), &s)
            }
            Err(_) => Err(0xff3),
        }
    }
    fn get_include(
        &self,
        tgt: &Path,
        cur_file: &Path,
        file_str: &str,
    ) -> Option<(PathBuf, String)> {
        if let Some(parent) = cur_file.parent() {
            let p = parent.join(file_str);
            if let Ok(res) = self.get_code(tgt, &p) {
                return Some((p, res));
            }
        }
        for dir in self.include_dirs.borrow().iter() {
            let p = dir.join(file_str);
            if let Ok(res) = self.get_code(tgt, &p) {
                return Some((p, res));
            }
        }
        if file_str.ends_with(".mch") {
            return None;
        }
        self.get_include(tgt, cur_file, &format!("{}.mch", file_str))
    }

    /* ---------- 主处理流程 ---------- */
    fn handle_target(&self, tgt: &Path, cur: &Path, code: &String) -> Result<String, i32> {
        if self.processing.borrow().contains(cur) {
            return Err(0xff6);
        }
        self.processing.borrow_mut().insert(cur.to_path_buf());

        let mut ignore = false;
        let mut ignore_stack = MatrixStack::new();
        let mut out = String::new();

        for line in self.logical_lines(code) {
            /* ----- 普通行：宏展开/输出 ----- */
            if !line.starts_with('#') {
                if !ignore {
                    let mut processed = if let Some(exp) = self.try_expand_func_macro(tgt, &line) {
                        exp
                    } else {
                        line.to_owned()
                    };
                    processed = self.try_expand_obj_macros(tgt, &processed);
                    out.push_str(&processed);
                    out.push('\n');
                }
                continue;
            }

            /* ----- 指令行解析 ----- */
            let (op, params) =
                match line.find(' ').and_then(|p| if p == line.len() - 1 { None } else { Some(p) }) {
                    None => (&line[1..], ""),
                    Some(pos) => (&line[1..pos], &line[pos + 1..]),
                };

            match op {
                /* ---------- #include ---------- */
                "include" => {
                    if ignore {
                        continue;
                    }
                    if params.len() < 3 {
                        return Err(0xff7);
                    }
                    let first = &params[0..1];
                    let last = &params[params.len() - 1..];
                    let inner = if (first == "\"" && last == "\"") || (first == "<" && last == ">") {
                        &params[1..params.len() - 1]
                    } else {
                        return Err(0xff8);
                    };
                    match self.get_include(tgt, cur, inner) {
                        None => return Err(0xff9),
                        Some((file, code)) => {
                            if self.include_once.borrow().contains(file.as_path()) {
                                if self
                                    .bypass_include
                                    .borrow()
                                    .get(tgt)
                                    .unwrap()
                                    .contains(file.as_path())
                                {
                                    continue;
                                }
                                self.bypass_include
                                    .borrow_mut()
                                    .get_mut(tgt)
                                    .unwrap()
                                    .insert(file.clone());
                            }
                            out.push_str("#push line\n");
                            out.push_str(&format!(
                                "#line -1 \"{}\"\n",
                                file.to_str().unwrap_or("Unknown Source")
                            ));
                            out.push_str("#nowarn\n");
                            out.push_str(&code);
                            out.push_str("\n#pop line\n");
                        }
                    }
                }

                /* ---------- 条件编译 ---------- */
                "ifdef" | "ifndef" => {
                    if params.contains(char::is_whitespace) {
                        return Err(if op == "ifdef" { 0xffb } else { 0xffc });
                    }
                    ignore_stack.push_matrix(ignore);
                    let defined = self
                        .defines
                        .borrow()
                        .get(tgt)
                        .unwrap()
                        .contains_key(params.trim());
                    ignore = if op == "ifdef" { !defined } else { defined };
                }
                "endif" => {
                    if !params.is_empty() {
                        return Err(0xffd);
                    }
                    if ignore_stack.is_empty() {
                        return Err(0xffe);
                    }
                    ignore = ignore_stack.pop_matrix();
                }

                /* ---------- #define（对象/函数宏） ---------- */
                "define" => {
                    if ignore {
                        continue;
                    }
                    let (key, val) = self.split_define(params.trim());
                    if key.contains('(') && key.ends_with(')') {
                        /* ---- 函数宏 ---- */
                        let open = key.find('(').unwrap();
                        let name = key[..open].trim().to_string();
                        let params_part = &key[open + 1..key.len() - 1];
                        let plist: Vec<String> = if params_part.trim().is_empty() {
                            vec![]
                        } else {
                            params_part
                                .split(',')
                                .map(|s| s.trim().to_string())
                                .collect()
                        };
                        self.func_macros
                            .borrow_mut()
                            .get_mut(tgt)
                            .unwrap()
                            .insert(name, (plist, val));
                    } else {
                        /* ---- 对象宏 ---- */
                        if val.contains(char::is_whitespace) {
                            return Err(0xfff);
                        }
                        self.defines
                            .borrow_mut()
                            .get_mut(tgt)
                            .unwrap()
                            .insert(key, val);
                    }
                }

                /* ---------- #undef ---------- */
                "undef" => {
                    if ignore {
                        continue;
                    }
                    let k = params.trim();
                    if k.is_empty() {
                        return Err(0x1000);
                    }
                    self.defines.borrow_mut().get_mut(tgt).unwrap().remove(k);
                    self.func_macros
                        .borrow_mut()
                        .get_mut(tgt)
                        .unwrap()
                        .remove(k);
                }

                /* ---------- #once ---------- */
                "once" => {
                    if ignore {
                        continue;
                    }
                    self.include_once.borrow_mut().insert(PathBuf::from(cur));
                }
                
                _ => {}
            }
            out.push('\n');
        }

        if !ignore_stack.is_empty() {
            return Err(0x1001);
        }
        self.processing.borrow_mut().remove(cur);
        Ok(out)
    }

    /* ---------- 公开 API：处理 / 获取 ---------- */
    pub fn process(&mut self) -> i32 {
        for (p, c) in self.targets.borrow_mut().iter_mut() {
            match self.handle_target(p, p, c) {
                Ok(newc) => *c = newc,
                Err(e) if e != 0 => return e,
                _ => {}
            }
        }
        0
    }
    pub fn get_targets(&self) -> Ref<Vec<(PathBuf, String)>> {
        self.targets.borrow()
    }
    /// 仍 **只** 返回对象宏，保持旧 API
    pub fn get_defines(&self) -> Ref<HashMap<PathBuf, HashMap<String, String>>> {
        self.defines.borrow()
    }
}
