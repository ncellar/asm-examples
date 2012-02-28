@echo off
as dllload.asm -o dllload.o
ld dllload.o -o dllload.exe --subsystem windows -lkernel32 -L. -ldlldll