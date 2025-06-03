/* PROGRAM DESCRIPTION */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#define BUFFER_SIZE 64
#define MAX_ARGS 10

char username[16];


void cmd_prompt()
{
    printf("%s🐚limbo:=> ", username);
}

// void parser(char* command)
// {
    
//     strcat(command, path);
// }

int main()
{
    // List of commands for the shell.
    //char*  commands[] = {"/usr/bin/ls", "/usr/bin/echo", "/usr/bin/pwd", NULL};

    printf("Enter a username: ");
    fgets(username, sizeof(username), stdin);
    username[strcspn(username, "\n")] = '\0';

    char buffer[BUFFER_SIZE];
    char* delim = " \n\t";
    char** command = malloc(sizeof(char *) * MAX_ARGS);
    if (command == NULL)
    {
        perror("Failed to allocate memory!");
        return EXIT_FAILURE;
    }
    
    
    // Infinite user prompt loop.
    while (1)
    {
        
        cmd_prompt();
        if(fgets(buffer, BUFFER_SIZE, stdin) == NULL)
        {
            break;
        }
        
        //buffer[strcspn(buffer, "\n")] = '\0';
        //printf("%s\n", buffer);

        /* COMMAND PARSING TIME */
        int argc = 0;
        char* token = strtok(buffer, delim);
        while (token != NULL && argc < MAX_ARGS - 1)
        {
            command[argc] = token;
            argc ++;
            token = strtok(NULL, delim);
        }
        
        command[argc] = NULL;
        
        char path[] = "/usr/bin/";

        // Call the parser function.
        printf("%s\n", command[0]);

        command[0] = strcat(path, command[0]);
        //parser(command[0]);

        printf("%s\n", command[0]);

        /* EXECUTION TIME */
        // Create new process for the command.
        pid_t pid = fork();
        if (pid == -1)
        {
            perror("Failed to fork process!");
            return EXIT_FAILURE;
        }

        if (pid == 0)
        {
            execv(command[0], command);

            perror("execv failed!");
            return EXIT_FAILURE;
        }
        else
        {
            // Parent process.
            wait(NULL);
            printf("✔\n");
            free(command);
        }        

    }


    return EXIT_SUCCESS;
}