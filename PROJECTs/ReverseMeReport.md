# XOR-Encoded Password Reversal Report

## Overview
Binary used XOR-encoding to obfuscate password.

## Observations
- Found encoded characters in disassembly via `objdump`.
- Used decoding logic from C code (`char ^ KEY`) to reconstruct password.
- Verified password in memory using GDB stack inspection.

## Steps Taken
1. Ran `objdump -d <binary>` and looked for immediate values used in password construction.
2. Noted XOR key (`0xa3`), applied XOR again to recover plaintext.
3. Verified via:
   - Re-inputting into program.
   - GDB memory inspection.

## Recovered Password
`deepflow` (original input before encoding)
