.file "console.asm"

# Prints a console message on Windows using the win32 api.
# dependencies : kernel32.dll (all calls)

     # Number of the console output handle.
    .set conout, -12

.section .data

    message: .asciz "This was a triumph.\n"
    handle:  .int 0             # standard output handle

.section .text

    .global _start

_start:

    # get console handle
    pushl $conout
    call  _GetStdHandle@4
    movl  %eax, handle

    movl  $message, %edi
    call  _strlen
    call  _str_cons

    pushl $0
    call  _ExitProcess@4

_death:
    mov (%ecx), %eax
    pushl $0
    call  _ExitProcess@4

_strlen:
    # Returns the length of a null-terminated string (null not counted).
    # <- %edi : string pointer
    # -> %ecx : length
    # ~~ %eax

    pushl %edi

    movl  %ecx, %ecx
    xorb  %al, %al
    notl  %ecx                  # ecx = int_max
    repne scasb                 # decrement ecx for each byte up to null
    notl  %ecx                  # ecx = int_max - ecx
    decl  %ecx                  # undo the decrement for the null byte

    popl  %edi
    ret

_str_cons:
    # Writes a string to the console whose handle is in $handle.
    # <- %edi : string pointer
    # <- %ecx : string length
    # ~~ %ebp, %ebx

    movl  %esp, %ebp
    subl  $4, %esp              # where to put nb of bytes written

    pushl $0                    # null pointer to asynchronous I/O struct
    lea   -4(%ebp), %ebx
    pushl %ebx
    pushl %ecx
    pushl %edi
    pushl handle
    call _WriteFile@20

    addl  $4, %esp
    ret

.end
