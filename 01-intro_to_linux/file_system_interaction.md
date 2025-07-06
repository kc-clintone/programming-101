# 🛠️ Viewing and Manipulating Files in Linux

Once you know how to move around the Linux file system, the next step is learning how to **work with files**: view, copy, move, and delete them safely using the command line.

This lesson covers essential commands:

- `cat` – view file contents
- `less` – scroll through files
- `cp` – copy files
- `mv` – move or rename files
- `rm` – delete files

And we’ll include safety tips so you don’t lose important data by accident.

---

## 👁️ Viewing File Contents

### 1. `cat` – View the whole file

```bash
cat filename.txt
````

* Displays the entire file in the terminal at once.
* Great for short files.

> ⚠️ For large files, `cat` will flood your screen. Use `less` instead.

---

### 2. `less` – Scroll through file contents

```bash
less filename.txt
```

* Opens a scrollable viewer in the terminal.
* Use:

  * `↑` and `↓` or `PageUp` / `PageDown` to navigate.
  * `q` to quit.

> 🧠 *Analogy:* Think of `cat` as unrolling an entire scroll at once, while `less` gives you a window to read page by page.

---

## 📄 Copying, Moving, and Renaming Files

### 3. `cp` – Copy a file

```bash
cp original.txt copy.txt
```

* Creates a **duplicate** of the file.

#### To copy into a folder:

```bash
cp notes.txt Documents/
```

---

### 4. `mv` – Move or rename a file

```bash
mv oldname.txt newname.txt
```

* Renames a file if destination is a filename.
* Moves a file if destination is a directory.

#### Example – Move to another folder:

```bash
mv notes.txt Archive/
```

> 🧠 *Tip:* Unlike `cp`, `mv` removes the original file after moving.

---

## 🗑️ Deleting Files (Carefully)

### 5. `rm` – Remove a file or directory

```bash
rm file.txt
```

> ⚠️ There’s no Recycle Bin. Deleted means **gone**.

---

### ⚠️ Safety Tip: Use `-i` (interactive)

```bash
rm -i file.txt
```

* Asks for confirmation before deleting.

#### Even safer for folders:

```bash
rm -ri myfolder/
```

* `-r` means recursive (needed to delete folders)
* `-i` prompts for each file inside

---

## 🌟 Bonus Tips: Wildcards & Safety

### 🐚 Use Wildcards to Select Multiple Files

```bash
rm *.log
```

* Deletes all `.log` files in the current directory.

```bash
cp *.txt backup/
```

* Copies all `.txt` files to `backup/`

#### Wildcard symbols:

| Symbol | Meaning                  |
| ------ | ------------------------ |
| `*`    | Any number of characters |
| `?`    | One single character     |

---

## 🔒 Avoiding Data Loss

* 🛑 Never run `rm -rf /` — it will delete your whole system.
* ✅ Use `rm -i` for important deletions.
* 💾 Always **double-check** the file or folder name.
* 📦 Consider using `trash-cli` or `mv` to a `Trash/` directory if unsure.

---

## 🧪 Try This:

```bash
touch test.txt
echo "Hello!" > test.txt
cat test.txt
cp test.txt backup.txt
mv backup.txt archive.txt
rm -i archive.txt
```

Each command here demonstrates file creation, viewing, copying, renaming, and deletion — interactively and safely.

---

## 🎯 Quick Reference

| Command   | Action                        |
| --------- | ----------------------------- |
| `cat`     | View short file contents      |
| `less`    | View and scroll through files |
| `cp`      | Copy files                    |
| `mv`      | Move or rename files          |
| `rm`      | Delete files                  |
| `-i`      | Prompt before delete/copy     |
| `*` / `?` | Wildcard match for files      |

---

## 📚 Want to Learn More?

Explore more Linux file tips and tricks in my full Medium post:

👉 [**View & Manage Files Like a Pro on Medium**]([Read more here](https://medium.com/@kc_clintone/file-management-in-linux-navigating-organizing-and-securing-your-files-0156c017c55c))

---
