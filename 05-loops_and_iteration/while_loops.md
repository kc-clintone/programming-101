# 🔁 `while` Loops in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Understand how `while` loops work in Bash.
* Use `while` to repeat commands until a condition is false.
* Create interactive loops (e.g., reading input).
* Understand infinite loops and how to safely break out of them.

---

## 🔧 Basic Syntax

```bash
while [ condition ]
do
  # commands
done
```

The loop runs **as long as the condition is true**.

---

## 🧪 Example 1: Counting with a `while` Loop

```bash
count=1

while [ $count -le 5 ]
do
  echo "Count is $count"
  ((count++))
done
```

**Output:**

```
Count is 1
Count is 2
...
Count is 5
```

✅ Great for loops where the condition isn’t tied to a list.

---

## 💬 Example 2: Read User Input Until “quit”

```bash
input=""

while [ "$input" != "quit" ]
do
  read -p "Type something (type 'quit' to exit): " input
  echo "You typed: $input"
done
```

✅ This loop keeps asking until the user types `quit`.

---

## 📥 Example 3: Read from a File Line by Line

```bash
while read -r line
do
  echo "Line: $line"
done < myfile.txt
```

✅ Useful for processing files without loading them fully into memory.

---

## ♾️ Infinite Loops

Sometimes, you want a loop to run forever — **until something inside breaks it**.

### Syntax:

```bash
while true
do
  # do something forever
done
```

Or:

```bash
while :
do
  # same thing — colon is a no-op (always true)
done
```

---

## 🛑 Breaking Out of Loops

Use `break` to **exit a loop early**.

### 🧪 Example: Loop with Exit Condition

```bash
while true
do
  read -p "Enter password (or 'exit' to quit): " pass

  if [ "$pass" = "secret" ]; then
    echo "Access granted."
    break
  elif [ "$pass" = "exit" ]; then
    echo "Goodbye!"
    break
  else
    echo "Wrong password."
  fi
done
```

✅ Breaks the loop only when the user gets it right or types `exit`.

---

## ⚠️ Safety Tips for `while` Loops

| Problem             | Cause                    | Fix                                  |
| ------------------- | ------------------------ | ------------------------------------ |
| Loop never ends     | Condition always true    | Add a `break` or update a counter    |
| CPU stuck at 100%   | Empty loop body          | Add a small `sleep` if needed        |
| Infinite input loop | Waiting on input forever | Add a timeout, `ctrl+c` or `read -t` |

---

## 💤 Optional: Delay with `sleep`

```bash
while true
do
  echo "Heartbeat..."
  sleep 2  # wait 2 seconds
done
```

✅ Helps avoid hammering the CPU in background monitoring loops.

---

## 🧠 Summary Table

| Loop Type             | Description                   | Example              |
| --------------------- | ----------------------------- | -------------------- |
| `while [ condition ]` | Loops while condition is true | `[ $count -lt 10 ]`  |
| `while true`          | Infinite loop                 | `while true; do ...` |
| `while read`          | Line-by-line file reader      | `read -r line`       |

---
