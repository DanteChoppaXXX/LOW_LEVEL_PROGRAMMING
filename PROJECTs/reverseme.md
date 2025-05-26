
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
