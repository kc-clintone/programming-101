# 🧠 Using `break` and `continue` in Bash Loops

## 🔍 Overview

| Command    | What it does                                           |
| ---------- | ------------------------------------------------------ |
| `break`    | Immediately **exits** the entire loop                  |
| `continue` | **Skips the current iteration**, moves to the next one |

---

## 📌 Syntax

Both are used **inside loops**:

```bash
for item in list
do
  if [ condition ]; then
    break      # or continue
  fi
done
```

Also works with `while` and `until`.

---

## 🧪 Example 1: `break` — Exit Loop Early

```bash
for num in {1..10}
do
  echo "Checking $num"
  if [ "$num" -eq 5 ]; then
    echo "Found 5! Stopping the loop."
    break
  fi
done
```

**Output:**

```
Checking 1
Checking 2
...
Found 5! Stopping the loop.
```

✅ Use `break` when something is found or a condition is met and you want to **stop immediately**.

---

## 🧪 Example 2: `continue` — Skip Certain Iterations

```bash
for file in *.txt
do
  if [[ "$file" == "secret.txt" ]]; then
    echo "Skipping secret file..."
    continue
  fi
  echo "Processing $file"
done
```

✅ Use `continue` when you want to **skip over specific values** (e.g., ignore temp files, skip malformed lines, etc.)

---

## 🔂 Real-Life Example: Filter and Stop

```bash
count=0

for file in *.log
do
  if [[ "$file" == *error* ]]; then
    echo "Skipping error log: $file"
    continue
  fi

  echo "Archiving $file"
  ((count++))

  if [ $count -ge 3 ]; then
    echo "Archived 3 files. Done!"
    break
  fi
done
```

### ✅ What it does:

* Skips files with “error” in the name.
* Processes only 3 files, then stops.

---

## 🔁 Also Works with `while` Loops

```bash
num=0

while [ $num -lt 10 ]
do
  ((num++))

  if [ $((num % 2)) -eq 0 ]; then
    continue  # skip even numbers
  fi

  echo "Odd number: $num"

  if [ "$num" -eq 7 ]; then
    echo "Stopping at lucky 7!"
    break
  fi
done
```

✅ This prints odd numbers until 7, then stops.

---

## ⚠️ Best Practices

| Practice                              | Why it matters                      |
| ------------------------------------- | ----------------------------------- |
| Avoid deep nesting with `break`       | Use it early to reduce complexity   |
| Comment your `continue`/`break`       | Explain why you're skipping/exiting |
| Use `break` for success/failure exits | e.g., found item, max attempts      |

---

## 📚 Summary Table

| Statement  | Effect                                  | Use Case                               |
| ---------- | --------------------------------------- | -------------------------------------- |
| `break`    | Stops the loop entirely                 | Found what you were looking for        |
| `continue` | Skips the current loop and goes to next | Skip unwanted items (e.g., temp files) |

---
