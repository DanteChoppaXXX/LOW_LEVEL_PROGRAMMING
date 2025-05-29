/* Program Description

 * This program demonstrates a simple password check mechanism.
 * The password is stored in a spread manner across multiple variables,
 * and it is reconstructed at runtime for comparison with user input.
 * Each byte of the password is obfuscated using a simple XOR operation with a key.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define KEY 0xa3
#define PWD_LENGTH 8

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
    char pwd_var[] = {a, b, c, d, e, f, g, h};

    // Prompt the user to enter a password.
    printf("Enter The Password: ");
    scanf("%10s", user_input);

    /* Reconstruct the real password at runtime */
    // Copy each of the password characters into another buffer.
    for (size_t i = 0; i < PWD_LENGTH; i++)
    {
        pwd_buffer[i] = pwd_var[i] ^ KEY;
        
    }
    pwd_buffer[PWD_LENGTH] = '\0';

    /* Compare the input with the reconstructed password */
    // Check for equal character length.
    if (strlen(user_input) != strlen(pwd_buffer))
    {
        printf("[x] Access Denied!!! [FAILED!]\n");
        return 1;
    }
    
    // Do a manual character-by-character comparison (avoid using strcmp).
    for (size_t i = 0; i < PWD_LENGTH; i++)
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