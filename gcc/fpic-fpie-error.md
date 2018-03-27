# gcc link failed with -fPIE

`fuga.c`

```c
#include <stdio.h>

void fuga() {
    printf("fuga\n");
}

int main() {
    fuga();
    return 0;
}
```

## gcc 4.8 on CentOS 7

```
$ gcc -c -fPIE -fPIC fuga.c
$ gcc -o fuga -shared fuga.o
$
```

## gcc 4.4 on CentOS 6

```
$ gcc -c -fPIE -fPIC fuga.c
$ gcc -o fuga -shared fuga.o
/usr/bin/ld: fuga.o: relocation R_X86_64_PC32 against symbol `fuga' can not be used when making a shared object; recompile with -fPIC
/usr/bin/ld: final link failed: Bad value
collect2: ld returned 1 exit status
$
```

