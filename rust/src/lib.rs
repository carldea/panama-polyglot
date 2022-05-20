use std::process;

#[no_mangle]
pub extern "C" fn rust_get_pid() -> u32 {
  return process::id();
}
