assume cs:code,ds:data

code segment    
    start:
    
    mov ah,02ch
    int 21h
    
    mov al,ch
    call hex_bcd
    call disp
    
    mov dl,':'
    mov ah,02
    int 21h
    
    mov al,cl
    call hex_bcd
    call disp   
    
    mov ah,4ch
    int 21h
    
    disp proc
        push cx
        mov ah,00
        mov cx,4
        shl ax,4
        shr al,4
        add ax,3030h
        push ax
          
        mov dl,ah
        mov ah,2
        int 21h
        pop ax
        
        mov dl,al 
        mov ah,2
        int 21h
        
        pop cx
        
        ret
    endp
    
    hex_bcd proc
        push cx
        mov cl,al
        mov ch,0
        mov al,0
        
        next:
        add al,1
        daa
        loop next
        pop cx
        ret
    endp
    
    code ends
end start
    
        
        
    
    
    