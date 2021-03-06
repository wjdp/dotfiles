# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

LOG="$HOME/.profile-invocations"
echo "-----" >>$LOG
echo "Caller: $0" >>$LOG
echo "DESKTOP_SESSION: $DESKTOP_SESSION" >>$LOG
echo "GDMSESSION: $GDMSESSION" >>$LOG
echo "SSH_AUTH_SOCK: $GNOME_KEYRING_CONTROL" >>$LOG
echo "SSH_AUTH_SOCK: $SSH_AUTH_SOCK" >>$LOG
echo "SSH_AUTH_SOCK: $GPG_AGENT_INFO" >>$LOG

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"


export TERMINAL="alacritty"

export PATH="$HOME/.poetry/bin:$PATH"
source "$HOME/.cargo/env"

export HASS_SERVER=https://ha.pimblett.me.uk
export HASS_TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI0NTY2YWRmMjE1Y2U0ZDFjYmYzMjAzOGVmOTljNGEyNSIsImlhdCI6MTYxMTc3MDQ2NiwiZXhwIjoxOTI3MTMwNDY2fQ.CM5M3XEI4CZs0k0vZpGSg9Z57R9HD0pXGYaz1l7zHDM
