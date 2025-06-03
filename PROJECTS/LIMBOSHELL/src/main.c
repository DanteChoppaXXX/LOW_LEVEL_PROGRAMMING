/* PROGRAM DESCRIPTION */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 64

char username[16];


void cmd_prompt()
{
    printf("%s🐚limbo:=> \n", username);
}

int main()
{
    printf("Enter a username: ");
    fgets(username, sizeof(username), stdin);
    username[strcspn(username, "\n")] = '\0';

    char buffer[BUFFER_SIZE];
    char* delim = " ";
    
    // Infinite user prompt loop.
    while (1)
    {
        cmd_prompt();
        fgets(buffer, BUFFER_SIZE, stdin);
        buffer[strcspn(buffer, "\n")] = '\0';
        
        char* token = strtok(buffer, delim);
        while (token != NULL)
        {
            printf("%s\n", token);
            token = strtok(NULL, delim);
        }
        
        

        

    }
    

    return EXIT_SUCCESS;
}