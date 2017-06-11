assume cs:code,ds:data

data segment
    str1 db "malayalm"
    len1 dw len1-str1
    str2 db 10 dup(?)
    msg1 db "Palindrome$"
    msg2 db "not Palindrome$"
    
    data ends
code segment
    start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov cx,len1
    lea si,len1
    dec si
    
    lea di,str2
    
    next:
    mov al,[si]
    mov [di],al
    inc di
    dec si
    loop next
    
    lea si,str1
    lea di,str2
    
    cld
    mov cx,len1
    rep cmpsb
    je pal
    lea dx,msg2
    jmp disp
    
    pal:
    lea dx,msg1
    
    disp:
    mov ah,9
    int 21h
    
    code ends
end start
    
      
   
    
    
      