PROMPT='%(?,%{$fg[yellow]%},%{$fg[red]%})🧻  '
#RPS1='%{$fg[blue]%}%~%{$reset_color%} '
RPS1='%{$fg[blue]%}%1~$(git_prompt_info)%{$reset_color%}'
#RPS1='%{$fg[white]%}%2~$(git_prompt_info) %{$fg_bold[blue]%}%m%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" 🐲"
ZSH_THEME_GIT_PROMPT_DIRTY=" 🔥"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"
