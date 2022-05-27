if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  command sh -c "$(curl -fsSL https://git.io/get-zi)" --
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z-shell.pages.dev/docs/gallery/collection
zicompinit # <- https://z-shell.pages.dev/docs/gallery/collection#minimal

# common
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-history-substring-search
zi light zdharma/fast-syntax-highlighting
zi light z-shell/z-a-bin-gem-node

# oh my zsh functions
zi snippet OMZ::lib/completion.zsh
zi snippet OMZ::lib/history.zsh
zi snippet OMZ::lib/key-bindings.zsh
zi snippet OMZ::lib/theme-and-appearance.zsh
zi snippet OMZP::common-aliases/common-aliases.plugin.zsh

# key binding
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey ',' autosuggest-accept

# p10k theme
zi ice depth'1' atload"[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" nocd
zi light romkatv/powerlevel10k

# packages
zi pack"bgn" for pyenv
zi lucid as'command' pick"bin/*" atinit'export PYENV_ROOT="$PWD"' \
    atclone'PYENV_ROOT="$PWD" ./bin/pyenv-virtualenv-init - > zpyenvvirtualenv.zsh' \
    atpull"%atclone" src"zpyenvvirtualenv.zsh" nocompile'!' for \
    pyenv/pyenv-virtualenv

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
