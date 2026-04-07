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

eval "$(starship init zsh)"
