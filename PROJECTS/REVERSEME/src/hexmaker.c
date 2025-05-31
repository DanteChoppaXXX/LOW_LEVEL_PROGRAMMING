#include <stdio.h>

int main()
{

    
    //"55  89  e5  83  ec  10  e8  13  02  00  00  05  fc  2d  00  00  c7  45  f4  64  65  65  70  c7  45  f8  66  6c  6f  77  83  7d  0c  08  74  07  b8  00  00  00  00  eb  39  c7  45  fc  00  00  00  00  eb  25  8b  55  fc  8b  45  08  01  d0  0f  b6  10  8d  4d  f4  8b  45  fc  01  c8  0f  b6  00  38  c2  74  07  b8  00  00  00  00  eb  0f  83  45  fc  01  83  7d  fc  07  7e  d5  b8  01  00  00  00  c9  c3"
    
    /* MACHINE CODE */
    unsigned char raw[] = {"55  89  e5  83  ec  10  05  fc  2d  00  00  c7  45  f4  64  65  65  70  c7  45  f8  66  6c  6f  77  83  7d  0c  08  74  07  b8  00  00  00  00  eb  39  c7  45  fc  00  00  00  00  eb  25  8b  55  fc  8b  45  08  01  d0  0f  b6  10  8d  4d  f4  8b  45  fc  01  c8  0f  b6  00  38  c2  74  07  b8  00  00  00  00  eb  0f  83  45  fc  01  83  7d  fc  07  7e  d5  b8  01  00  00  00  c9  c3"
    };
    
    int counter = 0;
    for (size_t i = 0; i < sizeof(raw); i+=2)
    {
        if (raw[i] != ' ' )
        {
            printf("0x%c%c ^ KEY, ", raw[i], raw[i + 1]);
            counter ++;
        }
 
    }
    printf("\nNumber Of Bytes: %d\n", counter);

    return 0;
}
