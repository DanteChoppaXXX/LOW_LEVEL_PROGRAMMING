#ifndef EXECUTOR_H
#define EXECUTOR_H


int execute_command(char** args, int argc);
int handle_redirection(char** args, int argc);
int run_command_with_pipe(char* buffer);

#endif