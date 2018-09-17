# Managed by https://github.com/3sd/ansible/tree/master/roles/zsh

# History
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt incappendhistory sharehistory

# Completions
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Key bindings
bindkey -e

# Use globs with rsync and ssh, etc.
setopt nonomatch

# Cursor movement
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char-or-list
WORDCHARS='*?[]~=&;!#$%^(){}<>'

# Prompt
PROMPT="%B%F{$PROMPT_COLOUR}%n@%m %F{111}%~%b%f "
RPROMPT="%B%F{$PROMPT_COLOUR}%D{%a %e %b %H:%M:%S}%f%b"

# autosuggestions
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias a="atom -a"
alias grep='grep --color'
alias hosts='sudo vim /etc/hosts'
alias ls='ls --color'
alias rgrep='grep --recursive --line-number --color'
alias wirt='chromium --new-window "https://www.metoffice.gov.uk/public/weather/will-it-rain-today/#?tab=map&map=Rainfall&zoom=9&lon=-3.50&lat=50.93&fcTime=1516572000"'
