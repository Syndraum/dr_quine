#define FNAME "Grace_kid.c"
#define s1 "#define FNAME %2$cGrace_kid.c%2$c%1$c#define s1 %2$c%3$s%2$c%1$c#define FT(x)int main(){int open(const char*, int, int); int dprintf(int, const char *, ...);int close(int);int fd=open(FNAME, 577, 436);dprintf(fd, s1, 10, 34, s1);close(fd);}%1$c/*%1$c    This program will print its own source when run.%1$c*/%1$cFT()"
#define FT(x)int main(){int open(const char*, int, int); int dprintf(int, const char *, ...);int close(int);int fd=open(FNAME, 577, 436);dprintf(fd, s1, 10, 34, s1);close(fd);}
/*
    This program will print its own source when run.
*/
FT()