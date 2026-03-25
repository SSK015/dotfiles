#!/bin/bash

# SSH Config Deployment Script
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

echo "🚀 Deploying SSH configuration..."

mkdir -p ~/.ssh
backup_if_exists ~/.ssh/config

cp -r .ssh/* ~/.ssh/
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config 2>/dev/null || true

echo "✨ SSH configuration deployed."
