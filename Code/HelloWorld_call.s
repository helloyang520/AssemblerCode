//GitHub:https://github.com/helloyang520/AssemblerCode
//输出HelloWorld
.section .data
        Msg:
        .asciz "HelloWorld!\n"
.section .text
.globl _start
_start:
        pushl %ebp
        movl %esp,  %ebp
        //保存堆栈
        pushl $Msg
	//将字符串入栈
	call printf
	//调用c库函数 printf
        movl %ebp, %esp
        popl %ebp
        //恢复堆栈
        movl $1,    %eax
        movl $0x0, %ebx
        int $0x80
        //系统中断，中断号1,对应 __NR_exit
