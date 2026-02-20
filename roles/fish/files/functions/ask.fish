function ask
  echo $argv | claude -p "Answer concisely in 1-2 sentences, no formatting, do not try to use tools, just tell the user what to do:" \
      --model sonnet --effort low \
      --disallowedTools Task,TaskOutput,Bash,Glob,Grep,Read,Edit,Write,NotebookEdit,TodoWrite,AskUserQuestion,Skill,EnterPlanMode,ExitPlanMode,TaskStop
end
