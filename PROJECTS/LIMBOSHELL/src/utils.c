#include <stdio.h>
#include "utils.h"

void cmd_prompt(const char* username)
{
    printf("%s⛩ Limbo:=> ", username);
}
void shell_error(const char* msg);
void safe_free(void* ptr);