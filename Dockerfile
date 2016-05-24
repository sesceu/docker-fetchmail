FROM base/archlinux
MAINTAINER Sebastian Schneider <mail@sesc.eu>

# install fetchmail
RUN pacman -Syyu --noconfirm --force --ignore systemd \
    && pacman-db-upgrade \
    && pacman -S fetchmail --noconfirm --ignore systemd \
    && rm -rf /home /srv /mnt /opt /boot /root /tmp/* /var/tmp/

VOLUME ["/data"]
RUN fetchmail -i /data/.fetchids -f /data/.fetchmailrc

