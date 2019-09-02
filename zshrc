# Managed by https://github.com/3sd/ansible/tree/master/roles/zsh

source ~/.zsh/vars

# History
HISTFILE=~/.histfile
HISTSIZE=10000000 # in session
SAVEHIST=10000000 # in $HISTFILE
setopt SHARE_HISTORY # share history between terminals

# TODO: review and document/comment from here 

# Completions
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
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
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Search history substring
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_FUZZY=TRUE
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# Git prompt
source ~/.zsh/plugins/zsh-git-prompt/zshrc.sh
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
ZSH_THEME_GIT_PROMPT_HASH_PREFIX=":"

ZSH_THEME_GIT_PROMPT_STASHED="%B%F{208}%{s%G%}"
ZSH_THEME_GIT_PROMPT_LOCAL="%B%F{70} local "

# The following are not set (and are maybe a bit unecessary?
# ZSH_THEME_GIT_PROMPT_UPSTREAM_FRONT=" {%{$fg[blue]%}"
# ZSH_THEME_GIT_PROMPT_UPSTREAM_END="%{${reset_color}%}}"
# ZSH_THEME_GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}|MERGING%{${reset_color}%}"
# ZSH_THEME_GIT_PROMPT_REBASE="%{$fg_bold[magenta]%}|REBASE%{${reset_color}%} "

# Prompt
PROMPT='%B%F{$PROMPT_COLOUR}%n@%m %F{111}%~$(git_super_status)%f%b '
RPROMPT="%B%F{$PROMPT_COLOUR}%D{%a %e %b %H:%M:%S}%f%b"

# Globbing
setopt extendedglob

# Path navigation

PATH=$HOME/.npm-packages/bin:$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH

. /usr/share/autojump/autojump.sh

# cd
DIRSTACKSIZE=0
setopt autopushd pushdminus pushdsilent pushdtohome
alias d='dirs -v'

hash -d b=~/bk/build
hash -d bk=~/bk

# Aliases
alias ls='ls --color'
alias grep='grep --color'
alias rgrep='grep --recursive --line-number --color'
alias o='xdg-open'
alias c="code"
alias pc="pass show -c"

# civicrm-buildkit-docker
alias bk='docker-compose --file $HOME/bk/docker-compose.yml'
alias bku='docker-compose --file $HOME/bk/docker-compose.yml up -d'
alias bkc='docker-compose --file $HOME/bk/docker-compose.yml exec -u buildkit civicrm'
alias bkb='docker-compose --file $HOME/bk/docker-compose.yml exec -u buildkit civicrm bash'
alias sb='docker-compose --file $HOME/src/scout/docker-compose.yml exec -u buildkit scout  bash'

alias hosts='sudo vim /etc/hosts'
alias wirt='chromium --new-window "https://www.metoffice.gov.uk/public/weather/will-it-rain-today/#?tab=map&map=Rainfall&zoom=9&lon=-3.50&lat=50.93&fcTime=1516572000"'
alias zshSync="git -C ~/src/zsh push;git -C ~/.zsh pull;source ~/.zshrc"

# pyenv - move this somewhere more appropriate
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

