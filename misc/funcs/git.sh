#!/bin/bash

get_branch_name() {
	echo $(git rev-parse --abbrev-ref HEAD)
}

delete_upstream_branch() {
	branch=$1
	gum confirm "Are you sure you want to delete the branch: $branch?" && git push origin --delete $branch
}

set_and_push_upstream() {
	branch=$(get_branch_name)
	output=$(git push --set-upstream origin $branch)

	# Run git pull and capture the output
	output=$(git pull)

	# Define a regular expression to match the GitHub URL
	regex='https:\/\/github.com\/.*\/pull\/new\/.*'

	# Extract the URL from the output using the regular expression
	if [[ $output =~ $regex ]]; then
		url="${BASH_REMATCH[0]}"
		gum confirm "Open $url in the browser?" && open $url
	else
		echo "Could not find GitHub pull request URL in git pull output"
	fi
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

delete_all_but_master_and_current_branch() {
	# TODO: dont just use 'master'
	gb | grep -v 'master\|\*' | xargs git branch -D
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
