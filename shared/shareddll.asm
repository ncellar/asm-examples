.file "shareddll.asm"

# A dll with a variable that will be shared between process using the dll.
# dependencies : microsoft C runtime

.section data

    format: .asciz "value : %d\n"
    dummy:  .asciz "x"          # doesn't work if empty or whitespace

.section shared, "bs"

    var:    .int 0

.section .drectve

	.ascii " -export:incp"

.section .text

    .global dllMain
    .global _incp

dllMain:
    movl  $1, %eax
    ret

_incp:
    # Increment and print the shared variable.
    # ~~ everything

    incl  (var)                 # increment counter

    pushl $dummy                # wait for input
    call  _scanf
    addl  $4, %esp

    pushl (var)                 # display value
    pushl $format
    call  _printf
    addl  $8, %esp

    ret

.end
