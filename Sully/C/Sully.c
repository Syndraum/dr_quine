#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
int main(){
int i=5;
if (i == 0)
return 0;
char *s1="#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$cint main(){%1$cint i=%4$d;%1$cif (i == 0)%1$creturn 0;%1$cchar *s1=%3$c%2$s%3$c;%1$cchar s2[255]={0};%1$cchar s3[255]={0};%1$csprintf(s2, %3$cSully_%%d.c%3$c, i-1);%1$csprintf(s3, %3$cN=%%d%3$c, i-1);%1$cint fd=open(s2, 577, 436);%1$cdprintf(fd, s1, 10, s1, 34, (i - 1));%1$cclose(fd);%1$cexeclp(%3$cmake%3$c, %3$cmake%3$c, %3$cchild%3$c, s3, 0);%1$creturn 1;%1$c}";
char s2[255]={0};
char s3[255]={0};
sprintf(s2, "Sully_%d.c", i-1);
sprintf(s3, "N=%d", i-1);
int fd=open(s2, 577, 436);
dprintf(fd, s1, 10, s1, 34, (i - 1));
close(fd);
execlp("make", "make", "child", s3, 0);
return 1;
}