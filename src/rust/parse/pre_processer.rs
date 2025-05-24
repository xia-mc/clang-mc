use std::cell::{RefCell, RefMut};
use std::collections::{HashMap, HashSet};
use std::fs::File;
use std::io::Read;
use std::path::{Path, PathBuf};
use std::rc::Rc;

pub struct PreProcesser {
    include_dirs: RefCell<Vec<PathBuf>>,
    include_cache: Rc<RefCell<HashMap<PathBuf, Rc<String>>>>,
    targets: Rc<RefCell<Vec<(PathBuf, String)>>>,
    processed: Rc<RefCell<Vec<PathBuf>>>,
    processing: Rc<RefCell<HashSet<PathBuf>>>,
}

impl PreProcesser {
    pub fn new() -> PreProcesser {
        PreProcesser {
            include_dirs: RefCell::new(Vec::new()),
            include_cache: Rc::new(RefCell::new(HashMap::new())),
            targets: Rc::new(RefCell::new(Vec::new())),
            processed: Rc::new(RefCell::new(Vec::new())),
            processing: Rc::new(RefCell::new(HashSet::new())),
        }
    }

    pub fn clone(&self) -> PreProcesser {
        PreProcesser {
            include_dirs: self.include_dirs.clone(),
            include_cache: self.include_cache.clone(),
            targets: self.targets.clone(),
            processed: self.processed.clone(),
            processing: self.processing.clone(),
        }
    }

    pub fn add_include(&mut self, path: PathBuf) -> i32 {
        self.include_dirs.get_mut().push(path);
        0
    }

    pub fn add_target(&mut self, path: PathBuf) -> i32 {
        self.targets.borrow_mut().push((path, String::new()));
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

    fn get_code(&self, path: PathBuf) -> Result<Rc<String>, i32> {
        if self.include_cache.borrow().get(&path).is_none() {
            match File::open(&path) {
                Ok(mut file) => {
                    let mut str = String::new();
                    if file.read_to_string(&mut str).is_err() {
                        return Err(0xff2);
                    }

                    match self.handle_target(path.as_path(), &str) {
                        Ok(result) => {
                            self.include_cache.borrow_mut().insert(path.clone(), Rc::new(result));
                        }
                        Err(err) => {
                            if err != 0 {
                                return Err(err);
                            }
                            self.include_cache.borrow_mut().insert(path.clone(), Rc::new(str));
                        }
                    };
                }
                Err(_) => {
                    return Err(0xff3);
                }
            }
        }

        let cache = self.include_cache.borrow();
        let result = cache.get(&path);
        match result {
            None => {
                Err(0xff4)
            }
            Some(value) => {
                Ok(value.clone())
            }
        }
    }

    fn get_include(&self, cur_file: &Path, file_str: &str) -> Option<Rc<String>> {
        let path = cur_file.join(file_str);
        if let Ok(result) = self.get_code(path) {
            return Some(result);
        }

        for begin in self.include_dirs.borrow().iter() {
            let path = begin.join(file_str);
            if let Ok(result) = self.get_code(path) {
                return Some(result);
            }
        }

        if file_str.ends_with(".mcasm") {
            return None;
        }
        if let Some(result) = self.get_include(cur_file, format!("{}.mcasm", file_str).as_str()) {
            return Some(result);
        }
        None
    }

    #[allow(unreachable_code)]
    fn handle_target(&self, path: &Path, code: &String) -> Result<String, i32> {
        let path_buf = path.to_path_buf();
        if self.processed.borrow().contains(&path_buf) {
            return Err(0xff5);
        }
        if self.processing.borrow().contains(&path_buf) {
            return Err(0xff6);
        }
        self.processing.borrow_mut().insert(path_buf.clone());

        let mut result = String::new();
        for line in code.lines() {
            if !line.starts_with('#') {
                result.push_str(line);
                result.push('\n');
                continue;
            }

            let op;
            let mut params;
            match line.find(' ').and_then(|pos|
                if pos == line.len() - 1 { None } else { Some(pos) }) {
                None => {
                    op = line;
                    params = "";
                }
                Some(pos) => {
                    op = &line[1..pos];
                    params = &line[pos + 1..];
                }
            };

            match op {
                "include" => {
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
                    match self.get_include(path, params) {
                        None => {
                            return Err(0xff9);
                        }
                        Some(code) => {
                            result.push_str(&**code);
                            continue;
                        }
                    }
                }
                _ => {
                    return Err(0xffa);
                }
            }

            result.push_str(line);
            result.push('\n');
        }

        self.processing.borrow_mut().remove(&path_buf);
        self.processed.borrow_mut().push(path_buf);
        Ok(result)
    }

    pub fn process(&mut self) -> i32 {
        for (path, code) in self.targets.borrow_mut().iter_mut() {
            match self.handle_target(path, code) {
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
