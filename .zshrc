# oh-my-zsh path
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="agnoster-salas"

# oh-my-zsh plugins
plugins=(git docker z extract zsh-completions zsh-autosuggestions zsh-syntax-highlighting)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# plugin setting
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=111'

# workspace environments
export PATH="/home/salas/miniconda3/bin:$PATH"
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

