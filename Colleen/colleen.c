#include <stdio.h>

/*
	This program will print its own source when run.
*/
int main() {
	// Begin program
	char *s1="#include <stdio.h>%c%c/*%c%cThis program will print its own source when run.%c*/%cint main() {%c%c// Begin program%c%cchar *s1=%c%s%c;%c%cprintf(s1, 10, 10, 10, 9, 10, 10, 10, 9, 10, 9, 34, s1, 34, 10, 9, 10);%c}";
	printf(s1, 10, 10, 10, 9, 10, 10, 10, 9, 10, 9, 34, s1, 34, 10, 9, 10);
}