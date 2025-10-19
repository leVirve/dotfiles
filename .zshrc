. "$HOME/.local/bin/env"

[ -f ~/.aliases ] && source ~/.aliases

autoload -Uz compinit && compinit

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

command -v fzf >/dev/null && source <(fzf --zsh)
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v direnv >/dev/null && eval "$(direnv hook zsh)"
command -v starship >/dev/null && eval "$(starship init zsh)"
