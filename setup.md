# Setup Guide

Welcome! This guide will help you get ready for the Bash Scripting course, no matter which operating system you use. Follow the instructions for your platform below.

---

## 1. Windows Users

### Option A: Windows Subsystem for Linux (WSL)

**Recommended for the full Linux experience.**

1. **Enable WSL:**
   - Open PowerShell as Administrator and run:
     ```powershell
     wsl --install
     ```
   - Restart your computer if prompted.

2. **Install a Linux distribution:**
   - After restart, search for "Microsoft Store" and install Ubuntu (or your preferred distro).
   - Launch Ubuntu and follow the prompts to create a user.

3. **Update the package list:**
   ```bash
   sudo apt update && sudo apt upgrade
   ```

4. **Test Bash:**
   ```bash
   bash --version
   ```
   You should see version info.

### Option B: Git Bash

**Quick and easy for basic Bash scripting (not all Linux commands supported).**

1. [Download Git for Windows](https://gitforwindows.org/) and install it.
2. After installation, right-click anywhere and select **Git Bash Here** to open a Bash terminal.

---

## 2. macOS Users

1. **Open Terminal:**  
   - Find it in Applications > Utilities > Terminal.
2. **Check Bash version:**
   ```bash
   bash --version
   ```
   (macOS comes with Bash pre-installed; version 3.x is common. For newer Bash, consider installing via [Homebrew](https://brew.sh/):  
   `brew install bash`)
3. **You're ready!**

---

## 3. Linux Users

1. **Open your terminal.**
2. **Check Bash version:**
   ```bash
   bash --version
   ```
   (Most Linux distributions come with Bash pre-installed.)
3. **Update your system (optional):**
   ```bash
   sudo apt update && sudo apt upgrade    # For Ubuntu/Debian
   sudo dnf update                        # For Fedora
   sudo pacman -Syu                       # For Arch
   ```

---

## 4. Clone the Course Repository

After setting up your terminal and Bash, download the course materials:

```bash
git clone https://github.com/kc-clintone/programming-101.git
cd programming-101
```

---

## 5. Recommended Code Editors

- [Visual Studio Code](https://code.visualstudio.com/)
- [Sublime Text](https://www.sublimetext.com/)
- [nano](https://www.nano-editor.org/) or [vim](https://www.vim.org/) for terminal editing

---

## 6. Next Steps

- Open the [syllabus.md](syllabus.md) to begin your learning journey!
- Start with the first module and follow along with the lessons.

---

**Questions or issues?**  
Open an issue in the repository or ask for help in Discussions!

Happy scripting!
