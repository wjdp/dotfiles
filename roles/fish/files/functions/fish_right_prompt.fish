function fish_right_prompt
  set -l last_command_status $status

  if set -q AWS_VAULT
    echo -n -s " "
    echo -n -s (set_color -b yellow black) "  " (basename "$AWS_VAULT") " " (set_color normal) " "
  end
  if set -q VIRTUAL_ENV
    echo -n -s " "
    echo -n -s (set_color -b blue white) "  " (basename "$VIRTUAL_ENV") " " (set_color normal) " "
  end
  if test $last_command_status != 0
    echo -n -s " "
    echo -n -s (set_color -b red white) " $last_command_status " (set_color normal) " "
  end
  set_color 474747
  date "+%H:%M:%S"
  set_color normal
end
