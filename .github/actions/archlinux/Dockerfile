FROM archlinux:base-devel

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

RUN pacman -Syuq --noconfirm  --noprogressbar --ignore linux --ignore linux-firmwre --needed base-devel devtools dbus sudo && rm -rf /var/cache/pacman/pkg/* /var/lib/pacman/sync/*

RUN dbus-uuidgen --ensure=/etc/machine-id && groupadd -f -r wheel && useradd -m -G wheel -s /bin/bash build && (echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel)

ENTRYPOINT ["/entrypoint.sh"]