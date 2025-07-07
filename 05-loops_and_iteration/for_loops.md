# 🔁 `for` Loops in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Write `for` loops using both **numeric ranges** and **list-style** iteration.
* Understand the `in` keyword, loop variables, and proper syntax.
* Use loops to process files, lines, and command output.
* Learn formatting and best practices for readable loops.

---

## 🔧 Basic Syntax

```bash
for variable in list
do
  # commands
done
```

* `variable`: A placeholder that changes on each loop
* `list`: A space-separated list of values

---

## 📋 1. List-Style Iteration

Looping over a set of **strings** or **items**.

### 🧪 Example: Loop Through Words

```bash
for name in Alice Bob Charlie
do
  echo "Hello, $name!"
done
```

**Output:**

```
Hello, Alice!
Hello, Bob!
Hello, Charlie!
```

✅ Use this for looping through known values.

---

## 🔢 2. Numeric Ranges with `{}`

```bash
for i in {1..5}
do
  echo "Number: $i"
done
```

**Output:**

```
Number: 1
Number: 2
...
Number: 5
```

You can also set step values:

```bash
for i in {0..10..2}; do echo "$i"; done
```

---

## 🔁 3. C-Style `for` Loop (like in C/Java)

```bash
for ((i=1; i<=5; i++))
do
  echo "Count: $i"
done
```

✅ Useful when you need more control (e.g., incrementing with different step sizes or using math inside the loop)

---

## 📁 4. Looping Through Files

```bash
for file in *.txt
do
  echo "Found text file: $file"
done
```

✅ This is super useful for automation scripts like backups, renaming files, or parsing data.

---

## 🔂 5. Loop Through Command Output

Use command substitution `$()`:

```bash
for user in $(cut -d: -f1 /etc/passwd)
do
  echo "System user: $user"
done
```

⚠️ This works best when the output has **no spaces**. For outputs with spaces or newlines, use a `while` loop instead (we’ll cover that soon).

---

## 🧠 Real-World Example: Renaming Files

```bash
count=1
for file in *.jpg
do
  mv "$file" "image_$count.jpg"
  ((count++))
done
```

Renames:

```
photo1.jpg → image_1.jpg
photo2.jpg → image_2.jpg
```

---

## 🧼 Formatting and Indentation Tips

* Use 2 spaces or tabs consistently
* Avoid cramming logic in a single line for readability (unless it's very short)
* Use `{}` or `""` around variables when in doubt (especially for filenames)

---

## ⚠️ Common Pitfalls

| Mistake                                 | Problem            | Fix                                 |
| --------------------------------------- | ------------------ | ----------------------------------- |
| No `do` keyword                         | Syntax error       | Always start loop body with `do`    |
| Forgetting `done`                       | Script crashes     | Every loop must end with `done`     |
| Quoting filenames improperly            | Breaks with spaces | Use `"$file"` instead of `$file`    |
| Looping over command output with spaces | Breaks items       | Use `IFS` or a `while` loop instead |

---

## 📚 Summary Table

| Type       | Syntax                 | Use Case               |
| ---------- | ---------------------- | ---------------------- |
| List-style | `for x in a b c`       | Loop over known values |
| Range      | `for x in {1..5}`      | Loop over numbers      |
| C-style    | `for ((i=1;i<=5;i++))` | More control with math |
| Files      | `for f in *.txt`       | Batch file processing  |
| Commands   | `for x in $(command)`  | Process output safely  |

---
