#!/usr/bin/env bash
set -e

# ================================
# Dotfiles Installer
# ================================

DOTFILES="$HOME/Documents/dotfiles"
OS="$(uname -s)"
IS_WSL=false

# Detect WSL
if grep -qi microsoft /proc/version 2>/dev/null; then
    IS_WSL=true
fi

echo "Installing dotfiles for $OS (WSL: $IS_WSL)"

# ----------------
# Symlink Zsh
# ----------------
echo "Linking Zsh..."
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

# ----------------
# Symlink Tmux
# ----------------
echo "Linking Tmux..."
ln -sf "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# ----------------
# Symlink Git
# ----------------
echo "Linking Git..."
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

# ----------------
# Symlink Ghostty (macOS only)
# ----------------
if [[ "$OS" == "Darwin" ]]; then
    echo "Linking Ghostty..."
    GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
    mkdir -p "$GHOSTTY_DIR"
    ln -sf "$DOTFILES/ghostty/config" "$GHOSTTY_DIR/config"
fi

# ----------------
# Optional: Symlink other configs
# ----------------
# echo "Linking Powerlevel10k..."
# ln -sf "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
# echo "Linking Vim..."
# ln -sf "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"

# ----------------
# Optional: Install tools / plugins
# ----------------
# echo "Installing Oh-My-Zsh..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# echo "Installing Tmux plugins..."
# ~/.tmux/plugins/tpm/bin/install_plugins

echo "✅ Dotfiles installed successfully!"

