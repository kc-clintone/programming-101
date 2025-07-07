# 🧠 Structuring Larger Bash Scripts with Modular Functions

---

## 📦 Why Modularize?

| ✅ Good Practice           | 🚫 Bad Practice            |
| ------------------------- | -------------------------- |
| Reuse common functions    | Rewriting the same logic   |
| Easier to test/debug      | Huge, unreadable scripts   |
| Clean separation of logic | Everything mashed together |

---

## 🧱 1. Structure Overview

Here’s a typical layout for a larger Bash script project:

```
my-script/
├── main.sh            # main entry point
├── utils.sh           # general helper functions
├── logging.sh         # all log-related functions
├── config.sh          # environment variables & paths
└── README.md
```

---

## 🧑‍💻 2. Defining Modular Function Files

### 📄 `logging.sh`

```bash
log() {
  local level=${1:-INFO}
  local message=${2:-"No message provided"}
  echo "[$(date '+%F %T')] [$level] $message"
}
```

### 📄 `utils.sh`

```bash
backup_file() {
  local file=$1
  local dest_dir=$2

  if [[ -f "$file" ]]; then
    cp "$file" "$dest_dir"
    log "INFO" "Backed up $file to $dest_dir"
  else
    log "ERROR" "File $file not found"
  fi
}
```

> 🧠 These files contain **only functions** — no code that runs on its own.

---

## 🔌 3. Using `source` or `.` to Include Files

In your `main.sh`, you load other scripts like this:

```bash
#!/bin/bash

# Load modules
source ./logging.sh
source ./utils.sh

# Or the equivalent:
# . ./logging.sh
# . ./utils.sh

# Use the functions
log "INFO" "Script starting..."
backup_file "data.txt" "backups/"
```

✅ Once sourced, all functions become available in the current script.

---

## 💡 Tip: Always check if the file exists before sourcing

```bash
[ -f "./utils.sh" ] && source "./utils.sh"
```

---

## 🧪 4. Real Example: A Backup Tool

### 📁 File: `main.sh`

```bash
#!/bin/bash

source config.sh
source logging.sh
source utils.sh

log "INFO" "Backup started"
backup_file "$TARGET_FILE" "$BACKUP_DIR"
log "INFO" "Backup finished"
```

### 📁 File: `config.sh`

```bash
#!/bin/bash

# Centralized variables
TARGET_FILE="important.txt"
BACKUP_DIR="./backups"
```

---

## 🧼 Best Practices for Modular Bash Projects

| Tip                                | Why it helps                    |
| ---------------------------------- | ------------------------------- |
| Use `source` to reuse functions    | Clean, avoids duplication       |
| Keep files focused by topic        | Easier to navigate & maintain   |
| Avoid global variables if possible | Reduce unexpected side effects  |
| Separate config from logic         | Makes your script more portable |
| Use consistent naming conventions  | e.g. `log_`, `util_`, `backup_` |

---

## 🔒 Bonus: Prevent Functions from Running on Import

If you include code at the bottom of a function file, **wrap it in a check**:

```bash
# Only run this block if the file is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "This file is meant to be sourced, not executed."
  exit 1
fi
```

---

## 🧠 Summary Table

| Concept                 | Example                                     |
| ----------------------- | ------------------------------------------- |
| Source a file           | `source ./file.sh` or `. ./file.sh`         |
| Function file           | `backup_file() { ... }`                     |
| Main runner             | `main.sh` calls `source` and uses functions |
| Check execution context | `[[ ${BASH_SOURCE[0]} == $0 ]]`             |

---
