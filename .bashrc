# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

setup_ohmyposh() {
  if [[ ! -f $HOME/bin/oh-my-posh ]]; then
    echo -e "\033[0;32m▓▒░\033[0m Installing \033[0;32moh-my-posh\033[0m…"
    command mkdir -p "$HOME/bin/"
    command wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ./bin/oh-my-posh && \
      echo -e "\033[0;32m▓▒░\033[0m Download successful." || \
      echo -e "\033[0;31m▓▒░\033[0m Download has failed."
    command chmod +x "$HOME/bin/oh-my-posh"
    echo -e "\033[0;32m▓▒░\033[0m Installation successful."
  fi

  if [[ ! -d $HOME/.poshthemes ]]; then
    echo -e "\033[0;32m▓▒░\033[0m Installing \033[0;32moh-my-posh themes\033[0m…"
    command mkdir -p "$HOME/.poshthemes"
    command wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip && \
      echo -e "\033[0;32m▓▒░\033[0m Download successful." || \
      echo -e "\033[0;31m▓▒░\033[0m Download has failed."
    command unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
    command chmod u+rw ~/.poshthemes/*.json
    command rm ~/.poshthemes/themes.zip
    echo -e "\033[0;32m▓▒░\033[0m Installation successful."
  fi
}

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -d $HOME/bin/ ] && export PATH="${PATH:+${PATH}:}$HOME/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f $HOME/bin/oh-my-posh ] && eval "$(oh-my-posh init bash --config ~/.poshthemes/amro.omp.json)"