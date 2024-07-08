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
  local branch=$1

  if [ -z "$branch" ]; then
    echo "Branch name is required."
    return 1
  fi

  local writing_style="write it like a human. lowercase everything. dont be too in depth unless necessary.dont use terminology that would seem scary or overwhleming otherwise ppl wont review hehe."
  local output_format="format in markdown in a code block cuz ill post to github."
  local prompt="summarize file changes for a PR description. what are the significant, high level changes that devs should know about?  anticipate questions someone would ask in review and factor them into the changelog - dont explicitly call out. no need to list every single change or file unless needed. $writing_style $output_format"

  gd "$branch" | sgpt --model gpt-4o "$prompt"
}
