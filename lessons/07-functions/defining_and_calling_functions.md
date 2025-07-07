# 🔧 Defining and Using Functions in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Define and call functions in Bash
* Pass arguments to functions
* Use return codes and local variables
* Understand why functions are essential for script clarity and reusability

---

## 📦 1. What Is a Function in Bash?

A function is a **named block of code** you can call multiple times in your script.

### ✅ Syntax 1 (preferred):

```bash
function say_hello() {
  echo "Hello!"
}
```

### ✅ Syntax 2 (sh-compatible):

```bash
say_hello() {
  echo "Hello!"
}
```

> 🧠 You don’t need `function` keyword — both styles work. Use whichever feels cleaner to you.

---

## ▶️ 2. Calling a Function

Just write its name like a command:

```bash
say_hello
```

---

## 📨 3. Passing Arguments to Functions

Bash functions get arguments just like regular scripts:

```bash
greet() {
  echo "Hello, $1!"
}

greet "Alice"    # Output: Hello, Alice!
```

| Variable      | Meaning         |
| ------------- | --------------- |
| `$1`          | First argument  |
| `$2`, `$3`... | Additional args |
| `$@`          | All arguments   |

---

## 🧪 Example: A Reusable Logger Function

```bash
log() {
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "[$timestamp] $1"
}
```

**Usage:**

```bash
log "Script started"
sleep 2
log "Finished processing"
```

**Output:**

```
[2025-07-07 14:30:01] Script started
[2025-07-07 14:30:03] Finished processing
```

✅ Makes logging clean, consistent, and reusable!

---

## 📦 4. Returning Exit Codes (not values)

Functions can return exit codes (not strings like other languages):

```bash
check_number() {
  if [ "$1" -gt 10 ]; then
    return 0    # success
  else
    return 1    # failure
  fi
}

check_number 15 && echo "OK" || echo "Too small"
```

✅ Use this style when writing validation checks.

---

## 📌 5. Use `local` for Local Variables

Bash variables are **global by default**, even inside functions. Use `local` to prevent side effects:

```bash
add() {
  local result=$(( $1 + $2 ))
  echo $result
}
```

✅ Keeps `result` from interfering with the rest of your script.

---

## 🧰 Real-World Use: Logger with Levels

```bash
log() {
  local level="$1"
  local message="$2"
  local timestamp=$(date +"%F %T")
  echo "[$timestamp][$level] $message"
}

log INFO "Starting cleanup..."
log ERROR "Could not delete file"
```

**Output:**

```
[2025-07-07 14:41:22][INFO] Starting cleanup...
[2025-07-07 14:41:23][ERROR] Could not delete file
```

---

## 🧼 When and Why to Use Functions

| ✅ Use Functions When...          | 🚫 Avoid When...                         |
| -------------------------------- | ---------------------------------------- |
| You repeat code blocks           | You're doing one-liners only             |
| You want better readability      | Your script is extremely short           |
| You're structuring large scripts | You're still testing ideas interactively |

---

## 🧠 Summary Table

| Feature     | Syntax                      |
| ----------- | --------------------------- |
| Define      | `my_func() { ... }`         |
| Call        | `my_func` or `my_func args` |
| Args        | `$1`, `$2`, `$@`            |
| Return code | `return 1`, check with `$?` |
| Scope       | Use `local` for local vars  |

---
