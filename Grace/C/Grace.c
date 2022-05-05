#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#define s1 "#include <fcntl.h>%c#include <unistd.h>%c#include <stdio.h>%c#define s1 %c%s%c%c#define FT()int main(){int fd = open(%cGrace_kid.c%c, 577, 436);dprintf(fd, s1, 10, 10, 10, 34, s1, 34, 10, 34, 34, 10, 10, 10, 10);close(fd);}%c/*%c    This program will print its own source when run.%c*/%cFT()"
#define FT()int main(){int fd = open("Grace_kid.c", 577, 436);dprintf(fd, s1, 10, 10, 10, 34, s1, 34, 10, 34, 34, 10, 10, 10, 10);close(fd);}
/*
    This program will print its own source when run.
*/
FT()