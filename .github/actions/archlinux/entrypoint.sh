#!/bin/bash
set -ex
pacman-key --init
pacman -Syuq --noconfirm --noprogressbar --ignore linux --ignore linux-firmware --needed

og=$(stat -c '%u:%g' .)
od=$(pwd)
chown -R build: .

if [ ! -z "${SECRET}" ]; then
openssl aes-256-cbc -d -a -pbkdf2 -in ${GPGKEY} -pass pass:${SECRET} | sudo -u build gpg --import
unset GPGKEY
unset SECRET
fi

cd $1
shift
sudo -u build --preserve-env=PACKAGER $@

cd "$od"
chown -R "$og" .