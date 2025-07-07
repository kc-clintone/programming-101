# 🐚 Lesson: What Is a Bash Script?

## 🧠 Learning Objectives:

By the end of this lesson, students will be able to:

* Understand what a Bash script is and how it works.
* Know when and why to use a Bash script over interactive commands.
* Distinguish between interactive shell usage and scripting.
* See real-world examples of automating tasks with Bash.

---

## 🔹 What is a Bash Script?

A **Bash script** is simply a **text file** that contains a series of Bash commands, which are executed in sequence.

It’s like writing down all the commands you’d normally type in a terminal—then letting the system run them automatically for you.

It usually starts with a special line called a **shebang**:

```bash
#!/bin/bash
```

This tells the system: “Use Bash to interpret this file.”

### 📦 Example:

```bash
#!/bin/bash

echo "Hello, world!"
date
uptime
```

Save it as `hello.sh`, give it execute permission with:

```bash
chmod +x hello.sh
```

Then run it:

```bash
./hello.sh
```

You’ll see:

```
Hello, world!
Mon Jul  7 15:03:42 UTC 2025
 15:03:42 up  2:01,  2 users,  load average: 0.23, 0.18, 0.16
```

---

## 🔄 Bash Scripts vs. Running Commands Interactively

| Feature            | Interactive Shell             | Bash Script                            |
| ------------------ | ----------------------------- | -------------------------------------- |
| **Mode**           | One command at a time         | Batch of commands in a file            |
| **Use Case**       | One-off, ad-hoc tasks         | Repetitive, automated, scheduled tasks |
| **Persistence**    | Commands vanish after session | Stored, reusable                       |
| **Error Handling** | Manual                        | Can include automated logic            |
| **Scalability**    | Low                           | High                                   |

### 🤔 Analogy:

> Using the interactive shell is like making coffee manually every day.
> Writing a Bash script is like programming your coffee machine to do it for you at 7:00 AM.

---

## 🧰 When Should You Use a Bash Script?

Use a Bash script when:

* You're repeating the same terminal commands often.
* You want automation (e.g., backups, builds, deployments).
* You need to chain multiple commands together.
* You want logic (e.g., conditionals or loops).
* You're working with cron jobs (scheduled tasks).

Don't use a Bash script when:

* The task is trivial or one-off.
* You need GUI interaction or heavy data manipulation (e.g., Python or Perl might be better).

---

## 🚀 Real-Life Bash Scripting Examples

### 1. **Daily Backup Script**

```bash
#!/bin/bash

SOURCE="/home/user/documents"
DEST="/mnt/backup/$(date +%F)"
mkdir -p "$DEST"
cp -r "$SOURCE" "$DEST"
echo "Backup completed to $DEST"
```

**Use case:** Automatically back up your documents folder every day.

---

### 2. **System Update & Cleanup Script**

```bash
#!/bin/bash

echo "Updating system..."
sudo apt update && sudo apt upgrade -y
echo "Removing unused packages..."
sudo apt autoremove -y
```

**Use case:** Regular maintenance of your Linux system.

---

### 3. **Bulk Rename Files**

```bash
#!/bin/bash

i=1
for file in *.jpg; do
  mv "$file" "image_$i.jpg"
  ((i++))
done
```

**Use case:** Rename photos in a directory for consistency.

---

### 4. **Monitor Internet Connection**

```bash
#!/bin/bash

ping -c 1 google.com > /dev/null

if [ $? -eq 0 ]; then
  echo "Internet is up"
else
  echo "Internet is down"
fi
```

**Use case:** Check if your internet is working and log the result.

---

### 5. **Cron Job + Bash Script Combo**

You can schedule any Bash script to run at specific intervals using `cron`:

```bash
crontab -e
```

Add:

```
0 2 * * * /home/user/backup.sh
```

**Use case:** Run your backup script daily at 2 AM.

---

## ✅ Best Practices for Bash Scripts

* Always start with `#!/bin/bash`.
* Comment your code! (`# This line does xyz`)
* Use `set -e` to stop on the first error.
* Use `"$VARIABLE"` in double quotes to avoid globbing/word splitting issues.
* Make scripts executable (`chmod +x script.sh`).
* Keep scripts modular and reusable.

---

## 🔍 Common Mistakes

| Mistake                                  | What Happens                                     |
| ---------------------------------------- | ------------------------------------------------ |
| Missing `#!/bin/bash`                    | The script may be interpreted by the wrong shell |
| Not quoting variables                    | May break filenames with spaces                  |
| Using `=` instead of `==` in `[[ ... ]]` | Leads to syntax errors                           |
| Forgetting to `chmod +x`                 | Script won’t run directly                        |

---

## 🏁 Summary

* **Bash scripts** automate tasks you'd otherwise do manually in the shell.
* They’re perfect for repetitive, complex, or scheduled tasks.
* Scripting is where Linux power users *live and breathe*.
* Practice turning everyday tasks into scripts—automation is addictive!

---
