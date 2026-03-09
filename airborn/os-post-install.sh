#!/bin/bash

# BoundZero OS Post install script
# (Run this after installing BoundZero to install extra useful programs)

set -exuo pipefail

sudo dpkg -i /var/tmp/windscribe*.deb
sudo apt update
sudo apt upgrade

echo
echo "POST INSTALL SUCCESSFUL! :D"
echo "(Removing links to script in 3 seconds...)"

sleep 3
echo

sudo rm "/etc/skel/Documents/os-post-install.sh" || true
sudo rm "$HOME/Documents/os-post-install.sh" || true