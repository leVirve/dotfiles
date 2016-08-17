# oh-my-zsh path
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="agnoster-salas"

# oh-my-zsh plugins
plugins=(git zsh-completions docker docker-compose)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
export PATH="/home/salas/miniconda3/bin:$PATH"

alias py="python"
alias gs="git status"

