#!/usr/bin/env bash
set -euo pipefail

# Deploy this Neovim config to ~/.config/nvim
# Usage:
#   ./deploynvim.sh            # link + Lazy sync (best effort)
#   ./deploynvim.sh --no-sync  # only link files
#   ./deploynvim.sh --no-packages  # skip package install even if sudo exists

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.config/nvim"

NO_SYNC=0
NO_PACKAGES=0

for arg in "$@"; do
  case "$arg" in
    --no-sync) NO_SYNC=1 ;;
    --no-packages) NO_PACKAGES=1 ;;
    *)
      echo "Unknown arg: $arg" >&2
      exit 2
      ;;
  esac
done

need_cmd() { command -v "$1" >/dev/null 2>&1; }

install_packages_apt() {
  sudo apt-get update -y
  sudo apt-get install -y \
    git curl unzip ripgrep \
    nodejs npm \
    python3 python3-pip \
    build-essential
}

install_packages_dnf() {
  sudo dnf install -y \
    git curl unzip ripgrep \
    nodejs npm \
    python3 python3-pip \
    make gcc gcc-c++ glibc-devel
}

install_packages_pacman() {
  sudo pacman -Sy --noconfirm \
    git curl unzip ripgrep \
    nodejs npm \
    python python-pip \
    base-devel
}

maybe_install_packages() {
  if [[ "$NO_PACKAGES" -eq 1 ]]; then
    return 0
  fi

  if need_cmd nvim && need_cmd git && need_cmd curl; then
    return 0
  fi

  if ! need_cmd sudo; then
    echo "[nvim] sudo not found; skipping package install." >&2
    echo "[nvim] Please install at least: neovim git curl unzip ripgrep nodejs npm" >&2
    return 0
  fi

  if need_cmd apt-get; then
    install_packages_apt
  elif need_cmd dnf; then
    install_packages_dnf
  elif need_cmd pacman; then
    install_packages_pacman
  else
    echo "[nvim] No supported package manager found; skipping package install." >&2
    echo "[nvim] Please install at least: neovim git curl unzip ripgrep nodejs npm" >&2
  fi
}

link_config() {
  mkdir -p "$(dirname -- "$TARGET_DIR")"

  if [[ -e "$TARGET_DIR" && ! -L "$TARGET_DIR" ]]; then
    local backup="${TARGET_DIR}.bak.$(date +%Y%m%d-%H%M%S)"
    echo "[nvim] Backing up existing $TARGET_DIR -> $backup"
    mv "$TARGET_DIR" "$backup"
  fi

  ln -sfn "$SCRIPT_DIR" "$TARGET_DIR"
  echo "[nvim] Linked $TARGET_DIR -> $SCRIPT_DIR"
}

sync_plugins() {
  if [[ "$NO_SYNC" -eq 1 ]]; then
    return 0
  fi
  if ! need_cmd nvim; then
    echo "[nvim] nvim not found; skipping Lazy sync." >&2
    return 0
  fi

  echo "[nvim] Running Lazy sync (headless)…"
  nvim --headless "+Lazy sync" "+qa" || true

  # Optional: if you want to install LSP servers in headless mode:
  # (mason.nvim is configured to load for MasonInstall too)
  echo "[nvim] Installing default LSP servers (headless)…"
  nvim --headless "+MasonInstall lua-language-server pyright bash-language-server" "+qa" || true

  echo "[nvim] Updating treesitter parsers (headless)…"
  nvim --headless "+TSUpdateSync" "+qa" || true
}

main() {
  maybe_install_packages
  link_config
  sync_plugins
  echo "[nvim] Done."
}

main

