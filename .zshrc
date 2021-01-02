export ZSH="/home/anu/.oh-my-zsh"
ZSH_THEME=""

ENABLE_CORRECTION="true"
plugins=(
    z
    git
    archlinux
    chucknorris
    auto-notify
    alias-finder
    colored-man-pages
    zsh-autosuggestions
    fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases for a few useful commands
alias ls="lsd"
alias lt="lsd --tree"
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xq="xbps-query"
alias zshconfig="vim ~/.zshrc"
alias mirrorUpdate='sudo reflector --latest 250 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias vim="nvim"
alias vi="nvim"
alias vimrc="nvim ~/.config/nvim/init.vim"

# Turn off all beeps
unsetopt BEEP

# SSH settings
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 24h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! "$SSH_AUTH_SOCK" ]]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

# Prompt Settings
# precmd() { precmd() { print "" } }

# Enable vim mode in zsh
bindkey -v

# ---Prompt---
eval "$(starship init zsh)"
