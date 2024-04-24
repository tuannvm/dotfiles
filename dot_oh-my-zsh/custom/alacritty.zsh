alacritty-theme () {
        if ! test -f ~/.config/alacritty/alacritty.toml
        then
                echo "file ~/.config/alacritty/alacritty.toml doesn't exist"
        fi
        config_path=`realpath ~/.config/alacritty/alacritty.toml`
        if [ $1 = "toggle" ]
        then
                current=`cat ~/.config/alacritty/alacritty.toml  | grep themes | cut -d "/" -f6 | cut -d "." -f1`
                if [ $current = "dark" ]
                then
                        gsed -i '0,/dark/{s//light/}' $config_path
                else
                        gsed -i '0,/light/{s//dark/}' $config_path
                fi
                echo "switched to $$."
        fi
}
