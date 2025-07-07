# 🔁 `until` Loops in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Understand how `until` loops work and how they differ from `while` loops.
* Use `until` for retrying tasks or waiting for conditions.
* Write practical scripts using countdowns, retries, and waits.

---

## 🔍 How `until` Differs from `while`

| Loop Type | Runs when...           |
| --------- | ---------------------- |
| `while`   | condition is **true**  |
| `until`   | condition is **false** |

So:

```bash
while [ condition ]; do ... done   # Runs while true
until [ condition ]; do ... done   # Runs while false
```

---

## 🔧 Basic Syntax

```bash
until [ condition ]
do
  # commands
done
```

It keeps looping **until the condition becomes true** (i.e., it's the opposite logic of `while`).

---

## ⏱️ Example 1: Countdown with `until`

```bash
count=5

until [ $count -le 0 ]
do
  echo "Countdown: $count"
  ((count--))
done
```

**Output:**

```
Countdown: 5
Countdown: 4
...
```

✅ It stops once `$count` is no longer greater than 0.

---

## 🔁 Example 2: Retry Until File Exists

```bash
filename="data.txt"

until [ -f "$filename" ]
do
  echo "Waiting for $filename to be created..."
  sleep 2
done

echo "File found!"
```

✅ Useful for scripts that wait for a file to appear, like logs or outputs from another job.

---

## 🔐 Example 3: Ask for Input Until Correct

```bash
input=""

until [ "$input" = "yes" ]
do
  read -p "Do you agree? Type 'yes' to continue: " input
done

echo "Thank you!"
```

✅ This repeats until the user types `"yes"`.

---

## 🔄 Infinite Loop with Break (Optional)

Sometimes you don’t have a clear end condition. You can use `until true` or `until false` and break manually:

```bash
attempts=0

until false
do
  read -p "Enter the secret word: " word
  ((attempts++))

  if [ "$word" = "banana" ]; then
    echo "Correct!"
    break
  elif [ $attempts -ge 3 ]; then
    echo "Too many tries!"
    break
  fi
done
```

---

## 🧠 When to Use `until`

- ✅ When you're **waiting for something to happen**
- ✅ When a task **should retry until it succeeds**
- ✅ When the **failure case is the starting state** (e.g. file not present, connection not established)

> If your condition starts out as "bad" and becomes "good", use `until`.
> If it starts out "good" and becomes "bad", use `while`.

---

## 📌 Summary Table

| Feature       | `while`                          | `until`                          |
| ------------- | -------------------------------- | -------------------------------- |
| Runs when...  | condition is **true**            | condition is **false**           |
| Stops when... | condition becomes false          | condition becomes true           |
| Use when...   | You know the success state early | You're waiting for success later |

---
