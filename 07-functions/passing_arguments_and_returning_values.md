# 🧠 Passing Arguments & Returning Values in Bash Functions

## 🎯 Goals:

* Learn how to pass arguments like `$1`, `$2`, etc.
* Validate or handle missing arguments
* Return values via `echo` (standard way)
* Use global variables when necessary

---

## 📨 1. Passing Arguments to Functions

Bash functions accept arguments **just like scripts**:

```bash
greet_user() {
  echo "Hello, $1!"
}

greet_user "Alice"
```

| Special Variable | Description                    |
| ---------------- | ------------------------------ |
| `$1`, `$2`, …    | Positional arguments           |
| `$@`             | All arguments, space-separated |
| `$#`             | Number of arguments            |

---

## 🔍 2. Handling Missing Arguments

Use conditionals to ensure required arguments are passed.

```bash
greet_user() {
  if [ -z "$1" ]; then
    echo "Error: No name provided"
    return 1
  fi

  echo "Hello, $1!"
}

greet_user            # Error
greet_user "Charlie"  # OK
```

### 🔧 Breakdown:

* `-z "$1"` checks if the first argument is empty.
* `return 1` exits the function with a non-zero (failure) code.

---

## 🔁 3. Return Values in Bash Functions

### ❌ `return` is **not** for returning data — it's for **exit status** only (like 0 = success, 1 = failure).

### ✅ Use `echo` to return data:

```bash
add() {
  local sum=$(( $1 + $2 ))
  echo "$sum"
}

result=$(add 3 5)
echo "Result is $result"
```

✅ This captures the output of the function in a variable using `$(...)`.

---

## 💡 4. Using Global Variables (only if needed)

Sometimes, especially in older Bash code, functions **set a global variable** instead of echoing:

```bash
multiply() {
  result=$(( $1 * $2 ))  # global var
}

multiply 3 4
echo "Product: $result"
```

⚠️ Be careful:

* This works, but global variables can accidentally be overwritten.
* Prefer `local` and `echo` for safety and clarity.

---

## 💬 Example: Safe Division Function

```bash
divide() {
  if [ "$2" -eq 0 ]; then
    echo "Error: Division by zero"
    return 1
  fi

  echo $(( $1 / $2 ))
}

output=$(divide 10 2)
echo "Output: $output"

divide 5 0  # Error
```

---

## 📦 Real-World Function: Logging With Optional Levels

```bash
log() {
  local level=${1:-INFO}
  local message=${2:-"No message provided"}

  echo "[$(date '+%F %T')] [$level] $message"
}

log "INFO" "System started"
log "ERROR" "Something failed"
log         # Uses default values
```

✅ `${1:-default}` is Bash parameter expansion — supplies a fallback if empty.

---

## 🧼 Best Practices

| Practice                        | Why It Matters                       |
| ------------------------------- | ------------------------------------ |
| Always check for `$#` or `-z`   | Prevents missing arg bugs            |
| Use `echo` for value return     | Standard, clean, and portable        |
| Quote variables                 | Prevents issues with spaces/specials |
| Avoid global vars unless needed | Reduces bugs and variable conflicts  |
| Use `local` inside functions    | Keeps variables scoped safely        |

---

## 🧠 Summary Table

| Feature           | Syntax Example                |
| ----------------- | ----------------------------- |
| Positional args   | `$1`, `$2`, `$@`              |
| Check args count  | `if [ $# -lt 2 ]; then ...`   |
| Default values    | `${1:-default}`               |
| Return a value    | `echo "$value"` then `$(...)` |
| Exit with status  | `return 0` or `return 1`      |
| Global var (rare) | `result=...`                  |

---
