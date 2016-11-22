.syntax unified

.text

.align 8
.global substring
.func substring, substring
.type substring, %function

substring:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (char *str1 is in r0, char *str2 is in r1)
    @-----------------------

    CMP r0, #0
    BEQ zero  @ when str1 is NULL
    CMP r1, #0
    BEQ zero  @ when str2 is NULL

    PUSH {r0-r3}
    BL strlen
    MOV r4, r0  @ r4 = strlen(str1)
    POP {r0-r3}

    PUSH {r0-r3}
    MOV r0, r1
    BL strlen
    MOV r5, r0  @ r5 = strlen(str2)
    POP {r0-r3}

    @ make r0 the possible substring, and r4 its length
    CMP r4, r5
    MOVGT r6, r0  @ swap r0 and r1
    MOVGT r0, r1
    MOVGT r1, r6
    MOVGT r6, r4  @ swap r4 and r5
    MOVGT r4, r5
    MOVGT r5, r6

    MOV r6, #0
    SUB r5, r5, r4
@ use outer for loop to traverse all substrings of length r4 in r1
for:
    CMP r6, r5
    BGT zero

    MOV r7, #0
    MOV r8, r6
@ use inner loop to examine every substring
for2:
    CMP r7, r4
    BGE one  @ when r0 is found in r1
    LDRB r9, [r0, r7]
    LDRB r10, [r1, r8]
    CMP r9, r10
    BNE endfor2
    ADD r7, r7, #1
    ADD r8, r8, #1
    B for2

endfor2:
    ADD r6, r6, #1
    B for

zero:
    MOV r0, #0
    B end

one:
    MOV r0, #1

end:

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

