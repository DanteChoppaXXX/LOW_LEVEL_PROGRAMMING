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
    printf("%s⛩ Limbo:=> ", username);
}

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

        /* INPUT VALIDATION TIME */
        // Check if the input buffer is empty.
        if (strlen(buffer) == 0)
        {
            printf("❌ Command not found!\n");
            continue;
        }
        //  Check if user typed exit command.
        if (strcmp(buffer, "exit\n") == 0 || strcmp(buffer, "exit") == 0)
        {
            printf("Exiting Limbo shell...\n");
            free(command);
            exit(EXIT_SUCCESS);
        }
        
        // Check if user pressed enter without typing anything OR typed only spaces or tabs.
        if (strspn(buffer, " \t\n") == strlen(buffer))
        {
            //printf("❌ Command not found!\n");
            continue;
        }
        // Remove trailing newline character from the input buffer.
        buffer[strcspn(buffer, "\n")] = '\0';

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


        command[0] = strcat(path, command[0]);

        // Check if the command exist among system commands.
        if (access(command[0], X_OK) == -1)
        {
            printf("❌ Command not found!\n");
            continue;
        }

        // Handle shell-builtins that must execute in the parent process.
        /* code */

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