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

## taskwarrior
alias t='task'
alias ta='task add'
alias ta="task add"
alias tatf='task entry.after:now-14days'
alias tw=timew
alias twd='timew day'
alias tws='timew summary :ids'
alias twt='timew transfer'
alias twsy='tws yesterday to now'
alias twty='twt yesterday to now'
alias tww='timew week'

alias hosts='sudo vim /etc/hosts'
alias wirt='chromium --new-window "https://www.metoffice.gov.uk/public/weather/will-it-rain-today/#?tab=map&map=Rainfall&zoom=9&lon=-3.50&lat=50.93&fcTime=1516572000"'
alias wh='brave-browser "https://projects.3sd.io/time_entries/report?utf8=%E2%9C%93&criteria%5B%5D=project&set_filter=1&sort=spent_on%3Adesc&f%5B%5D=spent_on&op%5Bspent_on%5D=%3Et-&v%5Bspent_on%5D%5B%5D=57&f%5B%5D=user_id&op%5Buser_id%5D=%3D&v%5Buser_id%5D%5B%5D=me&f%5B%5D=&group_by=&t%5B%5D=hours&t%5B%5D=&columns=week&criteria%5B%5D="'
alias zshSync="git -C ~/src/zsh push;git -C ~/.zsh pull;source ~/.zshrc"

# Handy environment variables
E=michaelmcandrew@thirdsectordesign.org