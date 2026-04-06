#!/bin/bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "unknown"')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // ""')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory to ~
home="$HOME"
short_cwd="${cwd/#$home/\~}"

# Shorten path like fish's prompt_pwd: abbreviate all but last component
abbreviated=""
IFS='/' read -ra parts <<< "$short_cwd"
last_index=$(( ${#parts[@]} - 1 ))
for i in "${!parts[@]}"; do
  part="${parts[$i]}"
  if [ $i -eq $last_index ]; then
    abbreviated="${abbreviated}${part}"
  elif [ $i -eq 0 ] && [ -z "$part" ]; then
    # absolute path starts with /
    abbreviated="/"
  elif [ "${part:0:1}" = "~" ]; then
    abbreviated="${part}"
  else
    abbreviated="${abbreviated}${part:0:1}/"
  fi
done

# Get git branch (skip lock to avoid blocking)
branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null)

# Get hostname
host=$(hostname -s)

# Build output
out="[${model}] ${host} ${abbreviated}"
[ -n "$branch" ] && out="${out} (${branch})"
[ -n "$used" ] && out="${out} $(printf '%.0f' "$used")% context"

echo "$out"
