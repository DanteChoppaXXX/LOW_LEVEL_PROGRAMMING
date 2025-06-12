#include <string.h>
#include <unistd.h>
#include "builtin.h"

/* Handle shell-builtins that must execute in the parent process */
int handle_builtin(char** args)
{
    // Handling "cd" command.
    if (strcmp(args[0], "cd") == 0) chdir(args[1]);
    return 1;
}

int is_builtin(const char* args)
{
    // Handling "cd" command.
    return (strcmp(args, "cd") == 0);

}