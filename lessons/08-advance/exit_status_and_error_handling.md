# Exit Status and Error Handling in Bash

---

## ✅ What Is an Exit Status?

When a command or script runs in Bash, it returns an **exit status** — a number between `0` and `255` — that tells whether it **succeeded** or **failed**.

| Exit Code | Meaning                     |
| --------- | --------------------------- |
| `0`       | Success                     |
| `1–255`   | Failure (varies by command) |

You can access the exit code of the **last run command** using:

```bash
$?
```

---

## 📌 Example: Checking Exit Status

```bash
mkdir new_folder

if [ $? -eq 0 ]; then
  echo "Directory created successfully."
else
  echo "Failed to create directory."
fi
```

---

## 🔁 Simplified: Use `&&` and `||`

Bash offers shorter ways to check success/failure:

```bash
mkdir new_folder && echo "Success" || echo "Failed"
```

* `&&` runs if the command **succeeds**
* `||` runs if it **fails**

> ⚠️ This isn't foolproof if both succeed — for critical logic, use `if`.

---

## 🧯 Using `exit`

You can **manually exit** a script or function with a status:

```bash
if [ ! -f config.txt ]; then
  echo "Missing config file."
  exit 1
fi
```

✅ `exit 0` = success
❌ `exit 1` (or higher) = failure

---

## 🛡 Defensive Scripting with `set` Options

### 🔐 `set -e`: Exit on Error

This makes the script exit **immediately** if any command fails.

```bash
#!/bin/bash
set -e

mkdir project
cd project
git clone https://github.com/some/repo.git
```

> ⚠️ Use with caution: you must understand where failure is allowed and where it's not.

---

### 🔐 `set -u`: Exit on Unset Variables

Prevents silent bugs from uninitialized variables.

```bash
#!/bin/bash
set -u

echo "Welcome $USERNAME"  # Will fail if USERNAME is unset
```

### 🔐 `set -o pipefail`: Catch pipe errors

Ensures **entire pipelines** fail properly (useful for logging, filtering):

```bash
set -o pipefail

grep "error" logfile.txt | tee errors.txt
```

---

## 🚨 `trap`: Clean Up or Handle Failures

`trap` lets you **run commands when the script exits**, or when specific signals (like `Ctrl+C`) are received.

### 🧹 Example: Cleanup on Exit

```bash
#!/bin/bash
set -e
trap cleanup EXIT

cleanup() {
  echo "Cleaning up temporary files..."
  rm -f /tmp/tempfile
}

touch /tmp/tempfile
echo "Doing important work..."
# Script exits, trap calls `cleanup`
```

### ❌ Catch `Ctrl+C` (SIGINT):

```bash
trap "echo 'Script interrupted'; exit 1" SIGINT
```

---

## 🧪 Practical Example: Safer Script with All Tools

```bash
#!/bin/bash
set -euo pipefail
trap "echo 'Something went wrong! Exiting...'" ERR

download_file() {
  curl -fSL "$1" -o "$2"
  echo "Downloaded $2"
}

download_file "https://example.com/file.txt" "output.txt"
```

* `-e` exits if any command fails
* `-u` exits if a variable is missing
* `-o pipefail` fails the script if a piped command fails
* `trap ... ERR` adds a custom error message

---

## 🧼 Best Practices for Error Handling

| Tip                               | Why It Helps                           |
| --------------------------------- | -------------------------------------- |
| Always check `$?` or use `set -e` | Detects command failures early         |
| Use `trap` for cleanup or logging | Prevents leftover files, logs errors   |
| Use `exit N` for clarity          | Communicates result to calling scripts |
| Quote your variables              | Avoids subtle bugs in conditionals     |
| Use `set -u` during testing       | Finds typos and missing vars early     |

---

## 🧠 Summary Table

| Feature           | Description                          |
| ----------------- | ------------------------------------ |
| `$?`              | Last command’s exit code             |
| `exit`            | Terminate script with a status code  |
| `set -e`          | Exit on any error                    |
| `set -u`          | Exit on unset variable               |
| `set -o pipefail` | Fail if any part of a pipeline fails |
| `trap`            | Run cleanup or error handler         |

---
