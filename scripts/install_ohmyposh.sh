#!/bin/bash

if [[ ! -f $HOME/bin/oh-my-posh ]]; then
    echo -e "\033[0;32m▓▒░\033[0m Installing \033[0;32moh-my-posh\033[0m…"
    command mkdir -p "$HOME/bin/"
    command wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O ./bin/oh-my-posh &&
        echo -e "\033[0;32m▓▒░\033[0m Download successful." ||
        echo -e "\033[0;31m▓▒░\033[0m Download has failed."
    command chmod +x "$HOME/bin/oh-my-posh"
    echo -e "\033[0;32m▓▒░\033[0m Installation successful."
fi

if [[ ! -d $HOME/.poshthemes ]]; then
    echo -e "\033[0;32m▓▒░\033[0m Installing \033[0;32moh-my-posh themes\033[0m…"
    command mkdir -p "$HOME/.poshthemes"
    command wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip &&
        echo -e "\033[0;32m▓▒░\033[0m Download successful." ||
        echo -e "\033[0;31m▓▒░\033[0m Download has failed."
    command unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
    command chmod u+rw ~/.poshthemes/*.json
    command rm ~/.poshthemes/themes.zip
    echo -e "\033[0;32m▓▒░\033[0m Installation successful."
fi
