export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="flazz"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 14

plugins=(git gitignore direnv)

source $ZSH/oh-my-zsh.sh


