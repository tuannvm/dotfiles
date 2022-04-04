function alacritty-theme {
  echo $1
  dark_window_style='fg=white,bg=default'
  light_window_style='fg=black,bg=default'
  if ! test -f ~/.config/alacritty/color.yaml;then
    echo "file ~/.config/alacritty/color.yaml doesn't exist"
  fi

  config_path=`realpath ~/.config/alacritty/color.yaml`

  sed -i "" -e "s#^colors: \*.*#colors: *$1#g" $config_path
  case $1 in

    *"light"*)
      tmux set window-style $light_window_style
      ;;
    *)
      tmux set window-style $dark_window_style
      ;;
  esac

  echo "switched to $$."
}
