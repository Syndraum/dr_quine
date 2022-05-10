#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/wait.h>
#define FORK(...) do {pid=fork();if(pid == 1)return 1;if(pid == 0){execlp(__VA_ARGS__);return 1;}waitpid(pid, &ret, 0);}while(0)

int main(){
  int i=5;
  if (i <= 0)
  return 0;
  char *s1="#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdio.h>%1$c#include <sys/wait.h>%1$c#define FORK(...) do {pid=fork();if(pid == 1)return 1;if(pid == 0){execlp(__VA_ARGS__);return 1;}waitpid(pid, &ret, 0);}while(0)%1$c%1$cint main(){%1$c  int i=%4$d;%1$c  if (i <= 0)%1$c  return 0;%1$c  char *s1=%3$c%2$s%3$c;%1$c  char s2[255]={0};%1$c  char s3[255]={0};%1$c  sprintf(s2, %3$cSully_%%d.c%3$c, i-1);%1$c  sprintf(s3, %3$cSully_%%d.o%3$c, i-1);%1$c  int fd=open(s2, 577, 436);%1$c  dprintf(fd, s1, 10, s1, 34, i-1);%1$c  close(fd);%1$c  int ret=0;%1$c  pid_t pid;%1$c  FORK(%3$cclang%3$c, %3$cclang%3$c, %3$c-Wall%3$c, %3$c-Werror%3$c, %3$c-Wall%3$c, s2, %3$c-c%3$c, NULL);%1$c  FORK(%3$cclang%3$c, %3$cclang%3$c, %3$c-Wall%3$c, %3$c-Werror%3$c, %3$c-Wall%3$c, s3, %3$c-o%3$c, %3$cSully%3$c, NULL);%1$c  execlp(%3$c./Sully%3$c, %3$c./Sully%3$c, NULL);%1$c  return 1;%1$c}";
  char s2[255]={0};
  char s3[255]={0};
  sprintf(s2, "Sully_%d.c", i-1);
  sprintf(s3, "Sully_%d.o", i-1);
  int fd=open(s2, 577, 436);
  dprintf(fd, s1, 10, s1, 34, i-1);
  close(fd);
  int ret=0;
  pid_t pid;
  FORK("clang", "clang", "-Wall", "-Werror", "-Wall", s2, "-c", NULL);
  FORK("clang", "clang", "-Wall", "-Werror", "-Wall", s3, "-o", "Sully", NULL);
  execlp("./Sully", "./Sully", NULL);
  return 1;
}