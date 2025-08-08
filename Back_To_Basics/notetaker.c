/*
    This program takes a note as command-line argument, then adds it to the end
   of the file /tmp/notes
*/

#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include "utils.h"

void usage(char *prog_name, char *filename)
{
    printf("Usage: %s <data to add to %s>\n", prog_name, filename);
    exit(0);
}

// void fatal(char *);            // A function for fatal errors.
// void *ec_malloc(unsigned int); // An error-checked malloc() wrapper.
//
int main(int argc, char *argv[])
{
    int userid, fd; // File descriptor.
    char *buffer, *datafile;

    buffer = (char *)ec_malloc(100);
    datafile = (char *)ec_malloc(20);
    strcpy(datafile, "/var/notes");

    // Check for command-line arguments.
    if (argc < 2)
    {
        usage(argv[0], datafile); // Display the usage message and exit.
    }

    strcpy(buffer, argv[1]); // Copy note into buffer.

    printf("[DEBUG] buffer   @ %p: \'%s\'\n", buffer, buffer);
    printf("[DEBUG] datafile @ %p: \'%s\'\n", datafile, datafile);


    // Opening file.
    fd = open(datafile, O_WRONLY | O_CREAT | O_APPEND, S_IRUSR | S_IWUSR);
    if (fd == -1)
    {
        fatal("in main() while opening file");
    }
    printf("[DEBUG] file descriptor is %d\n", fd);

    userid = getuid();  // Get the real user ID.

    // Writing data
    if (write(fd, &userid, 4) == -1)    // Write user ID before note data.
    {
        fatal("in main() while writing userid to file");
    }
    write(fd, "\n", 1);    // Add a newline on the end.

    if (write(fd, buffer, strlen(buffer)) == -1)    // Write note.
    {
        fatal("in main() while writing buffer to file");
    }
    write(fd, "\n", 1);    // Add a newline on the end.

    // Closing file
    if (close(fd) == -1)
    {
        fatal("in main() while closing file");
    }

    printf("Note has been saved.\n");

    free(buffer);
    free(datafile);

    return EXIT_SUCCESS;
}

