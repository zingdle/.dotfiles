local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
prompt='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    elapsed=$(($SECONDS - $timer))
    hour=$((elapsed/3600))
    min=$((elapsed/60))
    sec=$((elapsed%60))

    if [ "$elapsed" -le 60 ] ; then
      timer_show="%F{green}${elapsed}s"
    elif [ "$elapsed" -gt 60 ] && [ "$hour" -eq 0 ]; then
      timer_show="%F{yellow}${min}m ${sec}s"
    else
      min=$(($min%60))
      timer_show="%F{red}${hour}h ${min}m ${sec}s"
    fi

    export RPROMPT="${timer_show} %{$reset_color%}%D|%T@%m"
    unset timer
  fi
}
