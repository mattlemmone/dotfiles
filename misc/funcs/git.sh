#!/bin/bash

get_branch_name() {
	echo $(git rev-parse --abbrev-ref HEAD)
}

delete_upstream_branch() {
	branch=$1
	gum confirm "Are you sure you want to delete the branch: $branch?" && git push origin --delete $branch
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
	# TODO: dont just use 'master'
	gb | grep -v 'main\|master\|\*' | xargs git branch -D
}

gbi() {
	local branch=$(gb | grep -v '*' | fzf | xargs)
	gc $branch
}

grv() {
	# TODO: dont just use 'master'
	local file=$(git diff master --name-only --relative | fzf --preview "bat --color=always {}")
	git checkout master $file
}

cmt() {
	description=$1
	git add . && git commit -m "$1"
}
