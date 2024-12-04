#DISABLE_UPDATE_PROMPT="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"
export UPDATE_ZSH_DAYS=8

setopt autocd extendedglob nomatch notify inc_append_history share_history

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -U colors && colors

export EDITOR="code -w"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TERM=xterm-256color

alias ls='ls --color=auto'
alias ll='ls -l'
alias cp='cp -i -r'
alias mv='mv -i'
alias rm='rm -rf'
#alias scp='scp -r'
#alias mirror='rsync -avz --delete'
#alias cat=bat
alias ag='ag --noheading'
alias agg='cls ; ag'
alias grepr='grep --color=auto -I -rn'
#alias pgrep='pgrep -l -f -u $(whoami)'
#alias du='du -csh'
#alias tree='tree -C'
alias uprc='source $HOME/.zshrc'
alias vim='vim -p'
#alias x='xdg-open'
#alias fixgpg='pkill gpg-agent ; gpg-agent --daemon'
alias cls='yes "" | head -$(tput lines)'
alias gcc='gcc -ansi -pedantic -Wall -Wextra -W -Wshadow -std=c11'
alias g++='g++ -std=c++0x -pedantic -Wall -W -Wshadow'
alias python=python3
alias tic80='tic80 --skip --fs=.'

#fixperms() {
#	find $1 -type d -exec chmod 700 {} \;
#	find $1 -type f -exec chmod 600 {} \;
#}

#case $(hostname) in
#	'almanac' )
		#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		#export CLASSPATH=".:/usr/local/lib/antlr-4.9.3-complete.jar:$CLASSPATH"
		#alias antlr4='java -jar /usr/local/lib/antlr-4.9.3-complete.jar'
		#alias julia='/usr/local/bin/julia -t 8'
#		;;
#	'Anorak' )
		#alias up='sudo apt-get update ; sudo apt-get -y upgrade ; sudo apt-get -y dist-upgrade ; sudo apt-get autoclean ; sudo apt-get autoremove'
		#alias sshT='ssh -L 8080:localhost:$WAT_PORT
#		;;
#esac

# Find and set branch name var if in git repository.
#function git_branch_name()
#{
#  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
#  if [[ $branch == "" ]];
#  then
#    :
#  else
#    echo $branch
#  fi
#}
# Enable substitution in the prompt.
#setopt prompt_subst
# Config for prompt. PS1 synonym.
#prompt='%{$fg[magenta]%}$(git_branch_name)%{$reset_color%}/%1~ 🍭 '

eval "$(shadowenv init zsh)"
export PATH=/usr/local/sbin:/usr/local/bin:$HOME/dot-files:$PATH:.
#export PATH=$JAVA_HOME/bin:$PATH:.
#export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/Applications/tic80.app/Contents/MacOS/:$PATH"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/georgekastrinis/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

eval "$(oh-my-posh init zsh --config ~/gkastrinis.info.json)"
