#!/bin/bash
set -ex
pacman-key --init
pacman -Syuq --noconfirm --noprogressbar --ignore linux --ignore linux-firmwre --needed

og=$(stat -c '%u:%g' .)
od=$(pwd)
chown -R build: .
if [ "$2" == "exec" ]; then
    cd $1
    sudo -u build --preserve-env=PACKAGER $3
    cd "$od"
elif [ "$2" == "makepkg" ]; then
    cd $1
    sudo -u build --preserve-env=PACKAGER makepkg -sr -C -c --noconfirm --noprogressbar
    cd "$od"
elif [ "$2" == "repo-add" ]; then
    find $1 -iname *.pkg.tar.zst -exec sudo -u build --preserve-env=PACKAGER repo-add -R -p -q ${3}.db.tar.xz {} \;
fi
chown -R "$og" .