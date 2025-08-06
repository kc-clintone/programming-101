# 🧾 Using the `read` Command to Capture User Input

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Use `read` to capture user input in Bash.
* Prompt users with `-p`.
* Set default values.
* Understand optional flags like `-s` (silent) and `-t` (timeout).
* Use input values dynamically in their scripts.

---

## 👂 What Is the `read` Command?

`read` is used in Bash to **capture keyboard input** from the user and **store it in a variable**.

---

## 🔧 Basic Syntax

```bash
read variable_name
```

### 🧪 Example:

```bash
echo "What is your name?"
read name
echo "Hello, $name!"
```

If the user types “Korvo”, the output will be:

```
Hello, Korvo!
```

---

## 📣 Prompting the User with `-p`

Use `-p` to show a message **before** input, all in one line:

```bash
read -p "Enter your age: " age
echo "You are $age years old."
```

This is cleaner than using `echo` + `read` separately.

---

## 🔄 Setting Default Values (Manually)

Bash `read` doesn’t support default values **directly**, but you can simulate it:

```bash
read -p "Enter your country [Kenya]: " country
country=${country:-Kenya}
echo "Country: $country"
```

### 💡 How it works:

* If the user just presses Enter (empty input), the default “Kenya” is used.

---

## 🛠️ More Useful `read` Flags

| Flag | Description              | Example                 |
| ---- | ------------------------ | ----------------------- |
| `-p` | Prompt before input      | `read -p "Name: " name` |
| `-s` | Silent mode (no echo)    | For passwords           |
| `-t` | Timeout in seconds       | `read -t 5 name`        |
| `-n` | Accept only N characters | `read -n 1 choice`      |

---

### 🔐 Example with `-s` (Silent Input):

```bash
read -sp "Enter your password: " password
echo -e "\nPassword received."
```

> `-s` is great for passwords — no input is shown while typing.

---

### ⏳ Example with `-t` (Timeout):

```bash
read -t 5 -p "Enter your username (5s timeout): " username
username=${username:-"anonymous"}
echo "Username: $username"
```

> If the user doesn’t type anything within 5 seconds, the script proceeds.

---

## 🧑‍💻 Reading Multiple Values at Once

```bash
read -p "Enter your first and last name: " first last
echo "First: $first, Last: $last"
```

---

## ❗ Common Mistakes

| Mistake                                | Why it's wrong                  | Fix                                    |
| -------------------------------------- | ------------------------------- | -------------------------------------- |
| Forgetting quotes in prompts           | May cause unexpected formatting | Always quote: `read -p "Prompt: " var` |
| Expecting default values automatically | `read` doesn’t support this     | Use `${var:-default}` workaround       |
| No newline after `-s`                  | Looks like it hangs             | Add `echo` or `-e "\n"` after          |

---

## ✅ Best Practices

* Always quote your prompts: `read -p "Enter something: " var`
* Use `-s` for passwords
* Use default fallback values with `${var:-default}`
* Validate input if necessary (we’ll cover that in a later lesson)

---

## 📁 Summary Table

| Task           | Command                            |
| -------------- | ---------------------------------- |
| Prompt user    | `read -p "Enter your name: " name` |
| Silent input   | `read -sp "Password: " pass`       |
| Timeout input  | `read -t 5 name`                   |
| Fallback value | `var=${var:-Default}`              |

---

## 🧠 Example Script: User Profile Prompt

```bash
#!/bin/bash

read -p "Name: " name
read -p "Age: " age
read -sp "Password: " password
echo -e "\nWelcome, $name! You're $age years old."
```

---
