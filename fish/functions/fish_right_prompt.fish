# Defined in /tmp/fish.qN5qkX/fish_right_prompt.fish @ line 2
function fish_right_prompt
  if set -q VIRTUAL_ENV
    echo -n -s " "
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end
  set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
  date "+%H:%M:%S"
  set_color normal
end
