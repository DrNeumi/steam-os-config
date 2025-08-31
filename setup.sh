#!/bin/bash
# =======================================================
# My Personal Setup Script for SteamOS >= SteamOS 3.7.13
# =======================================================

echo "Starting setup..."

# --- Step 1: System Configuration ---
echo "Configuring system settings (Timezone, Boot Mode)..."
sudo timedatectl set-timezone "Europe/Berlin"
sudo sed -i 's/Session=gamescope-wayland.desktop/Session=plasmax11.desktop/g' /etc/sddm.conf.d/zz-steamos-autologin.conf

# --- Step 2: Ensure Google Chrome is installed ---
echo "Checking for Google Chrome..."
if ! flatpak list | grep -q "com.google.Chrome"; then
    echo "Google Chrome not found. Installing automatically..."
    flatpak install -y flathub com.google.Chrome
    echo "Google Chrome installation complete."
else
    echo "Google Chrome is already installed."
fi


# --- Step 3: Create Symbolic Links ---
echo "Linking configuration files..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
CONFIG_DIR="$HOME/.config"

ln -sf "$SCRIPT_DIR/plasma-org.kde.plasma.desktop-appletsrc" "$CONFIG_DIR/plasma-org.kde.plasma.desktop-appletsrc"
ln -sf "$SCRIPT_DIR/kxkbrc" "$CONFIG_DIR/kxkbrc"
ln -sf "$SCRIPT_DIR/kcminputrc" "$CONFIG_DIR/kcminputrc"

echo "Setup script finished."
