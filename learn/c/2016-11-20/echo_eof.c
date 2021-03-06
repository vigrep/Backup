/*
 * 重定向输入、输出 以及 EOF文件尾标识的使用
 * 
 * 重定向输入：echo_eof.exe < input.txt
 * 重定向输出：echo_eof.exe > output.txt
 *
 * 组合重定向：echo_eof.exe < input.txt > output.txt
 * 			   echo_eof.exe > output.txt < input.txt (命令与重定向运算符的顺序无关，只要输入输出文件名不同)
 *
 * 程序可以通过两种方式使用文件：
 *  1. 使用特定函数打开文件、关闭文件、读取文件、写入文件
 *  2. 重定向输入输出流至文件
 *
 *  重定向输入输出流：把stdin/stdout流赋给文件，继续使用getchar() 函数从输入流中读取数据，不用关心从留的
 *  					什么位置获取数据
 *  重定向的一个主要问题是与操作系统有关，与C无关
 *
 *  < 符号是UNIX 和 DOS/Windows 的重定向运算符，该运算符使文件与stdin流相关联，把文件的内容导入程序。程序
 *  本身并不需要关心输入的内容是来自文件还是键盘。
 *
 *  > 符号是重定向输出符，该运算符把文件与stdout流相关联
 *
 */

#include <stdio.h>

int main(void)
{
	char ch;

	while((ch = getchar()) != EOF)
		putchar(ch);

	return 0;
}
