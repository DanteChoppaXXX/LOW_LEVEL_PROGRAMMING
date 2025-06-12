#include <string.h>
#include "parser.h"

int parse_command(char* buffer, char** args)
{
    // Tokenize the input buffer to extract command and arguments.
    char* delim = " \n\t";
    int argc = 0;
    char* token = strtok(buffer, delim);

    while (token != NULL && argc < MAX_ARGS - 1)
    {
        args[argc] = token;
        argc ++;
        token = strtok(NULL, delim);
    }
    
    args[argc] = NULL;

    return argc;

}
int is_pipe_present(const char* buffer)
{
    return (strstr(buffer, "|") != NULL);

}
int is_redirection_present(char** args, int argc)
{
    int flag = 0;
    for (int i = 0; i < argc; i++)
    {
        if (strcmp(args[i], ">") == 0 || strcmp(args[i], ">>") == 0 || strcmp(args[i], "<") == 0)
        {
            flag = 1;
            break;
        }
    }
    return flag;
    
}
void trim_whitespace(char* str);