#!/bin/bash

# --- Modern CLI Tools Installer ---
# This script installs fzf, eza, zoxide, and lazygit on Ubuntu/Debian.

set -e

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
fi

if [[ "$OS" != "ubuntu" && "$OS" != "debian" ]]; then
    echo "Error: This script is only for Ubuntu/Debian."
    exit 1
fi

echo "🚀 Starting installation of modern CLI tools..."

# 1. Update package list
sudo apt update
sudo apt install -y gpg wget curl unzip

# 2. Install fzf (using the existing install-fzf.sh if available)
if [ -f "$(dirname "$0")/fzf/install-fzf.sh" ]; then
    echo "📦 Installing fzf..."
    bash "$(dirname "$0")/fzf/install-fzf.sh"
elif ! command -v fzf >/dev/null 2>&1; then
    echo "📦 Installing fzf via apt..."
    sudo apt install -y fzf
fi

# 3. Install eza (Modern ls)
if ! command -v eza >/dev/null 2>&1; then
    echo "📦 Installing eza..."
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
else
    echo "✅ eza is already installed."
fi

# 4. Install zoxide (Smart cd)
if ! command -v zoxide >/dev/null 2>&1; then
    echo "📦 Installing zoxide..."
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    # Add to path if not already there
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        export PATH="$HOME/.local/bin:$PATH"
    fi
else
    echo "✅ zoxide is already installed."
fi

# 5. Install lazygit (Git TUI)
if ! command -v lazygit >/dev/null 2>&1; then
    echo "📦 Installing lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit.tar.gz lazygit
else
    echo "✅ lazygit is already installed."
fi

# 6. Install JetBrainsMono Nerd Font (Optional but recommended)
echo "❓ Do you want to install JetBrainsMono Nerd Font for better icons? (y/n)"
read -r install_font
if [[ "$install_font" =~ ^[Yy]$ ]]; then
    echo "📦 Installing JetBrainsMono Nerd Font..."
    mkdir -p ~/.local/share/fonts
    wget -O /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip -o /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMonoNerd
    fc-cache -fv
    rm /tmp/JetBrainsMono.zip
    echo "✅ Font installed! Please set your terminal font to 'JetBrainsMono Nerd Font'."
fi

echo "✨ All tools installed successfully!"
echo "👉 Please run 'source ~/.zshrc' to activate changes."
