#!/bin/bash

# Tmux Deployment Script
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

echo "🚀 Deploying Tmux configuration..."

backup_if_exists ~/.tmux.conf
backup_if_exists ~/.tmux.conf.local

cp .tmux.conf ~/.tmux.conf
cp .tmux.conf.local ~/.tmux.conf.local

if command -v tmux >/dev/null 2>&1; then
    tmux source-file ~/.tmux.conf
    echo "✅ Tmux configuration reloaded."
fi

echo "✨ Tmux deployment complete."
