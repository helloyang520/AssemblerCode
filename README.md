本项目与以下内容关联:<br>
Linux 汇编(linux assembler)<br>
AT&T 汇编(at&t assembler)<br>
80386 汇编(80386 assembler)<br>
32位 汇编(32bit assembler)<br>
<br>
注:本项目代码为入门者或新手编写的汇编代码示例!<br>
注:文件名：FileName_int     //为系统中断代码<br>
注:文件名：FileName_call    //为C库调用函数代码<br>
注:代码文件最后一行务必为空行,否则编译错误！<br>
<br>
此项目用于共同学习研究AT&T汇编技术，项目将同时实现汇编语言的两种代码，<br>
分别是:系统中断(int $0x80)，和C语言函数库调用(call functions).<br>
<br>
项目中提供了自动编译脚本[asm.sh],脚本使用bash shell作为解释器.<br>
脚本使用方式简单:<br>
    ./asm.sh CodeName<br>
//或将脚本移动到指令目录<br>
例如:<br>
    mv asm.sh /usr/local/bin<br>
//脚本执行:<br>
    asm.sh CodeName <br>
//缺省的目标名称,脚本会自动生成<br>
源代码名:assembler.s 则目标名为: assembler<br>
<br>
脚本会自动通过识别代码的"call"调用来连接C库(不区分大小写),<br>
若代码中包含字符串"!debug"则自动附加gdb调试(不区分大小写),<br>
例如:<br>
    //!debug    //代码注释<br>
    ./asm.sh CodeName   //附加gdb调试<br>
    gdb CodeName    //开始gdb调试<br>
<br>
脚本提供了冗余的参数，用于特殊情况指定编译参数<br>
例如:<br>
    ./asm.sh SourceCodeName DestinationCodeName -g <br>
    //编译SourceCodeName，指定编译后可执行文件名为DestinationCodeName(DestinationCodeName可缺省),参数"-g"附加gdb调试器<br>
    ./asm.sh SourceCodeName DestinationCodeName -cstd<br>
    //编译SourceCodeName，指定编译后可执行文件名为DestinationCodeName(DestinationCodeName可缺省),参数"-cstd"连接c库<br>
<br>
//QQ群:668798306<br>
![image](https://github.com/helloyang520/AssemblerCode/blob/master/QQID.png)
<br>