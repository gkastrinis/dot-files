DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=8
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

setopt autocd extendedglob nomatch notify inc_append_history share_history

export EDITOR="code -w"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TERM=xterm-256color

alias cp='cp -i -r'
alias mv='mv -i'
alias rm='rm -rf'
alias scp='scp -r'
#alias mirror='rsync -avz --delete'
alias cat=bat
alias ls=exa
alias ll='ls -l'
alias ag='ag --noheading'
alias agg='cls ; ag'
alias grepr='grep --color=auto -I -rn'
alias pgrep='pgrep -l -f -u $(whoami)'
#alias du='du -csh'
#alias tree='tree -C'
alias uprc='source $HOME/.zshrc'
alias vim='vim -p'
#alias hexyl=hexyl
#alias x='xdg-open'
#alias fixgpg='pkill gpg-agent ; gpg-agent --daemon'
alias cls='yes "" | head -$(tput lines)'
alias gcc='gcc -ansi -pedantic -Wall -Wextra -W -Wshadow -std=c11'
alias g++='g++ -std=c++0x -pedantic -Wall -W -Wshadow'

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
		alias julia='/usr/local/bin/julia -t 8'
		;;
	'Anorak' )
		alias up='sudo apt-get update ; sudo apt-get -y upgrade ; sudo apt-get -y dist-upgrade ; sudo apt-get autoclean ; sudo apt-get autoremove'
		#alias sshT='ssh -L 8080:localhost:$WAT_PORT
		;;
esac

#syncall() {
#	ORIG_DIR=$(pwd)
#	if [ $(hostname) = 'Anorak' ]; then cd /mnt/d ;
#	else cd $HOME ; fi
#	if [ $(hostname) != 'bellatrix' ]; then echo "=> bellatrix"; mirror mirror bellatrix: ; fi
#	if [ $(hostname) != 'centauri.di.uoa.gr' ]; then echo "=> centauri"; mirror mirror centauri: ; fi
#	if [ $(hostname) != 'draco.di.uoa.gr' ]; then echo "=> draco"; mirror mirror draco: ; fi
#	cd $ORIG_DIR
#}

eval "$(shadowenv init zsh)"

export PATH=/usr/local/sbin:/usr/local/bin:$JAVA_HOME/bin:$HOME/dot-files:$PATH:.
