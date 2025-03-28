#![no_main]
#![no_builtins]

use std::panic::set_hook;
use crate::native::native::on_terminate;

mod native;
mod parse;


#[allow(non_snake_case)]
#[unsafe(no_mangle)]
pub extern "C" fn ClRust_Init() {
    set_hook(Box::new(|_panic_info| {
        on_terminate()
    }));
}
