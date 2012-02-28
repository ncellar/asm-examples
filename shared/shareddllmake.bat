:: shareddllmake.bat
@echo off
as shareddll.asm -o shareddll.o
ld -shared -o shareddll.dll shareddll.o -lmsvcrt