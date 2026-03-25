#!/bin/bash

# --- Modern CLI Tools Installer ---
# This script installs fzf, eza, zoxide, lazygit, bat, ripgrep, fd, delta, dust, and tldr on Ubuntu/Debian.

set -e

# Function to backup existing files
backup_if_exists() {
    local file=$1
    if [ -e "$file" ]; then
        local backup="${file}.bak.$(date +%Y%m%d-%H%M%S)"
        echo "⚠️  Existing $file found. Backing up to $backup"
        mv "$file" "$backup"
    fi
}

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

# 6. Install bat (Modern cat)
if ! command -v bat >/dev/null 2>&1; then
    echo "📦 Installing bat..."
    sudo apt install -y bat
    # Ubuntu installs it as 'batcat', create a symlink to 'bat'
    mkdir -p ~/.local/bin
    ln -sf /usr/bin/batcat ~/.local/bin/bat
else
    echo "✅ bat is already installed."
fi

# 7. Install ripgrep (Modern grep)
if ! command -v rg >/dev/null 2>&1; then
    echo "📦 Installing ripgrep..."
    sudo apt install -y ripgrep
else
    echo "✅ ripgrep is already installed."
fi

# 8. Install fd-find (Modern find)
if ! command -v fd >/dev/null 2>&1; then
    echo "📦 Installing fd-find..."
    sudo apt install -y fd-find
    # Ubuntu installs it as 'fdfind', create a symlink to 'fd'
    mkdir -p ~/.local/bin
    ln -sf /usr/bin/fdfind ~/.local/bin/fd
else
    echo "✅ fd is already installed."
fi

# 9. Install delta (Modern git diff)
if ! command -v delta >/dev/null 2>&1; then
    echo "📦 Installing delta..."
    DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
    curl -Lo delta.deb "https://github.com/dandavison/delta/releases/latest/download/git-delta_${DELTA_VERSION}_amd64.deb"
    sudo dpkg -i delta.deb
    rm delta.deb
else
    echo "✅ delta is already installed."
fi

# 10. Install dust (Modern du)
if ! command -v dust >/dev/null 2>&1; then
    echo "📦 Installing dust..."
    DUST_VERSION=$(curl -s "https://api.github.com/repos/bootandy/dust/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
    curl -Lo dust.tar.gz "https://github.com/bootandy/dust/releases/download/${DUST_VERSION}/dust-${DUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
    tar xf dust.tar.gz
    sudo install -m 755 "dust-${DUST_VERSION}-x86_64-unknown-linux-gnu/dust" /usr/local/bin/dust
    rm -rf dust.tar.gz "dust-${DUST_VERSION}-x86_64-unknown-linux-gnu"
else
    echo "✅ dust is already installed."
fi

# 11. Install tldr (Modern man)
if ! command -v tldr >/dev/null 2>&1; then
    echo "📦 Installing tldr..."
    sudo apt install -y tldr || pip3 install tldr
else
    echo "✅ tldr is already installed."
fi

# 12. Install JetBrainsMono Nerd Font (Optional but recommended)
if [ ! -d "$HOME/.local/share/fonts/JetBrainsMonoNerd" ]; then
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
fi

echo "✨ All tools installed successfully!"
echo "👉 Please run 'source ~/.zshrc' to activate changes."
