# oh-my-zsh path
export ZSH=/home/salas/.oh-my-zsh

ZSH_THEME="agnoster-salas"

plugins=(git zsh-completions docker docker-compose)

autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

export PATH="/home/salas/miniconda3/bin:$PATH"

alias py="python"

