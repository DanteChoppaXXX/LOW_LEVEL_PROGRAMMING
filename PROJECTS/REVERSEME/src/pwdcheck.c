/* Password-Check Function For Dynamic Reconstruction */

#include <stdio.h>

#define PWD_LENGTH 8
#define SUCCESS_FLAG 1
#define FAILED_FLAG 0

int pwdcheck(char* user_input, int len)
{
    // Store the password in an char array.
    char pwd_buffer[] = {'d','e','e','p','f','l','o','w'};

    // Check for equal character length.
    if (len != PWD_LENGTH)
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