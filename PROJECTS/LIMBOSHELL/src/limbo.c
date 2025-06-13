#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <wait.h>
#include <errno.h>
#include "parser.h"
#include "executor.h"
#include "builtin.h"
#include "utils.h"

#define BUFFER_SIZE 64

char username[16];

void handle_sigchld(int sig) 
{
    (void)sig; // Silence unused warning

    int saved_errno = errno;
    pid_t pid;
    int status;

    // Loop to handle multiple terminated children
    while ((pid = waitpid(-1, &status, WNOHANG)) > 0) {
        if (WIFEXITED(status)) {
            printf("\n✔ Background job (PID %d) completed with exit status %d\n", pid, WEXITSTATUS(status));
        } else if (WIFSIGNALED(status)) {
            printf("\n✖ Background job (PID %d) terminated by signal %d\n", pid, WTERMSIG(status));
        } else {
            printf("\n⚠ Background job (PID %d) ended unexpectedly\n", pid);
        }

        // Re-print the prompt so user isn't confused
        cmd_prompt(username);
        fflush(stdout);
    }

    errno = saved_errno;
}

int main(void)
{
    //setup_sigchld_handler();

    // Set up SIGCHLD handler for background jobs
    struct sigaction sa;
    sa.sa_handler = &handle_sigchld;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_RESTART | SA_NOCLDSTOP; // Restart syscalls & ignore stopped children

    if (sigaction(SIGCHLD, &sa, NULL) == -1) {
        perror("sigaction");
        exit(EXIT_FAILURE);
    }

    printf("Enter a username: ");
    fgets(username, sizeof(username), stdin);
    username[strcspn(username, "\n")] = '\0';
    
    char buffer[BUFFER_SIZE];
    char* args[MAX_ARGS];
    
    while (1)
    {
        waitpid(-1, NULL, WNOHANG);
        cmd_prompt(username);

        if (fgets(buffer, BUFFER_SIZE, stdin) == NULL) break;

        /* INPUT VALIDATION TIME */
        //  Check if user typed exit command.
        if (strcmp(buffer, "exit\n") == 0) 
        {
            printf("Exiting Limbo shell...\n");
            break;
        }
        // Check if user pressed enter without typing anything OR typed only spaces or tabs.
        if (strspn(buffer, " \t\n") == strlen(buffer)) continue;

        buffer[strcspn(buffer, "\n")] = '\0';

        if (is_pipe_present(buffer)) 
        {
            run_command_with_pipe(buffer);
            continue;
        }

    
        int argc;
        argc = parse_command(buffer, args);
       
        if (is_builtin(args[0])) 
        {
            handle_builtin(args);
        }
        else if (is_redirection_present(args, argc)) 
        {
            handle_redirection(args, argc);
        }
        else 
        {
            execute_command(args, argc);
        }

    }
    

    return EXIT_SUCCESS;
}