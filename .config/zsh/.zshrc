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

# Enable vim mode
bindkey -v

# Change cursor shape for different vi modes.
function zle-keymap-select()
{
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';; # Block
        viins|main) echo -ne '\e[5 q';; # Beam
    esac
}
zle -N zle-keymap-select
zle-line-init()
{
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne '\e[5 q'
}
echo -ne '\e[5 q' # Use beam shape cursor on startup.

# ---Prompt---
# eval "$(starship init zsh)"
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# precmd() { precmd() { print "" } }
