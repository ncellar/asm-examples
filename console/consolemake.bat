:: consolemake.bat
@echo off
as console.asm -o console.o
ld console.o -o console.exe --subsystem console -lkernel32
