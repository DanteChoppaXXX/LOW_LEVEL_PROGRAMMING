/* PROGRAM DESCRIPTION */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h> 

#define BUFFER_SIZE 64
#define MAX_ARGS 10

char username[16];


void cmd_prompt()
{
    printf("%s⛩ Limbo:=> ", username);
}

int main()
{

    printf("Enter a username: ");
    fgets(username, sizeof(username), stdin);
    username[strcspn(username, "\n")] = '\0';

    char buffer[BUFFER_SIZE];
    char* delim = " \n\t";
    char** command = NULL;
        
    // Infinite user prompt loop.
    while (1)
    {
        
        cmd_prompt();
        if(fgets(buffer, BUFFER_SIZE, stdin) == NULL)
        {
            break;
        }

        /* INPUT VALIDATION TIME */
        //  Check if user typed exit command.
        if (strcmp(buffer, "exit\n") == 0 || strcmp(buffer, "exit") == 0)
        {
            printf("Exiting Limbo shell...\n");
            exit(EXIT_SUCCESS);
        }
        
        // Check if user pressed enter without typing anything OR typed only spaces or tabs.
        if (strspn(buffer, " \t\n") == strlen(buffer))
        {
            continue;
        }

        // Remove trailing newline character from the input buffer.
        buffer[strcspn(buffer, "\n")] = '\0';

        /* COMMAND PARSING TIME */
        // Allocate memory for command arguments.
        command = malloc(sizeof(char *) * MAX_ARGS);
        if (command == NULL)
        {
            perror("Failed to allocate memory!");
            return EXIT_FAILURE;
        }
        
        // Tokenize the input buffer to extract command and arguments.
        int argc = 0;
        char* token = strtok(buffer, delim);

        while (token != NULL && argc < MAX_ARGS - 1)
        {
            command[argc] = token;
            argc ++;
            token = strtok(NULL, delim);
        }
        
        command[argc] = NULL;

        
        
        /* Handle shell-builtins that must execute in the parent process */
        // Handling "cd" command.
        if (strcmp(command[0], "cd") == 0)
        {
            chdir(command[1]);
            continue;
        }
        
        char path[] = "/usr/bin/";
        
        command[0] = strcat(path, command[0]);
        
        // Check if the command exist among system commands.
        if (access(command[0], X_OK) == -1)
        {
            printf("❌ Command not found!\n");
            continue;
        }

        if (argc <= 2)
        {
            /* EXECUTION TIME */
            // Create new process for the command.
            pid_t pid = fork();
            if (pid == -1)
            {
                perror("Failed to fork process!");
                free(command);
                exit(EXIT_FAILURE);
            }

            if (pid == 0)
            {
                execv(command[0], command);

                perror("execv failed!");
                free(command);
                // If execv fails, we exit the child process.
                exit(EXIT_FAILURE);
            }
            else
            {
                // Parent process.
                wait(NULL);
                printf("✔\n");
                free(command);
                continue;
            }        

        }


        /* INPUT/OUTPUT REDIRECTION */
        // Detect redirection operators (>, >>, <) in the user input.

        int fd, fd2;
        fd2 = STDOUT_FILENO;
        
        if (strcmp(command[argc - 2], ">") == 0)
        {
            fd = open(command[argc - 1], O_WRONLY|O_CREAT|O_APPEND, S_IRUSR|S_IWUSR);
            if (fd == -1)
            {
                perror("Failed to open file!");
            }
            command[argc - 2] = NULL;         
            
        }else if (strcmp(command[argc - 2], "<") == 0)
        {
            fd = open(command[argc - 1], O_RDONLY);
            if (fd == -1)
            {
                perror("Failed to open file!");
            }
            command[argc - 2] = NULL;
            fd2 = STDIN_FILENO;   
        }

        /* EXECUTION TIME */
        // Create new process for the command.
        pid_t pid = fork();
        if (pid == -1)
        {
            perror("Failed to fork process!");
            free(command);
            exit(EXIT_FAILURE);
        }

        if (pid == 0)
        {
            dup2(fd, fd2);
            close(fd);
            execv(command[0], command);

            perror("execv failed!");
            free(command);
            // If execv fails, we exit the child process.
            exit(EXIT_FAILURE);
        }
        else
        {
            // Parent process.
            close(fd);
            wait(NULL);
            printf("✔\n");
            free(command);
        }        

    }


    return EXIT_SUCCESS;
}