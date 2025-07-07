# Nested `if` Statements in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Understand how to nest `if` statements inside one another.
* Use proper indentation and formatting to keep code readable.
* Write scripts that handle complex, multi-layered conditions.

---

## 🔄 What Is Nesting?

**Nesting** means putting one `if` statement **inside another**.

This lets you **check a second condition only if the first one passes**.

---

## 🔧 Basic Syntax of Nested `if`

```bash
if [ first_condition ]; then
  if [ second_condition ]; then
    # Do this if both conditions are true
  else
    # Do this if only the first condition is true
  fi
else
  # Do this if the first condition is false
fi
```

---

## 🧪 Example: File and Content Check

Check if a file exists, and if it does, whether it’s empty or not:

```bash
#!/bin/bash

read -p "Enter filename: " file

if [ -e "$file" ]; then
  echo "File exists."

  if [ -s "$file" ]; then
    echo "File is not empty."
  else
    echo "File is empty."
  fi

else
  echo "File does not exist."
fi
```

---

### 📌 Explanation

* First `if`: Does the file exist?
* Nested `if`: Is the file size > 0?

---

## ✅ Indentation and Formatting Tips

| Rule                                | Why                            |
| ----------------------------------- | ------------------------------ |
| Use **2 spaces** per level          | Keeps code readable            |
| Line up `fi` with its matching `if` | Easier to debug                |
| Add **comments** in complex logic   | Avoid confusion later          |
| Don't over-nest if avoidable        | Use `elif` or case when better |

---

## 🧠 Alternative: Use Logical Operators Instead of Nesting

Instead of nesting:

```bash
if [ -e "$file" ]; then
  if [ -s "$file" ]; then
    echo "OK"
  fi
fi
```

You can write:

```bash
if [ -e "$file" ] && [ -s "$file" ]; then
  echo "OK"
fi
```

- ✅ Shorter
- ✅ Still readable (as long as logic is simple)

---

## 🧪 Real-Life Example: Login Access Control

```bash
#!/bin/bash

read -p "Enter your username: " user
read -p "Enter access level (1-5): " level

if [[ "$user" == "admin" ]]; then
  echo "Admin detected."

  if [ "$level" -ge 4 ]; then
    echo "Full access granted."
  else
    echo "Restricted admin access."
  fi

else
  echo "Standard user."
  if [ "$level" -ge 3 ]; then
    echo "Elevated access."
  else
    echo "Basic access."
  fi
fi
```

---

## ⚠️ Common Pitfalls

| Mistake          | Problem         | Fix                       |
| ---------------- | --------------- | ------------------------- |
| Missing `fi`     | Breaks script   | Always close each `if`    |
| Poor indentation | Hard to read    | Use consistent spacing    |
| Over-nesting     | Confusing logic | Consider `elif` or `case` |

## 🧠 Summary

- ✅ Use nested `if` statements to handle **dependent conditions**
- ✅ Keep your code clean with **indentation** and **commenting**
- ✅ Consider alternatives (`&&`, `elif`, `case`) when nesting gets deep

---
