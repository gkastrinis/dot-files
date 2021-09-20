export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=8

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="terminalparty"
#ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "terminalparty" "rkj" "sporty_256" )

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(command-not-found)
#plugins=(command-not-found zsh-syntax-highlighting)

setopt autocd extendedglob nomatch notify inc_append_history share_history
source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TERM=xterm-256color

alias cp='cp -i -r'
alias mv='mv -i'
alias rm='rm -rf'
alias scp='scp -r'
alias mirror='rsync -avz --delete'
alias df='df -h'
alias diff='colordiff'
alias vdiff='colordiff -y -W $(tput cols) --suppress-common-lines'
alias vvdiff='colordiff -y -W $(tput cols)'
alias du='du -csh'
alias grep='grep --color=auto -I'
alias grepr='grep --color=auto -I -r'
alias pgrep='pgrep -l -f -u $(whoami)'
alias tree='tree -C'
alias uprc='source $HOME/.zshrc'
alias up='sudo apt-get update ; sudo apt-get -y upgrade ; sudo apt-get -y dist-upgrade ; sudo apt-get autoclean ; sudo apt-get autoremove'
alias vim='vim -p'
#alias sshT='ssh -L 8080:localhost:$CLUE_PORT'
#alias x='xdg-open'
#alias yolo='echo "$(curl -s http://whatthecommit.com/index.txt)"'

case "$(uname -s)" in
	Linux*)
		alias ll='ls -lF --group-directories-first --color=auto'
		alias ls='ls --color=auto'
		alias gcc='gcc -ansi -pedantic -Wall -Wextra -W -Wshadow -std=c11'
		alias g++='g++ -std=c++0x -pedantic -Wall -W -Wshadow'
		eval `dircolors -b ~/.dircolors`
		eval `keychain --eval id_rsa --quiet`
		;;
	Darwin*)
		alias ll='ls -lFG'
		alias ls='ls -G'
		;;
esac

case $(hostname) in
	'almanac' )
		export JULIA_PROJECT=$HOME/Work/raicode
		source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		;;
	'bellartix' )
		export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
		;;
	'centauri.di.uoa.gr' | 'draco.di.uoa.gr' )
		export JAVA_HOME=/usr/lib/jvm/java-1.8.0
		#export LOGICBLOX_HOME=/opt/lb/logicblox-3.10.14/logicblox
		#export LD_LIBRARY_PATH=/usr/lib64
		source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		;;
esac

syncall() {
	ORIG_DIR=$(pwd)
	if [ $(hostname) = 'Anorak' ]; then cd /mnt/d ;
	else cd $HOME ; fi

	if [ $(hostname) != 'bellatrix' ]; then echo "=> bellatrix"; mirror mirror bellatrix: ; fi
	if [ $(hostname) != 'centauri.di.uoa.gr' ]; then echo "=> centauri"; mirror mirror centauri: ; fi
	if [ $(hostname) != 'draco.di.uoa.gr' ]; then echo "=> draco"; mirror mirror draco: ; fi
	cd $ORIG_DIR
}

alias fixgpg='pkill gpg-agent ; gpg-agent --daemon'

fixperms() {
	find $1 -type d -exec chmod 700 {} \;
	find $1 -type f -exec chmod 600 {} \;
}

export PATH=/usr/local/bin:$JAVA_HOME/bin:$HOME/souffle-bin/bin/:$PATH:.
