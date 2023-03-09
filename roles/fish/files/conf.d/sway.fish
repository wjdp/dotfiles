# As fish is the login shell we can set global environment variables here

set -gx SDL_VIDEODRIVER wayland
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx QT_QPA_PLATFORM wayland
set -gx XDG_CURRENT_DESKTOP sway
set -gx XDG_SESSION_DESKTOP sway
