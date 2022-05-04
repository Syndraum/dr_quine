#include <stdio.h>

int main() {
	char *s1="#include <stdio.h>%c%cint main() {%c%cchar *s1=%c%s%c;%c%cprintf(s1, 10, 10, 10, 9, 34, s1, 34, 10, 9, 10);%c}";
	printf(s1, 10, 10, 10, 9, 34, s1, 34, 10, 9, 10);
}