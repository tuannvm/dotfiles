local ret_status="%(?:%{$fg_bold[magenta]%}λ:%{$fg_bold[magenta]%}λ)"
PROMPT="${ret_status} %{$fg[yellow]%}%c%{$reset_color%} %# "

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"
