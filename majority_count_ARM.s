.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
 * or come ask us if you're curious!*/
.data 


.text

/* int majority_count_ARM(int * arr, int len, int * result)*/
/* Remember to place your return value in r0. */
/* Return the count of the majority element in arr, */
/* or 0 if there is no majority. If "result" is not */
/* NULL, place the value of the majority element at */
/* that memory location before returning. */

.align 8
.global majority_count_ARM
.func majority_count_ARM, majority_count_ARM
.type majority_count_ARM, %function

majority_count_ARM:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}
    @ May want to decrement stack pointer for more space

    PUSH {r3, ip}

@ if (len == 0)
    CMP r1, #0
    MOVEQ r0, #0
    BEQ end

@ if (len == 1)
    CMP r1, #1
    BNE after1
    CMP r2, #0
    LDRNE r3, [r0]
    STRNE r3, [r2]
    MOV r0, #1
    B end

after1:
@ call majority_count_ARM(arr, len/2, &left_majority)
    SUB sp, sp, #16
    STR r0, [sp, #4]
    STR r1, [sp, #8]
    STR r2, [sp, #12]
    LSR r1, r1, #1
    MOV r2, sp
    BL majority_count_ARM
    MOV r4, r0  @ r4 = left_majority_count
    LDR r3, [sp]  @ r3 = left_majority
    LDR r0, [sp, #4]
    LDR r1, [sp, #8]
    LDR r2, [sp, #12]
    ADD sp, sp, #16
    
@ call majority_count_ARM(arr+len/2, len-len/2, &right_majority)
    SUB sp, sp, #16
    STR r0, [sp, #4]
    STR r1, [sp, #8]
    STR r2, [sp, #12]
    LSR r2, r1, #1
    SUB r1, r1, r2
    LSL r2, r2, #2
    ADD r0, r0, r2
    MOV r2, sp
    BL majority_count_ARM
    MOV r6, r0  @ r6 = right_majority_count
    LDR r5, [sp]  @ r5 = right_majority
    LDR r0, [sp, #4]
    LDR r1, [sp, #8]
    LDR r2, [sp, #12]
    ADD sp, sp, #16

@ if (left_majority_count)
    CMP r4, #0
    BEQ secondif
    PUSH {r0-r2, ip}
    MOV r2, r3
    BL count
    MOV r7, r0  @ r7 = c = count(arr, len, left_majority)
    POP {r0-r2, ip}
    LSL r7, r7, #1
    CMP r7, r1  @ if (2 * c > len)
    LSRGT r7, r7, #1
    BGT storevalue

secondif:
@ if (right_majority_count)
    CMP r6, #0
    MOVEQ r0, #0
    BEQ end
    PUSH {r0-r2, ip}
    MOV r2, r5
    BL count
    MOV r7, r0  @ r7 = c = count(arr, len, right_majority)
    POP {r0-r2, ip}
    LSL r7, r7, #1
    CMP r7, r1  @ if (2 * c > len)
    MOVLE r0, #0
    BLE end
    LSR r7, r7, #1
    MOV r3, r5
    B storevalue

storevalue:
@ store the majority element and return its count
    CMP r2, #0
    STRNE r3, [r2]
    MOV r0, r7
    B end

@ count the number of times the input integer appears in the array
@ ------------------------------
count:
    PUSH {r3-r11, lr}
    MOV r4, #0  @ r4 = i = 0
    MOV r5, #0  @ r5 = ret_count = 0
while:  @ use a while loop to count the accurence of the input integer
    CMP r4, r1
    BGE endwhile
    LDR r6, [r0, r4, LSL #2]
    CMP r6, r2
    ADDEQ r5, r5, #1
    ADD r4, r4, #1
    B while
endwhile:
    MOV r0, r5
    POP {r3-r11, pc}
@ ------------------------------

end:
    POP {r3, ip}
 
    @ Remember to restore your stack pointer before popping!
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


