# Assumes we have ssh-agent running in the background as a systemd service
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket