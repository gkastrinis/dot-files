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
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -U colors && colors

export VISUAL="nvim"
export EDITOR="nvim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TERM=xterm-256color

alias cp='cp -r'
alias rm='rm -rf'
alias ls='lsd'
alias ll='lsd -l'
alias lt='lsd -l --tree'
alias cat=bat
#alias pgrep='pgrep -l -f -u $(whoami)'
alias uprc='source $HOME/.zshrc'
#alias x='xdg-open'
#alias fixgpg='pkill gpg-agent ; gpg-agent --daemon'
alias cls='yes "" | head -$(tput lines)'
#alias tic80='tic80 --skip --fs=.'
alias jl='julia -t 8'
alias vin='nvim'
alias v='nvim'

#case $(hostname) in
#	'almanac' )
		#export CLASSPATH=".:/usr/local/lib/antlr-4.9.3-complete.jar:$CLASSPATH"
		#alias antlr4='java -jar /usr/local/lib/antlr-4.9.3-complete.jar'
#		;;
#	'Anorak' )
		#alias sshT='ssh -L 8080:localhost:$WAT_PORT
#		;;
#esac

eval "$(shadowenv init zsh)"
export PATH=/usr/local/sbin:/usr/local/bin:$HOME/dot-files:$PATH:.
export PATH=$HOME/nvim-macos-x86_64-nightly/bin:$PATH
#export PATH="/Applications/tic80.app/Contents/MacOS/:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.julia/artifacts/d10d213b97cf181a9138de58f6e9d01156d4b3bc/bin/:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.13/libexec/bin:$PATH"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/georgekastrinis/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

source $HOME/Work/pyautoenv/pyautoenv.plugin.zsh

eval "$(oh-my-posh init zsh --config ~/gkastrinis.info.json)"
export PATH="$HOME/.local/bin:$PATH"

# added by Snowflake SnowflakeCLI installer v1.0
export PATH=/Applications/SnowflakeCLI.app/Contents/MacOS/:$PATH
