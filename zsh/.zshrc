export ZSH="$HOME/.oh-my-zsh"

# Lazy tool commands
command -v lazygit >/dev/null 2>&1 || alias lazygit="echo 'lazygit not installed'"
command -v lazydocker >/dev/null 2>&1 || alias lazydocker="echo 'lazydocker not installed'"
command -v lzaysql >/dev/null 2>&1 || alias lzaysql="echo 'lzaysql not installed'"


ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
alias tmuxreload="tmux source ~/.tmux.conf"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ghosttycfg='vim "$HOME/Library/Application Support/com.mitchellh.ghostty/config"'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Detect OS
case "$OSTYPE" in
  darwin*)   export OS_TYPE="mac" ;;
  linux*)    
    if grep -qi microsoft /proc/version 2>/dev/null; then
      export OS_TYPE="wsl"
    else
      export OS_TYPE="linux"
    fi
    ;;
  *) export OS_TYPE="unknown" ;;
esac

# Fastfetch on shell start
if command -v fastfetch &> /dev/null; then
  fastfetch
fi

# Auto-start tmux safely
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  # Try to start tmux, fallback to normal shell if it fails
  tmux attach || tmux new || echo "tmux failed, continuing in shell"
fi
