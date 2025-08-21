export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

export GOPATH="$HOME/Workspace/Extra/go"
export PATH="$GOPATH/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

ZSH_THEME=""

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

plugins=(fast-syntax-highlighting zsh-completions zsh-autosuggestions extract rust docker zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"

function ratemirrors {
  echo "Rate Mirrors: Arch"
  rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist

  echo "Rate Mirrors: Chaotic AUR"
  rate-mirrors chaotic-aur | sudo tee /etc/pacman.d/chaotic-mirrorlist
}
