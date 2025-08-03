#!/bin/bash
# =======================================================
# My Personal Setup Script for SteamOS
# =======================================================

echo "Starting setup..."

# The directory where this script is located (i.e., your Git repo folder)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# The target directory for most configuration files
CONFIG_DIR="$HOME/.config"

# --- Step 1: Create symbolic links for configuration files ---
echo "Linking configuration files..."

# Panels, Desktops, etc.
ln -sf "$SCRIPT_DIR/plasma-org.kde.plasma.desktop-appletsrc" "$CONFIG_DIR/plasma-org.kde.plasma.desktop-appletsrc"

# Global settings (colors, fonts) - add the file to the repo first!
# ln -sf "$SCRIPT_DIR/kdeglobals" "$CONFIG_DIR/kdeglobals"

# Window Manager settings - add the file to the repo first!
# ln -sf "$SCRIPT_DIR/kwinrc" "$CONFIG_DIR/kwinrc"

# --- Step 2: Reminder for manual steps ---
echo "-----------------------------------------------------------"
echo "MANUAL STEPS REQUIRED:"
echo "1. Restart Plasma or log out and back in."
echo "2. Install the 'Control Centre 6' widget."
echo "-----------------------------------------------------------"


echo "Setup script finished!"
