# My SteamOS Setup Configuration

This repository contains all my personal configuration files and an automated setup script to restore my customized KDE Plasma desktop on a fresh SteamOS installation.

---
## Fresh Install Checklist

Follow these steps in order after a fresh installation of SteamOS.

### 1. Switch to Desktop Mode
First, boot into Desktop Mode to access the full desktop environment.

### 2. Set a Sudo Password
The `deck` user needs a password to perform administrative tasks. Open a terminal (`Konsole`) and set a password:
```bash
passwd
```
Enter your desired password twice.

### 3. Install Git
Git is not installed by default. To install it, you need to disable the read-only filesystem and initialize the pacman keyring first.
```bash
# Disable read-only mode (enter your sudo password)
sudo steamos-readonly disable

# Initialize the pacman keyring
sudo pacman-key --init
sudo pacman-key --populate

# Install Git
sudo pacman -S --noconfirm git
```

### 4. Configure Git & GitHub Authentication
First, tell Git who you are:
```bash
git config --global user.name "YourName"
git config --global user.email "your.email@example.com"
```
Then, set up an SSH key for passwordless authentication with GitHub. This is the recommended method.
```bash
# Create a new SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Display the public key to copy it
cat ~/.ssh/id_ed25519.pub
```
Copy the public key and add it to your GitHub account under **Settings > SSH and GPG keys > New SSH key**.

### 5. Clone This Repository
Now you can clone your configuration repository.
```bash
git clone git@github.com:DrNeumi/steam-os-config.git
```
Navigate into the directory:
```bash
cd steam-os-config
```

### 6. Run the Setup Script
The final step is to execute the setup script, which will create all symbolic links and apply your custom configuration.
```bash
chmod +x setup.sh
./setup.sh
```
After the script is finished, follow the manual steps it prompts, like restarting the Plasma shell. Your desktop is now fully restored!
