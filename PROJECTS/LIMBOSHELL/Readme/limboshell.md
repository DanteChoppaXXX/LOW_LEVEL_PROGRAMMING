# 🛠️ Project: **Mini Shell (Stage 1 to 5)**

We’ll build it in stages. You’ll get a real shell by the end — not just a toy.

---

### 🔹 **Stage 1: Basic Command Execution**

**Goal:** Run commands like `ls`, `echo hello`, or `pwd`.

#### Key Concepts:

* `fork()`, `execvp()`, `waitpid()`
* `readline()` (or `fgets()` if keeping it ultra-C)

#### Algorithm:

1. Print a prompt (e.g., `mini-shell> `).
2. Read user input.
3. Split input into command and arguments (tokenize).
4. Use `fork()` to create a child process.
5. In the child: `execvp()` the command.
6. In the parent: `waitpid()` for child to finish.

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
