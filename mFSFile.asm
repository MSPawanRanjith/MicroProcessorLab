assume cs:code,ds:data

data segment
    fname db "testf2.txt"
    buff  db 100 dup(?),"$"
    data ends
code segment
    start:
    mov ax,data
    mov ds,ax
    
    mov ah,3dh
    lea dx,fname
    mov al,00
    int 21h
    
    mov bx,ax
    mov ah,3fh
    mov cx,100d
    lea dx,buff
    
    int 21h
    
    mov ah,3eh
    int 21h
    
    lea dx,buff
    mov ah,9h
    int 21h
    
    mov ah,4ch
    int 21h
    code ends
 end start