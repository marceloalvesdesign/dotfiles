# Source aliases file if it exists
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

set -o vi

export PATH="$PATH:$HOME/.local/bin"
export EDITOR="vi"

eval "$(starship init zsh)"
