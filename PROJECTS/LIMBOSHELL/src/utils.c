#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <sys/wait.h>
#include <unistd.h>
#include "utils.h"

void cmd_prompt(const char* username)
{
    printf("\033[1;32m%s\033[1;33m@\033[1;31mLimbo:=>\033[1;97m ", username);
}
void shell_error(const char* msg);
void safe_free(void* ptr);

// void handle_sigchld(int sig)
// {
//     (void)sig;  // silence unused warning
//     int saved_errno = errno;
//     while (waitpid(-1, NULL, WNOHANG) > 0)
//         ;
//     errno = saved_errno;
// }

// void setup_sigchld_handler()
// {
//     struct sigaction sa;
//     sa.sa_handler = &handle_sigchld;
//     sigemptyset(&sa.sa_mask);
//     sa.sa_flags = SA_RESTART | SA_NOCLDSTOP;
//     sigaction(SIGCHLD, &sa, NULL);
// }
