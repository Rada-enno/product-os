#!/bin/sh
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')

# Context usage
if [ -n "$used" ]; then
  context_str="ctx: ${used}%"
else
  context_str="ctx: --"
fi

# Current mode (vim or normal)
if [ -n "$vim_mode" ]; then
  mode_str="[$vim_mode]"
else
  mode_str="[INSERT]"
fi

# Git repo name and branch (using cwd from JSON, skip optional locks)
repo_name=""
branch=""
if [ -n "$cwd" ] && [ -d "$cwd/.git" ] || git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
  branch=$(git -C "$cwd" -c gc.auto=0 symbolic-ref --short HEAD 2>/dev/null)
  repo_name=$(basename "$(git -C "$cwd" -c gc.auto=0 rev-parse --show-toplevel 2>/dev/null)")
fi

if [ -n "$repo_name" ] && [ -n "$branch" ]; then
  git_str="$repo_name:$branch"
elif [ -n "$branch" ]; then
  git_str="$branch"
else
  git_str=""
fi

# Assemble status line
if [ -n "$git_str" ]; then
  printf "%s  |  %s  |  %s  |  %s" "$model" "$context_str" "$mode_str" "$git_str"
else
  printf "%s  |  %s  |  %s" "$model" "$context_str" "$mode_str"
fi
