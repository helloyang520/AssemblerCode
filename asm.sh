#!/bin/bash
printf "\033[01;34mDefault:elf_i386\033[0m\n"
AssemblerParameter="--32"
LinkDestinationParameter="-m elf_i386"
SourceCode=$1
Destination=$2
LinkLibrary="-cstd"
case $LinkLibrary in
    $1)
    Temp=$LinkLibrary;;
    $2)
    Temp=$LinkLibrary;;
    $3)
    Temp=$LinkLibrary;;
    *)
    Temp="";;
esac
if [ ! -r $1 ];
then
	printf "\033[31mFile does not exist or is not readable!\033[0m\n"	
	exit -1
elif [ -n "$1" ];
then
    AutoLinker=$(grep -i call -R "$1"|wc -l)
fi
case "-g" in
    $1)
    debug="-gstabs";;
    $2)
    debug="-gstabs";;
    $3)
    debug="-gstabs";;
    *)
    debug="";;
esac
if [ "$(grep -i "\!debug" -R "$1"|wc -l)" != "0" ];
then
    debug="-gstabs"
    printf "\033[31mEnable GDB Debug!\033[0m\n"
fi
if [ -n "$Temp" ] || [ "$AutoLinker" !=  "0" ];
then
    LinkDestinationParameter="${LinkDestinationParameter}  -dynamic-linker /usr/lib32/ld-linux.so.2  /usr/lib32/libc.so.6 "
	printf "\033[01;34mLink to c library\033[0m\n"
fi
if [ -n "$SourceCode" ] && [ -n "$Destination" ] && [ "$3" == "$LinkLibrary" ];
then
    Object="${SourceCode%%.*}.o"
    as $AssemblerParameter  $SourceCode  -o  $Object $debug
    ld $LinkDestinationParameter    $Object -o  $Destination
    printf "\033[01;34mCompile %s to %s\033[0m\n" $SourceCode ${Destination%%.*}
    rm $Object
elif [ -n "$SourceCode" ];
then
    Object="${SourceCode%%.*}.o"
    Destination=$Object
    as $AssemblerParameter $SourceCode -o $Object $debug
    ld $LinkDestinationParameter    $Object -o  ${Destination%%.*}
    printf "\033[01;34mCompile %s to %s\033[0m\n" $SourceCode ${Destination%%.*}
    rm $Object
else
    printf "\033[01;31mParameter is Empty!\n%s [SourceCode] [Execute]\033[0m\n" ${0##*/}
fi
