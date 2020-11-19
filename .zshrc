export ZSH="/home/anu/.oh-my-zsh"
ZSH_THEME=""

ENABLE_CORRECTION="true"
plugins=(
    z
    git
    archlinux
    chucknorris
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
alias zshconfig="vim ~/.zshrc"
alias mirrorUpdate='sudo reflector --latest 250 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias vim="nvim"
alias vi="nvim"
alias vimrc="nvim ~/.config/nvim/init.vim"

# Turn off all beeps
unsetopt BEEP

# SSH settings
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 24h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Prompt Settings
precmd() { precmd() { print "" } }

# Enable vim mode in zsh
bindkey -v

# ---Prompt---

# Stolen from pure prompt
# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
# terminal codes:
# \e7   => save cursor position
# \e[2A => move cursor 2 lines up
# \e[1G => go to position 1 in terminal
# \e8   => restore cursor position
# \e[K  => clears everything after the cursor on the current line
# \e[2K => clear everything on the current line
PROMPT='%{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'$'\n'
PROMPT+="%(?:%{$fg_bold[green]%}❯  :%{$fg_bold[red]%}❯  )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
