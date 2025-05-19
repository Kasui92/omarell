if [[ -v OMAKUB_FIRST_RUN_THEME ]]; then
    cp $OMAKUB_PATH/themes/$OMAKUB_FIRST_RUN_THEME/alacritty.toml ~/.config/alacritty/theme.toml
    cp $OMAKUB_PATH/themes/$OMAKUB_FIRST_RUN_THEME/zellij.kdl ~/.config/zellij/themes/$OMAKUB_FIRST_RUN_THEME.kdl
    sed -i "s/theme \".*\"/theme \"$OMAKUB_FIRST_RUN_THEME\"/g" ~/.config/zellij/config.kdl

    cp $OMAKUB_PATH/themes/$THEME/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i "s/theme = \".*\"/theme = \"$THEME\"/g" ~/.config/btop/btop.conf

    cp $OMAKUB_PATH/themes/$OMAKUB_FIRST_RUN_THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

    source $OMAKUB_PATH/themes/$OMAKUB_FIRST_RUN_THEME/gnome.sh
    source $OMAKUB_PATH/themes/$OMAKUB_FIRST_RUN_THEME/gdm-background.sh
    source $OMAKUB_PATH/themes/$OMAKUB_FIRST_RUN_THEME/extensions.sh
    if [[ "$OMAKUB_FIRST_RUN_OPTIONAL_DEV_APPS" == *"Visual-Studio-Code"* ]]; then
        source $OMAKUB_PATH/themes/$OMAKUB_FIRST_RUN_THEME/vscode.sh
    fi
else
    source $OMAKUB_PATH/themes/tokyo-night/gnome.sh
    source $OMAKUB_PATH/themes/tokyo-night/gdm-background.sh
    source $OMAKUB_PATH/themes/tokyo-night/extensions.sh
    if [[ "$OMAKUB_FIRST_RUN_OPTIONAL_DEV_APPS" == *"Visual-Studio-Code"* ]]; then
        source $OMAKUB_PATH/themes/tokyo-night/vscode.sh
    fi
fi



