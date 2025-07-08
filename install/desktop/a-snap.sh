remove_snaps() {
    snap_pkgs=$(snap list | awk 'NR>1 {print $1}')

    for pkg in $snap_pkgs; do
        if [[ "$pkg" != "snapd" ]]; then
            sudo snap remove --purge "$pkg" 2>/dev/null || true
        fi
    done

    for pkg in $(snap list | awk 'NR>1 {print $1}'); do
        sudo snap remove --purge "$pkg" 2>/dev/null || true
    done

    if [ "$(snap list | wc -l)" -gt 1 ]; then
        remove_snaps
    fi
}

if command -v snap >/dev/null 2>&1; then
    echo -e "\nRemoving snap and all its packages..."

    remove_snaps >/dev/null

    sudo apt autoremove --purge snapd gnome-software-plugin-snap -y >/dev/null 2>&1 || echo -e "\033[1;31mFailed to remove snapd and gnome-software-plugin-snap."

    sudo rm -rf /var/cache/snapd/ /var/lib/snapd/ /var/snap/ /snap /etc/snap >/dev/null 2>&1
    rm -rf ~/snap >/dev/null 2>&1

    sudo apt-mark hold snapd >/dev/null 2>&1

    echo -e "\nFinished!"
fi
