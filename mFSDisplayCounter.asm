assume cs:code,ds:data
code segment
    start:
    mov ah,00h
    mov al,02
    int 10h
    
    mov cx,10d
    mov bl,0h
    
    nxt: 
    mov ah,02
    mov dh,12d
    mov dl,20d
    int 10h
    
    mov al,bl
    call disp
    call delay
    inc bl
    loop nxt
    
    mov ah,4ch
    int 21h
    
    disp proc
        aam
        add ax,3030h
        push ax
        mov dl,ah
        mov ah,02
        int 21h
        pop ax
        mov dl,al
        mov ah,02
        int 21h
        ret
    endp
    delay proc
        mov si,05h
        l2:mov di,05h
        l1:dec di
           jnz l1
           dec si
           jnz l2 
           ret
           
    endp
    code ends
end start
        
        