wait:
	swi 0x202
	cmp r0,#0
	beq wait
	
	ldr r5,=zero
	mov r1,#0
loop1:
	ldrb r0,[r5]
	add r1,r1,#1
	cmp r1,#12
	beq end
	swi 0x200
	add r5,r5,#1
	bl count
	b loop1
end:
	b wait
count:
	mov r4,#64000
count1:
	cmp r4,#0
	subgt r4,r4,#1
	bgt count1
	swi 0x206
	mov pc,lr
.data
zero:	.byte 0b11101101
one: 	.byte 0b01100000
two:	.byte 0b11001110
three:	.byte 0b11101010
four:	.byte 0b01100011
five:	.byte 0b10101011
six:	.byte 0b10101111
seven:	.byte 0b11100000
eight:	.byte 0b11101111
nine:	.byte 0b11101011

A:	.byte 0b11100111
B:	.byte 0b11101111
C:	.byte 0b10001101
D: 	.byte 0b11101101
E:	.byte 0b10001111
F:	.byte 0b10000111


