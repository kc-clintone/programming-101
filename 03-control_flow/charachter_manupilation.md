# 🧵 Quotes, Escaping, and String Handling in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Understand the difference between **single (`'`)** and **double (`"`)** quotes.
* Know how to **escape special characters** like `$`, `"`, `\`, and spaces.
* Apply best practices to avoid quoting and string-related bugs.

---

## 🔤 1. The Difference: `'Single'` vs. `"Double"` Quotes

| Feature                    | Single Quotes `'...'`     | Double Quotes `"..."` |
| -------------------------- | ------------------------- | --------------------- |
| **Variables expanded**     | ❌ No                      | ✅ Yes                 |
| **Command substitution**   | ❌ No                      | ✅ Yes                 |
| **Escaping special chars** | Not needed inside         | Sometimes needed      |
| **Literal text**           | ✅ Everything is preserved | Allows interpolation  |

---

### 🧪 Example: Variable Expansion

```bash
name="Korvo"

echo 'Hello, $name'   # Output: Hello, $name
echo "Hello, $name"   # Output: Hello, Korvo
```

### 🧪 Example: Command Substitution

```bash
echo 'Today is $(date)'   # Output: Today is $(date)
echo "Today is $(date)"   # Output: Today is Mon Jul 7 ...
```

🔁 **Single quotes are for literal text.**
🔁 **Double quotes let Bash interpret things inside.**

---

## 🧼 2. Escaping Special Characters

Sometimes you need to use characters that Bash treats specially — like `$`, `"`, `'`, `\`, `*`, `!`, or even a **space**.

You "escape" them with a **backslash** (`\`).

### 📌 Examples

#### 🪙 Dollar Sign (`$`)

```bash
echo "Price: \$10"     # Output: Price: $10
```

#### 🧠 Quotes inside Quotes

**Double inside double:**

```bash
echo "He said, \"Hello there!\""
```

**Single inside single (harder):**

You must end the quote, use an escaped `'`, then reopen:

```bash
echo 'It'\''s a nice day.'
```

But easier with double quotes:

```bash
echo "It's a nice day."
```

#### 🌌 Backslashes

```bash
echo "Path: C:\\Users\\Korvo"
```

---

## 🧰 3. Best Practices to Avoid String Bugs

✅ **Always quote variables**:

```bash
echo "$filename"      # Safe
echo $filename        # Risky if value has spaces
```

✅ **Use double quotes for most things**:

```bash
echo "Welcome, $USER"
```

✅ **Use single quotes for static, literal text**:

```bash
echo 'The value of $USER will not be shown here.'
```

✅ **Escape characters you want printed literally**:

```bash
echo "5 > 3 is true"         # Fine
echo "Use the \$PATH variable"  # Escapes the dollar sign
```

---

## 🔂 4. Common Bugs and Fixes

| ❌ Bug                             | 😬 What Happens             | ✅ Fix                                 |
| --------------------------------- | --------------------------- | ------------------------------------- |
| `echo $var` with spaces           | Word splitting              | `echo "$var"`                         |
| `echo '$USER'`                    | No expansion                | Use `"`, not `'`                      |
| `echo "My folder is ~/Documents"` | Doesn’t expand `~`          | Use `"$HOME/Documents"`               |
| Escaping too much                 | Over-escaping breaks intent | Use wisely: only escape what you must |

---

## 🧪 Real Example: Breaking Without Quotes

```bash
filename="My Documents"

# Wrong
cp $filename /backup/

# Bash sees:
# cp My Documents /backup/
# → error: cp: cannot stat 'My': No such file or directory

# Right
cp "$filename" /backup/
```

---

## 🧠 Summary Table

| Quote Type | Use Case                    | Expands Variables | Expands Commands |
| ---------- | --------------------------- | ----------------- | ---------------- |
| `'Single'` | Literal text                | ❌                 | ❌                |
| `"Double"` | Dynamic text with variables | ✅                 | ✅                |
| No quotes  | Rarely safe                 | ✅                 | ✅                |

---

## 🧠 Bonus Tip: Heredoc for Multi-line Text

```bash
cat <<EOF
Hello, $USER!
Today is $(date)
EOF
```

Use `<<'EOF'` (single quoted) if you **don’t** want variable expansion.

---
