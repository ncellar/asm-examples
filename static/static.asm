.file "static.asm"

# Static library for displaying a message box on Windows.
# dependencies : kernel32.dll (ExitProcess), user32.dll (MessageBox)

.section .data

    title:   .asciz "Norswap's Box"
    message: .asciz "This was a triumph."

.section .text

    .global box

box:
    # display box
    pushl $0                # null : no owner window
    pushl $title
    pushl $message
    pushl $0                # MB_OK : only OK button
    call  _MessageBoxA@16
    ret

.end
