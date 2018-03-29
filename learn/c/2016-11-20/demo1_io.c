/*
 * 无缓冲输入和缓冲输入
 * 无缓冲输入：回显用户输入的字符后立即重复打印该字符, 即正在等待的程序可以立即使用输入的字符 , 例如，在游戏中，按下一个键就执行相应的指令
 * 缓冲输入：用户输入的字符被收集并存储在缓冲区的临时存储区，按下Enter键后，程序才可使用用户输入的字符
 *
 * 缓冲分为两类：完全缓冲I/O和行缓冲I/O
 * 				完全缓冲输入：当缓冲区被填满时才刷新缓冲区（文件输入）
 * 				行缓冲：出现换行符时才刷新缓冲区（键盘输入）
 *
 *
 *
 */


#include <stdio.h>

int main(void)
{
	char ch;

	while((ch = getchar()) != '#')
		putchar(ch);

	return 0;
}
