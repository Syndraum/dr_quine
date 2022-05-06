#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#define FORK(...) do {pid=fork();if(pid == 1)return 1;if(pid == 0){execlp(__VA_ARGS__);return 1;}waitpid(pid, &ret, 0);}while(0)
int main(){
int i=5;
if (i <= 0)
return 0;
char *s1="#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$c#include <sys/wait.h>%1$c#define FORK(...) do {pid=fork();if(pid == 1)return 1;if(pid == 0){execlp(__VA_ARGS__);return 1;}waitpid(pid, &ret, 0);}while(0)%1$cint main(){%1$cint i=%4$d;%1$cif (i <= 0)%1$creturn 0;%1$cchar *s1=%3$c%2$s%3$c;%1$cchar s2[255]={0};%1$cchar s3[255]={0};%1$csprintf(s2, %3$cSully_%%d.c%3$c, i-1);%1$csprintf(s3, %3$cSully_%%d.o%3$c, i-1);%1$cint fd=open(s2, 577, 436);%1$cdprintf(fd, s1, 10, s1, 34, (i - 1));%1$cclose(fd);%1$cint ret=0;%1$cpid_t pid;%1$cFORK(%3$cclang%3$c, %3$c-Wall%3$c, %3$c-Werror%3$c, %3$c-Wall%3$c, s2, %3$c-c%3$c, 0);%1$cFORK(%3$cclang%3$c, %3$c-Wall%3$c, %3$c-Werror%3$c, %3$c-Wall%3$c, s3, %3$c-o%3$c, %3$cSully%3$c, 0);%1$cexeclp(%3$c./Sully%3$c, %3$c%3$c, 0);%1$creturn 1;%1$c}";
char s2[255]={0};
char s3[255]={0};
sprintf(s2, "Sully_%d.c", i-1);
sprintf(s3, "Sully_%d.o", i-1);
int fd=open(s2, 577, 436);
dprintf(fd, s1, 10, s1, 34, (i - 1));
close(fd);
int ret=0;
pid_t pid;
FORK("clang", "-Wall", "-Werror", "-Wall", s2, "-c", 0);
FORK("clang", "-Wall", "-Werror", "-Wall", s3, "-o", "Sully", 0);
execlp("./Sully", "", 0);
return 1;
}