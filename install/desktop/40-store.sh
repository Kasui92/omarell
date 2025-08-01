#!/bin/bash

# Remove Snap packages if they exist
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
    remove_snaps >/dev/null

    sudo apt autoremove --purge snapd gnome-software-plugin-snap -y >/dev/null 2>&1 || echo -e "\nFailed to remove snapd and gnome-software-plugin-snap. Please remove them manually.\n"
    sudo apt clean
    sudo rm -rf /var/cache/snapd/ /var/lib/snapd/ /var/snap/ /snap /etc/snap >/dev/null 2>&1
    rm -rf ~/snap >/dev/null 2>&1

    sudo apt-mark hold snapd >/dev/null 2>&1
fi

# Install Flatpak and GNOME Software plugin for Flatpak
sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
