assume cs:code,ds:data

data segment
    pa equ 20a0h
    pb equ 20a1h
    pc equ 20a2h
    cr equ 20a3h
    data ends
code segment
    start:
    mov ax,data
    mov ds,ax
    
    mov dx,cr
    mov al,80h
    out dx,al
    
    mov cx,100d
    mov al,88h
    mov dx,pa
    
    rot:
    out dx,al
    ror al,1;rol al,1 for anti
    call delay
    loop rot
    
    mov ah,4ch
    int 21h
   
    delay proc
        mov si,02fffh
        l2:mov di,0ffffh
        l1:dec di
        jnz l1
        dec si
        jnz l2
        ret
        delay endp
    code ends
end start