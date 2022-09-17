# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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
DISABLE_MAGIC_FUNCTIONS="true"

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
#ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "terminalparty" "rkj" "sporty_256" )

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(command-not-found)

setopt autocd extendedglob nomatch notify inc_append_history share_history
source $ZSH/oh-my-zsh.sh

export EDITOR="code -w"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TERM=xterm-256color

alias cp='cp -i -r'
alias mv='mv -i'
alias rm='rm -rf'
alias scp='scp -r'
alias mirror='rsync -avz --delete'
alias cat=bat
alias ls=exa
alias ag='ag --noheading'
alias grepr='grep --color=auto -I -rn'
alias pgrep='pgrep -l -f -u $(whoami)'
#alias du='du -csh'
#alias tree='tree -C'
alias uprc='source $HOME/.zshrc'
#alias up='sudo apt-get update ; sudo apt-get -y upgrade ; sudo apt-get -y dist-upgrade ; sudo apt-get autoclean ; sudo apt-get autoremove'
alias vim='vim -p'
alias hexyl=hexyl
#alias sshT='ssh -L 8080:localhost:$CLUE_PORT'
#alias x='xdg-open'
#alias fixgpg='pkill gpg-agent ; gpg-agent --daemon'
alias cls='yes "" | head -$(tput lines)'

#fixperms() {
#	find $1 -type d -exec chmod 700 {} \;
#	find $1 -type f -exec chmod 600 {} \;
#}

alias diff='colordiff'
alias vdiff='colordiff -y -W $(tput cols) --suppress-common-lines'
#alias vvdiff='colordiff -y -W $(tput cols)'

dif() {
	#diff -u $1 $2 | diff-so-fancy
	diff -y -W $(tput cols) $1 $2 | diff-so-fancy
}

case "$(uname -s)" in
	Linux*)
		alias gcc='gcc -ansi -pedantic -Wall -Wextra -W -Wshadow -std=c11'
		alias g++='g++ -std=c++0x -pedantic -Wall -W -Wshadow'
		eval `dircolors -b ~/.dircolors`
		eval `keychain --eval id_rsa --quiet`
		;;
	Darwin*)
		;;
esac

case $(hostname) in
	'almanac' )
		source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

		export CLASSPATH=".:/usr/local/lib/antlr-4.9.3-complete.jar:$CLASSPATH"
		alias antlr4='java -jar /usr/local/lib/antlr-4.9.3-complete.jar'
		alias julia='JULIA_PROJECT=$PWD /usr/local/bin/julia'
		;;
	'bellartix' )
		export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
		;;
	'centauri.di.uoa.gr' | 'draco.di.uoa.gr' )
		export JAVA_HOME=/usr/lib/jvm/java-1.8.0
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

export PATH=/usr/local/sbin:/usr/local/bin:$JAVA_HOME/bin:$HOME/souffle-bin/bin/:$HOME/Work/rai-cli/build:$PATH:.

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
