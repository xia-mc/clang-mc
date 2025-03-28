unsafe extern "C" {
    fn onTerminate();
}

pub fn on_terminate() {
    println!("Warning: crashed in rust");
    unsafe {
        onTerminate();
    }
}
