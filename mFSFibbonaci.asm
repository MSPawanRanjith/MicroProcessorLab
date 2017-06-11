assume cs:code,ds:data

data segment
    fibbo db 10 dup(?)
    n db 0ah
    data ends

code segment
    start:
    mov ax,data
    mov ds,ax
    
    mov al,00h
    lea si,fibbo
    mov [si],al
    inc si
    
    mov bl,01h
    mov [si],bl
    inc si
    mov cl,n
    dec cl
    dec cl
    mov ch,00h
    
    next:
    add al,bl
    mov [si],al
    inc si
    xchg al,bl
    loop next
    
    mov ah,4ch
    int 21h
    
    code ends
end start
   