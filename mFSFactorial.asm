assume cs:code,ds:data

data segment
    n dw 06h   ;16 bit
    res dw ?
    data ends
code segment
    start:
    mov ax,data
    mov ds,ax
    
    mov ax,n
    call fact
    mov ah,4ch
    int 21h
    
    fact proc 
        cmp ax,0000h
        je cal
        
        push ax
        dec ax
        call fact
        pop ax
        mul res
        mov res,ax
        ret
        
        cal:
        mov res,0001
        ret
        fact endp
    code ends
end start
       
   