// Responsibility: Tokenizing user input, detecting piping/redirection, preparing argv.

#ifndef PARSER_H
#define PARSER_H

#define MAX_ARGS 10

typedef struct
{
    char* argv[MAX_ARGS];
    char* input_file;
    char* output_file;
    int mode;     // 1 for write, 0 for read
} Parsed_Command;

int parse_command(char* buffer, char** args);
int is_pipe_present(const char* buffer);
int is_redirection_present(char** args, int argc);
void trim_whitespace(char* str);

#endif