# Environment Variables and `export` in Bash

---

## 📌 What Are Environment Variables?

An **environment variable** is a key-value pair stored in your shell’s environment that **affects the behavior of processes and programs**.

They:

* Hold important system data (`PATH`, `HOME`, `USER`, etc.)
* Let you configure programs without hardcoding values
* Are inherited by **child processes**

---

## 🆚 Shell Variables vs. Environment Variables

| Type                | Defined With        | Inherited by Child Processes? | Example Use                      |
| ------------------- | ------------------- | ----------------------------- | -------------------------------- |
| **Shell variable**  | `name=value`        | ❌ No                          | Temporary script values          |
| **Environment var** | `export name=value` | ✅ Yes                         | App configuration, system values |

---

### ✅ Shell Variable (local to the shell)

```bash
GREETING="Hello"
```

This variable is **only available in the current shell**. If you open a new terminal or call another script, it's gone.

---

### ✅ Environment Variable (available to subprocesses)

```bash
export GREETING="Hello"
```

Now `GREETING` is passed to child processes.

```bash
bash -c 'echo $GREETING'   # Output: Hello
```

---

## 🔧 Using `export`

You can export a new or existing variable:

```bash
MY_VAR="world"
export MY_VAR
```

Or in one line:

```bash
export MY_VAR="world"
```

---

## 🛠 Real-Life Example: Configuring Script Behavior

```bash
#!/bin/bash

export ENV="production"

run_script() {
  echo "Running in $ENV mode"
}

run_script
```

✅ This script can be reused by other scripts or shells that respect the `ENV` variable.

---

## 📁 Making Environment Variables Permanent

To make a variable persist across sessions (e.g. every time you open a terminal), add it to:

* `~/.bashrc` → for interactive shells
* `~/.bash_profile` or `~/.profile` → login shells

### Example (`~/.bashrc`):

```bash
export EDITOR=nano
export PATH="$PATH:$HOME/scripts"
```

Then run:

```bash
source ~/.bashrc   # Apply changes immediately
```

---

## 🧼 Best Practices for Environment Variables

| Rule                               | Why It Matters             |
| ---------------------------------- | -------------------------- |
| Use uppercase names (`MY_CONFIG`)  | Consistency and convention |
| Avoid using `export` unless needed | Keeps scope clean          |
| Use `"$VAR"` when referencing      | Prevents word splitting    |
| Add comments to `.bashrc`          | Easier maintenance         |

---

## 🔍 Viewing and Managing Env Vars

| Command          | What It Does                     |
| ---------------- | -------------------------------- |
| `printenv`       | List environment variables       |
| `echo $HOME`     | Print value of a variable        |
| `set`            | Show all variables (incl. shell) |
| `env`            | Run command with temporary env   |
| `unset VAR_NAME` | Remove a variable                |

---

## 🧪 Real-World Use Case: Temporary Overrides

```bash
API_KEY="123abc" node app.js
```

✅ This sets `API_KEY` **only for that command** — great for CI/CD pipelines or quick testing.

---

## 🧠 Summary

| Concept          | Syntax Example              |
| ---------------- | --------------------------- |
| Define shell var | `FOO=bar`                   |
| Export to env    | `export FOO=bar`            |
| Make permanent   | Add `export` to `~/.bashrc` |
| Remove           | `unset FOO`                 |
| View             | `echo $FOO`, `printenv`     |

---
