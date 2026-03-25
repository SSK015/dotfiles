#!/bin/bash

# Zsh Setup Script
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

echo "🚀 Setting up Zsh configuration..."

# Backup existing configs
backup_if_exists ~/.zshrc
backup_if_exists ~/.alias
backup_if_exists ~/.zfunctions
backup_if_exists ~/ascii_art.txt

# Copy new configs
cp .alias ~/.alias
cp .zshrc ~/.zshrc
cp .zfunctions ~/.zfunctions
cp ascii_art.txt ~

# Setup syntax highlighting themes
mkdir -p ~/.zsh
cp -v catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.zsh/
cp -v catppuccin_latte-zsh-syntax-highlighting.zsh ~/.zsh/

# Install custom plugins if they don't exist
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

install_plugin() {
    local name=$1
    local url=$2
    if [ ! -d "$ZSH_CUSTOM/plugins/$name" ]; then
        echo "📦 Installing plugin: $name"
        git clone "$url" "$ZSH_CUSTOM/plugins/$name"
    else
        echo "✅ Plugin $name is already installed."
    fi
}

install_plugin "zsh-completions" "https://github.com/zsh-users/zsh-completions"
install_plugin "zsh-history-substring-search" "https://github.com/zsh-users/zsh-history-substring-search"
install_plugin "zsh-you-should-use" "https://github.com/MichaelAquilina/zsh-you-should-use.git"
install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
install_plugin "git-open" "https://github.com/paulirish/git-open.git"
install_plugin "zsh-fzf-history-search" "https://github.com/joshskidmore/zsh-fzf-history-search"

# Install other dependencies
echo "📦 Installing other dependencies..."
pip3 install thefuck llm llm-openrouter --user || echo "⚠️  Pip install failed, please check manually."

if ! command -v autojump >/dev/null 2>&1; then
    sudo apt install -y autojump || echo "⚠️  Failed to install autojump."
fi

echo "✨ Zsh setup complete! Please run 'source ~/.zshrc'"
