# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# if [ "$TMUX" = "" ]; then tmux new \; set-option destroy-unattached; fi
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ys"
# VSCode zsh integration may reference RPROMPT; avoid errors if someone enables `set -u`.
: ${RPROMPT:=}
: ${RPS1:=}
# Don't force TERM; let the terminal/tmux set it.
# Only set a sane default if it's missing.
export TERM="${TERM:-xterm-256color}"

# fzf-history-search: avoid fullscreen/alternate-screen rendering issues in some terminals
# (use a bottom "dropdown" instead of full-screen UI).
export ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS="--height=40% --layout=reverse --border"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9ca0b0,bg=none"

zstyle ':completion:*' list-colors 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting web-search copyfile copypath zsh-history-substring-search extract command-not-found tmux rand-quote zsh-completions zsh-you-should-use autojump git-open colored-man-pages zsh-fzf-history-search vscode zsh-interactive-cd ubuntu zsh-navigation-tools ssh alias-finder)
source $ZSH/oh-my-zsh.sh
source ~/.alias
# export http_proxy=127.0.0.1:8889
# export https_proxy=127.0.0.1:8889
# export http_proxy=127.0.0.1:7899
# export https_proxy=127.0.0.1:7899

source ~/.zsh/catppuccin_latte-zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
source ~/.alias
source ~/.zfunctions

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{238}on%f %F{18}git:%F{24}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{124}x%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{28}o%f"

PROMPT=$'%B%F{18}#%f%b %B%F{23}%n%f%b@%B%F{22}%m%f%b %F{238}in%f %B%F{17}%~%f%b$(git_prompt_info) [%*] %(?,,%F{124}C:%?%f)\n%B%F{124}$%f%b '

export ZSH_COLORIZE_TOOL=github
export ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
unset FZF_DEFAULT_OPTS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf: force light theme (even if something sets FZF_DEFAULT_OPTS_FILE)
unset FZF_DEFAULT_OPTS_FILE
export FZF_DEFAULT_OPTS="--color=light \
--color=bg:255,bg+:252,fg:238,fg+:236 \
--color=hl:124,hl+:124,header:124,info:61,prompt:61 \
--color=pointer:166,marker:166,spinner:166 \
--no-bold"

# Some zsh fzf integrations (Ctrl-R / Ctrl-T / Alt-C) use these variables instead
# of FZF_DEFAULT_OPTS. Keep them consistent so the theme doesn't silently revert.
export FZF_CTRL_R_OPTS="$FZF_DEFAULT_OPTS"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_ALT_C_OPTS="$FZF_DEFAULT_OPTS"

# If your terminal actually supports truecolor, this helps some tools detect it.
export COLORTERM="${COLORTERM:-truecolor}"

# Ctrl-R: force fzf-based history UI (light theme via FZF_DEFAULT_OPTS).
# zsh-navigation-tools binds ^R to znt-history-widget, which ignores fzf colors.
fzf_history_light_widget() {
  # Show history with timestamps, but only paste the actual command into the prompt.
  local selected

  # Some terminals (or integrations) can end up with COLUMNS/LINES as 0,
  # which makes fzf's screen rendering go haywire. Self-heal from stty.
  if [[ "${COLUMNS:-0}" -le 0 || "${LINES:-0}" -le 0 ]]; then
    local _stty
    _stty=(${(s: :)$(stty size 2>/dev/null)})
    if [[ ${#_stty} -eq 2 && "${_stty[1]:-0}" -gt 0 && "${_stty[2]:-0}" -gt 0 ]]; then
      export LINES="${_stty[1]}"
      export COLUMNS="${_stty[2]}"
    fi
  fi

  # NOTE: `fc -i` timestamp fields are not guaranteed (depends on history options).
  # So we *strip* "<event> [date time]" before feeding into fzf, otherwise a fixed
  # `--nth=4..` will accidentally drop the beginning of short commands like `build...`.
  selected="$(
    fc -rl -i 1 2>/dev/null \
      | sed -E 's/^[[:space:]]*[0-9]+\\**[[:space:]]+//; s/^[0-9]{4}-[0-9]{2}-[0-9]{2}[[:space:]]+[0-9]{2}:[0-9]{2}(:[0-9]{2})?[[:space:]]+//' \
      | fzf ${=FZF_DEFAULT_OPTS} \
      --height=40% --layout=reverse --border \
      --prompt='history> ' \
      --query "$LBUFFER" \
      --tiebreak=index
  )" || return

  LBUFFER="$selected"
  zle redisplay
}
zle -N fzf_history_light_widget
bindkey '^R' fzf_history_light_widget

# Optional: keep znt history available on another key (uncomment if you want)
# (( $+widgets[znt-history-widget] )) && bindkey '^G' znt-history-widget



if command -v neofetch >/dev/null 2>&1; then
    neofetch
else
    echo "neofetch is not installed. Please install it first."
fi

echo -e "\033[34m$(cat ~/ii_art.txt)\033[0m"

reload_vscode_ipc() {
    export VSCODE_IPC_HOOK_CLI=$(ls -tr /run/user/$(id -u)/vscode-ipc-* 2>/dev/null | tail -n 1)
}
reload_vscode_ipc