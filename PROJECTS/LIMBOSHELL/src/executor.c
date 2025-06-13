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



int execute_command(char** args, int argc)
{
    char cmd[25];

    // Check if the command exists.
    if (strchr(args[0], '/') == NULL)
    {
        snprintf(cmd, sizeof(cmd), "/usr/bin/%s", args[0]);

        if (access(cmd, X_OK) == -1)
        {
            printf("❌ Command %s not found!\n", args[0]);
            return 0;
        }
    }

    // Check if it's a background command.
    int background = 0;
    if (strcmp(args[argc - 1], "&") == 0)
    {
        background = 1;
        args[argc - 1] = NULL;  // ✅ Proper null-termination
        argc--;
    }

    pid_t pid = fork();

    if (pid == -1)
    {
        perror("Failed to fork process!");
        exit(EXIT_FAILURE);
    }

    if (pid == 0)
    {
        // Child process
        setpgid(0, 0);  // ✅ Always set PGID to detach from shell control

        execvp(args[0], args);

        perror("execvp failed");
        exit(EXIT_FAILURE);
    }
    else
    {
        // Parent process
        if (!background)
        {
            waitpid(pid, NULL, 0);
            printf("✔\n");
        }
        else
        {
            printf("✔ Background job started [PID %d]\n", pid);
            fflush(stdout);
            printf("\n");  // ✅ Ensure prompt doesn't get overwritten
        }
    }

    return EXIT_SUCCESS;
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
    
    return EXIT_SUCCESS;
}


int run_command_with_pipe(char* buffer)
{
    /* PIPELINING - PIPING MULTIPLE COMMANDS TOGETHER */
    // Detect the pipe operator (|) in the user input and split pipe segments.
    //printf("%s\n", buffer);
    // Tokenize the input buffer to extract command and arguments.
    
    char** command = NULL;
    // Allocate memory for command arguments.
    command = malloc(sizeof(char *) * MAX_ARGS);
    if (command == NULL)
    {
        perror("Failed to allocate memory!");
        exit(EXIT_FAILURE);
    }

    int argc = 0;
    char* token = strtok(buffer, "|");

    while (token != NULL && argc < MAX_ARGS - 1)
    {
        command[argc] = token;
        argc ++;
        token = strtok(NULL, "|");
    }
    
    command[argc] = NULL;

    char** argv = NULL;

    argv = malloc(sizeof(char *) * MAX_ARGS);
    if (argv == NULL)
    {
        perror("Failed to allocate memory!");
        free(command);
        exit(EXIT_FAILURE);
    }

    
    
    int pipefd[2];
    int prev_read = -1;     // Read-end of the previous pipe.
    
    // For each command create a pipe() (except for the last one).
    for (int i = 0; i < argc; i++)
    {
        int j = 0;
        char* token = strtok(command[i], " ");

        while (token != NULL && j < MAX_ARGS - 1)
        {
            argv[j] = token;
            j ++;
            token = strtok(NULL, " ");
        }
        
        argv[j] = NULL;
        
        if (i < argc - 1)
        {
            // Create a new pipe.
            if (pipe(pipefd) == -1 )
            {
                perror("pipe failed!");
                exit(EXIT_FAILURE);
            }
        }
        
        // Create new process for the command.
        pid_t pid = fork();
        
        if (pid == -1)
        {
            perror("Failed to fork process!");
            free(command);
            free(argv);
            exit(EXIT_FAILURE);
        }

        if (pid == 0)
        {
            //printf("🚀 Executing %s 🚀\n", argv[0]);
            // CHILD PROCESS
            // If not first command, replace stdin with previous pipe read-end.            
            if (prev_read != -1)
            {
                dup2(prev_read, STDIN_FILENO);
                close(prev_read);
            }
            
            // If not last command, replace stdout with current pipe write-end.
            if (i < argc - 1)
            {
                close(pipefd[0]);       // Close read-end.
                dup2(pipefd[1], STDOUT_FILENO);
                close(pipefd[1]);
            }
            
            // Execute the command.
            execvp(argv[0], argv);
            
            perror("execv failed!");
            // If execv fails, we exit the child process.
            exit(EXIT_FAILURE);
            
        }
        
        // PARENT PROCESS
        // Close write-end of current pipe (no longer needed).
        if (i < argc - 1)
        {
            close(pipefd[1]);
        }

        // Close previous read-end (if any).
        if (prev_read != -1)
        {
            close(prev_read);
        }
        
        // Update prev_read for next command.
        if (i < argc - 1)
        {
            prev_read = pipefd[0];
            
        }    
        
    }
    printf("✔\n");

    // Wait for all children.
    for (int i = 0; i < argc; i++)
    {
        wait(NULL);
        
    }

    return EXIT_SUCCESS;
}
