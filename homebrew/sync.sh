#!/bin/bash
set -uo pipefail

SCRIPT_PATH=$(dirname "$(realpath "$0")")
MANIFEST_FILE=$SCRIPT_PATH/plugins.txt

BREW_ACTION_INSTALL="install"
BREW_ACTION_UNINSTALL="uninstall"

log() {
	gum log --structured --level info "$1"
}

substitute_newline_with_space() {
	echo "$1" | tr '\n' ' ' | sed 's/ $/\n/'
}

get_installed_plugins() {
	brew list -1 --full-name | sort
}

update_manifest() {
	log "Updating manifest file..."
	new_manifest=$(get_installed_plugins)
	echo "$new_manifest" >"$MANIFEST_FILE"
}

manage_plugins() {
	action=$1
	plugins=$2

	log "Checking plugins to $action..."

	if [ "$plugins" == "" ]; then
		return
	fi

	fmted_plugins=$(substitute_newline_with_space "$plugins")

	# shellcheck disable=2086
	# TODO: pass in function, not brew arg
	gum confirm "Are you sure you want to ${action} these plugins?" && brew $action $fmted_plugins
}

installed_plugins=$(get_installed_plugins)
plugins_to_remove=$(echo "$installed_plugins" | comm -23 - <(sort "$MANIFEST_FILE"))
plugins_to_install=$(echo "$installed_plugins" | comm -13 - <(sort "$MANIFEST_FILE"))

manage_plugins $BREW_ACTION_UNINSTALL "$plugins_to_remove"
manage_plugins $BREW_ACTION_INSTALL "$plugins_to_install"

update_manifest
