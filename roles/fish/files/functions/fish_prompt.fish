function fish_prompt
  set -l last_command_status $status
  set -l cwd

  if test "$theme_short_path" = 'yes'
    set cwd (basename (prompt_pwd))
  else
    set cwd (prompt_pwd)
  end

  set -l fish     ""
  set -l error    ""
  set -l ahead    ""
  set -l behind   ""
  set -l diverged "⥄ "
  set -l dirty    "δ"
  set -l none     ""

  set -l normal_color     (set_color normal)
  set -l success_color    (set_color 86d0d1)
  set -l error_color      (set_color red --bold)
  set -l directory_color  (set_color $fish_color_quote 2> /dev/null; or set_color brown)
  set -l repository_color (set_color $fish_color_cwd 2> /dev/null; or set_color green)

  if test $last_command_status -eq 0
    echo -n -s $success_color $fish $normal_color
  else
    echo -n -s $error_color $error $normal_color
  end
  
  if git_is_repo
    if test "$theme_short_path" = 'yes'
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

  echo -n -s " "
end