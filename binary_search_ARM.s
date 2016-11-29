.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
 * or come ask us if you're curious!*/
.data 


.text

/*int binary_search_ARM(int * data, int toFind, int start, int end)*/
/*Note that you return your value in r0*/

.align 8
.global binary_search_ARM
.func binary_search_ARM, binary_search_ARM
.type binary_search_ARM, %function

binary_search_ARM:
    @ We need to save away a bunch of registers
    push    {r4-r11, ip, lr}
    @ May need to decrement stack pointer for more stack space

    @ r4 = mid = start + (end - start) / 2
    SUB r4, r3, r2
    LSR r4, r4, #1
    ADD r4, r4, r2

    @ if (start > end)
    CMP r2, r3
    MOVGT r0, #-1
    BGT end

    @ r5 = data[mid]
    LDR r5, [r0, r4, LSL #2]

    @ if (data[mid] == toFInd)
    CMP r5, r1
    MOVEQ r0, r4
    BEQ end

    SUBGT r3, r4, #1  @ if (data[mid] > toFInd)
    ADDLT r2, r4, #1  @ if (data[mid] < toFInd)
    BL binary_search_ARM

end:
    @ Remember to restore the stack pointer before popping!
    @ This handles restoring registers and returning
    pop     {r4-r11, ip, pc}

.endfunc

.end


