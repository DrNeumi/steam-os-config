#!/bin/bash
# =======================================================
# My Personal Setup Script for SteamOS >= SteamOS 3.7.13
# Executable via: curl -L URL | sudo bash
# =======================================================

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Preparation ---
# Define colors for output
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "Starting fully automated setup..."

# This script must be run via sudo, but we need the regular user's name and home directory
THE_USER="deck"
CONFIG_DIR="/home/$THE_USER/.config"
DESKTOP_DIR="/home/$THE_USER/Desktop"
REPO_BASE_URL="https://raw.githubusercontent.com/DrNeumi/steam-os-config/main"

# --- Step 1: Prepare System ---
echo "Disabling read-only mode..."
sudo steamos-readonly disable

# --- Step 2: System Configuration ---
echo "Configuring system settings (Timezone, Boot Mode)..."
sudo timedatectl set-timezone "Europe/Berlin"
sudo sed -i 's/Session=gamescope-wayland.desktop/Session=plasmax11.desktop/g' /etc/sddm.conf.d/zz-steamos-autologin.conf

# --- Step 3: Ensure Google Chrome is installed ---
echo "Checking for Google Chrome..."
if ! flatpak list | grep -q "com.google.Chrome"; then
    echo "Google Chrome not found. Installing automatically..."
    flatpak install -y flathub com.google.Chrome
    echo "Google Chrome installation complete."
else
    echo "Google Chrome is already installed."
fi

# --- Step 4: Download and Copy User Configs ---
echo "Downloading and applying user configuration files..."

# Ensure the target directory exists and is owned by the user
mkdir -p "$CONFIG_DIR"
chown $THE_USER:$THE_USER "$CONFIG_DIR"

# Download config files directly to the final destination AS THE USER
# This prevents permission issues with root-owned files in the user's home dir.
sudo -u $THE_USER curl -Lo "$CONFIG_DIR/plasma-org.kde.plasma.desktop-appletsrc" "$REPO_BASE_URL/plasma-org.kde.plasma.desktop-appletsrc"
sudo -u $THE_USER curl -Lo "$CONFIG_DIR/kxkbrc" "$REPO_BASE_URL/kxkbrc"
sudo -u $THE_USER curl -Lo "$CONFIG_DIR/kcminputrc" "$REPO_BASE_URL/kcminputrc"
sudo -u $THE_USER curl -Lo "$CONFIG_DIR/plasmashellrc" "$REPO_BASE_URL/plasmashellrc"
echo "Configuration files applied."

# --- Step 5: Hide Default Desktop Icons ---
echo "Hiding default desktop icons..."

# Hide Steam and Return to Gaming Mode icons by renaming them with a leading dot.
# This is a non-destructive way to clean up the desktop.
if [ -f "$DESKTOP_DIR/steam.desktop" ]; then
    mv "$DESKTOP_DIR/steam.desktop" "$DESKTOP_DIR/.steam.desktop"
fi
if [ -f "$DESKTOP_DIR/Return.desktop" ]; then
    mv "$DESKTOP_DIR/Return.desktop" "$DESKTOP_DIR/.Return.desktop"
fi

# --- Step 6: Finalize and Reboot ---
echo "Re-enabling read-only mode..."
sudo steamos-readonly enable

echo "-----------------------------------------------------------"
echo "SETUP COMPLETE! A system reboot is required."
echo "Press Ctrl+C to cancel the automatic reboot."
echo

# Countdown from 15 seconds
for (( i=15; i>0; i-- )); do
    printf "\r${YELLOW}Rebooting in %2d seconds...${NC}" "$i"
    sleep 1
done

reboot
