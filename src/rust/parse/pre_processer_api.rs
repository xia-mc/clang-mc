use crate::native::native::on_terminate;
use crate::parse::pre_processer::PreProcesser;
use std::alloc::{alloc, Layout};
use std::ffi::{c_char, c_void, CStr};
use std::path::PathBuf;
use std::ptr::{null_mut, write};

type CPreProcesser = *mut c_void;

#[inline]
fn as_processer(instance: CPreProcesser) -> &'static mut PreProcesser {
    if instance.is_null() {
        on_terminate();
    }

    unsafe { &mut *(instance as *mut PreProcesser) }
}

#[inline]
fn as_path(path: *const c_char) -> PathBuf {
    unsafe {
        PathBuf::from(CStr::from_ptr(path).to_str().unwrap()).to_path_buf()
    }
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_New() -> CPreProcesser {
    Box::into_raw(Box::new(PreProcesser::new())) as CPreProcesser
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
pub extern "C" fn ClPreProcess_BeginGetSource(instance: CPreProcesser) -> u32 {
    assert!(!instance.is_null());
    as_processer(instance).get_targets().len() as u32
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_GetCodes(instance: CPreProcesser) -> *mut *const c_char {
    assert!(!instance.is_null());
    let processer = as_processer(instance);
    let size = processer.get_targets().len();
    let layout = match Layout::from_size_align(size, 16) {
        Ok(result) => result,
        Err(_) => return null_mut(),
    };

    unsafe {
        let result = alloc(layout) as *mut *const c_char;

        let targets = processer.get_targets();
        for i in 0..size {
            debug_assert!(targets.get(i).is_some());
            let code = &targets.get(i).unwrap().1;
            write(result.add(i), code.as_ptr() as *const c_char);
        }
        result
    }
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_GetPaths(instance: CPreProcesser) -> *mut *const c_char {
    assert!(!instance.is_null());
    let processer = as_processer(instance);
    let size = processer.get_targets().len();
    let layout = match Layout::from_size_align(size, 16) {
        Ok(result) => result,
        Err(_) => return null_mut(),
    };

    unsafe {
        let result = alloc(layout) as *mut *const c_char;

        let targets = processer.get_targets();
        for i in 0..size {
            debug_assert!(targets.get(i).is_some());
            let path = &targets.get(i).unwrap().0;
            write(result.add(i), path.to_string_lossy().as_ptr() as *const c_char);
        }
        result
    }
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_EndGetSource(_instance: CPreProcesser) {
}
