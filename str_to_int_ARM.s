.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
 * or come ask us if you're curious!*/
.data 


.text

/* int str_to_int(char * str, int * dest);*/
/* Return 1 for success and 0 for failure. */
/* If successful, store the result at the */
/* location pointed to by "dest" */

.align 8
.global str_to_int
.func str_to_int, str_to_int
.type str_to_int, %function

str_to_int:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}

    @ invalid arguments
    CMP r0, #0
    BEQ zero
    CMP r1, #0
    BEQ zero
    LDRB r4, [r0]
    CMP r4, #0
    BEQ zero

    MOV r11, #0  @ used to store the resulting integer

    @ if(*s == '-' && *(s + 1) != '\0')
    CMP r4, #45
    BNE else
    LDRB r4, [r0, #1]
    CMP r4, #0
    BEQ else

    MOV r4, #1
@ use a while loop to examine all characters
while:
    LDRB r5, [r0, r4]
    CMP r5, #0
    BEQ afterwhile  @ successful translation
    CMP r5, #48
    BLT zero  @ invalid characters
    CMP r5, #57
    BGT zero  @ invalid characters

    @ update the integer value
    LSL r10, r11, #3
    LSL r11, r11, #1
    ADD r11, r11, r10
    ADD r11, r11, r5
    SUB r11, r11, #48
    ADD r4, r4, #1

    B while

@ get the true negative value
afterwhile:
    MVN r11, r11
    ADD r11, #1
    B one

else:
    MOV r4, #0
@ use a while loop to examine all characters
while2:
    LDRB r5, [r0, r4]
    CMP r5, #0
    BEQ one  @ successful translation
    CMP r5, #48
    BLT zero  @ invalid characters
    CMP r5, #57
    BGT zero  @ invalid characters

    @ update the integer value
    LSL r10, r11, #3
    LSL r11, r11, #1
    ADD r11, r11, r10
    ADD r11, r11, r5
    SUB r11, r11, #48
    ADD r4, r4, #1

    B while2

one:
    STR r11, [r1]
    MOV r0, #1
    B end

zero:
    MOV r0, #0

end:
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


