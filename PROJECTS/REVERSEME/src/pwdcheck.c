/* Password-Check Function For Dynamic Reconstruction */

#include <stdio.h>
#include <string.h>

#define PWD_LENGTH 8
#define SUCCESS_FLAG 1
#define FAILED_FLAG 0

int pwdcheck(char* user_input)
{
    // Store the password in an char array.
    char pwd_buffer[] = {'d','e','e','p','f','l','o','w'};

    // Check for equal character length.
    if (strlen(user_input) != strlen(pwd_buffer) - 1)
    {
        return FAILED_FLAG;
    }

    // Do a manual character-by-character comparison (avoid using strcmp).
    for (int i = 0; i < PWD_LENGTH; i++)
    {
        if (user_input[i] != pwd_buffer[i])
        {
            return FAILED_FLAG;
        }  
    }
    return SUCCESS_FLAG;
}


int main()
{

    /* MACHINE CODE */
    
    unsigned char raw[] = {
        "55  89  e5  56  53  83  ec  10  e8  f6  fe  ff  ff  81  c3  2a  2e  00  00  c7  45  ec  64  65  65  70  c7  45  f0  66  6c  6f  77  83  ec  0c  ff  75  08  e8  77  fe  ff  ff  83  c4  10  89  c6  83  ec  0c  8d  45  ec  50  e8  66  fe  ff  ff  83  c4  10  83  e8  01  39  c6  74  07  b8  00  00  00  00  eb  39  c7  45  f4  00  00  00  00  eb  25  8b  55  f4  8b  45  08  01  d0  0f  b6  10  8d  4d  ec  8b  45  f4  01  c8  0f  b6  00  38  c2  74  07  b8  00  00  00  00  eb  0f  83  45  f4  01  83  7d  f4  07  7e  d5  b8  01  00  00  00  8d  65  f8  5b  5e  5d  c3"
    };
    
    int counter = 0;
    for (size_t i = 0; i < sizeof(raw); i+=2)
    {
        if (raw[i] != ' ' )
        {
            printf("0x%c%c ^ KEY, ", raw[i], raw[i + 1]);
            counter ++;
        }
        // else
        // {
        //     printf("%d", i);

        // }
        
        // printf("\\x%c%c ", raw[i], raw[j]);
    }
    printf("\nNumber Of Bytes: %d\n", counter);

    return 0;
}
