# My SteamOS Setup Configuration

This repository provides an automated script to restore my customized KDE Plasma desktop on a fresh SteamOS installation (`>= v3.7.13`).

The process is designed to be as simple as possible. After a fresh install, you only need to perform two steps after reading the important notes below.

---
### ⚠️ Important: What This Script Will Do

This is a fully automated script. Before running it, you should be aware of all the changes it will make to your system:

* **System Timezone:** Sets the system timezone to `Europe/Berlin`.
* **Keyboard Layout:** Sets the default system-wide keyboard layout to **German (DE)**.
* **Default Boot:** Configures the system to boot directly into **Desktop Mode** instead of Gaming Mode.
* **Mouse Settings:** Applies custom mouse sensitivity and acceleration settings.
* **Software Installation:** Installs Google Chrome via Flatpak if it's not already present.
* **Configuration Files:** Copies a predefined set of KDE Plasma configurations for the taskbar, etc.
* **System Reboot:** Automatically reboots the system after a 10-second countdown upon completion.

---
## Setup Instructions

### Step 1: Set a Sudo Password

This is the only required manual step. You will need this password for the script below.

**❗️ SECURITY WARNING (Keyboard Layout):**
The system starts with a default **US keyboard layout**. The script will automatically switch this to **German (DE)**. To avoid password problems after the script has run, please choose a password that is identical on both US and DE layouts (e.g., containing only letters and numbers, and avoiding symbols or the letters Z/Y, which are swapped).

With this in mind, open a terminal (`Konsole`) and set your password:
```bash
passwd
```

### Step 2: Run the Automated Installer

Copy the command below, paste it into your Konsole, and press Enter. It will ask for the password you just set.
```bash
curl -L https://raw.githubusercontent.com/DrNeumi/steam-os-config/main/setup.sh | sudo bash
```
The script will now run automatically. After it is finished, the system will reboot. Your desktop will then be fully restored.
