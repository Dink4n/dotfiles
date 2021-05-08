# Dink4n's config for zoomer shell

# Enable colors and change prompt
autoload -U colors && colors # load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Good auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Load aliases if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Turn off all beeps
unsetopt BEEP

# Enable vim mode
bindkey -v
export KEYTIMEOUT=1

# make backspace act normal
bindkey -v '^?' backward-delete-char

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
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# load plugin if existent
loadplugin()
{
    plugin=$1
    base_dir="/usr/share/zsh/plugins/"
    [ -d "$base_dir/$plugin" ] && source "$base_dir/$plugin/$plugin.plugin.zsh"
}

# Load all the plugins
loadplugin zsh-z
loadplugin zsh-autosuggestions
loadplugin fast-syntax-highlighting
