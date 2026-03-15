#!/bin/bash

### BoundZero OS Main install script
### (Ran when creating the Installation Media in the Cubic Shell)

set -exuo pipefail

copy_files_preserve_dirs () {
    local source_dir="$1"
    local dest_dir="$2"

    sudo mkdir -p "$dest_dir"

    find "$source_dir" -type f | while read -r file; do
        
        relative_path="$(realpath -s --relative-to="$source_dir" "$file")"
        dest_file="$dest_dir/$relative_path"
        
        dest_dir_path="$(dirname "$dest_file")"
        sudo mkdir -p "$dest_dir_path"
        
        sudo cp "$file" "$dest_file"
        echo "Copied: $relative_path"
    done

    echo "Copy complete!"
}


OS_RELEASE="airborn"
OS_VERSION="0.3.2"
OS_NAME="BoundZero OS \"${OS_RELEASE^}\" v$OS_VERSION"

BZ_TOOLSET_INSTALL_DIR="/opt/boundzero"

git clone https://github.com/boundzero-org/bz-tools.git "$BZ_TOOLSET_INSTALL_DIR/bz-tools" || true
git clone https://github.com/boundzero-org/bz-install.git "$BZ_TOOLSET_INSTALL_DIR/bz-install" || true



copy_files_preserve_dirs "$BZ_TOOLSET_INSTALL_DIR/bz-install/$OS_RELEASE/os" /

sudo ln -s "$BZ_TOOLSET_INSTALL_DIR/bz-install/$OS_RELEASE/os-post-install.sh" "/etc/skel/Desktop/"

sed "s/\[OS_NAME\]/$OS_NAME/g" /etc/skel/Desktop/README.txt > tmpfile.txt
mv tmpfile.txt /etc/skel/Desktop/README.txt
