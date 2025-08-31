#!/bin/bash
# =======================================================
# My Personal Setup Script for SteamOS
# =======================================================

echo "Starting setup..."

# --- Step 1: Ensure Google Chrome is installed ---
echo "Checking for Google Chrome..."
if ! flatpak list | grep -q "com.google.Chrome"; then
    echo "Google Chrome not found. Installing automatically..."
    flatpak install -y flathub com.google.Chrome
    echo "Google Chrome installation complete."
else
    echo "Google Chrome is already installed."
fi


# --- Step 2: Create Symbolic Links ---
echo "Linking configuration files..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
CONFIG_DIR="$HOME/.config"

ln -sf "$SCRIPT_DIR/plasma-org.kde.plasma.desktop-appletsrc" "$CONFIG_DIR/plasma-org.kde.plasma.desktop-appletsrc"


# --- Step 3: Finalizing Setup ---
echo "-----------------------------------------------------------"
echo "Setup script finished."
echo "A system reboot is recommended to ensure all changes are applied correctly."

read -p "Do you want to reboot now? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Rebooting in 5 seconds... (You may be asked for your sudo password)"
    sleep 5
    sudo reboot
fi

echo "All done. Please reboot manually if you haven't."
