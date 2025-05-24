unsafe extern "C" {
    fn onTerminate();
}

pub fn on_terminate() {
    println!("\x1b[31mfatal error:\x1b[97m crashed in rust\x1b[0m");
    unsafe {
        onTerminate();
    }
}
