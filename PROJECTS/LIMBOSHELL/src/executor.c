#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>
#include "executor.h"
#include "parser.h"



int execute_command(char** args)
{
    char command[25];
    if (strchr(args[0], '/') == NULL)
    {
        snprintf(command, sizeof(command), "/usr/bin/%s", args[0]);
        
        // Check if the command exist among system commands.
        if (access(command, X_OK) == -1)
        {
            printf("❌ Command %s not found!\n", command);
            return 0;
        }
    }
    

    /* EXECUTION TIME */
    // Create new process for the command.
    pid_t pid = fork();
    if (pid == -1)
    {
        perror("Failed to fork process!");
        //free(command);
        exit(EXIT_FAILURE);
    }

    if (pid == 0)
    {
        execvp(args[0], args);

        perror("execv failed!");
        //free(command);
        // If execv fails, we exit the child process.
        exit(EXIT_FAILURE);
    }
    else
    {
        // Parent process.
        wait(NULL);
        printf("✔\n");
        //free(command);
    }        

    return 1;
}
int handle_redirection(char** args, int argc)
{
    
    Parsed_Command* flag = malloc(sizeof(Parsed_Command));
    if (flag == NULL)
    {
        perror("Memory Allocation Failed!");
        exit(EXIT_FAILURE);
    }
    
    
    for (int i = 0; i < argc; i++)
    {
        if (strcmp(args[i], ">") == 0 || strcmp(args[i], ">>") == 0)
        {
            flag->mode = 1;
            flag->output_file = args[i + 1];
            args[i] = NULL;
        }
        else if (strcmp(args[i], "<") == 0)
        {
            flag->mode = 0;
            flag->input_file = args[i + 1];
            args[i] = NULL;
        }
        
        
    }
    
    int fd, fd2;
    fd2 = STDOUT_FILENO;
    
    if (flag->mode == 1)
    {
        fd = open(flag->output_file, O_WRONLY|O_CREAT|O_APPEND, S_IRUSR|S_IWUSR);
        if (fd == -1)
        {
            perror("Failed to open file!");
        }       
        
    }else if (flag->mode == 0)
    {
        fd = open(flag->input_file, O_RDONLY);
        if (fd == -1)
        {
            perror("Failed to open file!");
        }

        fd2 = STDIN_FILENO;   
    }

    /* EXECUTION TIME */
    // Create new process for the command.
    pid_t pid = fork();
    if (pid == -1)
    {
        perror("Failed to fork process!");
        free(flag);
        exit(EXIT_FAILURE);
    }

    if (pid == 0)
    {
        dup2(fd, fd2);
        close(fd);
        execvp(args[0], args);

        perror("execv failed!");
        free(flag);
        // If execv fails, we exit the child process.
        exit(EXIT_FAILURE);
    }
    else
    {
        // Parent process.
        close(fd);
        wait(NULL);
        printf("✔\n");
        //free(command);
    }
    
    return 1;
}


// int run_command_with_pipe(char* buffer)
// {
//     /* PIPELINING - PIPING MULTIPLE COMMANDS TOGETHER */
//     // Detect the pipe operator (|) in the user input and split pipe segments.
//     //printf("%s\n", buffer);
//     // Tokenize the input buffer to extract command and arguments.
//     int argc = 0;
//     char* token = strtok(buffer, "|");

//     while (token != NULL && argc < MAX_ARGS - 1)
//     {
//         command[argc] = token;
//         argc ++;
//         token = strtok(NULL, "|");
//     }
    
//     command[argc] = NULL;

//     char** argv = NULL;

//     argv = malloc(sizeof(char *) * MAX_ARGS);
//     if (argv == NULL)
//     {
//         perror("Failed to allocate memory!");
//         free(command);
//         exit(EXIT_FAILURE);
//     }

    
    
//     int pipefd[2];
//     int prev_read = -1;     // Read-end of the previous pipe.
    
//     // For each command create a pipe() (except for the last one).
//     for (int i = 0; i < argc; i++)
//     {
//         char path[20] = "/usr/bin/";
        
//         int j = 0;
//         char* token = strtok(command[i], " ");

//         while (token != NULL && j < MAX_ARGS - 1)
//         {
//             argv[j] = token;
//             j ++;
//             token = strtok(NULL, " ");
//         }
        
//         argv[j] = NULL;

//         argv[0] = strcat(path, argv[0]);

//         //printf("%s %s : %s %s\n", argv[0], argv[1], argv[2], argv[3]);
        
//         // Check if the command exist among system commands.
//         if (access(argv[0], X_OK) == -1)
//         {
//             printf("❌ Command \"%s\" not found!\n", argv[0]);
//         }
        
//         if (i < argc - 1)
//         {
//             // Create a new pipe.
//             if (pipe(pipefd) == -1 )
//             {
//                 perror("pipe failed!");
//                 exit(EXIT_FAILURE);
//             }
//         }
        
//         // Create new process for the command.
//         pid_t pid = fork();
        
//         if (pid == -1)
//         {
//             perror("Failed to fork process!");
//             free(command);
//             free(argv);
//             exit(EXIT_FAILURE);
//         }

//         if (pid == 0)
//         {
//             printf("🚀 Executing %s 🚀\n", argv[0]);
//             // CHILD PROCESS
//             // If not first command, replace stdin with previous pipe read-end.            
//             if (prev_read != -1)
//             {
//                 dup2(prev_read, STDIN_FILENO);
//                 close(prev_read);
//             }
            
//             // If not last command, replace stdout with current pipe write-end.
//             if (i < argc - 1)
//             {
//                 close(pipefd[0]);       // Close read-end.
//                 dup2(pipefd[1], STDOUT_FILENO);
//                 close(pipefd[1]);
//             }
            
//             // Execute the command.
//             execv(argv[0], argv);
            
//             perror("execv failed!");
//             // If execv fails, we exit the child process.
//             exit(EXIT_FAILURE);
            
//         }
        
//         // PARENT PROCESS
//         // Close write-end of current pipe (no longer needed).
//         if (i < argc - 1)
//         {
//             close(pipefd[1]);
//         }

//         // Close previous read-end (if any).
//         if (prev_read != -1)
//         {
//             close(prev_read);
//         }
        
//         // Update prev_read for next command.
//         if (i < argc - 1)
//         {
//             prev_read = pipefd[0];
            
//         }    
        
//     }
//     printf("✔\n");

//     // Wait for all children.
//     for (int i = 0; i < argc; i++)
//     {
//         wait(NULL);
        
//     }

// }
