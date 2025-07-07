# 🔰 The Shebang (`#!`) and Making Scripts Executable with `chmod +x`

## 🧠 Learning Objectives

By the end of this lesson, students will be able to:

* Understand what the **shebang (`#!`)** line does in a script.
* Know why it's important for script execution.
* Use `chmod +x` to make scripts executable.
* Identify and fix common mistakes.

---

## 🐚 What Is the Shebang (`#!`)?

The **shebang** is the very first line in a script file. It looks like this:

```bash
#!/bin/bash
```

### 🔍 Breakdown:

* `#!` is called the *shebang*.
* `/bin/bash` is the *path* to the Bash shell (or interpreter).

### 🧠 What It Means:

> “Use this program to run the rest of this file.”

---

## 📌 Why Is the Shebang Important?

Without the shebang:

* The system might **not know how to run the script**.
* It may try to use the **default shell**, which isn’t always Bash.
* This can cause bugs if your script uses Bash-specific syntax like `[[ ... ]]` or `(( ... ))`.

With the shebang:

* The system knows exactly which interpreter to use — no guessing.

---

## ✨ Common Shebang Examples

| Interpreter   | Shebang Line          | Use Case                           |
| ------------- | --------------------- | ---------------------------------- |
| Bash          | `#!/bin/bash`         | Bash scripts                       |
| Python        | `#!/usr/bin/python3`  | Python scripts                     |
| Node.js       | `#!/usr/bin/env node` | JavaScript (Node.js) scripts       |
| Portable Bash | `#!/usr/bin/env bash` | More flexible on different systems |

> ✅ `#!/usr/bin/env bash` is more *portable*, especially across different Linux distributions or macOS.

---

## 🛠️ Making Your Script Executable with `chmod +x`

By default, new `.sh` files **aren’t executable**. You must explicitly allow them to be run like programs.

### 🪛 Use this command:

```bash
chmod +x script_name.sh
```

This adds **execute permission** for the file owner.

#### 🧪 Example:

```bash
nano hello.sh
```

Paste:

```bash
#!/bin/bash
echo "Hello, world!"
```

Save and exit. Then:

```bash
chmod +x hello.sh
./hello.sh
```

Expected output:

```
Hello, world!
```

---

## 🔐 Understanding Permissions with `ls -l`

Run:

```bash
ls -l hello.sh
```

Output before `chmod +x`:

```
-rw-r--r-- 1 user user 32 Jul 7 16:30 hello.sh
```

After:

```
-rwxr-xr-x 1 user user 32 Jul 7 16:30 hello.sh
```

🟢 `x` means executable
🟢 `rwx` means the file owner (you) can read, write, and execute

---

## ⚠️ Common Errors and How to Fix Them

| 🧨 Error                                     | 💡 Cause                                                           | ✅ Fix                                    |
| -------------------------------------------- | ------------------------------------------------------------------ | ---------------------------------------- |
| `Permission denied`                          | Trying to run a script without execute permissions                 | Run `chmod +x script.sh`                 |
| `command not found`                          | You ran `script.sh` instead of `./script.sh`                       | Use `./script.sh` or `bash script.sh`    |
| `bad interpreter: No such file or directory` | Shebang points to a non-existent path (e.g., typo or wrong system) | Check with `which bash` and fix the path |
| Nothing happens                              | Script doesn’t have a shebang or executable bit                    | Add `#!/bin/bash` and `chmod +x`         |

---

## ✅ Best Practices

* Always include a shebang at the **very top** of the file.
* Use `#!/usr/bin/env bash` for **portability**.
* Make your script executable once — no need to repeat `chmod +x` every time.
* Use `ls -l` to confirm permissions.

---

## 🧪 Quick Test

Create a script called `report.sh`:

```bash
#!/bin/bash
echo "Generating system report..."
uptime
df -h
```

Run:

```bash
chmod +x report.sh
./report.sh
```

Expected output:

```
Generating system report...
 16:33:29 up 2 days,  4:01,  1 user,  load average: 0.17, 0.10, 0.09
Filesystem      Size  Used Avail Use% Mounted on
...
```

---

## 🧠 Bonus Tip: Run Without Shebang?

Yes, you *can* run a script without a shebang using:

```bash
bash script.sh
```

But that’s not recommended long-term. It’s better to:

* Include the shebang
* Set execute permissions
* Run it like a native program: `./script.sh`

---

## 🏁 Recap

* The **shebang** tells Linux which interpreter to use.
* `chmod +x` gives your script **execute** permission.
* Always test with `./script.sh` and check for typos in the shebang path.
* Without a shebang, you’re relying on luck. Don’t.

---
