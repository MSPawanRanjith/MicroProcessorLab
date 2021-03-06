assume cs:code,ds:data
data segment
    a db 10h,20h,30h,40h,50h
    n db n-a
    key db 20h
    msg1 db "Not found$"
    msg2 db "Found at "
    pos db ?,"$"
    data ends
code segment
    start:
    mov ax,data
    mov ds,ax
    
    mov al,00h
    mov dl,n
    dec dl
    
    again:
    cmp al,dl
    ja fail
    mov cl,al
    add al,dl
    shr al,1
    mov ah,00h
    mov si,ax
    mov bl,[si]
    cmp bl,key
    jae loc1
    inc al
    jmp again
      
    loc1:
    je sucess
    dec al
    mov dl,al
    mov al,cl
    jmp again
    
    fail:
    lea dx,msg1
    jmp disp
    
    sucess:
    inc al
    add al,30h
    mov pos,al
    lea dx,msg2
    jmp disp
    
    disp:
    mov ah,09h
    int 21h
    
    mov ah,4ch
    int 21h
    
    code ends
end start
    
     
   