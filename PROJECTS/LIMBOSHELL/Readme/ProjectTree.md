## 🗂️ `limboshell/`

```
limboshell/
├── src/
│   ├── main.c
│   ├── shell.c
│   ├── shell.h
│   ├── executor.c
│   ├── executor.h
│   ├── parser.c
│   ├── parser.h
│   └── builtins.c
│       builtins.h
│
├── include/
│   └── (optional: for public headers, if you separate interfaces)
│
├── Makefile
└── README.md
```

---

### 🔹 `main.c`

* Entry point.
* Contains the main loop: prompt → read → parse → execute.

### 🔹 `shell.c` / `shell.h`

* Shell loop control logic.
* Prompt formatting, initialization, cleanup, signal setup.

### 🔹 `executor.c` / `executor.h`

* Actual launching of processes (via `fork`, `exec`, `waitpid`).
* Handles redirection, piping, background jobs.

### 🔹 `parser.c` / `parser.h`

* Tokenizing input.
* Parsing into command structures (e.g. linked list or array of structs).
* Detecting special symbols: `|`, `>`, `<`, `&`.

### 🔹 `builtins.c` / `builtins.h`

* Implement built-in commands: `cd`, `exit`, `pwd`, etc.
* Usually run in the parent process.

---

## ✅ `Makefile`

For easy compiling:

```make
CC = gcc
CFLAGS = -Wall -Wextra -g
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
BIN = limboshell

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(BIN) src/*.o
```

---

## 📄 `README.md`

Document:

* What the shell does
* How to compile/run
* Features (current + planned)
* Known bugs / limitations

---
