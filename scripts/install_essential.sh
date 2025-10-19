#!/bin/bash
# Interactive installer for essential tools

set -e

echo "=== Installing Essential Tools ==="
echo ""

# Starship prompt
if command -v starship >/dev/null 2>&1; then
  echo "✓ Starship already installed"
else
  read -p "Install starship prompt? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    curl -sS https://starship.rs/install.sh | sh
  fi
fi

# Antidote (zsh plugin manager)
if [ -d "${ZDOTDIR:-~}/.antidote" ]; then
  echo "✓ Antidote already installed"
else
  read -p "Install antidote (zsh plugin manager)? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/mattmc3/antidote.git "${ZDOTDIR:-~}/.antidote"
  fi
fi

# TPM (tmux plugin manager)
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "✓ TPM already installed"
else
  read -p "Install TPM (tmux plugin manager)? (y/n) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo "Note: Start tmux and press 'Ctrl+a I' to install plugins"
  fi
fi

echo ""
echo "✓ Installation complete!"
echo "Restart your shell or run: source ~/.zshrc"
