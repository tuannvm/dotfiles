function alacritty-theme {
  if ! test -f ~/.config/alacritty/color.yaml;then
    echo "file ~/.config/alacritty/color.yaml doesn't exist"
  fi

  config_path=`realpath ~/.config/alacritty/color.yaml`

  if [ $1 = "toggle" ];then
    current=`cat ~/.config/alacritty/color.yaml | grep ^colors | cut -d" " -f2`
    if [ $current = "*dark" ];then
      desire="*light"
    else
      desire="*dark"
    fi
    sed -i "" -e "s#^colors: \*.*#colors: $desire#g" $config_path
  else
    sed -i "" -e "s#^colors: \*.*#colors: *$1#g" $config_path
    echo "switched to $$."
  fi
}
