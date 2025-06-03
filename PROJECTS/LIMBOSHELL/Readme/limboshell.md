# 🛠️ Project: **Mini Shell (Stage 1 to 5)**

We’ll build it in stages. You’ll get a real shell by the end — not just a toy.

---

### 🔹 **Stage 1: Basic Command Execution**
---

### ✅ Goal

Allow the user to enter a command (e.g., `ls`, `echo hello`) and have your shell execute it just like a real shell.

---
**Goal:** Run commands like `ls`, `echo hello`, or `pwd`.

#### Key Concepts:

* `fork()`, `execvp()`, `waitpid()`
* `readline()` (or `fgets()` if keeping it ultra-C)

### 🔨 Tasks

1. **Input Loop**

   * Continuously prompt the user for input.
   * Read full lines from standard input (handling spaces and arguments).

2. **Parse Input**

   * Split the line into a command and its arguments.
   * Tokenize based on spaces (handle trailing newlines cleanly).

3. **Fork and Execute**

   * Create a new process for each command.
   * Use system calls to replace the child’s process image with the command.
   * Parent waits for the child to finish.

4. **Error Handling**

   * Gracefully handle unknown commands or failed executions.
   * Print helpful error messages without crashing.

5. **Exit Condition**

   * Let the user type something like `exit` to leave the shell.

---

### 🔍 Key Concepts Involved

* Process creation (fork)
* Program execution (exec variants)
* Process synchronization (wait)
* Command parsing (tokenizing strings)
* Prompt I/O handling (readline or fgets)

---

### 🧪 Test Cases

Try:

* `ls`
* `echo hello world`
* `date`
* Invalid command (e.g., `blablabla`)
* `exit`

---

### 🔹 **Stage 2: Handle `cd`, `exit`, and whitespace**

**Goal:** Handle shell-builtins that must execute in the parent process.

#### Built-ins:

* `cd [dir]`: Use `chdir()`
* `exit`: Call `exit(0)`
* Handle empty input (pressing enter without command)

---

### 🔹 **Stage 3: I/O Redirection (`>`, `<`)**

**Goal:** Run things like `ls > out.txt` or `cat < file.txt`.

#### Concepts:

* `open()`, `dup2()`, `close()`
* File descriptor manipulation

---

### 🔹 **Stage 4: Pipelining (`|`)**

**Goal:** Support commands like `ls | grep .c | wc -l`.

#### Concepts:

* Pipes (`pipe()` syscall)
* Process chaining with multiple `fork()`s
* Redirecting stdin/stdout across processes

---

### 🔹 **Stage 5: Background Execution (`&`)**

**Goal:** Allow `./longtask &` and don’t block the shell.

#### Concepts:

* Detect `&` at end of input
* Don’t call `waitpid()` for background jobs
* Optional: job table

---

## 🧠 Advanced Ideas (for later)

* **Command history** (like pressing up arrow)
* **Tab completion** (using GNU readline)
* **Signal handling** (`SIGINT`, `SIGCHLD`)
* **Scripting mode** (execute shell scripts)

---
