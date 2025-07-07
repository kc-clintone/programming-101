# 📄 Reading Files Line-by-Line in Bash

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Use `while read` loops to process files one line at a time.
* Handle spaces, tabs, empty lines, and special characters safely.
* Split CSV or delimited files into variables.
* Avoid common mistakes when reading files in Bash.

---

## 🔧 Basic Syntax

```bash
while read line
do
  echo "$line"
done < file.txt
```

✅ Reads the file **line-by-line**, stores each line in the `line` variable.

---

## ⚠️ Safer Version (Recommended)

```bash
while IFS= read -r line
do
  echo "$line"
done < file.txt
```

### Why this is better:

| Option | Purpose                                                 |
| ------ | ------------------------------------------------------- |
| `IFS=` | Prevents trimming leading/trailing whitespace           |
| `-r`   | Tells `read` not to interpret backslashes (no escaping) |

---

## 🧪 Example: Print All Lines in a Text File

**file.txt**

```
Alice
Bob
Charlie
```

**Script:**

```bash
while IFS= read -r line
do
  echo "User: $line"
done < file.txt
```

**Output:**

```
User: Alice
User: Bob
User: Charlie
```

---

## 📊 Example: Process CSV Data

**users.csv**

```
John,28,Engineer
Sarah,34,Designer
Mike,22,Student
```

**Script:**

```bash
while IFS=',' read -r name age profession
do
  echo "$name is a $age-year-old $profession."
done < users.csv
```

**Output:**

```
John is a 28-year-old Engineer.
Sarah is a 34-year-old Designer.
Mike is a 22-year-old Student.
```

- ✅ Works perfectly for **simple, clean CSVs**
- ✅ You can adjust `IFS=','` for other delimiters (e.g., tabs, pipes)

---

## 🧼 Best Practices

| Tip                             | Reason                                         |
| ------------------------------- | ---------------------------------------------- |
| Use `IFS=` and `-r`             | Avoids whitespace trimming and escaping issues |
| Always quote `"$line"`          | Handles spaces, special characters safely      |
| Avoid `for line in $(cat file)` | Breaks on spaces and newlines!                 |
| Validate the file exists first  | Prevents script crashes                        |

---

## 🧰 Real-World Use Case: Cleanup Script

**filenames.txt**

```
old_backup1.tar.gz
old_backup2.tar.gz
old_backup3.tar.gz
```

**Script:**

```bash
while IFS= read -r file
do
  if [ -f "$file" ]; then
    echo "Deleting $file"
    rm "$file"
  else
    echo "File not found: $file"
  fi
done < filenames.txt
```

- ✅ Checks if each file exists before deleting
- ✅ Good for automation and cron jobs

---

## 🧠 Pro Tip: You Can Use Process Substitution

This avoids `< file` and works well in functions:

```bash
while IFS= read -r line
do
  echo "Line: $line"
done < <(grep "error" logfile.txt)
```

> `< <(command)` feeds the output of the command directly into the loop.

---

## ⚠️ Common Pitfalls

| Mistake                                  | What Happens            | Fix                      |
| ---------------------------------------- | ----------------------- | ------------------------ |
| `read line` without `-r`                 | Backslashes get lost    | Add `-r`                 |
| `IFS= read -r` but don’t quote variables | Lines with spaces break | Always quote `"$line"`   |
| Using `for line in $(cat file)`          | Breaks on spaces/tabs   | Use `while read` instead |

---

## 🧠 Summary Table

| Pattern                                | Use Case             |
| -------------------------------------- | -------------------- |
| `while read line; do ...; done < file` | Basic reading        |
| `IFS= read -r line`                    | Safe line handling   |
| `IFS=',' read -r col1 col2`            | CSV parsing          |
| `done < <(command)`                    | Process substitution |

---
