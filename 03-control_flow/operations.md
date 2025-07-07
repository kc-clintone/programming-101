# ➕ Arithmetic in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Perform integer arithmetic using `let`, `$(( ))`, and `expr`
* Use increment (`++`) and decrement (`--`) operations
* Understand Bash's math limitations (no float support)
* Apply arithmetic in practical scripts

---

## 🔢 Bash and Math: Quick Overview

Bash supports **basic integer arithmetic**, including:

* Addition: `+`
* Subtraction: `-`
* Multiplication: `*`
* Division: `/`
* Modulo (remainder): `%`

📛 **But:** Bash **does not support floating-point numbers** — math is limited to **integers only**!

---

## 🧮 1. Using `$(( ))` — Arithmetic Expansion (Preferred)

This is the **most common and modern** way to do math in Bash.

```bash
sum=$((5 + 3))
echo "Sum: $sum"
```

You can use variables directly:

```bash
a=10
b=4
result=$((a * b))
echo "Result: $result"
```

✅ Works inline, easy to read, no need for quotes or escaping.

---

## 🔧 2. Using `let` — Arithmetic Operator (Also Common)

The `let` command evaluates an arithmetic expression.

```bash
let x=5+3
echo "x = $x"
```

Or with variables:

```bash
a=8
b=2
let result=a/b
echo "Result: $result"
```

### 🔁 Increment and Decrement with `let`

```bash
count=0
let count++
let count+=2
let count--
echo "Count: $count"
```

> You can also use `++` and `--` with `$(( ))`, but not with `expr`.

---

## 🧾 3. Using `expr` — Older Style (Still Works)

The `expr` command does math but requires **spaces between every token**.

```bash
result=$(expr 7 + 2)
echo "Result: $result"
```

### ⚠️ Important:

* You must **escape** the `*` (multiplication) with `\*` because `*` is a shell wildcard:

```bash
result=$(expr 6 \* 3)
echo "6 times 3 is $result"
```

* No support for `++`, `--`, or `+=` style operators.

---

## 🚫 Limitation: No Floats!

Bash **can’t handle decimals**:

```bash
a=5
b=2
echo $((a / b))    # Output: 2, not 2.5
```

If you try:

```bash
echo $((5 / 2))     # → 2
```

### 💡 Workaround:

To use floating point math, use tools like:

* `bc` (Basic Calculator):

  ```bash
  echo "scale=2; 5 / 2" | bc   # Output: 2.50
  ```
* `awk` for inline math:

  ```bash
  echo | awk '{print 5/2}'     # Output: 2.5
  ```

---

## 📈 Arithmetic Operators Summary

| Operator    | Description           | Example               |
| ----------- | --------------------- | --------------------- |
| `+`         | Addition              | `$((a + b))`          |
| `-`         | Subtraction           | `$((a - b))`          |
| `*`         | Multiplication        | `$((a * b))`          |
| `/`         | Division (int only)   | `$((a / b))`          |
| `%`         | Modulo                | `$((a % b))`          |
| `++` / `--` | Increment / Decrement | `$((a++))`, `let a--` |
| `+=` / `-=` | Compound assignment   | `let a+=2`            |

---

## 🔂 Examples: Increment and Decrement

```bash
counter=0
echo "Start: $counter"

((counter++))   # post-increment
echo "After ++: $counter"

((counter--))   # post-decrement
echo "After --: $counter"

((counter+=5))  # add 5
echo "After +=5: $counter"
```

---

## 🧠 Best Practices

* Prefer `$(( ))` for arithmetic — modern and clean
* Use `let` for simple math or when incrementing directly
* Avoid `expr` unless required for legacy scripts
* Remember: Bash math is **integer-only**
* Use `bc` if you need decimal support

---

## 🧪 Mini Script Example

```bash
#!/bin/bash

read -p "Enter a number: " num
echo "Square: $((num * num))"
```
---
