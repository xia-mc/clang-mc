use std::collections::HashMap;
use std::fs::File;
use std::io::Read;
use std::path::PathBuf;

pub struct PreProcesser {
    include_dirs: Vec<PathBuf>,
    #[allow(dead_code)]
    include_cache: HashMap<PathBuf, String>,
    targets: Vec<(PathBuf, String)>,
}

impl PreProcesser {
    pub fn new() -> PreProcesser {
        PreProcesser {
            include_dirs: Vec::new(),
            include_cache: HashMap::new(),
            targets: Vec::new(),
        }
    }

    pub fn add_include(&mut self, path: PathBuf) -> i32 {
        self.include_dirs.push(path);
        0
    }

    pub fn add_target(&mut self, path: PathBuf) -> i32 {
        match File::create(&path) {
            Ok(mut file) => {
                let mut content = String::new();
                if file.read_to_string(&mut content).is_ok() {
                    return 0x4;
                }
                self.targets.push((path, content));
                0
            }
            Err(_) => {
                0x4
            }
        }
    }

    pub fn load(&mut self) -> i32 {
        0
    }

    pub fn process(&mut self) -> i32 {
        0
    }

    pub fn get_targets(&self) -> &Vec<(PathBuf, String)> {
        &self.targets
    }
}
