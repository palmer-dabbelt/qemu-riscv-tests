# pass/fail indication

pass:
        la a0, pass_msg
        jal puts
        li a0, 0
        j mee_shutdown

fail:
        la a0, fail_msg
        jal puts
        li a0, 1
        j mee_shutdown

puts:
        addi sp, sp, -16
        sd s0, -8(sp)
        mv s0, a0
1:      lbu a0, (s0)
        beqz a1, 3f
        call mee_tty_putc
        addi s0, s0, 1
        j 1b
        ld s0, -8(sp)
3:      ret

.section .data

pass_msg:
        .string "PASS\n"

fail_msg:
        .string "FAIL\n"
