//!debug
//GitHub:https://github.com/helloyang520/AssemblerCode
//计算字符串长度: ./StringLength
.section .data
	output:
		.asciz "Please Enter a string:"
	GetStr:
		.asciz "%s"
	StrLen:
		.asciz "String Length:%d\n"
	buffer:
		.lcomm input 256
		//缓冲区大小 256 字节,可修改
.section .text
	.globl _start
_input:
	pushl %ebp
	movl %esp,%ebp
	//保存堆栈
	pushl $output
	//将字符串入栈
	call printf
	//调用c库函数 printf
	pushl $input
	//将缓冲区入栈
	pushl $GetStr
	//将字符串入栈
	call scanf
	//调用c库函数 scanf
	pushl $input
	//将缓冲区入栈
	call strlen
	//调用c库函数 strlen
	pushl %eax
	//将返回值入栈
	pushl $StrLen
	//将字符串入栈
	call printf
	//调用c库函数 printf
	movl %ebp,%esp
	popl %ebp
	//恢复堆栈
	ret
	//返回call调用点后的指令地址
_start:
	pushl %ebp
	movl %esp,%ebp
	//保存堆栈
	call _input
	//调用代码段 _input
	pushl $0
	//将返回值入栈
	call exit
	//调用c库函数 exit
	movl %ebp,%esp
	popl %ebp
	//恢复堆栈
