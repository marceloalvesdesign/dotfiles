# Source aliases file if it exists
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

set -o vi

export EDITOR="vi"
export KUBE_EDITOR="vi"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH="$PATH:$HOME/.local/bin"
export VISUAL="vi"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
