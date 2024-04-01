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

checkout_pr(){
 gh pr checkout "$1"
}
