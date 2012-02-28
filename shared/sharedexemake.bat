:: sharedexemake.bat
@echo off
as sharedexe.asm -o sharedexe.o
ld sharedexe.o -o sharedexe.exe --subsystem console -lkernel32 -L. -lshareddll