#include <stdio.h>
#include <unistd.h>

int main()
{
    printf("Real uid: %d\nEffective uid: %d\n", getuid(), geteuid());
    
    return 0;
}
