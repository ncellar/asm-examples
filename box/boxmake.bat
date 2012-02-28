:: boxmake.bat
@echo off
as box.asm -o box.o
ld box.o -o box.exe --subsystem windows -luser32 -lkernel32
