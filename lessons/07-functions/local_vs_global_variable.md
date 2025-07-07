# 🧠 Local vs Global Variables in Bash

---

## 🚩 What Is Variable Scope?

In Bash:

* **Global variables** are accessible **everywhere** in the script (even inside functions).
* **Local variables** exist **only within the function** where they’re declared.

---

## 🌍 1. Global Variables (Default)

By default, **all variables in Bash are global**, unless explicitly declared otherwise.

```bash
message="Hello from outside"

greet() {
  echo "$message"
}

greet  # Output: Hello from outside
```

Here, the function `greet` can access the global variable `message`.

---

## ⚠️ Global Variables Can Be Overwritten Accidentally

```bash
count=5

update_count() {
  count=10
}

update_count
echo "$count"   # Output: 10 😱
```

🧨 That’s dangerous! The function **modified a global variable**, possibly without your intention.

---

## 🔐 2. Using `local` to Restrict Scope

### ✅ Declare local variables inside functions:

```bash
counter=0

increment() {
  local counter=1
  ((counter++))
  echo "Inside: $counter"
}

increment         # Inside: 2
echo "Outside: $counter"  # Outside: 0 ✅
```

* `local counter=1` ensures the variable **exists only within the function**.
* The global `counter` remains untouched.

---

## 🧪 Example: Function with Local Variables

```bash
add() {
  local a=$1
  local b=$2
  local result=$((a + b))
  echo "$result"
}

sum=$(add 3 4)
echo "Sum: $sum"
```

✅ Clean. `a`, `b`, and `result` are **local to the function**, reducing risk of name collision.

---

## 📦 Summary: `local` Keyword

| Syntax                   | Effect                              |
| ------------------------ | ----------------------------------- |
| `local var=value`        | Declares `var` inside function only |
| `var=value` (no `local`) | Declares or overwrites global var   |

---

## 🔬 Scope Limitations

* `local` only works **inside functions**
* Declaring `local` outside of a function throws an error:

  ```bash
  local foo=bar  # ❌ will cause: "local: can only be used in a function"
  ```

---

## 💡 Best Practices for Variable Scope

| Tip                                                         | Why                                |
| ----------------------------------------------------------- | ---------------------------------- |
| Use `local` inside functions                                | Avoid unintentional global changes |
| Use descriptive names for globals (`APP_ENV`, `CONFIG_DIR`) | Prevent naming collisions          |
| Don’t rely on globals for return values                     | Use `echo` and `$(...)` instead    |
| Always initialize variables before use                      | Prevent unexpected behavior        |

---

## 🧠 Summary Table

| Scope  | Declared With   | Accessible In   | Notes                       |
| ------ | --------------- | --------------- | --------------------------- |
| Global | `var=value`     | Anywhere        | Default in Bash             |
| Local  | `local var=...` | Inside function | Safer, recommended in funcs |

---
