本项目与以下关联:
Linux 汇编(linux assembler)
AT&T 汇编(at&t assembler)
80386 汇编(80386 assembler)
32位 汇编(32bit assembler)

注:本项目代码为入门者或新手编写的汇编代码示例!
注:文件名：FileName_int     //为系统中断代码
注:文件名：FileName_call    //为C库调用函数代码
注:代码文件最后一行务必为空行,否则编译错误！

此项目用于共同学习研究AT&T汇编技术，项目将同时实现汇编语言的两种代码，
分别是:系统中断(int $0x80)，和C语言函数库调用(call functions).

项目中提供了自动编译脚本[asm.sh],脚本使用bash shell作为解释器.
脚本使用方式简单:
    ./asm.sh CodeName   
//或将脚本移动到指令目录
例如:
    mv asm.sh /usr/local/bin
//脚本执行:
    asm.sh CodeName 
//缺省的目标名称,脚本会自动生成
源代码名:assembler.s 则目标名为: assembler

脚本会自动通过识别代码的"call"调用来连接C库(不区分大小写),
若代码中包含字符串"!debug"则自动附加gdb调试(不区分大小写),
例如:
    //!debug    //代码注释
    ./asm.sh CodeName   //附加gdb调试
    gdb CodeName    //开始gdb调试

脚本提供了冗余的参数，用于特殊情况指定编译参数
例如:
    ./asm.sh SourceCodeName DestinationCodeName -g 
    //编译SourceCodeName，指定编译后可执行文件名为DestinationCodeName(DestinationCodeName可缺省),参数"-g"附加gdb调试器
    ./asm.sh SourceCodeName DestinationCodeName -cstd
    //编译SourceCodeName，指定编译后可执行文件名为DestinationCodeName(DestinationCodeName可缺省),参数"-cstd"连接c库

//QQ群:668798306
![image](url)