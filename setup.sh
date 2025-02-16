#!/bin/bash

# Function to display messages in a user-friendly way
function log_message {
    echo -e "\n\033[1;32m$1\033[0m\n"
}

# Ask for the new user's username
read -p "Enter a username for the new user: " NEW_USER

# Ask for the new user's password
read -sp "Enter a password for the new user: " NEW_PASSWORD
echo

# Update and upgrade the system
log_message "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Install XFCE Desktop Environment
log_message "Installing XFCE Desktop Environment..."
sudo apt install xfce4 xfce4-goodies -y

# Install XRDP for remote desktop access
log_message "Installing XRDP..."
sudo apt install xrdp -y

# Configure XRDP to use XFCE
log_message "Configuring XRDP to use XFCE..."
echo "startxfce4" | sudo tee -a /etc/xrdp/startwm.sh > /dev/null

# Restart XRDP service
log_message "Restarting XRDP service..."
sudo systemctl restart xrdp

# Allow XRDP through the firewall
log_message "Allowing XRDP through the firewall..."
sudo ufw allow 3389/tcp

# Install Firefox
log_message "Installing Firefox..."
sudo apt install firefox -y

# Install Transmission (BitTorrent client)
log_message "Installing Transmission..."
sudo apt install transmission-gtk -y

# Create a new user with the provided username and password
log_message "Creating a new user: $NEW_USER..."
sudo adduser --quiet --disabled-password --gecos "" $NEW_USER
echo "$NEW_USER:$NEW_PASSWORD" | sudo chpasswd

# Add the new user to the sudo group
sudo usermod -aG sudo $NEW_USER

# Set XFCE as the default session for the new user
log_message "Setting XFCE as the default session for $NEW_USER..."
echo "startxfce4" | sudo tee /home/$NEW_USER/.xsession > /dev/null
sudo chown $NEW_USER:$NEW_USER /home/$NEW_USER/.xsession

# Get the VPS IP address
VPS_IP=$(curl -s ifconfig.me)

# Display login details
log_message "Installation complete!"
echo -e "\033[1;36mLogin Details:\033[0m"
echo -e "IP Address: \033[1;33m$VPS_IP\033[0m"
echo -e "Username: \033[1;33m$NEW_USER\033[0m"
echo -e "Password: \033[1;33m$NEW_PASSWORD\033[0m"
echo -e "\nYou can now connect to your VPS using an RDP client (e.g., Windows Remote Desktop)."
echo -e "Use the IP address above and port \033[1;33m3389\033[0m."
