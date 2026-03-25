#!/bin/bash

# Neofetch Configuration Update Script
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

echo "🚀 Updating Neofetch configuration..."

mkdir -p ~/.config/neofetch
backup_if_exists ~/.config/neofetch/config.conf

cp config.conf ~/.config/neofetch/config.conf

echo "✨ Neofetch configuration updated."
