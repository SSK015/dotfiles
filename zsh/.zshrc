# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# if [ "$TMUX" = "" ]; then tmux new \; set-option destroy-unattached; fi
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"
export TERM=xterm-256color

zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting web-search copyfile copypath zsh-history-substring-search extract command-not-found tmux rand-quote zsh-completions zsh-you-should-use autojump git-open colored-man-pages zsh-fzf-history-search vscode zsh-interactive-cd ubuntu zsh-navigation-tools ssh alias-finder)
source $ZSH/oh-my-zsh.sh
# sudo wg-quick up wg0
source ~/.alias
# source /home/luotianyi/.alias
# eval $(thefuck --alias)
# export http_proxy=127.0.0.1:8889
# export https_proxy=127.0.0.1:8889
# export http_proxy=127.0.0.1:7899
# export https_proxy=127.0.0.1:7899

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

export ZSH_COLORIZE_TOOL=chroma
export ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v neofetch >/dev/null 2>&1; then
    neofetch
else
    echo "neofetch is not installed. Please install it first."
fi

echo -e "\033[34m$(cat ~/ascii_art.txt)\033[0m"

reload_vscode_ipc() {
    export VSCODE_IPC_HOOK_CLI=$(ls -tr /run/user/$(id -u)/vscode-ipc-* 2>/dev/null | tail -n 1)
}
reload_vscode_ipc