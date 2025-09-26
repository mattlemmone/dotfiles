#!/bin/bash

delete_upstream_branch() {
  branch=$1
  gum confirm "Are you sure you want to delete the branch: $branch?" && git push origin --delete "$branch"
}

oopsies() {
  git reset --hard
}

crebase() {
  git add . && git rebase --continue
}

arebase() {
  git rebase --abort
}

delete_all_but_main_master_and_current_branch() {
  gb | grep -v 'main\|master\|\*' | xargs git branch -D
}

gbi() {
  local branch=$(gb | grep -v '*' | fzf)
  gc "$branch"
}

cmt() {
  git add . && git commit -m "$1"
}

checkout_pr() {
  gh pr checkout "$1"
}

reset_file_to_master() {
  git checkout master -- "$1"
}

summarize_pr_changes() {
  local main_branch=$1

  if [ -z "$main_branch" ]; then
    echo "Target branch name is required."
    return 1
  fi

  local prompt="summarize file changes for a PR description: major changes broken into a few categories/sections. write it in a human-like way, make it concise, use only lowercase. include major changes only. avoid unnecessary details. use easy and approachable language. make the changes sound reasonable. your response must use extremely simple formatting because i will paste it to GitHub. only markdown headers, hyphens and single spaces. no centering or rich formatting. use backticks for file/method etc names."

  gd "$main_branch" | sgpt --model gpt-4o "$prompt" | pbcopy
}

cmt_and_push() {
  git add . && git commit -m "$1" && git push
}
