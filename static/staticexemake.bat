:: staticexemake.bat
@echo off
as dllload.asm -o dllload.o
ld dllload.o -o staticexe.exe --subsystem windows -L. -lstatic -lkernel32 -luser32