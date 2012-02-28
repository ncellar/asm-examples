:: dllrunmake.bat
@echo off
:: Nothing about the DLL needs to be known at compile-time.
as dllrun.asm -o dllrun.o
ld dllrun.o -o dllrun.exe --subsystem windows -lkernel32
