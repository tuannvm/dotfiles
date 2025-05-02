toggle-vim-theme() {
  local vimrc="$HOME/.custom.vim"
  local current desired

  # 1) Verify file exists
  if [[ ! -f $vimrc ]]; then
    echo "Error: $vimrc not found."
    return 1
  fi

  # 2) Read current scheme name
  current=$(awk '/^colorscheme /{print $2; exit}' "$vimrc")
  if [[ -z $current ]]; then
    echo "Error: no colorscheme line in $vimrc."
    return 1
  fi

  # 3) Swap 'dark' ↔ 'light'
  if [[ $current == *dark* ]]; then
    desired=${current//dark/light}
  else
    desired=${current//light/dark}
  fi

  # 4) In-place edit via gsed, preserving the symlink itself
  gsed -i --follow-symlinks \
    "s|^colorscheme .*|colorscheme $desired|" \
    "$vimrc"

  echo "Switched Vim theme: $current → $desired"
}

