;assume cs:code,ds:data

code segment
    start:
    mov ah,00h
    mov al,02h
    int 10h
    
    mov ah,02h
    mov dh,24d
    mov dl,40d
    int 10h
    
    mov al,'V'
    mov bl,00c9h
    mov cl,2
    mov ah,09
    int 10h
    mov ah,07
    int 21h
    
    mov ah,4ch
    int 21h
    
    code ends
end start  
;assume cs:code
;code segment
;    start:
;        mov ah,00h
;        mov al,02h
;        int 10h
;        
;        mov ah,02
;        mov dh,12d
;        mov dl,40d
;        int 10h
;        
;        mov al,'X'
;        mov bl,8ch
;        mov cl,1
;        mov ah,9
;        int 10h
;        
;        mov ah,7
;        int 21h
;        
;        mov ah,4ch
;        int 21h
;code ends
;end start