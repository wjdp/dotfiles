function fish_greeting
    if not set -q fish_greeting
        set -l line Welcome to (set_color 86d0d1)fish(set_color normal), the friendly interactive shell
        set -g fish_greeting "$line"
    end

    if set -q fish_private_mode
        set -l line (set_color purple)fish is running in private mode,(set_color normal) history will not be persisted.
        set -g fish_greeting $line
    end

    # The greeting used to be skipped when fish_greeting was empty (not just undefined)
    # Keep it that way to not print superfluous newlines on old configuration
    test -n "$fish_greeting"
    and echo $fish_greeting
end

