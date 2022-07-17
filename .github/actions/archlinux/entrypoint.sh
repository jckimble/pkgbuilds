#!/bin/bash
set -ex
pacman-key --init
pacman -Syu --noconfirm --ignore linux --ignore linux-firmwre --needed base-devel

groupadd -f -r wheel

useradd -m -G wheel -s /bin/bash build

echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel
og=$(stat -c '%u:%g' .)
chown -R build: .
cd $1
sudo -u build $2
chown -R "$og" .