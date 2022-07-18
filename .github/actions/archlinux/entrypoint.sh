#!/bin/bash
listDir(){
    echo $1
    ls -lAh $1
}
set -ex
pacman-key --init
pacman -Syu --noconfirm --noprogressbar --ignore linux --ignore linux-firmwre --needed base-devel devtools dbus sudo python-pip

#pip install -q pacrepo-cli
#pacrepo-cli add --siglevel "Optional TrustAll" jckimble https://github.com/jckimble/pkgbuilds/releases/download/repository
#pip uninstall -q --yes pacrepo-cli
#pacman -Sy

dbus-uuidgen --ensure=/etc/machine-id

groupadd -f -r wheel

useradd -m -G wheel -s /bin/bash build

echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel
og=$(stat -c '%u:%g' .)
od=$(pwd)
chown -R build: .
cd $1
sudo -u build --preserve-env=PACKAGER $2
cd "$od"
chown -R "$og" .