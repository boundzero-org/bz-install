#!/bin/bash

### BoundZero OS Main install script
### (Ran when creating the Installation Media in the Cubic Shell)

set -exuo pipefail

BZ_TOOLSET_INSTALL_DIR="/opt/boundzero"
OS_RELEASE="airborn"

git clone https://github.com/boundzero-org/bz-tools.git $BZ_TOOLSET_INSTALL_DIR/bz-tools || true
git clone https://github.com/boundzero-org/bz-install.git $BZ_TOOLSET_INSTALL_DIR/bz-install || true

cd /etc/skel
mkdir Documents || true

sudo ln -s $BZ_TOOLSET_INSTALL_DIR/bz-install/$OS_RELEASE/os-post-install.sh Documents/
