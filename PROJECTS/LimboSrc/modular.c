// main.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.h"
#include "executor.h"
#include "builtin.h"
#include "utils.h"

#define BUFFER_SIZE 64

int main(void) {
    char username[16];
    printf("Enter a username: ");
    fgets(username, sizeof(username), stdin);
    username[strcspn(username, "\n")] = '\0';

    char buffer[BUFFER_SIZE];
    char* args[MAX_ARGS];

    while (1) {
        cmd_prompt(username);

        if (fgets(buffer, BUFFER_SIZE, stdin) == NULL) break;
        if (strcmp(buffer, "exit\n") == 0) {
            printf("Exiting Limbo shell...\n");
            break;
        }
        if (strspn(buffer, " \t\n") == strlen(buffer)) continue;

        buffer[strcspn(buffer, "\n")] = '\0';

        if (is_pipe_present(buffer)) {
            run_command_with_pipe(buffer);
            continue;
        }

        parse_command(buffer, args);

        if (is_builtin(args[0])) {
            handle_builtin(args);
        } 
        // else if (is_redirection_present(args)) {
        //     handle_redirection(args);
        // } 
        else {
            execute_command(args);
        }
    }

    return 0;
}

// parser.h
#ifndef PARSER_H
#define PARSER_H

#define MAX_ARGS 10

int parse_command(char* buffer, char** args);
int is_pipe_present(const char* buffer);
int is_redirection_present(char** args);
void trim_whitespace(char* str);

#endif

// executor.h
#ifndef EXECUTOR_H
#define EXECUTOR_H

int execute_command(char** args);
int handle_redirection(char** args);
int run_command_with_pipe(char* buffer);

#endif

// builtin.h
#ifndef BUILTIN_H
#define BUILTIN_H

int handle_builtin(char** args);
int is_builtin(const char* cmd);

#endif

// utils.h
#ifndef UTILS_H
#define UTILS_H

void cmd_prompt(const char* username);
void shell_error(const char* msg);
void safe_free(void* ptr);

#endif
