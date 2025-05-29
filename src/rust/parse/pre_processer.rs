use std::cell::{RefCell, RefMut};
use std::collections::{HashMap, HashSet};
use std::fs::File;
use std::io::Read;
use std::path::{Path, PathBuf};
use std::rc::Rc;
use crate::objects::matrix_stack::MatrixStack;

pub struct PreProcesser {
    include_dirs: RefCell<Vec<PathBuf>>,
    include_cache: Rc<RefCell<HashMap<PathBuf, Rc<String>>>>,
    targets: Rc<RefCell<Vec<(PathBuf, String)>>>,
    processing: Rc<RefCell<HashSet<PathBuf>>>,
    defines: Rc<RefCell<HashMap<PathBuf, HashMap<String, String>>>>,
    include_once: Rc<RefCell<HashSet<PathBuf>>>,
    bypass_include: Rc<RefCell<HashMap<PathBuf, HashSet<PathBuf>>>>,
}

impl PreProcesser {
    pub fn new() -> PreProcesser {
        PreProcesser {
            include_dirs: RefCell::new(Vec::new()),
            include_cache: Rc::new(RefCell::new(HashMap::new())),
            targets: Rc::new(RefCell::new(Vec::new())),
            processing: Rc::new(RefCell::new(HashSet::new())),
            defines: Rc::new(RefCell::new(HashMap::new())),
            include_once: Rc::new(RefCell::new(HashSet::new())),
            bypass_include: Rc::new(RefCell::new(HashMap::new())),
        }
    }

    pub fn clone(&self) -> PreProcesser {
        PreProcesser {
            include_dirs: self.include_dirs.clone(),
            include_cache: self.include_cache.clone(),
            targets: self.targets.clone(),
            processing: self.processing.clone(),
            defines: self.defines.clone(),
            include_once: self.include_once.clone(),
            bypass_include: self.bypass_include.clone(),
        }
    }

    pub fn add_include(&mut self, path: PathBuf) -> i32 {
        self.include_dirs.get_mut().push(path);
        0
    }

    pub fn add_target(&mut self, path: PathBuf) -> i32 {
        self.targets.borrow_mut().push((path.clone(), String::new()));
        self.defines.borrow_mut().insert(path.clone(), HashMap::new());
        self.bypass_include.borrow_mut().insert(path, HashSet::new());
        0
    }

    pub fn load(&mut self) -> i32 {
        for (path, str) in self.targets.borrow_mut().iter_mut() {
            match File::open(path) {
                Ok(mut file) => {
                    if file.read_to_string(str).is_err() {
                        return 0xff0;
                    }
                }
                Err(_) => {
                    return 0xff1;
                }
            }
        }
        0
    }

    fn get_code(&self, target: &Path, path: &PathBuf) -> Result<String, i32> {
        if self.include_cache.borrow().get(path.as_path()).is_none() {
            match File::open(&path) {
                Ok(mut file) => {
                    let mut str = String::new();
                    if file.read_to_string(&mut str).is_err() {
                        return Err(0xff2);
                    }

                    self.include_cache.borrow_mut().insert(path.clone(), Rc::from(str));
                }
                Err(_) => {
                    return Err(0xff3);
                }
            }
        }

        match self.handle_target(target, path.as_path(), self.include_cache.borrow().get(path.as_path()).unwrap()) {
            Ok(res) => {
                Ok(res)
            }
            Err(err) => {
                Err(err)
            }
        }
    }

    fn get_include(&self, target: &Path, cur_file: &Path, file_str: &str) -> Option<(PathBuf, String)> {
        match cur_file.parent() {
            None => {}
            Some(parent) => {
                let path = parent.join(file_str);
                if let Ok(result) = self.get_code(target, &path) {
                    return Some((path, result));
                }
            }
        }

        for begin in self.include_dirs.borrow().iter() {
            let path = begin.join(file_str);
            if let Ok(result) = self.get_code(target, &path) {
                return Some((path, result));
            }
        }

        if file_str.ends_with(".mch") {
            return None;
        }
        self.get_include(target, cur_file, format!("{}.mch", file_str).as_str())
    }

    fn handle_target(&self, target: &Path, path: &Path, code: &String) -> Result<String, i32> {
        let path_buf = path.to_path_buf();
        if self.processing.borrow().contains(&path_buf) {
            return Err(0xff6);
        }
        self.processing.borrow_mut().insert(path_buf.clone());

        let mut ignore = false;
        let mut ignore_stack = MatrixStack::new();
        let mut result = String::new();
        for line in code.lines() {
            if !line.starts_with('#') {
                if !ignore {
                    result.push_str(line);
                    result.push('\n');
                }
                continue;
            }

            let op;
            let mut params;
            match line.find(' ').and_then(|pos|
                if pos == line.len() - 1 { None } else { Some(pos) }) {
                None => {
                    op = &line[1..];
                    params = "";
                }
                Some(pos) => {
                    op = &line[1..pos];
                    params = &line[pos + 1..];
                }
            };

            match op {
                "include" => {
                    if ignore { continue }
                    if params.len() < 3 {
                        return Err(0xff7);
                    }
                    let first = &params[0..1];
                    let last = &params[params.len() - 1..params.len()];
                    if (first == "\"" && last == "\"") || (first == "<" && last == ">") {
                        params = &params[1..params.len() - 1];
                    } else {
                        return Err(0xff8);
                    }

                    match self.get_include(target, path, params) {
                        None => {
                            return Err(0xff9);
                        }
                        Some((file, code)) => {
                            if self.include_once.borrow().contains(file.as_path()) {
                                if self.bypass_include.borrow().get(target).unwrap().contains(file.as_path()) {
                                    continue;
                                }
                                self.bypass_include.borrow_mut().get_mut(target).unwrap().insert(file.clone());
                            }

                            result.push_str("#push\n");
                            result.push_str(format!("#line -1 \"{}\"\n", file.to_str().unwrap_or("Unknown Source")).as_str());
                            result.push_str("#nowarn\n");
                            result.push_str(&code);
                            result.push_str("\n#pop");
                        }
                    }
                }
                "ifdef" => {
                    if params.contains(char::is_whitespace) {
                        return Err(0xffb);
                    }

                    ignore_stack.push_matrix(ignore);
                    if !self.defines.borrow().get(target).unwrap().contains_key(params.trim()) {
                        ignore = true;
                    } else {
                        ignore = false;
                    }
                }
                "ifndef" => {
                    if params.contains(char::is_whitespace) {
                        return Err(0xffc);
                    }

                    ignore_stack.push_matrix(ignore);
                    if self.defines.borrow().get(target).unwrap().contains_key(params.trim()) {
                        ignore = true;
                    } else {
                        ignore = false;
                    }
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
                "define" => {
                    if ignore { continue }

                    let key: String;
                    let value: String;
                    match params.find(' ').and_then(|pos|
                        if pos == params.len() - 1 { None } else { Some(pos) }) {
                        None => {
                            key = params.trim().to_string();
                            value = String::new();
                        }
                        Some(pos) => {
                            key = params[..pos].trim().to_string();
                            value = params[pos + 1..].trim().to_string();
                        }
                    };
                    if value.contains(char::is_whitespace) {
                        return Err(0xfff);
                    }

                    self.defines.borrow_mut().get_mut(target).unwrap().insert(key, value);
                }
                "undef" => {
                    if ignore { continue }
                    let key = params.trim();
                    if key.is_empty() {
                        return Err(0x1000);
                    }
                    self.defines.borrow_mut().get_mut(target).unwrap().remove(key);
                }
                "once" => {
                    if ignore { continue }
                    self.include_once.borrow_mut().insert(PathBuf::from(path));
                }
                _ => {
                    return Err(0xffa);
                }
            }
            result.push_str("\n");
        }

        if !ignore_stack.is_empty() {
            return Err(0x1001)
        }

        self.processing.borrow_mut().remove(&path_buf);
        Ok(result)
    }

    pub fn process(&mut self) -> i32 {
        for (path, code) in self.targets.borrow_mut().iter_mut() {
            match self.handle_target(path, path, code) {
                Ok(new_code) => {
                    *code = new_code;
                }
                Err(err) => {
                    if err != 0 {
                        return err;
                    }
                }
            }
        }
        0
    }

    pub fn get_targets(&self) -> RefMut<Vec<(PathBuf, String)>> {
        self.targets.borrow_mut()
    }
}
