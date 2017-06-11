assume cs:code,ds:data
data segment
    x dw 1000h,0500h,0300h,1500h,0100h  ;all 16 bit numbers
    n dw n-x ;it calculates only for bytes so difference is 10
    data ends
code segment
    start:
    mov ax,data
    mov ds,ax  
    
    mov ax,n  ;mov 10 to ax
    shr ax,1  ;divide by 2 to get actual n
    mov n,ax  ;mov back to n
    
    mov bx,n  ;mov the present n to bx
    dec bx    ;dec bx for n-1
    
    nxtpass:
    
    mov cx,bx
    mov dl,00h ;flag to terminate inner loop
    lea si,x
    
    nxtcmp:
    mov ax,[si]    ;first 16bit
    cmp ax,[si+2]  ; next 16 bit
    jle nothing
    xchg ax,[si+2] ;exchange 16 bits
    mov [si],ax
    mov dl,01
    
    nothing:
    inc si       ;inc for first 8 bit
    inc si       ;inc for next 8 bit to get 16bit
    loop nxtcmp
    cmp dl,00h   ;check flag
    je finish
    dec bx       ;dec bx for loop count
    jnz nxtpass
    
    finish:
    mov ah,4ch
    int 21h
    
    code ends
end start
    