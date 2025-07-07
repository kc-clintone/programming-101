# ⚖️ Comparing Numbers and Strings in Bash (`[ ]` vs `[[ ]]`)

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Compare **integers** and **strings** using `[ ]` and `[[ ]]`.
* Understand the difference between **string** and **numeric** comparisons.
* Use operators like `-eq`, `-lt`, `=`, and `!=`.
* Follow quoting best practices to prevent bugs.

---

## 🔧 Two Tools for Conditions

| Method      | Description                                          |
| ----------- | ---------------------------------------------------- |
| `[ ... ]`   | Traditional POSIX test command                       |
| `[[ ... ]]` | Bash-specific conditional expression (more flexible) |

---

## 🔢 1. Numeric Comparisons

Numeric comparisons only work for **integers** (whole numbers, no decimals).

### ✅ Syntax:

```bash
[ "$a" -eq "$b" ]     # Are a and b equal?
```

### 📌 Common Operators:

| Operator | Meaning          | Example             |
| -------- | ---------------- | ------------------- |
| `-eq`    | Equal            | `[ "$a" -eq "$b" ]` |
| `-ne`    | Not equal        | `[ "$a" -ne "$b" ]` |
| `-gt`    | Greater than     | `[ "$a" -gt "$b" ]` |
| `-lt`    | Less than        | `[ "$a" -lt "$b" ]` |
| `-ge`    | Greater or equal | `[ "$a" -ge "$b" ]` |
| `-le`    | Less or equal    | `[ "$a" -le "$b" ]` |

---

### 🧪 Example:

```bash
a=5
b=10

if [ "$a" -lt "$b" ]; then
  echo "$a is less than $b"
fi
```

---

## 🔤 2. String Comparisons

String comparisons compare **text values**.

### ✅ Operators:

| Operator    | Meaning                | Example                 |
| ----------- | ---------------------- | ----------------------- |
| `=` or `==` | Strings are equal      | `[ "$name" = "Alice" ]` |
| `!=`        | Strings are not equal  | `[ "$name" != "Bob" ]`  |
| `<`         | String is less (ASCII) | `[[ "$a" < "$b" ]]`     |
| `>`         | String is greater      | `[[ "$a" > "$b" ]]`     |
| `-z`        | String is empty        | `[ -z "$var" ]`         |
| `-n`        | String is not empty    | `[ -n "$var" ]`         |

> ⚠️ `<` and `>` only work with `[[ ]]`, not `[ ]`.

---

### 🧪 Example:

```bash
username="admin"

if [ "$username" = "admin" ]; then
  echo "Welcome, admin!"
else
  echo "Access denied."
fi
```

---

## ✅ 3. Quoting Best Practices

Always quote variables inside tests to avoid **word splitting** or **errors when variables are empty**.

### ✅ Good:

```bash
if [ "$name" = "Alex" ]; then
```

### ❌ Risky:

```bash
if [ $name = Alex ]; then
# Breaks if $name is empty → [ = Alex ] is invalid
```

---

## 🧠 4. Why Use `[[ ... ]]`?

The `[[ ... ]]` construct is:

* **More robust**: no need to escape `!`, `<`, `>`, `&&`, etc.
* **Safer with empty variables**.
* **Supports pattern matching** (`== *.txt`)

### 🧪 Example:

```bash
filename="report.txt"

if [[ "$filename" == *.txt ]]; then
  echo "Text file detected."
fi
```

---

## 🧾 Quick Comparison Table

| Feature                       | `[ ]` | `[[ ]]`             |
| ----------------------------- | ----- | ------------------- |
| POSIX-compatible              | ✅ Yes | ❌ No (Bash-only)    |
| Safer for string comparisons  | ❌ No  | ✅ Yes               |
| Supports `<` and `>`          | ❌ No  | ✅ Yes               |
| Allows regex/pattern matching | ❌ No  | ✅ Yes               |
| Fails on empty variables      | ❌ Yes | ✅ No (usually safe) |

---

## 🚫 Common Mistakes

| Mistake           | Problem                               | Fix                          |
| ----------------- | ------------------------------------- | ---------------------------- |
| `[ $num -gt 5 ]`  | Breaks if `$num` is empty             | Quote it: `[ "$num" -gt 5 ]` |
| `[ "$a" > "$b" ]` | Lexical string comparison not allowed | Use `[[ "$a" > "$b" ]]`      |
| Forgetting `fi`   | Block won’t close                     | Always end `if` with `fi`    |

---

## 🔂 Example Script

```bash
#!/bin/bash

read -p "Enter a number: " num

if [ "$num" -eq 42 ]; then
  echo "You found the meaning of life!"
elif [ "$num" -lt 10 ]; then
  echo "Too small!"
else
  echo "Just a number."
fi
```

---
