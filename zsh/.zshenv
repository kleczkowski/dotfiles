[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -s "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"
[ -s "$HOME/.opam/opam-init/init.zsh" ] && source "$HOME/.opam/opam-init/init.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
