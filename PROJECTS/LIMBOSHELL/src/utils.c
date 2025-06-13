#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <sys/wait.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include "utils.h"

void cmd_prompt(const char* username)
{
    printf("%s⛩ Limbo:=> ", username);
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
