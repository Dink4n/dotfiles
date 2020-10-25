export ZSH="/home/anu/.oh-my-zsh"
ZSH_THEME="myrobbyrussell"

ENABLE_CORRECTION="true"
plugins=(git
    zsh-autosuggestions
    zsh-syntax-highlighting
    archlinux
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# export TERM=rxvt-256color

# Termite settings
if [[ $term == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases for a few useful commands
alias ls="lsd"
alias lt="ls --tree"
alias zshconfig="vim ~/.zshrc"
alias mirrorUpdate='sudo reflector --latest 250 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias p5Server="browser-sync start --server --files ."
alias vim="nvim"
alias vi="nvim"
alias vimconf="nvim ~/.config/nvim/init.vim"
alias jn="jupyter notebook"
alias vf="vifm"
alias cl="clear"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Turn off all beeps
unsetopt BEEP
# Turn off autocomplete beeps
# unsetopt LIST_BEEP

# SSH settings
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 24h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Path settings
export PATH="$PATH:/home/anu/.local/bin"
export PATH="$PATH:/home/anu/bin"
export PATH="$HOME:/home/anu/.emacs.d/bin:$PATH"

# Prompt Settings
precmd() { precmd() { print "" } }

# Enable vim mode in zsh
bindkey -v

# ---Prompt---

# PROMPT=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'$'\n'
# PROMPT+="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}]%{$reset_color%}%  %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# # PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} ' 
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
