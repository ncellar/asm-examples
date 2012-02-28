`static.asm` is a slighlty modified version of (`../box/box.asm`), replacing `_start`
with `box`. This is because on Unix, underscores are not prefixed before symbol
names, while on Windows they are. For some reason MinGW seems to follow the Unix
convention for static libraries but the Windows convention for DLLs.

You'll need to reuse `../dll/dllload.asm` to make the executable that will use
the static library. The code make of a static or dynamic library is indeed the
same.