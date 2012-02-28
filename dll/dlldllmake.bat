:: dlldllmake.bat
@echo off
as dlldll.asm -o dlldll.o
:: Create the DLL and the import library (.a) needed to link against the DLL.
ld -shared -o dlldll.dll dlldll.a dlldll.o -luser32