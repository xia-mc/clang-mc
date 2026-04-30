# libc (C implementation)

This directory contains a C libc subset for the clang-mc C pipeline.

Implementation policy:
- Prefer copying/adapting proven picolibc implementations.
- `setjmp`/`longjmp`: intentionally not implemented.
- `threads.h`: intentionally not implemented; mcasm has no threads/processes and all mcasm instructions are atomic.
- `time.h`: intentionally not implemented for now; real wall-clock/process time needs a syscall/runtime time source.
- `fenv.h`: intentionally not implemented for now; the current soft-float runtime does not maintain a complete floating-point environment.
- Filesystem stdio functions: intentionally disabled; kept as commented placeholders in `stdio/fs_disabled.c`.
- Locale support is fixed to the C/POSIX locale. There is no multi-language locale database.
- `stdatomic.h` maps atomic operations to ordinary object operations. This is intentional: mcasm has no threads/processes and all instructions are atomic, so the atomics add no extra synchronization or fence behavior.
- Alignment note: 4-byte alignment is the efficient baseline on mcasm. Higher alignment does not improve or reduce performance, while addresses not divisible by 4 are much slower.

Current layout:
- `include/`: minimal headers for currently implemented libc subset.
- `ctype/`: ASCII/C-locale character classification and case conversion (`ctype.h`).
- `inttypes/`: `intmax_t` helpers and conversions.
- `locale/`: fixed C/POSIX locale support.
- `math/` and `complex/`: freestanding math/complex subset.
- `signal/`: synchronous library-level signal handlers (`signal.h`); no OS/asynchronous signal delivery.
- `wchar/`: ASCII/C-locale wide and UTF character helpers.
- `string/`: split-by-function string/memory primitives (copied from picolibc style), including token/search helpers (`strtok_r`, `strstr`, `memmem`, etc.).
- `stdlib/`: `abs/labs/atoi/atol/strtol/strtoul/itoa/gcvt/gcvt_fast` + tiny allocator (`malloc_tiny.c`) + `errno` storage.
  `gcvt` uses Ryu-based conversion for higher numeric fidelity; `gcvt_fast` keeps the lightweight path.
- `stdio/`: working `printf` family (`printf/vprintf/snprintf/vsnprintf/sprintf/vsprintf`) and `puts/putchar`.
  Current formatter focus: integer/pointer/string (`%d/%i/%u/%x/%X/%o/%p/%c/%s/%%`, width/precision/flags subset).
  `stdout` path currently depends on `puts` (line-based output primitive), with a single shared line buffer used by both `putchar` and `vprintf`.
