# Debugging Bash Scripts in Bash

---

## 🎯 Why Debugging Matters

Unlike compiled languages, Bash is interpreted line by line. That means:

* Silent failures can happen often.
* Typos, missing variables, or logic errors are common.
* You *must* be proactive in catching and diagnosing issues.

This lesson teaches you how to find and fix those bugs effectively.

---

## 🧪 1. Use `set -x` to Trace Execution

### 🔍 What it does:

Prints each command **and its arguments** as they execute. Super useful to see what the script is *actually doing*.

```bash
#!/bin/bash
set -x

name="Alice"
echo "Hello, $name"
```

### Output:

```
+ name=Alice
+ echo 'Hello, Alice'
Hello, Alice
```

✅ Great for **step-by-step tracing**
❌ Can get noisy — use selectively.

---

## 🧰 2. Use `set -v` to Show Script Lines

Shows each line of the script *as it’s read* (even before execution).

```bash
set -v
```

You can also combine both:

```bash
set -xv
```

---

## 🧼 Disable Tracing When Needed

To prevent logging sensitive data or clutter:

```bash
set +x  # turn off debug printing
```

Use this when handling secrets like passwords or tokens.

---

## 🛠 3. Trap Errors and Show Info

Use `trap` to capture and **respond to script errors**.

### Example:

```bash
trap 'echo "⚠️ Error on line $LINENO"; exit 1' ERR
```

This line:

* Triggers when **any error occurs**
* Prints the line number
* Exits with failure

🔒 Safer with `set -e`:

```bash
set -e
trap 'echo "Error at line $LINENO"; exit 1' ERR
```

---

## 📁 Real Example: Debug Setup Template

```bash
#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO"; exit 1' ERR

set -x  # enable tracing

echo "Script started"
mkdir -p /tmp/testdir
cd /tmp/testdir
touch file.txt
cat missingfile.txt  # will cause an error
```

### Output:

```
+ echo 'Script started'
Script started
+ mkdir -p /tmp/testdir
+ cd /tmp/testdir
+ touch file.txt
+ cat missingfile.txt
cat: missingfile.txt: No such file or directory
❌ Error on line 9
```

---

## 📋 4. Logging for Debugging

Instead of printing everything live, use a **log file** to track events.

### Example:

```bash
log() {
  echo "[$(date '+%F %T')] $1" >> debug.log
}

log "Script started"
log "Running task A"
```

✅ Logs can be reviewed even if the script crashes.

---

## 🚨 5. Common Bash Errors and Fixes

| Error                           | Cause                                     | Fix                                      |
| ------------------------------- | ----------------------------------------- | ---------------------------------------- |
| `command not found`             | Typo or missing program                   | Check spelling, install package          |
| `line N: syntax error near ...` | Bad formatting (e.g., missing `fi`, `do`) | Check indentation and block structure    |
| `unbound variable`              | Accessing unset var with `set -u`         | Use `${VAR:-default}` or check existence |
| `No such file or directory`     | Wrong path or missing file                | Use `ls`/`pwd` to confirm                |
| `Permission denied`             | Missing executable bit or access rights   | Run `chmod +x`, check permissions        |

---

## 🧼 Best Practices for Debugging Bash

| Practice                       | Why It Helps                                  |
| ------------------------------ | --------------------------------------------- |
| Use `set -x` for step tracing  | See what’s being executed                     |
| Use `trap` with `$LINENO`      | Pinpoint where the error happens              |
| Use `set -euo pipefail`        | Fail early, detect bad assumptions            |
| Write logs to a file           | Persist data across runs for diagnosis        |
| Comment out lines when testing | Avoid accidental execution of dangerous steps |

---

## 🧠 Summary Table

| Tool      | Purpose                               |
| --------- | ------------------------------------- |
| `set -x`  | Trace each command before execution   |
| `set -v`  | Show lines as read (before execution) |
| `trap`    | Handle errors, clean up, debug info   |
| `$LINENO` | Reports line number of error          |
| Logs      | Persist output for review/debugging   |

---
