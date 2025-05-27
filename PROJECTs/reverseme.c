/* Program Description */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define KEY 0xa3

int main()
{
    /* Spread Password in Memory */
    // Create multiple single-byte variables, each holding one character of the password.
    char a = 'd' ^ KEY;
    char b = 'e' ^ KEY;
    char c = 'e' ^ KEY;
    char d = 'p' ^ KEY;
    char e = 'f' ^ KEY;
    char f = 'l' ^ KEY;
    char g = 'o' ^ KEY;
    char h = 'w' ^ KEY;

    // Create a buffer to hold the user input.
    char user_input[10];
    
    char pwd_buffer[10];
    char pwd_var[] = {a ^ KEY, b ^ KEY, c ^ KEY, d ^ KEY, e ^ KEY, f ^ KEY, g ^ KEY, h ^ KEY};

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