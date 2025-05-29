
---

## **Stage 1 — Spread Password in Memory (Obfuscation Type 1)**

### **Concept Recap:**

We will hide the password by splitting it across multiple variables. Instead of:

```c
char password[] = "supersecret";
```

We’ll do something like:

```c
char a = 's';
char b = 'u';
// ...
```

Then assemble the full password in a temporary buffer when doing the comparison.

---

## **Algorithm:**

1. **Define your password in scattered variables.**

   * Create multiple single-byte variables, each holding one character of the password.

2. **Prompt the user to enter a password.**

   * Use `printf` and read the user input into a buffer.

3. **Reconstruct the real password at runtime.**

   * Copy each of the password characters into another buffer (e.g., using indices).

4. **Compare the input with the reconstructed password.**

   * Do a manual character-by-character comparison (avoid using `strcmp`).

5. **Display result.**

   * If match → “Access granted”, else → “Access denied”.

6. **Compile and strip the binary.**

   * `gcc -m32 -fno-stack-protector -z execstack -o reverseme reverseme.c`
   * `strip reverseme`

---

## **Example Password to Use:**

Let’s say your secret password is:

```
"flowdeep"
```

That will give us a nice 8-character password to work with — long enough to play with but not too long.

---
# ====================================
---



# 🔍 **Reverse Engineering Phase**:

---

## 🔍 **Reverse Engineering Goals for This Stage**

Now that you've hidden the password by spreading it in memory, your task will be to:

### ✅ **Goal:**

Recover the password **without access to the source code** — using only the compiled binary and tools like:

* `objdump` (to inspect disassembly)
* `gdb` (to debug and examine memory/registers)
* `strings` (to search for visible hints)
* `ltrace`/`strace` (to monitor runtime behavior, optional)

---

## 🔧 **Reverse Engineering Procedure**

1. **Compile the binary with the right flags**
   Make sure you compiled it like this:

   ```bash
   gcc -m32 -fno-stack-protector -z execstack -o reverseme reverseme.c
   strip reverseme
   ```

2. **Run `strings` on it**
   Try:

   ```bash
   strings reverseme
   ```

   Check if the password or parts of it leak here.

3. **Use `objdump` to disassemble**

   ```bash
   objdump -d reverseme > reverseme.asm
   ```

   Open the `.asm` and look through `main` and other functions to spot individual character assignments. You’re looking for:

   ```
   movb $0x66, -0x4(%ebp)  ; character 'f'
   ...
   ```

4. **Load into `gdb`**

   ```bash
   gdb reverseme
   ```

   * Set a breakpoint at `main`
   * Use `disas main` to see what's happening
   * Step through (`ni` or `si`)
   * Use `x/s`, `x/1xb`, or `x/8cb` to read memory content and registers
   * Spot how the password is being constructed

5. **Reconstruct the password manually from memory / register values**

6. **Confirm it by running the binary with your guess**

---


## ✅ Your Mission

* Go ahead and reverse the binary.
* Try to recover the full password without relying on the source code.
* When you think you’ve found it, test it and confirm.

---
# 🧪 **Stage 2 — XOR-encoding the password**

### 🧠 Goal:

Hide the real password in an encoded form and decode it only during runtime, making it harder to find by scanning strings or looking at immediate values in disassembly.

---

### 🔐 Algorithm Outline:

1. **Choose an encoding key**:

   * Pick a single-byte XOR key (e.g., `0x5A`).

2. **Preprocess the password**:

   * XOR each character in the original password with the key.
   * Hardcode the XORed bytes in your source (instead of the plain characters).

3. **Decode at runtime**:

   * At runtime, XOR the stored (encoded) bytes with the same key to retrieve the actual password.

4. **Authenticate**:

   * Take user input.
   * Compare it with the decoded password manually, character by character.

---

### ✅ Verification Tips:

Once you've written it:

* Confirm that `strings` doesn’t reveal the plaintext password.
* Use `objdump -d` and confirm the password isn't easily visible.
* Try reverse engineering it yourself from the binary to simulate the challenge for others.

