if [[ -v OMARELL_FIRST_RUN_THEME ]]; then
    cp $OMARELL_PATH/themes/$OMARELL_FIRST_RUN_THEME/alacritty.toml ~/.config/alacritty/theme.toml
    cp $OMARELL_PATH/themes/$OMARELL_FIRST_RUN_THEME/zellij.kdl ~/.config/zellij/themes/$OMARELL_FIRST_RUN_THEME.kdl
    sed -i "s/theme \".*\"/theme \"$OMARELL_FIRST_RUN_THEME\"/g" ~/.config/zellij/config.kdl

    cp $OMARELL_PATH/themes/$OMARELL_FIRST_RUN_THEME/btop.theme ~/.config/btop/themes/$OMARELL_FIRST_RUN_THEME.theme
    sed -i "s/theme = \".*\"/theme = \"$OMARELL_FIRST_RUN_THEME\"/g" ~/.config/btop/btop.conf

    cp $OMARELL_PATH/themes/$OMARELL_FIRST_RUN_THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

    source $OMARELL_PATH/themes/$OMARELL_FIRST_RUN_THEME/gnome.sh
    source $OMARELL_PATH/themes/$OMARELL_FIRST_RUN_THEME/gdm-background.sh
    source $OMARELL_PATH/themes/$OMARELL_FIRST_RUN_THEME/extensions.sh
    if [[ "$OMARELL_FIRST_RUN_OPTIONAL_DEV_APPS" == *"Visual-Studio-Code"* ]]; then
        source $OMARELL_PATH/themes/$OMARELL_FIRST_RUN_THEME/vscode.sh
    fi
else
    source $OMARELL_PATH/themes/tokyo-night/gnome.sh
    source $OMARELL_PATH/themes/tokyo-night/gdm-background.sh
    source $OMARELL_PATH/themes/tokyo-night/extensions.sh
    if [[ "$OMARELL_FIRST_RUN_OPTIONAL_DEV_APPS" == *"Visual-Studio-Code"* ]]; then
        source $OMARELL_PATH/themes/tokyo-night/vscode.sh
    fi
fi



