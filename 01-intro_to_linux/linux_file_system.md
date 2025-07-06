# 📁 Navigating the Linux File System

Before you can work with files or run scripts in Linux, you need to know **where you are** and how to move around. Think of your computer like a big city. Each **folder** is like a **neighborhood**, and **files** are the buildings inside.

In this lesson, you'll learn three essential commands:

- `ls` – list files and folders
- `cd` – change directory
- `pwd` – show your current location (print working directory)

---

## 🧭 1. Know Where You Are: `pwd`

Use `pwd` to print your current location in the file system.

```bash
pwd
````

Example output:

```
/home/username/projects
```

> 🧠 Analogy: If your computer were Google Maps, `pwd` is like checking your current GPS location.

---

## 📂 2. See What’s Around You: `ls`

Use `ls` to **list** the files and folders in your current directory.

```bash
ls
```

### Common Options:

* `ls -l` – list in long format (more details)
* `ls -a` – include hidden files (those starting with `.`)
* `ls -lh` – human-readable sizes

Example:

```bash
ls -lh
```

Output:

```
-rw-r--r-- 1 user user 1.2K Jul 6 10:30 notes.txt
drwxr-xr-x 2 user user 4.0K Jul 6 10:30 projects/
```

> 🧠 Analogy: `ls` is like peeking inside a folder to see what’s there.

---

## 🚪 3. Move Between Folders: `cd`

Use `cd` (change directory) to move around the file system.

```bash
cd foldername
```

### Examples:

```bash
cd Documents       # Go into the Documents folder
cd ..              # Go up one level
cd ~               # Go to your home directory
cd /etc            # Go to an absolute path
```

> 🧠 Analogy: `cd` is like walking into a different room in your house.

---

## 🧭 Path Types: Relative vs Absolute

### 🔹 Absolute Path

* Starts from the root `/`
* Always points to the same location no matter where you are

Example:

```bash
cd /home/username/Documents
```

> Think of it as a full street address: **/Country/City/Street/Building**

---

### 🔸 Relative Path

* Based on your current location
* Shorter and faster to type if you're already nearby

Example:

```bash
cd ../Downloads
```

> Think of it like saying: “Go to the house two blocks behind me.”

---

## 🖼️ Picture this: Navigating a Sample Structure

Let’s say this is your file system:

```
/
├── home
│   └── username
│       ├── Documents
│       └── Projects
│           └── website
```

If you're in `/home/username/Projects`, here’s what these do:

| Command             | Where You Go                       |
| ------------------- | ---------------------------------- |
| `cd ..`             | `/home/username` (go up one level) |
| `cd website`        | `/home/username/Projects/website`  |
| `cd ~/Documents`    | `/home/username/Documents`         |
| `cd /home/username` | Absolute path to home              |

---

## 🎯 Quick Recap

| Command | What It Does                   |
| ------- | ------------------------------ |
| `pwd`   | Shows your current directory   |
| `ls`    | Lists files and folders        |
| `cd`    | Moves you to another directory |

Learning to move confidently through the Linux file system will make you faster and more effective when working with Git, scripts, or projects.

---

## 📚 Want to Learn More?

Check out my detailed Linux navigation guide on Medium:

👉 [**Read the Full Guide on Medium**](https://medium.com/your-linux-navigation-guide)

---
