set -x XDG_CURRENT_DESKTOP GNOME
export (gnome-keyring-daemon -s)
set -x GPG_TTY (tty)
set -x GPGKEY D8FC66D2
