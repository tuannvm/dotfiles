local ret_status="%(?:%{$fg_bold[yellow]%}λ:%{$fg_bold[yellow]%}λ)"
PROMPT="${ret_status} %{$fg[magenta]%}%c%{$reset_color%} %# "

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"
