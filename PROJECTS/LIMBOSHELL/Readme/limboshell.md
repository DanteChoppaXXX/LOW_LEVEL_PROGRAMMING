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

### ✅ Recap of Your Progress So Far:

* ✅ You can parse commands.
* ✅ You can execute simple external programs.
* ✅ You handle special internal commands (`exit`, `cd`) directly in your shell process.

---

## 🚀 Stage 3: **Input/Output Redirection**

Now you’ll implement I/O redirection — this is where a shell really starts to feel powerful.

### 🎯 Your Mission

Support:

* `command > file` → redirect **stdout** to a file (create or overwrite)
* `command >> file` → redirect **stdout** and **append** to a file
* `command < file` → redirect **stdin** to read from a file

---

### 🛠️ Design Steps (no code)

1. **Detect redirection operators** (`>`, `>>`, `<`) in the user input.
2. **Separate** the command and file name.
3. **Before executing**, use `dup2()` to redirect `stdin` or `stdout` to the specified file.
4. **Only apply redirection in the child process** (after `fork()`, before `execvp()`).

---

### 📄 Example Behaviors to Support

* `ls > out.txt` → write directory listing to `out.txt`
* `cat < input.txt` → read contents of `input.txt`
* `echo "hello" >> log.txt` → append “hello” to `log.txt`

---


---

### 🔹 **Stage 4: Pipelining (`|`)**

**Goal:** Support commands like `ls | grep .c | wc -l`.

#### Concepts:

* Pipes (`pipe()` syscall)
* Process chaining with multiple `fork()`s
* Redirecting stdin/stdout across processes

---

### 📝**Stage 4: Pipes (`|`)** step by step break down.

---

## 🔧 What Are Pipes?

A **pipe** connects the output of one process to the input of another.

Example:

```bash
cat file.txt | grep hello | sort
```

This is equivalent to:

```c
int pipefd[2];
pipe(pipefd);
dup2(pipefd[1], STDOUT_FILENO); // for cat
dup2(pipefd[0], STDIN_FILENO);  // for grep
```

---

## 🧠 How Your Shell Should Think

1. **Split the command on `|`**

   * Input: `"cat file.txt | grep hello | sort"`
   * After splitting:

     * `cat file.txt`
     * `grep hello`
     * `sort`

2. **You need to fork for each command**

   * For `n` commands, you’ll need `n` child processes.
   * Each command’s `stdout` should feed into the next command’s `stdin`.

---

## 📦 Pipe Mechanics in Shell

Let’s say there are **N** commands:

```
cmd1 | cmd2 | cmd3 | ... | cmdN
```

You need:

* **N−1 pipes**, each connecting a command to the next.
* A loop that:

  * Creates the pipes
  * Forks the children
  * Sets up proper `dup2()` to connect them
  * Closes unused file descriptors

---

## 🌀 Example Execution Flow

Suppose you’re processing:
`ls -l | grep .c | wc -l`

### 1. Shell splits the commands:

```
cmds = ["ls -l", "grep .c", "wc -l"]
```

### 2. For each command:

* Create a `pipe()` (except for the last one).
* Fork a child:

  * If it’s **not the first**, connect its `stdin` to the *read end* of the previous pipe.
  * If it’s **not the last**, connect its `stdout` to the *write end* of the current pipe.
  * `execvp()` the command.
* Parent:

  * Closes all pipe ends not needed.
  * Waits for children at the end.

---

## 📍 What You Need to Implement

* A parser that identifies and splits pipe segments.
* A loop that:

  * Tracks previous and current pipes
  * Redirects FDs properly using `dup2`
  * Calls `fork()` + `execvp()` for each segment
* Proper closing of pipe ends after use
* `waitpid()` for all children

---

## 🧠 Mental Checklist per Command Segment:

For command `i` out of `N`:

* **stdin**:

  * Default unless `i > 0` → redirect from previous pipe read-end
* **stdout**:

  * Default unless `i < N-1` → redirect to current pipe write-end
* **Close** all pipe FDs not in use in each process

---

## 🧘 Advice Before You Begin

* Do **not** rush. Pipes are tricky. Think in terms of **data flow** between processes.
* Draw a diagram of pipes and file descriptors.
* Consider starting with just 2 commands to test it (`ls | wc`) before scaling to multiple.

---

### 🔹 **Stage 5: Background Execution (`&`)**

**Goal:** Allow `./longtask &` and don’t block the shell.

#### Concepts:

* Detect `&` at end of input
* Don’t call `waitpid()` for background jobs
* Optional: job table

---

## 🧠 Background Execution — Walkthrough

### 🔍 What You're Adding

If the user types:

```bash
sleep 5 &
```

Your shell:

* Launches the command in the background
* Does **not** wait for it to finish
* Immediately returns to the prompt

---

### 1. 🔎 **Detect the `&`**

Look for an ampersand `&` **at the end** of the command input.

You'll need to:

* Check if the **last token** is `&`
* If yes, set a `background = 1` flag
* **Remove** the `&` from the command list so `execv` doesn’t get confused

---

### 2. 🧠 **Avoid Waiting**

If it's a background process:

* You **do not call** `wait()` in the parent process
* You just print the prompt again

If it’s **not** a background process:

* Call `wait()` like normal

---

### 3. 🧼 Optional: Handle Zombie Processes

You can make your shell automatically clean up finished background processes using:

```c
signal(SIGCHLD, SIG_IGN);
```

This avoids having zombie processes, but you can add this later after the main logic works.

---

### 4. ⚠️ Piping & Redirection

For now, **only support backgrounding regular commands**, not pipelines like:

```bash
cat file.txt | grep something &
```

You can handle advanced cases later.

---

### 🔚 Summary

| Feature            | What To Do                                   |
| ------------------ | -------------------------------------------- |
| `&` detected       | Set `background = 1`, remove `&` from args   |
| Background process | Don’t `wait()`                               |
| Foreground process | `wait()` like before                         |
| Prompt behavior    | Always return to prompt after spawning child |

---


---

## 🧠 Advanced Ideas (for later)

* **Command history** (like pressing up arrow)
* **Tab completion** (using GNU readline)
* **Signal handling** (`SIGINT`, `SIGCHLD`)
* **Scripting mode** (execute shell scripts)

---
