#include <stdio.h>
#include <winsock2.h>
#include <windows.h>
#include <unistd.h>

void comolokko() {

    int rbt;
    printf("Enter an sometimes: ");
    scanf("%d", &rbt);

    // True if num is perfectly divisible by 2
    if(rbt % 2 == 0)
        printf("%d is even.", rbt);
    else
        printf("%d is odd.", rbt);

}


