use crate::native::native::on_terminate;
use crate::parse::pre_processer::PreProcesser;
use std::alloc::{alloc, dealloc, Layout};
use std::ffi::{c_char, c_void, CStr, CString};
use std::path::{Path, PathBuf};
use std::ptr::write;

pub type CPreProcesser = *mut c_void;
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Target {
    pub path: *mut c_char,
    pub code: *mut c_char,
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Targets {
    pub targets: *mut *mut Target,
    pub size: u32,
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Define {
    pub key: *mut c_char,
    pub value: *mut c_char,
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Defines {
    pub path: *mut c_char,
    pub values: *mut *mut Define,
    pub size: u32,
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct DefineMap {
    pub defines: *mut *mut Defines,
    pub size: u32,
}

fn as_processer(instance: CPreProcesser) -> &'static mut PreProcesser {
    if instance.is_null() {
        on_terminate();
    }

    unsafe { &mut *(instance as *mut PreProcesser) }
}

fn as_path(path: *const c_char) -> PathBuf {
    unsafe { PathBuf::from(CStr::from_ptr(path).to_str().unwrap()).to_path_buf() }
}

trait ToCString {
    fn to_cstring(&self) -> *mut c_char;
}

impl ToCString for str {
    fn to_cstring(&self) -> *mut c_char {
        CString::new(self.as_bytes()).unwrap().into_raw()
    }
}

impl ToCString for Path {
    fn to_cstring(&self) -> *mut c_char {
        CString::new(self.to_string_lossy().as_bytes())
            .unwrap()
            .into_raw()
    }
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_New() -> CPreProcesser {
    Box::into_raw(Box::new(PreProcesser::new())) as CPreProcesser
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_Clone(instance: CPreProcesser) -> CPreProcesser {
    assert!(!instance.is_null());
    Box::into_raw(Box::new(as_processer(instance).clone())) as CPreProcesser
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_Free(instance: CPreProcesser) {
    if !instance.is_null() {
        unsafe {
            let _ = Box::from_raw(instance as *mut PreProcesser);
        }
    }
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_AddIncludeDir(instance: CPreProcesser, path: *const c_char) -> i32 {
    assert!(!instance.is_null());
    as_processer(instance).add_include(as_path(path))
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_AddTarget(instance: CPreProcesser, path: *const c_char) -> i32 {
    assert!(!instance.is_null());
    as_processer(instance).add_target(as_path(path))
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_Load(instance: CPreProcesser) -> i32 {
    assert!(!instance.is_null());
    as_processer(instance).load()
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_Process(instance: CPreProcesser) -> i32 {
    assert!(!instance.is_null());
    as_processer(instance).process()
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_GetTargets(
    instance: CPreProcesser,
    result: *mut *mut Targets,
) -> i32 {
    assert!(!instance.is_null());
    let processer = as_processer(instance);
    let targets = processer.get_targets();
    let size = targets.len();

    let layout = match Layout::array::<*mut Target>(size) {
        Ok(l) => l,
        Err(_) => return 0x1002,
    };

    unsafe {
        let cTargets = alloc(layout) as *mut *mut Target;

        for (i, (path, code)) in targets.iter().enumerate() {
            let cPath: *mut c_char = path.to_cstring();
            let cCode: *mut c_char = code.to_cstring();

            write(
                cTargets.add(i),
                Box::into_raw(Box::new(Target {
                    path: cPath,
                    code: cCode,
                })),
            );
        }

        write(
            result,
            Box::into_raw(Box::new(Targets {
                targets: cTargets,
                size: size as u32,
            })),
        );
    }
    0
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_GetDefines(
    instance: CPreProcesser,
    result: *mut *mut DefineMap,
) -> i32 {
    assert!(!instance.is_null());
    let processer = as_processer(instance);
    let defineMap = processer.get_defines();
    let size = defineMap.len();

    let layout = match Layout::array::<*mut Defines>(size) {
        Ok(l) => l,
        Err(_) => return 0x1003,
    };

    unsafe {
        let cDefines = alloc(layout) as *mut *mut Defines;
        for (i, (path, defines)) in defineMap.iter().enumerate() {
            let valuesLayout = Layout::array::<*const Define>(defines.len()).unwrap();
            let cPath: *mut c_char = path.to_cstring();

            let cValues = alloc(valuesLayout) as *mut *mut Define;
            for (i, (key, value)) in defines.iter().enumerate() {
                write(
                    cValues.add(i),
                    Box::into_raw(Box::new(Define {
                        key: key.to_cstring(),
                        value: value.to_cstring(),
                    })),
                )
            }

            write(
                cDefines.add(i),
                Box::into_raw(Box::new(Defines {
                    path: cPath,
                    values: cValues,
                    size: defines.len() as u32,
                })),
            )
        }
        write(
            result,
            Box::into_raw(Box::new(DefineMap {
                defines: cDefines,
                size: size as u32,
            })),
        );
    }
    0
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_FreeTargets(instance: CPreProcesser, cTargets: *mut Targets) {
    assert!(!instance.is_null());

    if cTargets.is_null() {
        return;
    }

    unsafe {
        let targets = &*cTargets;
        let layout = Layout::array::<*const Target>(targets.size as usize).unwrap();

        for i in 0..targets.size {
            let cTarget = *targets.targets.add(i as usize);
            let target = &*cTarget;
            for ptr in [target.path, target.code] {
                if ptr.is_null() {
                    continue;
                }

                drop(CString::from_raw(ptr as *mut c_char));
            }
            drop(Box::from_raw(cTarget));
        }

        dealloc(targets.targets as *mut u8, layout);
        drop(Box::from_raw(cTargets));
    }
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_FreeDefines(instance: CPreProcesser, cDefineMap: *mut DefineMap) {
    assert!(!instance.is_null());

    if cDefineMap.is_null() {
        return;
    }

    unsafe {
        let defineMap = &*cDefineMap;
        let size = defineMap.size;
        let layout = Layout::array::<*const Defines>(size as usize).unwrap();

        for i in 0..size {
            let cDefines = *defineMap.defines.add(i as usize);
            let defines = &*cDefines;

            let valuesLayout = Layout::array::<*const Define>(defines.size as usize).unwrap();
            for j in 0..defines.size {
                let cDefine = *defines.values.add(j as usize);
                let define = &*cDefine;
                drop(CString::from_raw(define.key));
                drop(CString::from_raw(define.value));
                drop(Box::from_raw(cDefine));
            }
            dealloc(defines.values as *mut u8, valuesLayout);
            drop(Box::from_raw(cDefines));
        }

        dealloc(defineMap.defines as *mut u8, layout);
        drop(Box::from_raw(cDefineMap));
    }
}
