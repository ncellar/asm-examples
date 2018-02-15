I dabbled a tiny little bit in assembly, mostly for my own enjoyment. Here are a
few exemples I made that use the Win32 API and the C standard library.

You should know what assembler is already and have some notions about it : the
basic instructions, the registers, calling conventions (cdecl / stdcall) and
their stack frames and entry/exit sequences).

All my examples use the GNU assembler (gas) and the GNU toolchain. It is free
software and available on all three major platforms (Unix, Windows and Mac).

On Windows, you can get the tools by installing mingw (minimalist GNU for
Windows) then make sure that mingw\bin is added to the %PATH% environment
variable. In particular the tools we will use to program in assembler form the
core of what is called the "binutils".

I will use the following conventions in the documentation of my assemby
"functions":

- `%eax ->` means that %eax is an input of the function.
- `-> %eax` means that %eax is an output of the function.
- `~~ %eax` means that %eax is modified by the function
    (but is neither an input or an output).

Contents
================================================================================

1. `box      ` Windows Dialog in Assembler
2. `console  ` Windows Console Message in Assembler with win32 API
3. `printf   ` Windows Console Message in Assembler with C Standard Library
4. `dll      ` Producing a DLL from Assembler
5. `shared   ` Shared Memory in DLLs and Executables
6. `static   ` Producing a static library from Assembler

Assembly Links
================================================================================

Reference
--------------------------------------------------------------------------------

- [x86 Architecture](http://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture)
- [GAS Syntax](http://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax)
- [x86 Instructions Reference](http://ref.x86asm.net/)
- [x86 Instructions Description](http://home.comcast.net/~fbui/intel.html)
- [x86 Instructions Description (alt)](http://home.myfairpoint.net/fbkotler/nasmdocc.html)
- [win32 API calls](http://msdn.microsoft.com/en-us/windows/ff404219)
- [win32 API calls export names](http://homepage.mac.com/randyhyde/webster.cs.ucr.edu/Win32Asm/win32API.html)
- [binutils documentation](http://sourceware.org/binutils/)

Explanations & Tutorial
--------------------------------------------------------------------------------

- [x86 Instructions Size](http://www.swansontec.com/sintel.html)
- [Picking x86 Registers](http://www.swansontec.com/sregisters.html)
- [win32api in mingw](http://uglyhunk.in/articles/assembly/)

Linkers
--------------------------------------------------------------------------------

- [Linkers and Loaders](http://www.linuxjournal.com/article/6463) (simple)
- [Linkers by Ian Lance Taylor](http://www.airs.com/blog/index.php?s=linkers)
  (thorough)
- [File extensions used in linking](http://stackoverflow.com/questions/6422478/linking-a-lib-and-def-files)
