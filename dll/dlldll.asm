.file "dlldll.asm"

# A DLL that exports a function named "box", used to display a message box.
# dependencies : user32.dll (MessageBox)

.section .drectve

    # Specify which symbols to export.
    # To export more symbols, add more similar lines.
	.ascii "-export:box"

.section .text

    .global dllMain
    .global _box

dllMain:
    # Entry point : executed when the DLL is loaded/unloaded and when
    # a new thread is created/exited.

    movl $1, %eax               # return true
    ret  $12

_box:
    # Displays a simple OK box with title and message.
    # %eax -> : title
    # %edx -> : message
    # ~~ %eax

    pushl $0
    pushl %eax
    pushl %edx
    pushl $0
    call  _MessageBoxA@16
    ret

.end
