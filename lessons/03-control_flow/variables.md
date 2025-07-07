# 🔤 Declaring and Using Variables in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will be able to:

* Declare and assign values to variables in Bash.
* Understand naming rules and conventions.
* Use variables in scripts with `echo` and commands.
* Apply best practices to avoid common mistakes.

---

## 📦 What Is a Variable?

A **variable** is a container for storing data — like text, numbers, or file paths — so you can reuse them later.

In Bash, you don't need to declare the type (string, number, etc.). Everything is treated as **text** unless used in a math context.

---

## 🔧 Declaring a Variable

```bash
name="Korvo"
```

### 🧠 Syntax Breakdown:

* No spaces around the `=`
* Use quotes (`"`) for values with spaces
* Variable names are **case-sensitive**

✅ Valid:

```bash
greeting="Hello"
```

❌ Invalid:

```bash
greeting = "Hello"   # ❌ SPACE will break it
```

---

## 👨‍🏫 Naming Rules & Conventions

| Rule                                   | Example                 |
| -------------------------------------- | ----------------------- |
| Letters, numbers, and underscores only | `my_name`, `age25`      |
| Must start with a letter or `_`        | ✅ `_logPath`, ❌ `2cool` |
| Avoid special characters               | ❌ `name!`               |
| Case-sensitive                         | `USER` ≠ `user`         |

### ✅ Best Practice:

Use **lowercase\_with\_underscores** for your own variables to avoid conflict with system variables (like `$PATH`, `$HOME`).

---

## 📣 Using a Variable

To use a variable, **prefix it with `$`**:

```bash
name="Korvo"
echo "Hello, $name!"
```

Output:

```
Hello, Korvo!
```

### 🧪 Example in a Script:

```bash
#!/bin/bash

first_name="Ada"
last_name="Lovelace"

echo "Welcome, $first_name $last_name!"
```

---

## 🧼 Quoting Variables

Always wrap variables in **double quotes** when used with `echo`, filenames, or commands:

```bash
filename="my file.txt"
echo "$filename"         # ✅ Good
echo $filename           # ⚠️ Risky: word splitting
```

---

## 🧮 Bonus: Simple Math with Variables

Use `let`, `expr`, or `$(( ))` for arithmetic:

```bash
num1=5
num2=3
sum=$((num1 + num2))
echo "Sum: $sum"
```

---

## 🔂 Updating Variables

You can reassign new values anytime:

```bash
status="pending"
echo "Status: $status"

status="complete"
echo "Updated Status: $status"
```

Output:

```
Status: pending
Updated Status: complete
```

---

## ❌ Common Mistakes

| Mistake                           | Why it's wrong           | Fix                      |
| --------------------------------- | ------------------------ | ------------------------ |
| `name = "Korvo"`                  | Spaces around `=`        | `name="Korvo"`           |
| `echo $name` with unquoted spaces | Breaks multi-word values | Use `echo "$name"`       |
| Using undefined variables         | Expands to empty string  | Always assign before use |

---

## ✅ Best Practices

* Use clear, descriptive variable names.
* Always quote variables: `echo "$var"`
* Avoid global naming conflicts (use lowercase).
* Don’t put spaces around `=`.
* Use comments to explain what your variables do.

---

## 🧠 Extra: Exporting Variables

To make a variable available to **child processes**, use `export`:

```bash
export PATH="$PATH:/new/path"
```

This is useful for environment setup in `.bashrc` or `.profile`.

---

## 📁 Summary Table

| Task                | Example                |
| ------------------- | ---------------------- |
| Declare a variable  | `username="korvo"`     |
| Use a variable      | `echo "$username"`     |
| Reassign a variable | `username="neo"`       |
| Arithmetic          | `total=$((5 + 3))`     |
| Avoid spaces        | ❌ `var = 5`, ✅ `var=5` |

---
