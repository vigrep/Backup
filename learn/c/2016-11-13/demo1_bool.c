/**
* _Bool 类型的使用 (C99)
* C99 也提供了stdbool.h,该头文件让bool成为_Bool的别名，而且还把true和false分别定义为 1 和 0 的符号常量
* 包含该头文件后，写出的代码可以和C++ 兼容，因为C++把bool、true、false定义为关键字
*/

#include <stdio.h>
#include <stdbool.h>

int main()
{
	int num;
	//_Bool flag;
	bool flag;

	printf("please input some what:\n");
	fflush(stdout);
	flag = scanf("%d", &num) == 1;

	if (flag)
		printf("you are input a number!\n");
	else
		printf("I'm not sure what you are input!\n");

	return 0;
}

