#!/bin/sh

USER_NAME="bootstrap"

# Ensure the script is executed as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root." >&2
    exit 1
fi

# Check if pacman exists
if ! command -v pacman >/dev/null 2>&1; then
    echo "Error: This script is only compatible with Arch Linux or derivatives (pacman required)." >&2
    exit 1
fi

# Create user if it does not exist
if ! id "$USER_NAME" >/dev/null 2>&1; then
    useradd -m "$USER_NAME"
else
    echo "'$USER_NAME' user already exists. You can change its password with 'passwd $USER_NAME' if needed."
fi

# Setup passwordless sudo for the user
echo "Adding $USER_NAME to sudoers"
echo "$USER_NAME ALL = (root) NOPASSWD:ALL" > "/etc/sudoers.d/00_$USER_NAME"
chmod 0440 "/etc/sudoers.d/00_$USER_NAME"

# Install packages
echo "Installing required packages"
pacman -S --noconfirm python3 python-pip python-netaddr openssh

# Enable and start sshd
echo "Starting SSH"
systemctl enable sshd
systemctl start sshd

# The end
echo "Finished!"
echo "Please set a password for the '$USER_NAME' user with 'passwd $USER_NAME'"
echo "Make sure to delete the $USER_NAME user after bootstrapping with 'userdel -r $USER_NAME'"