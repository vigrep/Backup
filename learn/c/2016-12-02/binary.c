/* binary.c -- 以二进制的形式打印整数 对应书上内容 261页 */

#include <stdio.h>

void to_binary(unsigned long n);
void to_binary_1(unsigned long n);

void to_octal(unsigned long n);
void to_hex(unsigned long n);

int main(void)
{
	setbuf(stdout, NULL);
	unsigned long number;
	printf("Enter an integer (q to quit):\n");
	//fflush(stdout);

	while(scanf("%lu", &number) == 1)
	{
		printf("Binary equivalent : ");
	//	fflush(stdout);
		//to_binary(number);
		//to_binary_1(number);
		//to_octal(number);
		to_hex(number);
		putchar('\n');
		printf("Enter an integer (q to quit):\n");
	//	fflush(stdout);
	}

	printf("Done.\n");

	return 0;
}

void to_binary(unsigned long n)
{
	int r;

	r = n % 2;
//	putchar(r == 0 ? '0' : '1');
	if (n >= 2)
		to_binary(n/2);
	putchar(r == 0 ? '0' : '1');
	//fflush(stdout);

	return;
}

void to_binary_1(unsigned long n)
{
	int s = n / 2;
	int r = n % 2;
	if (s > 0 )
		to_binary_1(s);
	printf("%d", r);
}

//转八进制
void to_octal(unsigned long n)
{
	int s = n / 8;
	int r = n % 8;
	if (s > 0)
		to_octal(s);
	printf("%d", r);
}

//十进制转十六进制
void to_hex(unsigned long n)
{
	int s = n / 16;
	int r = n % 16;
	if (s > 0 )
		to_hex(s);
	printf("%d", r);
}




