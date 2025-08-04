#!/bin/bash

sudo apt install -y plymouth

# ==============================================================================
# PLYMOUTH SETUP
# ==============================================================================

# Ubuntu uses initramfs-tools, not mkinitcpio
# Check if plymouth is already in initramfs modules
if ! grep -q "plymouth" /etc/initramfs-tools/modules 2>/dev/null; then
  echo "plymouth" | sudo tee -a /etc/initramfs-tools/modules
  # Update initramfs
  sudo update-initramfs -u
fi

# Add kernel parameters for Plymouth
if [ -d "/boot/loader/entries" ]; then # systemd-boot
  echo "Detected systemd-boot"

  for entry in /boot/loader/entries/*.conf; do
    if [ -f "$entry" ]; then
      # Skip fallback entries
      if [[ "$(basename "$entry")" == *"fallback"* ]]; then
        echo "Skipped: $(basename "$entry") (fallback entry)"
        continue
      fi

      # Skip if splash it already present for some reason
      if ! grep -q "splash" "$entry"; then
        sudo sed -i '/^options/ s/$/ splash quiet/' "$entry"
      else
        echo "Skipped: $(basename "$entry") (splash already present)"
      fi
    fi
  done
elif [ -f "/etc/default/grub" ]; then # Grub
  echo "Detected grub"

  # Backup GRUB config before modifying
  backup_timestamp=$(date +"%Y%m%d%H%M%S")
  sudo cp /etc/default/grub "/etc/default/grub.bak.${backup_timestamp}"

  # Check if splash is already in GRUB_CMDLINE_LINUX_DEFAULT
  if ! grep -q "GRUB_CMDLINE_LINUX_DEFAULT.*splash" /etc/default/grub; then
    # Get current GRUB_CMDLINE_LINUX_DEFAULT value
    current_cmdline=$(grep "^GRUB_CMDLINE_LINUX_DEFAULT=" /etc/default/grub | cut -d'"' -f2)

    # Add splash and quiet if not present
    new_cmdline="$current_cmdline"
    if [[ ! "$current_cmdline" =~ splash ]]; then
      new_cmdline="$new_cmdline splash"
    fi
    if [[ ! "$current_cmdline" =~ quiet ]]; then
      new_cmdline="$new_cmdline quiet"
    fi

    # Trim any leading/trailing spaces
    new_cmdline=$(echo "$new_cmdline" | xargs)

    sudo sed -i "s/^GRUB_CMDLINE_LINUX_DEFAULT=\".*\"/GRUB_CMDLINE_LINUX_DEFAULT=\"$new_cmdline\"/" /etc/default/grub

    # Regenerate grub config
    sudo grub-mkconfig -o /boot/grub/grub.cfg
  else
    echo "GRUB already configured with splash kernel parameters"
  fi
elif [ -d "/etc/cmdline.d" ]; then # UKI
  echo "Detected a UKI setup"
  # Relying on mkinitcpio to assemble a UKI
  # https://wiki.archlinux.org/title/Unified_kernel_image
  if ! grep -q splash /etc/cmdline.d/*.conf; then
    # Need splash, create the omarell file
    echo "splash" | sudo tee -a /etc/cmdline.d/omarell.conf
  fi
  if ! grep -q quiet /etc/cmdline.d/*.conf; then
    # Need quiet, create or append the omarell file
    echo "quiet" | sudo tee -a /etc/cmdline.d/omarell.conf
  fi
elif [ -f "/etc/kernel/cmdline" ]; then # UKI Alternate
  # Alternate UKI kernel cmdline location
  echo "Detected a UKI setup"

  # Backup kernel cmdline config before modifying
  backup_timestamp=$(date +"%Y%m%d%H%M%S")
  sudo cp /etc/kernel/cmdline "/etc/kernel/cmdline.bak.${backup_timestamp}"

  current_cmdline=$(cat /etc/kernel/cmdline)

  # Add splash and quiet if not present
  new_cmdline="$current_cmdline"
  if [[ ! "$current_cmdline" =~ splash ]]; then
    new_cmdline="$new_cmdline splash"
  fi
  if [[ ! "$current_cmdline" =~ quiet ]]; then
    new_cmdline="$new_cmdline quiet"
  fi

  # Trim any leading/trailing spaces
  new_cmdline=$(echo "$new_cmdline" | xargs)

  # Write new file
  echo $new_cmdline | sudo tee /etc/kernel/cmdline
else
  echo ""
  echo " None of systemd-boot, GRUB, or UKI detected. Please manually add these kernel parameters:"
  echo "  - splash (to see the graphical splash screen)"
  echo "  - quiet (for silent boot)"
  echo ""
fi

# Install and configure Omarell Plymouth theme
THEME_SOURCE_DIR="$(dirname "$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")")/default/plymouth"

if [ -d "$THEME_SOURCE_DIR" ]; then
  sudo mkdir -p /usr/share/plymouth/themes/omarell/
  sudo cp -r "$THEME_SOURCE_DIR"/* /usr/share/plymouth/themes/omarell/

  # Check if the theme is already set
  current_theme=$(readlink /etc/alternatives/default.plymouth 2>/dev/null)
  if [[ "$current_theme" != *"omarell"* ]]; then
    # Install the theme as an alternative
    sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/omarell/omarell.plymouth 100

    # Set it as the default
    sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/omarell/omarell.plymouth
  fi
fi

if [ ! -f /etc/systemd/system/plymouth-quit.service.d/wait-for-graphical.conf ]; then
  # Make plymouth remain until graphical.target
  sudo mkdir -p /etc/systemd/system/plymouth-quit.service.d
  sudo tee /etc/systemd/system/plymouth-quit.service.d/wait-for-graphical.conf <<'EOF'
[Unit]
After=multi-user.target
EOF
fi

# Mask plymouth-quit-wait.service only if not already masked
if ! systemctl is-enabled plymouth-quit-wait.service | grep -q masked; then
  sudo systemctl mask plymouth-quit-wait.service
  sudo systemctl daemon-reload
fi

# Final initramfs update to ensure all Plymouth changes are applied
sudo update-initramfs -u