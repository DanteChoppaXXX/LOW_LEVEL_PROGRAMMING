#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.h"
#include "executor.h"
#include "builtin.h"
#include "utils.h"

#define BUFFER_SIZE 64

int main(void)
{
    char username[16];
    printf("Enter a username: ");
    fgets(username, sizeof(username), stdin);
    username[strcspn(username, "\n")] = '\0';

    char buffer[BUFFER_SIZE];
    char* args[MAX_ARGS];

    while (1)
    {
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

        // if (is_pipe_present(buffer)) 
        // {
        //     run_command_with_pipe(buffer);
        //     continue;
        // }

    
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
            execute_command(args);
        }
    }
    

    return EXIT_SUCCESS;
}