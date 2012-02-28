We take the code to display a message box (`../box`), turn it into a function and
wrap it in a DLL, whose code is in file `dlldll.asm`. `dlldllmake.bat` makes the
.dll file.

To use the DLL, we can either load the DLL at load-time (when the executable is
loaded into memory) or at run-time (at some point during the execution). The
code to load the dll at load-time is in `dllload.asm`, the code to load at
run-time is in `dllrun.asm`. The respective `*make.bat` file generate the
corresponding executable.