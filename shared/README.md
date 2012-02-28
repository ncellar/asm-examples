`shareddll.asm` implements a dll that can be shared between multiple
executables. Code for such an executable is in `sharedexe.dll`.

Test on cygwin with :

    ./sharedexe.exe | ./sharedexe.exe | ./sharedexe.exe

Or on cmd.exe with :

   sharedexe.exe | sharedexe.exe | sharedexe.exe

You should press enter after launching the command, then "value : 3" should be
displayed. The code is a bit messy and rely on the fact that the time it takes
you to press enter will allow all three programs to run to completion.

At first I wished to insert a prompt, something like "Press any key to
continue.", but because of the output buffering operated by printf, it is
possible for scanf to be executed before the prompt was displayed. The problem
could have been solved by using `fflush()`, but accessing stdout from assembler
proved to be very ugly (we need to call the implementation-defined function
`__iob_func()` to get an address, then index the second pointer stored in memory
after this address).

Note that I'm also not to sure if calling `scanf("x");` is actually legal, but it
does work in this case.
