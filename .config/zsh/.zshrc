export ZSH="/home/anu/.oh-my-zsh"
ZSH_THEME=""

ENABLE_CORRECTION="true"
plugins=(
    z
    git
    auto-notify
    zsh-autosuggestions
    fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# History in cache directory
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Load aliases if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

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
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
