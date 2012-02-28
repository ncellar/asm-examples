:: staticmake.bat
@echo off
as static.asm -o static.o
:: r is "insert", c is "create", s is "index"
ar rcs libstatic.a static.o