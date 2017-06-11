.text
.global _start
_start:
        ldr r0,=key
        ldr r1,[r0]
        mov r4,#5
       ldr r2,=array
again:  ldr r3,[r2]
        cmp r1,r3
         beq success 
      add r2,r2,#4
      sub r4,r4,#1
      cmp r2,#0
bne again
ldr r2,=msg2
bal display
 success: ldr r2,=msg1
display: mov r0,#10
         mov r1,#7
        swi 0X2040
     swi 0X11

.data
array:  .word 5,10,15,20,30
key: .word 10
msg1: .asciiz "key found"
msg2: .asciiz "key not found"
.end