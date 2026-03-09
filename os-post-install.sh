#!/bin/bash

# BoundZero OS Post install script
# (Run this after installing BoundZero to install extra useful programs)

set -exuo pipefail

sudo dpkg -i /var/tmp/windscribe*.deb
sudo apt update
sudo apt upgrade

echo
echo "POST INSTALL SUCCESSFUL! :D"
echo
