# Final Bash Project – Plan, Build, Level Up 🚀

---

## ✅ 3 Bash Project Ideas for Beginners

### 📁 1. Folder Backup Tool

> A script that creates timestamped backups of important folders or files.

**Key Features:**

* Takes source and destination as arguments
* Creates archive (`.tar.gz`) with date in name
* Logs the backup and handles errors
* Optional flags like `--dry-run` or `--verbose`

---

### ✅ 2. Terminal To-Do List Manager

> A simple interactive CLI tool to manage tasks stored in a `.txt` file.

**Key Features:**

* Add, remove, list, and complete tasks
* Stores tasks in a file using a consistent format
* Offers a menu UI (`case` statement + loop)
* Uses `read`, `grep`, `sed`, `awk`, etc.

---

### ✅ 3. System Health Checker

> A diagnostics tool that checks disk usage, memory, uptime, CPU load, and logs everything.

**Key Features:**

* Gathers info from commands like `df`, `free`, `uptime`, `top`
* Generates a simple report (`health-YYYY-MM-DD.txt`)
* Optional alerts (e.g., if disk > 80%)
* Good use of conditionals, functions, formatting

---

Let’s build **Project 1: Folder Backup Tool** from scratch.

---

# 🛠 Project: Folder Backup Tool (`backup.sh`)

---

## 📦 1. Project Goals

Build a script that:

* Backs up a directory to a target location
* Names backup with a timestamp
* Creates `.tar.gz` archives
* Handles errors gracefully
* Uses functions and logging

---

## 🧱 2. Project Structure

```
backup.sh
logs/
├── backup.log
backups/
```

---

## 🧩 3. Features & Requirements

| Feature             | Tools/Concepts Needed       |
| ------------------- | --------------------------- |
| Timestamped backups | `date`, variables           |
| Compression         | `tar`, `gzip`               |
| Command-line args   | `$1`, `$2`, `${1:-default}` |
| Logging             | Functions, `>>` redirection |
| Error handling      | `set -e`, `trap`, `exit`    |
| Usage message       | `--help`, `echo`            |

---

## 🔨 4. Step-by-Step Implementation

### Step 1: Initialize the Script

```bash
#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO"; exit 1' ERR
```

### Step 2: Define Variables

```bash
SOURCE=${1:-}
DEST=${2:-"./backups"}
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
LOG_FILE="./logs/backup.log"
```

### Step 3: Print Usage

```bash
if [[ -z "$SOURCE" ]]; then
  echo "Usage: $0 <source-folder> [destination-folder]"
  exit 1
fi
```

### Step 4: Logging Function

```bash
log() {
  echo "[$(date '+%F %T')] $1" | tee -a "$LOG_FILE"
}
```

### Step 5: Create Backup Directory If Missing

```bash
mkdir -p "$DEST"
mkdir -p "$(dirname "$LOG_FILE")"
```

### Step 6: Run the Backup

```bash
if [[ ! -d "$SOURCE" ]]; then
  log "❌ Source directory does not exist: $SOURCE"
  exit 1
fi

tar -czf "$DEST/$BACKUP_NAME" "$SOURCE"
log "✅ Backup created: $DEST/$BACKUP_NAME"
```

### Full Script: `backup.sh`

```bash
#!/bin/bash
set -euo pipefail
trap 'echo "❌ Error on line $LINENO"; exit 1' ERR

SOURCE=${1:-}
DEST=${2:-"./backups"}
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
LOG_FILE="./logs/backup.log"

log() {
  echo "[$(date '+%F %T')] $1" | tee -a "$LOG_FILE"
}

if [[ -z "$SOURCE" ]]; then
  echo "Usage: $0 <source-folder> [destination-folder]"
  exit 1
fi

mkdir -p "$DEST"
mkdir -p "$(dirname "$LOG_FILE")"

if [[ ! -d "$SOURCE" ]]; then
  log "❌ Source directory does not exist: $SOURCE"
  exit 1
fi

tar -czf "$DEST/$BACKUP_NAME" "$SOURCE"
log "✅ Backup created: $DEST/$BACKUP_NAME"
```

---

## ✅ 5. Run the Script

```bash
chmod +x backup.sh
./backup.sh my-folder /tmp/backups
```

---

## 🧪 6. Bonus Features to Try

* `--dry-run` mode to simulate without executing
* `--help` flag with detailed usage
* Email notification or desktop alert
* Backup rotation: keep only the latest 5 backups

---

## 🧠 What Students Practice in This Project

| Skill                     | Used In                     |
| ------------------------- | --------------------------- |
| Variables & functions     | For modular scripting       |
| Conditionals & `[ ]`      | Input and error checks      |
| Loops (in bonus features) | For cleanup or automation   |
| I/O redirection           | Logging                     |
| Debugging (`set`, `trap`) | Error tracking              |
| Command args              | Customizing script behavior |

---
