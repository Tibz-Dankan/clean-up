#!/bin/bash
# Safe Kali cleanup script

echo "Starting safe cleanup..."

# Package management
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

# Safe cache clearing
sudo rm -rf /var/cache/apt/archives/*.deb
rm -rf ~/.cache/thumbnails/*
rm -rf ~/.cache/mozilla/*

# Temporary files (only safe locations)
sudo find /tmp -type f -atime +7 -delete 2>/dev/null
sudo find /var/tmp -type f -atime +7 -delete 2>/dev/null

# Journal logs (keep last 3 days)
sudo journalctl --vacuum-time=3d

echo "Cleanup completed safely!"

# Run script instructions
# chmod +x cleanup.sh  # Make executable
# ./cleanup.sh  # Run the script