ghprc() {
  branch_name=`git branch --show-current`
  pr_prefix=`echo ${branch_name} | awk '{i=match($0, /^PR-[0-9]*/); print substr($0, i, RLENGTH)}'`
  pr_title=`echo ${branch_name} | awk '{i=match($0, /^PR-[0-9]*/); title=substr($0, RLENGTH+2); gsub(/-/, " ", title); print title}'`
  compiled_title="${pr_prefix}: ${pr_title}"

  if [ -n "$pr_prefix" ]; then
    gh pr create --title ${compiled_title}
  else
    echo "No PR prefix found in the branch name"
  fi
}
