PROMPT='%{$fg_bold[green]%}%n@%{$reset_color%}%{$fg_bold[green]%}%m %{$fg_bold[blue]%}%~%{$reset_color%} $(git_prompt_info)
%{$fg_bold[blue]%}%# '
RPROMPT='%{$fg_bold[blue]%}%* %{$fg[blue]%}[%{$fg_bold[red]%}%?%{$fg[blue]%}]%{$reset_color%}' 

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
