[ -d $HOME/.tmux/plugins/tpm ] ||
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

[ -d $HOME/.pyenv ] ||
  curl https://pyenv.run | bash

command -v starship >/dev/null ||
  curl -sS https://starship.rs/install.sh | sh
