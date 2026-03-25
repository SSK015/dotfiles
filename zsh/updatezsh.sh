#!/bin/bash

# Zsh Update Script
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

echo "🚀 Updating Zsh configuration..."

backup_if_exists ~/.zshrc
backup_if_exists ~/.alias
backup_if_exists ~/.zfunctions

cp .zshrc ~/.zshrc
cp .alias ~/.alias
cp .zfunctions ~/.zfunctions

echo "✨ Zsh configuration updated. Please run 'source ~/.zshrc'"
