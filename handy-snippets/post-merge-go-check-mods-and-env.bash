#!/bin/sh

diffCmd="git diff --name-only HEAD@{1} HEAD --"

printf "%-30s\n" " --------------------------------------------------- "
printf "%-30s\n" "| Checking if changes require additional actions... |"
printf "%-30s\n" " --------------------------------------------------- "

files=(.env.tpl .env.secrets.tpl go.mod go.sum)

for file in "${files[@]}"; do
  if eval "$diffCmd | grep -q '$file'"; then
    printf "%-30s %-10s\n" "$file" "❗- Additional action maybe required"
    git --no-pager log -p -1 $file
  else
    printf "%-30s %-10s\n" "$file" "✅ - No additional action required"
  fi
done
