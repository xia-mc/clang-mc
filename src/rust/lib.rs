#![no_main]
#![no_builtins]

use std::panic::{catch_unwind, set_hook};
use std::process::abort;
use crate::native::native::on_terminate;

mod native;
mod parse;
mod objects;

#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClRust_Init() {
    set_hook(Box::new(|_panic_info| {
        println!("\x1b[31mfatal error:\x1b[97m {}\x1b[0m", _panic_info.to_string());
        let _ = catch_unwind(|| {});
        on_terminate();
        abort();
    }));
}
