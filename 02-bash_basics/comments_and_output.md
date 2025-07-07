# 💬 Comments and `echo` in Bash Scripts

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Use comments (`#`) to annotate and document scripts.
* Use `echo` to print messages to the terminal.
* Follow best practices for spacing, formatting, and quoting in output.

---

## 🧾 Part 1: Using Comments in Bash Scripts

### ✅ What Are Comments?

In Bash, anything after a `#` is a **comment**. The shell **ignores** it.

```bash
# This is a comment
echo "Hello!"  # This comment explains the line
```

### 🧠 Why Use Comments?

* To explain *what* the code does
* To describe *why* something is done a certain way
* To make your script understandable — even to your future self!

---

### 🪄 Commenting Tips

✅ **Use full sentences for clarity**:

```bash
# This line displays the current date
date
```

✅ **Add a comment before each block of logic**:

```bash
# Check if user is root
if [ "$USER" == "root" ]; then
  echo "You're the boss!"
fi
```

✅ **Use visual dividers for large scripts**:

```bash
#######################
# Backup Section Start
#######################
```

---

## 📣 Part 2: Using `echo` for Output

The `echo` command prints **text or variables** to the terminal.

### 🧪 Example:

```bash
echo "Hello, world!"
```

### 📌 With Variables:

```bash
name="Morty Smith"
echo "Hi, $name!"
```

Output:

```
Hi, Morty Smith!
```

---

## ✨ Formatting Output with `echo`

### 🔹 Newlines:

By default, `echo` adds a newline at the end:

```bash
echo "Line 1"
echo "Line 2"
```

Output:

```
Line 1
Line 2
```

Use `-n` to **suppress** the newline:

```bash
echo -n "Enter your name: "
```

Output:

```
Enter your name: _  # cursor stays on same line
```

---

### 🔹 Tabs and Escape Characters

Use `-e` to enable **escaped characters** like `\t` (tab) and `\n` (newline):

```bash
echo -e "Name:\Morty\nStatus:\tLearning Bash"
```

Output:

```
Name:   Morty
Status: Learning Bash
```

---

## 🧼 Quoting Best Practices

| Situation             | Use Quotes? | Why?                             |
| --------------------- | ----------- | -------------------------------- |
| Printing plain text   | ✅ Yes       | Handles spaces and special chars |
| Echoing a variable    | ✅ Yes       | Avoids word splitting/globbing   |
| Printing shell output | ✅ Always    | Prevents breaking due to spaces  |

### 🔹 Examples

✅ Good:

```bash
echo "Your home directory is: $HOME"
```

❌ Risky:

```bash
echo Your home directory is: $HOME
```

> May break if `$HOME` has spaces (unlikely, but still risky style).

---

## ❗ Common `echo` Mistakes

| Mistake               | What Happens                        | Fix                               |
| --------------------- | ----------------------------------- | --------------------------------- |
| `echo Hello $name!`   | Might not expand as expected        | Use quotes: `echo "Hello $name!"` |
| Forgetting `-e`       | `\n` and `\t` are printed literally | Use `-e` for escaped characters   |
| Not quoting variables | Spaces break formatting             | Always quote variables in `echo`  |

---

## 🧠 Bonus Tip: Echo vs Printf

For more **precise formatting**, Bash also supports `printf`, which works like C-style formatting:

```bash
printf "Name: %s\nAge: %d\n" "Korvo" 25
```

But for 95% of scripts, `echo` is **simpler and good enough**.

---

## 🏁 Summary

| Feature        | Command                  |
| -------------- | ------------------------ |
| Comment        | `# This is a note`       |
| Basic echo     | `echo "Hello!"`          |
| No newline     | `echo -n "Prompt: "`     |
| Escaped output | `echo -e "Line1\nLine2"` |
| Tabs           | `echo -e "Name:\tValue"` |

---

## 📌 Best Practices Recap

- ✅ Comment your code generously
- ✅ Use `echo` for clear, clean output
- ✅ Always wrap echoed text in quotes
- ✅ Use `-e` for newlines and tabs
- ✅ Test formatting to ensure clean output

---
