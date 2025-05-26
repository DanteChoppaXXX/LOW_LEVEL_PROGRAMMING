/* Program Description */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Spread Password in Memory */
// Create multiple single-byte variables, each holding one character of the password.
char a = 'd';
char b = 'e';
char c = 'e';
char d = 'p';
char e = 'f';
char f = 'l';
char g = 'o';
char h = 'w';

int main()
{
    char user_input[10];
    char pwd_buffer[10];
    char pwd_var[] = {a, b, c, d, e, f, g, h};

    // Prompt the user to enter a password.
    printf("Enter The Password: ");
    scanf("%10s", user_input);

    /* Reconstruct the real password at runtime */
    // Copy each of the password characters into another buffer.
    for (size_t i = 0; i < sizeof(pwd_var); i++)
    {
        pwd_buffer[i] = pwd_var[i];
        
    }
    pwd_buffer[sizeof(pwd_var)] = '\0';

    /* Compare the input with the reconstructed password */
    // Check for equal character length.
    if (strlen(user_input) != strlen(pwd_buffer))
    {
        printf("[x] Access Denied!!! [FAILED!]\n");
        return 1;
    }
    
    // Do a manual character-by-character comparison (avoid using strcmp).
    for (size_t i = 0; i < sizeof(pwd_var); i++)
    {
        if (user_input[i] != pwd_buffer[i])
        {
            printf("[x] Access Denied!!! [FAILED!]\n");
            return 1;
        }
        
    }

    printf("%s\n", user_input);
    printf("[+] Access Granted!!! [SUCCESS!]\n");


    return EXIT_SUCCESS;
}