#!/usr/bin/env bash
set -euo pipefail

# Install/upgrade fzf to ~/.local/bin/fzf (no system packages, no rc modifications)
# Requirements: git, curl
#
# Usage:
#   ./install-fzf.sh
#
# Verify:
#   ~/.local/bin/fzf --version

need() {
  command -v "$1" >/dev/null 2>&1 || { echo "Missing dependency: $1" >&2; exit 1; }
}

need git
need curl

mkdir -p "$HOME/.local/bin"

tmp="$(mktemp -d)"
cleanup() { rm -rf "$tmp"; }
trap cleanup EXIT

git clone --depth 1 https://github.com/junegunn/fzf.git "$tmp/fzf" >/dev/null

# Download a matching prebuilt binary into the cloned repo (no shell rc changes)
"$tmp/fzf/install" --bin --no-update-rc --no-key-bindings --no-completion >/dev/null

cp -f "$tmp/fzf/bin/fzf" "$HOME/.local/bin/fzf"

echo "Installed: $HOME/.local/bin/fzf"
"$HOME/.local/bin/fzf" --version

cat <<'EOF'

Tip: ensure ~/.local/bin is before /usr/bin in PATH, then run:
  rehash  # (zsh) refresh command hash after upgrades
EOF

