use crate::native::native::on_terminate;
use crate::parse::pre_processer::PreProcesser;
use std::alloc::{alloc, Layout};
use std::ffi::{c_char, c_void, CStr, CString};
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
pub extern "C" fn ClPreProcess_BeginGetSource(instance: CPreProcesser) -> u32 {
    assert!(!instance.is_null());
    as_processer(instance).get_targets().len() as u32
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_GetPaths(instance: CPreProcesser) -> *mut *const c_char {
    assert!(!instance.is_null());
    let processer = as_processer(instance);
    let targets = processer.get_targets();
    let size = targets.len();

    let layout = match Layout::array::<*const c_char>(size) {
        Ok(l) => l,
        Err(_) => return null_mut(),
    };

    unsafe {
        let result = alloc(layout) as *mut *const c_char;

        for (i, (path, _)) in targets.iter().enumerate() {
            let cstr = match CString::new(path.to_string_lossy().as_bytes()) {
                Ok(cstr) => cstr,
                Err(_) => return null_mut(), // 含有 null 字节，不合法
            };

            let leaked_ptr = cstr.into_raw(); // -> *mut c_char
            write(result.add(i), leaked_ptr as *const c_char);
        }

        result
    }
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_GetCodes(instance: CPreProcesser) -> *mut *const c_char {
    assert!(!instance.is_null());
    let processer = as_processer(instance);
    let targets = processer.get_targets();
    let size = targets.len();

    let layout = match Layout::array::<*const c_char>(size) {
        Ok(l) => l,
        Err(_) => return null_mut(),
    };

    unsafe {
        let result = alloc(layout) as *mut *const c_char;

        for (i, (_, code)) in targets.iter().enumerate() {
            let cstr = match CString::new(code.as_bytes()) {
                Ok(cstr) => cstr,
                Err(_) => return null_mut(), // 含有 null 字节，不合法
            };

            let leaked_ptr = cstr.into_raw(); // -> *mut c_char
            write(result.add(i), leaked_ptr as *const c_char);
        }

        result
    }
}

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClPreProcess_EndGetSource(_instance: CPreProcesser, paths: *mut *const c_char, codes: *mut *const c_char, size: u32) {
    for ptr in [paths, codes] {
        if ptr.is_null() {
            return;
        }

        unsafe {
            for i in 0..size {
                let cstr_ptr = *ptr.add(i as usize) as *mut c_char;
                if !cstr_ptr.is_null() {
                    // 回收 CString
                    drop(CString::from_raw(cstr_ptr));
                }
            }

            // 释放字符串指针数组本身
            let layout = Layout::array::<*const c_char>(size as usize).unwrap();
            std::alloc::dealloc(ptr as *mut u8, layout);
        }
    }
}
