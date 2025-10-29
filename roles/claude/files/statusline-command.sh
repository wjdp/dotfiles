#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract current directory from JSON input
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

# Change to the working directory
cd "$cwd" 2>/dev/null || cd ~

# Colors (using printf for portability)
cyan=$(printf '\033[36m')
green=$(printf '\033[32m')
brown=$(printf '\033[33m')
red=$(printf '\033[31m')
blue=$(printf '\033[34m')
yellow=$(printf '\033[33m')
gray=$(printf '\033[90m')
normal=$(printf '\033[0m')

# Build left prompt
left_prompt=""

# Current directory
if [ -d .git ] || git rev-parse --git-dir >/dev/null 2>&1; then
    # In a git repo - show relative path from repo root
    root_folder=$(git rev-parse --show-toplevel 2>/dev/null)
    if [ -n "$root_folder" ]; then
        parent_root_folder=$(dirname "$root_folder")
        display_path=$(echo "$PWD" | sed -e "s|$parent_root_folder/||")
    else
        display_path=$(basename "$PWD")
    fi
    left_prompt="${brown}${display_path}${normal}"
    
    # Git branch (skip optional locks for safety)
    branch=$(GIT_OPTIONAL_LOCKS=0 git symbolic-ref --short HEAD 2>/dev/null || GIT_OPTIONAL_LOCKS=0 git show-ref --head -s --abbrev | head -n1 2>/dev/null)
    if [ -n "$branch" ]; then
        left_prompt="${left_prompt} ${green} ${branch}${normal} "
        
        # Git status (skip optional locks)
        if ! GIT_OPTIONAL_LOCKS=0 git diff-index --cached --quiet HEAD -- >/dev/null 2>&1 || ! GIT_OPTIONAL_LOCKS=0 git diff --no-ext-diff --quiet --exit-code >/dev/null 2>&1; then
            # Dirty
            left_prompt="${left_prompt}δ"
        else
            # Check ahead/behind
            commit_count=$(GIT_OPTIONAL_LOCKS=0 git rev-list --count --left-right "@{upstream}...HEAD" 2>/dev/null)
            if [ -n "$commit_count" ]; then
                behind=$(echo "$commit_count" | cut -f1)
                ahead=$(echo "$commit_count" | cut -f2)
                if [ "$behind" != "0" ] && [ "$ahead" != "0" ]; then
                    left_prompt="${left_prompt}⥄ "
                elif [ "$behind" != "0" ]; then
                    left_prompt="${left_prompt}-"
                elif [ "$ahead" != "0" ]; then
                    left_prompt="${left_prompt}+"
                fi
            fi
        fi
    fi
else
    # Not in a git repo - just show current directory
    display_path=$(basename "$PWD")
    left_prompt="${brown}${display_path}${normal}"
fi

# Build right prompt
right_prompt=""

# AWS Vault
if [ -n "$AWS_VAULT" ]; then
    vault_name=$(basename "$AWS_VAULT")
    right_prompt="${right_prompt}${yellow} ${vault_name} ${normal} "
fi

# Python virtual environment
if [ -n "$VIRTUAL_ENV" ]; then
    venv_name=$(basename "$VIRTUAL_ENV")
    py_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))' 2>/dev/null || echo "")
    if [ -n "$py_version" ]; then
        right_prompt="${right_prompt}${blue} ${venv_name}@${py_version} ${normal} "
    else
        right_prompt="${right_prompt}${blue} ${venv_name} ${normal} "
    fi
fi

# Time
time_str=$(date "+%H:%M:%S")
right_prompt="${right_prompt}${gray}${time_str}${normal}"

# Combine left and right prompts
echo "${left_prompt} ${right_prompt}"
