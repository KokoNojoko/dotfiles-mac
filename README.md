dotfiles

This repository contains my **macOS terminal setup** including Zsh, Tmux, Powerlevel10k, Ghostty, and related configurations. It is designed for a **minimal, fast, and highly productive terminal workflow**, with popup windows, Git integration, project tools, and system information on startup.

---

## Features

### Shell

- **Zsh** with `.zshrc` configuration
- **Powerlevel10k** (`.p10k.zsh`) for an aesthetic and informative prompt
- Safe **tmux auto-start** from Zsh
- **Fastfetch** for system information display on shell start
- Vi-mode navigation in shell

### Tmux

- **Popup windows** for:
  - LazyGit
  - LazyDocker
  - LazySQL
- **Vi-style keybindings** for pane navigation
- Mouse support
- Catppuccin Mocha theme
- TPM (Tmux Plugin Manager) integration

### Git

- `.gitconfig` for personal preferences
- `.gitignore` optimized for macOS, caches, and editor files

### Ghostty

- Launches Zsh automatically
- Integrates with tmux and popup workflows

### Optional Tools

- Neovim integration (`nvim` popups)
- File/folder management via tmux popups
- Minimal VS Code–like workflow in terminal

---

## Installation

Clone the repository:

```bash
git clone git@github.com:your-username/dotfiles-mac.git ~/dotfiles
cd ~/dotfiles - depending on what directory you've cloned into

Make the installer executable and run it:
chmod +x install.sh
./install.sh

### What install.sh does

1. Backs up existing dotfiles in ~/dotfiles_backup
2. Creates symlinks from this repository to your home directory:
	.zshrc
	.tmux.conf
	.p10k.zsh
	.Any other tracked dotfiles
3. Installs TPM (Tmux Plugin Manager) if not already installed
4. Prints instructions for the first-time plugin installation

## Post-installation

1. Open Ghostty or any terminal:
	- Zsh loads automatically
	- Tmux auto-starts if not already running
	- Fastfetch displays system information
2. Install Tmux plugins (first run):

# Inside tmux
Ctrl + s I   # Capital I installs all TPM plugins

3. Editing dotfiles
	- Files are tracked in ~/dotfiles
	- Changes automatically reflect in your home directory via symlinks
	- No need to edit both the home directory and the repository

## Recommended Terminal Setup
	- Terminal with truecolor support: Ghostty, Kitty, iTerm2
	- Nerd font installed for Powerlevel10k icons
	- Optional: Neovim for editing and scripting within terminal popups

## Notes

	- This repository is macOS-focused; Linux or WSL support can be added via OS-specific folders or conditional .zshrc sourcing.
	- Sensitive files are not tracked (e.g., .ssh/, .zsh_history)
	- Caches and temporary files are ignored via .gitignore
	- Popups and workflows assume installed tools: lazygit, lazydocker, lazysql, lazyvim, yazi
