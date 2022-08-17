local ret_status="%(?:%{$fg_bold[red]%}λ:%{$fg_bold[red]%}λ)"
PROMPT="${ret_status} %{$fg[green]%}%c%{$reset_color%} %# "

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}) %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"
