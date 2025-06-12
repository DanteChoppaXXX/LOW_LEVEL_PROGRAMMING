# **🧱MODULAR STRUCTURE**
Modular breakdown of your shell into `.h` and `.c` files, showing responsibilities and suggested function interfaces.

---

### 🧠 1. `main.c`

**Responsibility:**
Main loop, buffer input, high-level control flow.

**Functions:**

```c
#include "parser.h"
#include "executor.h"
#include "builtin.h"
#include "utils.h"

int main(void);
```

---

### 🧱 2. `parser.h` / `parser.c`

**Responsibility:**
Tokenizing user input, detecting piping/redirection, preparing `argv`.

**`parser.h`:**

```c
#ifndef PARSER_H
#define PARSER_H

#define MAX_ARGS 10

int parse_command(char* buffer, char** args);
int is_pipe_present(const char* buffer);
int is_redirection_present(const char** args);
void trim_whitespace(char* str);

#endif
```

**`parser.c`:**

```c
#include "parser.h"

int parse_command(char* buffer, char** args);
int is_pipe_present(const char* buffer);
int is_redirection_present(const char** args);
void trim_whitespace(char* str);
```

---

### ⚙️ 3. `executor.h` / `executor.c`

**Responsibility:**
Forking, exec'ing, handling redirection or I/O behavior.

**`executor.h`:**

```c
#ifndef EXECUTOR_H
#define EXECUTOR_H

int execute_command(char** args);
int handle_redirection(char** args);
int run_command_with_pipe(char* buffer);

#endif
```

**`executor.c`:**

```c
#include "executor.h"

int execute_command(char** args);
int handle_redirection(char** args);
int run_command_with_pipe(char* buffer);
```

---

### 📦 4. `builtin.h` / `builtin.c`

**Responsibility:**
Built-in shell commands (`cd`, `exit`, later maybe `jobs`, `export`, etc.)

**`builtin.h`:**

```c
#ifndef BUILTIN_H
#define BUILTIN_H

int handle_builtin(char** args);
int is_builtin(const char* cmd);

#endif
```

**`builtin.c`:**

```c
#include "builtin.h"

int handle_builtin(char** args);
int is_builtin(const char* cmd);
```

---

### 🔧 5. `utils.h` / `utils.c`

**Responsibility:**
Helper functions: error messages, prompt, memory, etc.

**`utils.h`:**

```c
#ifndef UTILS_H
#define UTILS_H

void cmd_prompt(const char* username);
void shell_error(const char* msg);
void safe_free(void* ptr);

#endif
```

**`utils.c`:**

```c
#include "utils.h"

void cmd_prompt(const char* username);
void shell_error(const char* msg);
void safe_free(void* ptr);
```

---

### 🧪 Optional Later Modules:

* `background.h`/`.c` for `&` background execution.
* `job.h`/`.c` for tracking background jobs.
* `history.h`/`.c` if you implement command history.

---
