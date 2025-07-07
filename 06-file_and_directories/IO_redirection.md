# 📥📤 Input/Output Redirection in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Understand standard input, output, and error in Bash.
* Redirect output to files using `>`, `>>`, and `<`.
* Capture errors and logs.
* Use **here-documents** (`<<`) to provide multi-line input.
* Create and use logs effectively in scripts.

---

## 📌 1. Bash I/O Streams Overview

| Stream   | Description     | File Descriptor |
| -------- | --------------- | --------------- |
| `stdin`  | Standard Input  | 0               |
| `stdout` | Standard Output | 1               |
| `stderr` | Standard Error  | 2               |

---

## ➡️ 2. Redirecting Output to a File (`>`)

```bash
echo "Hello world!" > hello.txt
```

* Creates `hello.txt` and writes the output to it.
* If the file exists, it will be **overwritten**.

---

## ➕ 3. Appending to a File (`>>`)

```bash
echo "Another line" >> hello.txt
```

* Adds to the end of the file instead of replacing it.

---

## ⬅️ 4. Redirecting Input (`<`)

```bash
while read line
do
  echo "Line: $line"
done < hello.txt
```

* Feeds the content of `hello.txt` **into the loop**.
* Used when a command/script **expects input from a file**.

---

## ❗ 5. Redirecting Errors (`2>` and `2>>`)

```bash
ls nonexistentfile 2> errors.log
```

* Redirects **stderr** to a file.
* Use `2>>` to **append** error messages.

---

## ✅ Redirect `stdout` and `stderr` Together

```bash
command > all.log 2>&1
```

* Redirects **both normal output and errors** into the same file.
* `2>&1` means "send stderr to the same place as stdout."

---

## 📂 6. Use Case: Script Logging Example

```bash
#!/bin/bash

logfile="backup.log"

echo "Starting backup..." > "$logfile"

cp myfile.txt backup/ 2>> "$logfile"

echo "Backup complete at $(date)" >> "$logfile"
```

- ✅ First line **overwrites** the old log
- ✅ Errors from `cp` get **appended**
- ✅ Timestamp is added at the end

---

## 📜 7. Here-Document (`<<`) for Multi-line Input

A **here-doc** is a block of text **redirected into a command**.

### Example: Use `cat` to Create a File

```bash
cat << EOF > intro.txt
Welcome to the Bash course.
This file was generated using a here-doc.
EOF
```

* Everything between `<< EOF` and `EOF` is treated as input to `cat`
* `EOF` can be replaced with any **unique token**
* Can be combined with `>>` to append instead of overwrite

---

## 🧪 Real-World Example: Creating a Template Script

```bash
cat << 'END' > starter.sh
#!/bin/bash

# Author: Your Name
# Created: $(date)
# Description: Starter script

echo "Script started"
END
```

> Tip: Use single quotes (`<< 'END'`) to **prevent variable expansion** like `$(date)`.

---

## 🧼 Best Practices

| Tip                                        | Why                             |
| ------------------------------------------ | ------------------------------- |
| Use `>>` for logs                          | Avoid overwriting data          |
| Redirect both `stdout` and `stderr`        | Capture everything              |
| Use here-docs for config/scripts/templates | Easier than `echo` line-by-line |
| Always quote filenames                     | Prevent bugs with spaces        |

---

## 🧠 Summary Table

| Operator | Meaning                                   | Use Case                      |
| -------- | ----------------------------------------- | ----------------------------- |
| `>`      | Redirect output (overwrite)               | Save command output           |
| `>>`     | Redirect output (append)                  | Add logs to a file            |
| `<`      | Redirect input                            | Read from a file              |
| `2>`     | Redirect errors                           | Save stderr to a file         |
| `2>>`    | Append stderr                             | Add errors to log             |
| `&>`     | Redirect stdout and stderr (Bash 4+)      | One-file logging              |
| `<<`     | Here-document                             | Pass multi-line input         |
| `<<-`    | Here-doc that allows tab-indented content | Cleaner formatting in scripts |

---
