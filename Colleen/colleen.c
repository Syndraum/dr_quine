#include <stdio.h>

int main() {
	char *s1="#include <stdio.h>%c%cint main() {%c";
	char *s2="%cchar *s1=%c%s%c;%c%cchar *s2=%c%s%c;%c%cprintf(s1, 10, 10, 10);%c%cprintf(s2, 9, 34, s1, 34, 10, 9, 34, s2, 34, 10, 9, 10, 9, 10);%c}";
	printf(s1, 10, 10, 10);
	printf(s2, 9, 34, s1, 34, 10, 9, 34, s2, 34, 10, 9, 10, 9, 10);
}