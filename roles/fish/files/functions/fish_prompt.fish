set NVM_DEFAULT (nvm current)

function left_prompt
  set -l cwd

  if test "$theme_short_path" = yes
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish ""
  set -l error ""
  set -l ahead ""
  set -l behind ""
  set -l diverged "⥄ "
  set -l dirty δ
  set -l none ""

  set -l normal_color (set_color normal)
  set -l success_color (set_color 86d0d1)
  set -l error_color (set_color red --bold)
  set -l directory_color (set_color $fish_color_quote 2> /dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd 2> /dev/null; or set_color green)

  if test $last_command_status -eq 0
    echo -n -s $success_color $fish $normal_color
  else
    echo -n -s $error_color $error $normal_color
  end

  if git_is_repo
    if test "$theme_short_path" = yes
      set root_folder (command git rev-parse --show-toplevel 2> /dev/null)
      set parent_root_folder (dirname $root_folder)
      set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    end

    echo -n -s " " $directory_color $cwd $normal_color
    echo -n -s " " $repository_color " " (git_branch_name) $normal_color " "

    if git_is_touched
      echo -n -s $dirty
    else
      echo -n -s (git_ahead $ahead $behind $diverged $none)
    end
  else
    echo -n -s " " $directory_color $cwd $normal_color
  end
end

function right_prompt
  set -l py_version (python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')
  set -l node_version (nvm current)

  set -l python_colour (set_color -b 0070B1 white)
  set -l node_colour (set_color -b 4d7c31 white)

  if set -q AWS_VAULT
    echo -n -s (set_color -b yellow black) "  " (basename "$AWS_VAULT") " " (set_color normal) " "
  end

  if set -q VIRTUAL_ENV
    echo -n -s $python_colour "  " (basename "$VIRTUAL_ENV")@$py_version" " (set_color normal) " "
  end

  if test $node_version != $NVM_DEFAULT
    echo -n -s $node_colour "  " $node_version" " (set_color normal) " "
  end

  if test $last_command_status != 0
    echo -n -s (set_color -b red white) " $last_command_status " (set_color normal) " "
  end

  set_color 474747
  date "+%H:%M:%S"
  set_color normal
end

function padding
  set -l space ""
  for i in (seq 1 $argv[1])
    set space " "$space
  end
  set_color -b black
  printf $space
  set_color normal
end

function remove_color
  printf $argv | perl -pe 's/\x1b.*?[mGKH]//g'
end

function fish_prompt
  set -g last_command_status $status
  set -l left (left_prompt)
  set -l right (right_prompt)
  # set -g paddding (padding (math $COLUMNS - (remove_color "$left$right" | string length)))
  # set -l cols (math $COLUMNS - (remove_color "$left$right" | string length))
  printf "\n"
  printf "$left $right"
  printf "\n "
end
