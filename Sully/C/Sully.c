#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
  int i=5;
  char *s1="#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$cint main(){%1$c  int i=%4$d;%1$c  char *s1=%3$c%2$s%3$c;%1$c  char s2[42]={0};%1$c  char s3[42]={0};%1$c  char cmd[124]={0};%1$c  if (i <= 0)%1$c    return 0;%1$c  #ifdef DEC%1$c  i--;%1$c  #endif%1$c  sprintf(s2, %3$cSully_%%d.c%3$c, i);%1$c  sprintf(s3, %3$c./Sully_%%d%3$c, i);%1$c  sprintf(cmd, %3$c/usr/bin/clang -Wall -Werror -Wextra %%s -o %%s -D DEC=1%3$c, s2, s3);%1$c  int fd=open(s2, 577, 436);%1$c  dprintf(fd, s1, 10, s1, 34, i);%1$c  close(fd);%1$c  if (system(cmd))%1$c    return 1;%1$c  if (system(s3))%1$c    return 1;%1$c}";
  char s2[42]={0};
  char s3[42]={0};
  char cmd[124]={0};
  if (i <= 0)
    return 0;
  #ifdef DEC
  i--;
  #endif
  sprintf(s2, "Sully_%d.c", i);
  sprintf(s3, "./Sully_%d", i);
  sprintf(cmd, "/usr/bin/clang -Wall -Werror -Wextra %s -o %s -D DEC=1", s2, s3);
  int fd=open(s2, 577, 436);
  dprintf(fd, s1, 10, s1, 34, i);
  close(fd);
  if (system(cmd))
    return 1;
  if (system(s3))
    return 1;
}