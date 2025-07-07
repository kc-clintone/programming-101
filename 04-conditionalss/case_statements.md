# 🎛️ The `case` Statement in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Understand how the `case` statement works in Bash.
* Use it to handle multiple known values efficiently.
* Write cleaner scripts for menus, user input, and argument parsing.
* Compare `case` with `if`/`elif` for better code design.

---

## 🔄 What Is `case`?

The `case` statement allows you to test **one variable against multiple patterns**, and execute different code depending on the match.

It’s like a switch-case in other languages like C, Java, or JavaScript.

---

## 🔧 Syntax

```bash
case "$variable" in
  pattern1)
    # commands
    ;;
  pattern2)
    # other commands
    ;;
  *)
    # default case
    ;;
esac
```

🧠 `esac` = `case` spelled backwards (like `fi` for `if`)

---

## 🧪 Example: Simple Menu

```bash
#!/bin/bash

echo "Choose an option:"
echo "1) Say hello"
echo "2) Show date"
echo "3) Exit"

read -p "Enter choice: " choice

case "$choice" in
  1)
    echo "Hello there!"
    ;;
  2)
    date
    ;;
  3)
    echo "Goodbye!"
    ;;
  *)
    echo "Invalid option"
    ;;
esac
```

---

## ✅ Why Use `case` Instead of Multiple `if`s?

### `if` Version (long and harder to read):

```bash
if [ "$input" = "start" ]; then
  echo "Starting..."
elif [ "$input" = "stop" ]; then
  echo "Stopping..."
elif [ "$input" = "restart" ]; then
  echo "Restarting..."
else
  echo "Unknown command."
fi
```

### `case` Version (cleaner):

```bash
case "$input" in
  start)
    echo "Starting..."
    ;;
  stop)
    echo "Stopping..."
    ;;
  restart)
    echo "Restarting..."
    ;;
  *)
    echo "Unknown command."
    ;;
esac
```

- ✅ Easier to maintain
- ✅ Scales better as options increase
- ✅ Cleaner with pattern matching

---

## 🧭 Wildcards and Pattern Matching

You can use wildcards like `*`, `?`, `[...]` in patterns.

### Example:

```bash
case "$file" in
  *.txt)
    echo "Text file"
    ;;
  *.jpg|*.png)
    echo "Image file"
    ;;
  *)
    echo "Unknown file type"
    ;;
esac
```

---

## 🧰 Real-World Example: Argument Parsing

```bash
#!/bin/bash

case "$1" in
  start)
    echo "Starting service..."
    ;;
  stop)
    echo "Stopping service..."
    ;;
  status)
    echo "Service is running."
    ;;
  *)
    echo "Usage: $0 {start|stop|status}"
    ;;
esac
```

Run it from terminal:

```bash
./service.sh start
./service.sh status
./service.sh foo
```

---

## 🔂 Another Example: Day of the Week

```bash
read -p "What day is it? " day

case "$day" in
  Monday|monday)
    echo "Ugh, Monday blues."
    ;;
  Friday|friday)
    echo "TGIF!"
    ;;
  Saturday|Sunday|saturday|sunday)
    echo "Weekend fun time!"
    ;;
  *)
    echo "Just another day."
    ;;
esac
```

---

## ⚠️ Common Mistakes

| Mistake                          | What Happens               | Fix                                       |
| -------------------------------- | -------------------------- | ----------------------------------------- |
| Missing `;;`                     | Falls through to next case | Always end each block with `;;`           |
| Forgetting `esac`                | Script crashes             | Always close with `esac`                  |
| Using `if` when `case` is better | Messy and hard to read     | Prefer `case` for menus and fixed options |

---

## 🧠 Summary Table

| Feature                | `if`   | `case`  |
| ---------------------- | ------ | ------- |
| Test logic expressions | ✅ Yes  | ❌ No    |
| Match fixed strings    | ✅ Yes  | ✅ Yes   |
| Pattern matching       | ❌ No   | ✅ Yes   |
| Best for menus & input | ❌ Okay | ✅ Ideal |
| Scales well            | ❌ No   | ✅ Yes   |

---

## 📌 Final Tip

Use `case` when:

* You expect **fixed string input**
* You're building **menus or CLIs**
* You want **cleaner logic**

---
