//GitHub:https://github.com/helloyang520/AssemblerCode
//输出HelloWorld
.section .data
        Msg:
        .asciz "HelloWorld!\n"
        MsgLength=.-Msg
.section .text
.globl _start
_start:
        pushl %ebp
        movl %esp,  %ebp
        //保存堆栈
        movl $4,    %eax
        movl $1,    %ebx
        movl $Msg, %ecx
        movl $MsgLength,   %edx
        int $0x80
        //系统中断，中断号4,对应 __NR_write
        movl %ebp, %esp
        popl %ebp
        //恢复堆栈
        movl $1,    %eax
        movl $0xff, %ebx
        int $0x80
        //系统中断，中断号1,对应 __NR_exit
