# Modern Dotfiles (Zsh)

A compact dotfiles setup focused on fast terminal workflows, modern CLI tools, and practical automation.

## Features

- `fzf` workflows: `ff`, `fcd`, `fp`, `fbr`, `fshow`, `fcs`, `fssh`, `fenv`, `falias`
- Modern CLI aliases: `eza`, `zoxide`, `lazygit`, `bat`, `ripgrep`, `dust`
- AI helper: `ask <your question>` generates shell commands from natural language
- Demo mode for screenshots: `demo` / `undemo` hides personal info in prompt and command output
- Installer and deploy scripts include automatic backup of existing local config files

## Quick Deploy (Ubuntu/Debian)

### 1) Clone
```bash
git clone https://github.com/SSK015/dotfiles.git ~/tools/dotfiles
cd ~/tools/dotfiles
```

### 2) Install tools
```bash
bash ./tools/install_tools.sh
```

This installs: `fzf`, `eza`, `zoxide`, `lazygit`, `bat`, `ripgrep`, `fd`, `dust`, `tldr`, and `JetBrainsMono Nerd Font`.

### 3) Install Oh My Zsh (if missing)
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

### 4) Deploy Zsh configs
```bash
cd ~/tools/dotfiles/zsh
bash ./setupzsh.sh
source ~/.zshrc
```

### 5) Optional: set zsh as default shell
```bash
chsh -s "$(which zsh)"
```

## Optional Deploy Scripts

- SSH config: `bash ~/tools/dotfiles/deployssh.sh`
- Tmux config: `bash ~/tools/dotfiles/tmux/deploytmux.sh`
- Neofetch config: `bash ~/tools/dotfiles/neofetch/update_neo_conf.sh`

## Common Commands

| Command | Purpose |
| --- | --- |
| `ff [dir]` | Fuzzy search files and open in editor |
| `fcd [dir]` | Fuzzy jump to directory |
| `lg` | Open `lazygit` |
| `lt` | Tree view (2 levels) |
| `ask "..."` | Get suggested shell command |
| `demo` / `undemo` | Toggle privacy-friendly demo mode |

## Notes

- Use a Nerd Font in your terminal to show icons correctly.
- `setupzsh.sh` and deploy scripts back up existing files automatically with timestamp suffixes.
