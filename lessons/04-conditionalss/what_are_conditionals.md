# 🔍 Conditionals in Bash (`if`, `then`, `else`, `fi`)

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Understand how `if` conditionals work in Bash.
* Use `then`, `else`, `elif`, and `fi` properly.
* Check conditions using `[ ]` and `[[ ]]`.
* Write clean, readable condition blocks with good indentation.
* Use conditionals in real-world scripts (e.g. check if a file exists).

---

## 🔁 What Are Conditionals?

Conditionals let your script make **decisions**.

> “If something is true, do this. Otherwise, do that.”

Bash uses `if`, `then`, `else`, and `fi` (which ends the block).

---

## 🔧 Basic Syntax

```bash
if [ condition ]
then
    # code to run if condition is true
else
    # code to run if condition is false
fi
```

Or written more compactly:

```bash
if [ condition ]; then
    # do something
else
    # do something else
fi
```

✅ `fi` = end of `if` block (it’s “if” spelled backwards)

---

## 🧪 Example: Check a Number

```bash
read -p "Enter a number: " num

if [ "$num" -gt 10 ]; then
    echo "That's a big number!"
else
    echo "That's a small number."
fi
```

---

## ✅ Condition Operators

| Test  | Description       | Example                 |
| ----- | ----------------- | ----------------------- |
| `-eq` | Equal             | `[ "$a" -eq "$b" ]`     |
| `-ne` | Not equal         | `[ "$a" -ne "$b" ]`     |
| `-gt` | Greater than      | `[ "$a" -gt "$b" ]`     |
| `-lt` | Less than         | `[ "$a" -lt "$b" ]`     |
| `-ge` | Greater or equal  | `[ "$a" -ge "$b" ]`     |
| `-le` | Less or equal     | `[ "$a" -le "$b" ]`     |
| `=`   | String equals     | `[ "$name" = "Alex" ]`  |
| `!=`  | String not equals | `[ "$name" != "Alex" ]` |

---

## 📁 Real-World Example: Check if File Exists

```bash
read -p "Enter a filename: " file

if [ -f "$file" ]; then
    echo "✅ File '$file' exists."
else
    echo "❌ File '$file' does not exist."
fi
```

### 🔍 File Test Flags

| Flag | Meaning                      |
| ---- | ---------------------------- |
| `-f` | Is a regular file            |
| `-d` | Is a directory               |
| `-e` | File or directory exists     |
| `-s` | File exists and is not empty |
| `-r` | Is readable                  |
| `-w` | Is writable                  |
| `-x` | Is executable                |

---

## 🧠 Using `elif` for Multiple Conditions

```bash
read -p "Enter your score (0-100): " score

if [ "$score" -ge 90 ]; then
    echo "Grade: A"
elif [ "$score" -ge 80 ]; then
    echo "Grade: B"
elif [ "$score" -ge 70 ]; then
    echo "Grade: C"
else
    echo "Grade: F"
fi
```

---

## 🧼 Indentation & Formatting Tips

✅ Best Practice:

* Indent the code inside each block with **2 spaces**
* Keep `then`, `else`, and `fi` aligned vertically

```bash
if [ "$name" = "admin" ]; then
  echo "Welcome, admin."
else
  echo "Access denied."
fi
```

---

## 💬 Tip: Use Quotes Around Variables

Always quote variables in conditionals to avoid errors when they’re empty:

```bash
if [ "$name" = "Alex" ]; then
```

Not this:

```bash
if [ $name = Alex ]; then  # ❌ breaks if $name is empty
```

---

## 📌 Use `[ ]` vs `[[ ]]`

* `[ ]` = traditional test command
* `[[ ]]` = newer, more powerful (supports pattern matching, safer spacing)

```bash
if [[ "$file" == *.txt ]]; then
  echo "Text file detected!"
fi
```

💡 Prefer `[[ ]]` in modern Bash scripts if available.

---

## 🚫 Common Errors

| Mistake                | Problem                   | Fix                     |
| ---------------------- | ------------------------- | ----------------------- |
| `if [ $var = "test" ]` | Breaks if `$var` is empty | Use `"$var"`            |
| Missing `fi`           | Unexpected end of file    | Always close with `fi`  |
| `if[ ... ]`            | No space after `if`       | Add space: `if [ ... ]` |
| `if [ "$a" > "$b" ]`   | Wrong for numbers         | Use `-gt` instead       |

---

## 📁 Summary Table

| Block                   | Keyword        |
| ----------------------- | -------------- |
| Start condition         | `if`           |
| Do something            | `then`         |
| Optional alternate path | `else`, `elif` |
| End block               | `fi`           |

---
