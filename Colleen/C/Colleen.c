#include <stdio.h>

void echo(char *s1){
    printf(s1, 10, 34, s1);
}

/*
    This program will print its own source when run.
*/
int main(){
    /*
        Begin program
    */
    char *s1="#include <stdio.h>%1$c%1$cvoid echo(char *s1){%1$c    printf(s1, 10, 34, s1);%1$c}%1$c%1$c/*%1$c    This program will print its own source when run.%1$c*/%1$cint main(){%c    /*%1$c        Begin program%1$c    */%1$c    char *s1=%2$c%3$s%2$c;%1$c    echo(s1);%1$c}";
    echo(s1);
}