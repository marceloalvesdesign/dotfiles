# Source aliases file if it exists
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

set -o vi

export PATH="$PATH:$HOME/.local/bin"
export EDITOR="vi"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
