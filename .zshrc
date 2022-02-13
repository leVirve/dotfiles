# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z-shell.pages.dev/docs/gallery/collection
zicompinit # <- https://z-shell.pages.dev/docs/gallery/collection#minimal

# ===
# Adapt from https://blog.kyomind.tw/ubuntu-zsh-zinit/
# ===

# common
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-history-substring-search
zi light zdharma/fast-syntax-highlighting

# oh my zsh functions
zi snippet OMZ::lib/completion.zsh
zi snippet OMZ::lib/history.zsh
zi snippet OMZ::lib/key-bindings.zsh
zi snippet OMZ::lib/theme-and-appearance.zsh

# key binding
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey ',' autosuggest-accept

# others
zi load djui/alias-tips
zi ice depth=1; zi light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(pyenv init -)"
