/* Program Description

 * This program demonstrates a simple password check mechanism.
 * The password is stored in a spread manner across multiple variables,
 * and it is reconstructed at runtime for comparison with user input.
 * Each byte of the password is obfuscated using a simple XOR operation with a key.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

#define KEY 0xa3
#define PWD_LENGTH 8
#define SUCCESS_FLAG 1
#define FAILED_FLAG 0


int main()
{
    // Function Encoded Bytes.
    unsigned char encoded_function[] = {0x55 ^ KEY, 0x89 ^ KEY, 0xe5 ^ KEY, 0x56 ^ KEY, 0x53 ^ KEY, 0x83 ^ KEY, 0xec ^ KEY, 0x10 ^ KEY, 0xe8 ^ KEY, 0xf6 ^ KEY, 0xfe ^ KEY, 0xff ^ KEY, 0xff ^ KEY, 0x81 ^ KEY, 0xc3 ^ KEY, 0x2a ^ KEY, 0x2e ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0xc7 ^ KEY, 0x45 ^ KEY, 0xec ^ KEY, 0x64 ^ KEY, 0x65 ^ KEY, 0x65 ^ KEY, 0x70 ^ KEY, 0xc7 ^ KEY, 0x45 ^ KEY, 0xf0 ^ KEY, 0x66 ^ KEY, 0x6c ^ KEY, 0x6f ^ KEY, 0x77 ^ KEY, 0x83 ^ KEY, 0xec ^ KEY, 0x0c ^ KEY, 0xff ^ KEY, 0x75 ^ KEY, 0x08 ^ KEY, 0xe8 ^ KEY, 0x77 ^ KEY, 0xfe ^ KEY, 0xff ^ KEY, 0xff ^ KEY, 0x83 ^ KEY, 0xc4 ^ KEY, 0x10 ^ KEY, 0x89 ^ KEY, 0xc6 ^ KEY, 0x83 ^ KEY, 0xec ^ KEY, 0x0c ^ KEY, 0x8d ^ KEY, 0x45 ^ KEY, 0xec ^ KEY, 0x50 ^ KEY, 0xe8 ^ KEY, 0x66 ^ KEY, 0xfe ^ KEY, 0xff ^ KEY, 0xff ^ KEY, 0x83 ^ KEY, 0xc4 ^ KEY, 0x10 ^ KEY, 0x83 ^ KEY, 0xe8 ^ KEY, 0x01 ^ KEY, 0x39 ^ KEY, 0xc6 ^ KEY, 0x74 ^ KEY, 0x07 ^ KEY, 0xb8 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0xeb ^ KEY, 0x39 ^ KEY, 0xc7 ^ KEY, 0x45 ^ KEY, 0xf4 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0xeb ^ KEY, 0x25 ^ KEY, 0x8b ^ KEY, 0x55 ^ KEY, 0xf4 ^ KEY, 0x8b ^ KEY, 0x45 ^ KEY, 0x08 ^ KEY, 0x01 ^ KEY, 0xd0 ^ KEY, 0x0f ^ KEY, 0xb6 ^ KEY, 0x10 ^ KEY, 0x8d ^ KEY, 0x4d ^ KEY, 0xec ^ KEY, 0x8b ^ KEY, 0x45 ^ KEY, 0xf4 ^ KEY, 0x01 ^ KEY, 0xc8 ^ KEY, 0x0f ^ KEY, 0xb6 ^ KEY, 0x00 ^ KEY, 0x38 ^ KEY, 0xc2 ^ KEY, 0x74 ^ KEY, 0x07 ^ KEY, 0xb8 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0xeb ^ KEY, 0x0f ^ KEY, 0x83 ^ KEY, 0x45 ^ KEY, 0xf4 ^ KEY, 0x01 ^ KEY, 0x83 ^ KEY, 0x7d ^ KEY, 0xf4 ^ KEY, 0x07 ^ KEY, 0x7e ^ KEY, 0xd5 ^ KEY, 0xb8 ^ KEY, 0x01 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0x00 ^ KEY, 0x8d ^ KEY, 0x65 ^ KEY, 0xf8 ^ KEY, 0x5b ^ KEY, 0x5e ^ KEY, 0x5d ^ KEY, 0xc3 ^ KEY};

    // Allocate Executable Memory With mmap().
    size_t size = 256;
    void* exec_mem = mmap(NULL, size,
                        PROT_READ | PROT_WRITE | PROT_EXEC,
                        MAP_PRIVATE | MAP_ANONYMOUS,
                        -1, 0);

    if (exec_mem == MAP_FAILED)
    {
        perror("mmap");
        exit(1);
    }
    
    // Decode the Bytes Into the Allocated Memory.
    for (size_t i = 0; i < sizeof(encoded_function); i++)
    {
        exec_mem = (void*)(encoded_function[i] ^ KEY);
        exec_mem ++;
    }
    // Cast memory pointer to a function pointer of type (int).
    typedef int (*func_ptr)(char*);
    func_ptr pwdcheck = (func_ptr)exec_mem;

    // Create a buffer to hold the user input.
    char user_input[10];

    // Prompt the user to enter a password.
    printf("Enter The Password: ");
    scanf("%10s", user_input);  

    /* Compare the input with the reconstructed password */
    /* code */

    if (pwdcheck(user_input))
    {
        printf("%s\n", user_input);
        printf("[+] Access Granted!!! [SUCCESS!]\n");
    }
    else
    {
        printf("[x] Access Denied!!! [FAILED!]\n");
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}