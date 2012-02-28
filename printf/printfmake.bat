:: printfmake.bat
@echo off
as printf.asm -o printf.o
ld -o printf.exe --subsystem console printf.o -lkernel32 -lmsvcrt