#!/usr/bin/zsh

if which acpi &> /dev/null; then
  local BATTSTATE="$(acpi -b)"
  local BATTPRCNT="$(echo ${BATTSTATE[(w)4]}|sed -r 's/(^[0-9]+).*/\1/')"
  local BATTSTATUS="$(echo ${BATTSTATE[(w)3]})"
  if [[ "${BATTSTATUS}" = "Discharging," ]]; then
    if [[ -z "${BATTPRCNT}" ]]; then
      PR_BATTERY=""
    elif [[ "${BATTPRCNT}" -lt 15 ]]; then
      PR_BATTERY="${fg[red]}(b:${BATTPRCNT}%%)"
    elif [[ "${BATTPRCNT}" -lt 60 ]]; then
      PR_BATTERY="${fg[yellow]}(b:${BATTTPRCNT}%%)"
    elif [[ "${BATTPRCNT}" -lt 100 ]]; then
      PR_BATTERY="${fg[green]}(b:${BATTPRCNT}%%)"
    else
      PR_BATTERY=""

    fi  
  else
    PR_BATTERY=""
  fi  
fi  


PROMPT='%{$fg_bold[green]%}%n@%{$reset_color%}%{$fg_bold[green]%}%m %{$fg_bold[blue]%}%~%{$reset_color%} ${PR_BATTERY} $(git_prompt_info)
%{$fg_bold[blue]%}%# '

RPROMPT='%{$fg_bold[blue]%}%* %{$fg[blue]%}[%{$fg_bold[red]%}%?%{$fg[blue]%}]%{$reset_color%}' 

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
