# 🌟 Globbing in Bash (`*`, `?`, `[]`)

## 🧠 Learning Objectives

By the end of this lesson, learners will:

* Understand what globbing is and how it differs from regular expressions.
* Use wildcard patterns (`*`, `?`, `[]`) to match files and strings.
* Avoid dangerous patterns that can affect the wrong files.
* Apply globbing in real-world use cases like loops, cleanup scripts, and automation.

---

## 🔍 What Is Globbing?

**Globbing** is pattern matching used by the **shell** (like Bash) to match **filenames and paths**.

> Globbing is **not** the same as regex (regular expressions).

| Feature           | Globbing                    | Regex                              |
| ----------------- | --------------------------- | ---------------------------------- |
| Used for          | File matching               | Text matching                      |
| Who interprets it | The shell (Bash)            | Programs like `grep`, `sed`, `awk` |
| Syntax            | Simpler (`*`, `?`, `[abc]`) | More powerful and complex          |

---

## 🔧 Globbing Patterns

### `*` (asterisk)

Matches **zero or more characters** (except `/`)

```bash
ls *.txt        # All .txt files
ls *file*       # All files that contain "file"
```

### `?` (question mark)

Matches **exactly one character**

```bash
ls file?.txt    # Matches file1.txt, fileA.txt, but not file10.txt
```

### `[]` (character class)

Matches **any single character inside the brackets**

```bash
ls file[123].txt    # Matches file1.txt, file2.txt, file3.txt
ls report[AB].pdf   # Matches reportA.pdf or reportB.pdf
```

You can also use ranges:

```bash
ls file[a-z].txt    # a to z
ls file[0-9].log    # 0 to 9
```

---

## 🔒 Safe Patterns and Practices

### 1. Always quote variables when using globbing

```bash
for file in *.txt; do
  echo "$file"
done
```

✅ Correct – prevents issues with spaces or weird filenames.

```bash
for file in *.txt; do
  rm "$file"
done
```

### 2. Use `set -u` and `set -o nounset` to avoid undefined variables.

### 3. Use `nullglob` to avoid unintended behavior

If no files match, `*.txt` will expand to `*.txt` **(the literal string)** — potentially dangerous in scripts like:

```bash
rm *.txt   # If no .txt files exist, this could delete *.txt
```

To avoid this, use:

```bash
shopt -s nullglob
```

✅ Now `*.txt` will expand to nothing if no match is found.

---

## 🧪 Examples

### Match all shell scripts:

```bash
ls *.sh
```

### Find all files starting with `data`:

```bash
ls data*
```

### Match files like `log1.txt`, `log2.txt`, ..., `log9.txt`

```bash
ls log[1-9].txt
```

### Match a specific number of characters:

```bash
ls file??.txt    # Matches file01.txt, file99.txt (2 chars after "file")
```

---

## 🚫 What Globbing Can’t Do

Globbing:

* Can’t match repeating patterns (like `a+`)
* Can’t do lookaheads/lookbehinds
* Can’t match start/end of line with `^` or `$`

For those, you need **regex** with `grep`, `sed`, `awk`, etc.

---

## 🧰 Real-World Example: Clean Up Old Files

```bash
#!/bin/bash

# Clean up all .bak and .tmp files in current directory
shopt -s nullglob  # Avoids expanding to literal patterns if nothing matches

for file in *.bak *.tmp
do
  echo "Deleting $file"
  rm "$file"
done
```

- ✅ Safe from accidental deletion if no matches
- ✅ Works across multiple extensions

---

## ⚠️ Common Pitfalls

| Mistake                         | Problem                          | Fix                         |
| ------------------------------- | -------------------------------- | --------------------------- |
| Using unquoted variables        | Breaks on filenames with spaces  | Always quote: `"$file"`     |
| Assuming `*.ext` is always safe | Expands to `*.ext` if no matches | Use `shopt -s nullglob`     |
| Confusing regex with glob       | Wrong pattern syntax             | Use glob for filenames only |

---

## 🧠 Summary Table

| Pattern | Meaning                 | Example Match                             |
| ------- | ----------------------- | ----------------------------------------- |
| `*`     | Zero or more characters | `*.txt` → `note.txt`, `hello.txt`         |
| `?`     | Exactly one character   | `file?.sh` → `file1.sh`                   |
| `[abc]` | Any one of listed chars | `log[12].txt` → `log1.txt`, `log2.txt`    |
| `[a-z]` | Character range         | `file[a-f].md` → `filea.md` to `filef.md` |

---
