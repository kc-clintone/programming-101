# 🛠️ Automating File Management with Bash

## 🧠 Learning Objectives

By the end of this guide, learners will:

* Rename files using consistent patterns (e.g. `photo_001.jpg`)
* Clean up unwanted files (e.g. `.tmp`, `.log`)
* Create automated backups
* Categorize files by type or date

---

## 🔁 1. **Renaming Files Automatically**

Renaming a batch of files using a loop helps you organize messy or randomly-named files (like camera dumps or downloads).

### ✅ Rename JPGs to `photo_1.jpg`, `photo_2.jpg`, etc.

```bash
#!/bin/bash

count=1

for file in *.jpg
do
  mv "$file" "photo_$count.jpg"
  ((count++))
done
```

💡 **Best Practices:**

* Always quote `"$file"` to handle spaces.
* Use `printf` to pad numbers with zeros:

```bash
mv "$file" "$(printf 'photo_%03d.jpg' "$count")"
```

---

## 🧹 2. **Cleaning Up Unwanted Files**

You can automate the deletion of temporary, log, or cache files using globbing and `rm`.

### ✅ Delete `.tmp` and `.log` files

```bash
#!/bin/bash

shopt -s nullglob  # avoid deleting wrong files

for file in *.tmp *.log
do
  echo "Deleting: $file"
  rm "$file"
done
```

💡 Add a prompt to confirm deletion:

```bash
read -p "Delete $file? (y/n): " answer
if [[ "$answer" = "y" ]]; then rm "$file"; fi
```

---

## 💾 3. **Creating Simple File Backups**

You don’t want to lose important config or data files — this script appends `.bak` to existing files or copies them into a backup folder.

### ✅ Append `.bak` to important files

```bash
#!/bin/bash

for file in *.conf
do
  cp "$file" "$file.bak"
done
```

### ✅ Backup files into a directory with a timestamp

```bash
#!/bin/bash

backup_dir="backup_$(date +%F_%H-%M-%S)"
mkdir "$backup_dir"

for file in *.txt
do
  cp "$file" "$backup_dir/"
done

echo "Backup saved to $backup_dir"
```

---

## 🗂️ 4. **Categorizing Files by Type**

You can organize files by extension or file type (e.g., images, documents, scripts).

### ✅ Move files into folders based on extension

```bash
#!/bin/bash

mkdir -p images docs scripts

for file in *
do
  case "$file" in
    *.jpg|*.png) mv "$file" images/ ;;
    *.pdf|*.docx) mv "$file" docs/ ;;
    *.sh) mv "$file" scripts/ ;;
  esac
done
```

### ✅ Sort downloads by date

```bash
#!/bin/bash

for file in *
do
  if [ -f "$file" ]; then
    folder=$(date -r "$file" +%Y-%m-%d)
    mkdir -p "$folder"
    mv "$file" "$folder/"
  fi
done
```

---

## ⚠️ 5. **Safety First — Add Dry-Run Mode**

To prevent accidents, always test scripts with a dry-run mode before executing them.

```bash
dry_run=true

for file in *.txt
do
  newname="renamed_$file"
  if $dry_run; then
    echo "[DRY RUN] mv $file $newname"
  else
    mv "$file" "$newname"
  fi
done
```

---

## 🧰 Tools and Commands You’ll Use

| Command  | Use                               |
| -------- | --------------------------------- |
| `mv`     | Rename/move files                 |
| `cp`     | Copy files                        |
| `rm`     | Delete files                      |
| `mkdir`  | Create folders                    |
| `date`   | Generate timestamps               |
| `case`   | Conditional branching             |
| `shopt`  | Enable safe globbing (`nullglob`) |
| `printf` | Format numbers (e.g., 001, 002)   |

---

## ✅ Summary

Automating file tasks in Bash saves time, reduces errors, and scales better than doing things manually. Here's a quick cheat-sheet:

| Task       | Pattern / Tool                               |
| ---------- | -------------------------------------------- |
| Rename     | `for file in *; do mv "$file" newname; done` |
| Clean up   | `rm *.tmp *.log`                             |
| Backup     | `cp file file.bak` or `cp file backup/`      |
| Categorize | `case` with `mv`                             |
| Dry run    | `if $dry_run; then echo; else do; fi`        |

---
