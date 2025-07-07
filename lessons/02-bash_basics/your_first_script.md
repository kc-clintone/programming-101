# 🐣 Creating and Running Your First Bash Script

## 🧠 Learning Objectives:

By the end of this lesson, learners will:

* Know how to create a `.sh` file using a text editor.
* Understand what the shebang line does.
* Be able to run a script using `bash` and `./`.
* Learn how to set the right file permissions using `chmod`.

---

## 🔧 What You Need:

* A Linux terminal (or WSL, macOS terminal, Codespaces, or Linux VM)
* A basic text editor (like `nano`, `vim`, or VS Code)

---

## 📁 Step 1: Create a New Script File

Let’s start by creating a file named `first_script.sh`.

In your terminal, type:

```bash
nano first_script.sh
```

This opens the Nano editor.

---

## ✍️ Step 2: Write the Script

Inside `nano`, type the following:

```bash
#!/bin/bash

echo "Hello, Bash!"
echo "Today is: $(date)"
echo "Your current directory is: $(pwd)"
```

### 🧠 What’s Happening Here?

* `#!/bin/bash`: This tells the system to use **Bash** to run this file.
* `echo`: Prints text to the terminal.
* `$(date)`: Executes the `date` command and inserts its output.
* `$(pwd)`: Shows the current working directory.

---

## 💾 Step 3: Save and Exit

To save in Nano:

* Press `Ctrl + O` (write out)
* Press `Enter` (confirm file name)
* Then press `Ctrl + X` to exit

Your script is now saved!

---

## ⚙️ Step 4: Run the Script

There are **two ways** to run a Bash script:

### 🔹 Option 1: Run with `bash`

```bash
bash first_script.sh
```

This works **even if** the file isn’t marked executable.

---

### 🔹 Option 2: Make It Executable & Run with `./`

#### 1. Make it executable:

```bash
chmod +x first_script.sh
```

This tells Linux: “Hey, this file can be executed like a program.”

#### 2. Run it:

```bash
./first_script.sh
```

> The `./` means: “Run this file in the **current directory**.”

---

## 🧪 Output Example:

```bash
Hello, Bash!
Today is: Mon Jul  7 16:02:12 UTC 2025
Your current directory is: /home/student
```

🎉 You just ran your first Bash script!

---

## 🔐 Quick Note on File Permissions

Use `ls -l` to view permissions:

```bash
ls -l first_script.sh
```

Output before `chmod +x`:

```
-rw-r--r-- 1 user user  72 Jul  7 16:00 first_script.sh
```

After `chmod +x`:

```
-rwxr-xr-x 1 user user  72 Jul  7 16:00 first_script.sh
```

Notice the `x` — it means **executable**.

---

## 🧼 Best Practices for Beginners

* Always start with `#!/bin/bash`
* Use comments to describe steps: `# This line prints the date`
* Test your script by running it both with `bash` and `./`
* Stick to simple commands as you build confidence

---

## 🛠️ Common Errors & Fixes

| ❌ Mistake                                    | 💡 Fix                              |
| -------------------------------------------- | ----------------------------------- |
| `Permission denied` when using `./script.sh` | Run `chmod +x script.sh` first      |
| `command not found`                          | Double-check your syntax or path    |
| Forgetting `#!/bin/bash`                     | Script may run with the wrong shell |

---

## 🧠 Bonus Tip: Add Some Flair

You can personalize your script with more system info:

```bash
#!/bin/bash

echo "Hi $USER!"
echo "You're currently in: $(pwd)"
echo "Logged in since: $(who -b)"
```

---

## 🏁 Recap

- ✅ Create a `.sh` file
- ✅ Start with `#!/bin/bash`
- ✅ Save and close the file
- ✅ Run with `bash script.sh` or make it executable and run with `./script.sh`
- ✅ Use `chmod +x` to grant execution permission

---

