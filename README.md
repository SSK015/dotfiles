# 🚀 Modern Dotfiles: The Ultimate CLI Workflow

[![Shell](https://img.shields.io/badge/Shell-Zsh-orange.svg)](https://www.zsh.org/)
[![OS](https://img.shields.io/badge/OS-Ubuntu%20%7C%20Debian-blue.svg)](https://ubuntu.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Search](https://img.shields.io/badge/Search-fzf-red.svg)](https://github.com/junegunn/fzf)

Transform your terminal into a high-performance, AI-powered development environment. This setup focuses on speed, discoverability, and modern aesthetics.

---

## 🌟 Key Features

- **⚡ Blazing Fast Navigation**: Deeply integrated `fzf` for files, directories, and command history.
- **🤖 AI-Powered Assistant**: Built-in `ask` command to generate shell instructions using LLMs.
- **🛠️ Modern Toolchain**: Replaces legacy commands with high-performance alternatives (`eza`, `bat`, `zoxide`, `ripgrep`, etc.).
- **🎨 Visual Excellence**: Full support for Nerd Font icons, syntax highlighting, and Git status integration.
- **📦 One-Click Setup**: Automated installation script for Ubuntu/Debian systems.

---

## 📸 Showcasing the Workflow

### 1. Instant File & Directory Search
Stop typing long paths. Use `ff` to find files and `fcd` to jump into directories with instant previews.
> *[Insert GIF of ff/fcd here]*

### 2. A Better `ls` and `cat`
Experience beautiful directory listings with `eza` and code viewing with `bat`.
> *[Insert GIF of eza/bat here]*

### 3. AI at Your Fingertips
Need to remember a complex command? Just `ask`.
> *[Insert GIF of ask command here]*

### 4. Git on Steroids
Manage your repository with `lazygit` or browse history with `fshow`.
> *[Insert GIF of lazygit here]*

---

## 🛠️ Essential Commands

| Command | Description | Tool |
| :--- | :--- | :--- |
| `ff` | Fuzzy find and open files (VSCode/Vim) | `fzf` + `fd` |
| `fcd` | Fuzzy find and change directory | `fzf` + `fd` |
| `z <dir>` | Smart directory jumping (autolearn) | `zoxide` |
| `ask <msg>`| Natural language to shell command | `LLM` |
| `lg` | Full-featured Git Terminal UI | `lazygit` |
| `lt` | Tree view of directories (2 levels) | `eza` |
| `cat` | Syntax highlighted file viewing | `bat` |

---

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/SSK015/dotfiles.git ~/tools/dotfiles
```

### 2. Install Modern Tools (Ubuntu/Debian)
This script handles `fzf`, `eza`, `zoxide`, `lazygit`, `bat`, `ripgrep`, and more.
```bash
cd ~/tools/dotfiles/tools
./install_tools.sh
```

### 3. Deploy Zsh Configuration
```bash
cd ~/tools/dotfiles/zsh
./setupzsh.sh
source ~/.zshrc
```

---

## 🎨 Prerequisites
To see the icons correctly, you **must** use a [Nerd Font](https://www.nerdfonts.com/).
- **Recommended**: `JetBrainsMono Nerd Font`
- **Installation**: Included as an option in `install_tools.sh`.

---

## 🤝 Contributing
Feel free to fork this repo and submit PRs for any cool new tools or fzf functions!

---
*Crafted with ❤️ by xiayanwen*
