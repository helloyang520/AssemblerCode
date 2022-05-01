//!debug
//GitHub:https://github.com/helloyang520/AssemblerCode
//文件读写: ./ReadAndWrite ReadFileName WriteFileName (若WriteFileName缺省则输出到终端)
.section .data
    ErrorMsg:
        .asciz "The Parameter is Wrong!\n"
        ErrorMsgLength=.-ErrorMsg
.section .bss
        .lcomm MemoryBuffer 4096
.section .text
    .globl _start
_Error:
    //错误则执行 _Error
    movl %ebp,   %esp
    popl %ebp
    //保存堆栈
    movl $4,    %eax
    movl $1,    %ebx
    movl $ErrorMsg, %ecx
    movl $ErrorMsgLength,   %edx
    int $0x80
    //系统中断，中断号4,对应 __NR_write
    movl $1,    %eax
    movl $0xff, %ebx
    int $0x80
    //系统中断，中断号1,对应 __NR_exit
_start:
    movl 8(%esp),   %esi
    movl 12(%esp),  %edi
    //读取执行参数
    pushl %ebp
    movl %esp,  %ebp
    //保存堆栈
    //__NR_open
    movl $5,    %eax
    movl %esi,  %ebx
    movl $0,    %ecx
    int $0x80
    //系统中断，中断号5,对应 __NR_open
    movl %eax,  %esi
    cmpl $0,    %esi
    jle _Error
    //若打开第一个文件失败，则跳转到 _Error
    //__NR_open
    movl $5,    %eax
    movl %edi,  %ebx
    movl $65,    %ecx
    movl $0644,  %edx
    int $0x80
    //系统中断，中断号5,对应 __NR_open
    movl %eax,  %edi
    movl $1,    %ecx
    cmpl $0,    %eax
    cmovng  %ecx, %edi
    //若打开第二文件失败，则将文件内容写入终端(stdout)
_io:
    //开始读取内容
    movl $3,    %eax
    movl %esi,  %ebx
    movl $MemoryBuffer, %ecx
    movl $4096, %edx
    int $0x80
    //系统中断，中断号3,对应 __NR_read
    cmpl $0,    %eax
    jz  _io_over
    //若读取字数为0，则视为读取结束，跳转到 _io_over
    //开始写入内容
    movl %eax,  %edx
    movl $4,    %eax
    movl %edi,  %ebx
    int $0x80
    //系统中断，中断号4,对应 __NR_write
    jmp _io
_io_over:
    movl %ebp, %esp
    popl %ebp
    //恢复堆栈
    movl $1,   %eax
    movl $0x0, %ebx
    int $0x80
    //系统中断，中断号1,对应 __NR_exit
