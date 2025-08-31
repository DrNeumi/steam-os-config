# My SteamOS Setup Configuration

This repository contains my personal configuration files and an automated script to restore my customized KDE Plasma desktop on a fresh SteamOS installation (`>= v3.7.13`).

The process is designed to be as simple as possible. After a fresh install, you only need to perform two steps.

---
## Setup Instructions

### Step 1: Set a Sudo Password (Manual Prerequisite)

This is the only manual step you need to perform first. The `deck` user needs a password for administrative tasks. Open a terminal (`Konsole`) and set a password:
```bash
passwd
```
Enter your desired password twice.

### 3. Run the Automated Setup (One-Shot Command)
Copy the entire code block below, paste it into your Konsole, and press Enter. You will be asked for your password once at the beginning. The command will then prepare the system, clone the repository, run the setup script, and clean up after itself.
```bash
# 0. Go to a safe directory
cd ~ && \

# 1. Prepare System by disabling read-only and installing Git
sudo steamos-readonly disable && \
sudo pacman-key --init && \
sudo pacman-key --populate && \
sudo pacman -S --noconfirm git && \

# 2. Clone Repository and run setup
git clone [https://github.com/DrNeumi/steam-os-config.git](https://github.com/DrNeumi/steam-os-config.git) && \
cd steam-os-config && \
chmod +x setup.sh && \
./setup.sh && \

# 3. Finalize and clean up
cd .. && \
sudo steamos-readonly enable && \
rm -rf steam-os-config && \

# 4. Force Reboot
echo "-----------------------------------------------------------" && \
echo "SETUP COMPLETE! The system is now protected again." && \
echo "A system reboot is required to apply all changes." && \
echo "The system will automatically reboot in 10 seconds." && \
echo "Press Ctrl+C to cancel the reboot." && \
sleep 10 && \
sudo reboot
```
After the reboot, your desktop will be fully restored with all your custom settings.
