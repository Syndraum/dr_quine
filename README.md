# Dr Quine

Introduction to quine, self-replication and polymorphism.

## Overview

You have to create three differentes quines, with incremental difficulties an specific contrain.
- [Classic quine](#classic-quine)
- [File quine](#file-quine)
- [Loop quine](#loop-quine)

## What is a quine ?

A quine is a program that containt his own source code and is self-replicating. Open your own file and print it is considired cheating.

## Classic quine

Print his own source code on `stdout`.

2 comments and a secondary function his required.

```c
#include <stdio.h>

void subfunction(char *str) {
    printf(str, ...);
}


/*
    A comment
*/
int main() {
    /*
        A other comment
    */
    char *s1="...";
    subfunction(s1);
}
```

## File quine

Copy his own source code in a new file.

Only use 3 defines and 1 comment.

```c
#define NAME filename
#define CODE "..."
#define FT() ...
/*
    A comment
*/
FT()
```

## Loop quine

- Your quine have an int X.
- Copy his own source file in Sully_X.c.
- Compile new file and launch the new executable.
- After the first copy, X is decrement at each copy.
- Stop when `X <= 0`

Only the X value is different between files.

```c
// Sully.c
#include <...>

int main() {
    int i = 5;
    ...
}
```

```c
// Sully_5.c
#include <...>

int main() {
    int i = 5;
    ...
}
```

```c
// Sully_4.c
#include <...>

int main() {
    int i = 4;
    ...
}
```