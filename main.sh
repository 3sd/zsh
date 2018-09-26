# Managed by https://github.com/3sd/ansible/tree/master/roles/zsh

# History
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt incappendhistory sharehistory

# Completions
fpath=(~/.zsh_plugins/zsh-completions/src $fpath)
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Cursor movement
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char-or-list
WORDCHARS='*?[]~=&;!#$%^(){}<>'

# Automatic suggestions
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Search history substring
source ~/.zsh_plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_FUZZY=TRUE
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# Git prompt
source ~/.zsh_plugins/zsh-git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_PREFIX=" %B%F{212}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_AHEAD="%B%F{184}%{a%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%B%F{184}%{b%G%}"
ZSH_THEME_GIT_PROMPT_BRANCH="%B%F{212}"
ZSH_THEME_GIT_PROMPT_CHANGED="%B%F{196}%{c%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_CONFLICTS="%B%F{196}%{x%G%}"
ZSH_THEME_GIT_PROMPT_STAGED="%B%F{70}%{s%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%B%F{196}%{+%G%}"

# Prompt
PROMPT='%B%F{$PROMPT_COLOUR}%n@%m %F{111}%~$(git_super_status)%f%b '
RPROMPT="%B%F{$PROMPT_COLOUR}%D{%a %e %b %H:%M:%S}%f%b"

# Use globs with rsync and ssh, etc.
setopt nonomatch

# cd
CDPATH=".:$HOME/bk/build:/var/www:$HOME/src:$HOME/Projects"
setopt autopushd
setopt cdablevars

# Paths
PATH=$PATH:$HOME/.local/bin
. /usr/share/autojump/autojump.sh

hash -d b=~/bk/build
hash -d bk=~/bk

# Aliases
alias ls='ls --color'
alias grep='grep --color'
alias rgrep='grep --recursive --line-number --color'
alias o='xdg-open'
alias a="atom -a"

# civicrm-buildkit-docker
alias bk='docker-compose --file $HOME/bk/docker-compose.yml'
alias bku='docker-compose --file $HOME/bk/docker-compose.yml up -d'
alias bkc='docker-compose --file $HOME/bk/docker-compose.yml exec -u buildkit civicrm'
alias bkb='docker-compose --file $HOME/bk/docker-compose.yml exec -u buildkit civicrm bash'
alias sb='docker-compose --file $HOME/src/scout/docker-compose.yml exec -u buildkit scout  bash'

## taskwarrior
alias t='task'
alias ta='task add'
alias ta="task add"
alias tatf='task entry.after:now-14days'
alias tw=timew
alias twd='timew day'
alias tws='timew summary :ids'
alias twsy='tws yesterday to now'
alias twt='timew transfer from yesterday'
alias tww='timew week'

alias hosts='sudo vim /etc/hosts'
alias wirt='chromium --new-window "https://www.metoffice.gov.uk/public/weather/will-it-rain-today/#?tab=map&map=Rainfall&zoom=9&lon=-3.50&lat=50.93&fcTime=1516572000"'
alias sync-zsh="git -C ~/src/zsh push;git -C ~/.zsh pull;source ~/.zshrc"
