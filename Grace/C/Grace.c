#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#define s1 "#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$c#define s1 %2$c%3$s%2$c%1$c#define FT()int main(){int fd=open(%2$cGrace_kid.c%2$c, 577, 436);dprintf(fd, s1, 10, 34, s1);close(fd);}%1$c/*%1$c    This program will print its own source when run.%1$c*/%1$cFT()"
#define FT()int main(){int fd=open("Grace_kid.c", 577, 436);dprintf(fd, s1, 10, 34, s1);close(fd);}
/*
    This program will print its own source when run.
*/
FT()