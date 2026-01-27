# Catppuccin Latte Theme (for zsh-syntax-highlighting)
#
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(brackets main regexp pattern)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#9ca0b0'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#000000,bold,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#870000'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#af0000'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#af0000'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#5f00af'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#000000,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#000000,bold'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#d20f39'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#df8e1d'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#4c4f69'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[path]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#8839ef'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[default]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#4c4f69,none'
ZSH_HIGHLIGHT_STYLES[cursor-at-point]='fg=#4c4f69,none'

typeset -A ZSH_HIGHLIGHT_PATTERNS
# ZSH_HIGHLIGHT_PATTERNS+=('rm -f' 'fg=208,bold')
# ZSH_HIGHLIGHT_PATTERNS+=('rm -r' 'fg=208,bold')
# ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' 'fg=208,bold')
# ZSH_HIGHLIGHT_PATTERNS+=('rm -fr' 'fg=208,bold')

typeset -A ZSH_HIGHLIGHT_REGEXP
ZSH_HIGHLIGHT_REGEXP+=('\<sudo\>' fg=#d20f39,bold)
ZSH_HIGHLIGHT_REGEXP+=('\<rm -rf\>' fg=#d20f39,bold)
ZSH_HIGHLIGHT_REGEXP+=('\<error\>' fg=#d20f39,bold)
