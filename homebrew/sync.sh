#!/bin/bash
set -eu

SCRIPT_PATH=$(dirname "$(realpath "$0")")
MANIFEST_FILE=$SCRIPT_PATH/plugins.txt

log() {
	gum log --structured --level info "$1"
}

substitute_newline_with_space() {
	echo "$1" | tr '\n' ' ' | sed 's/ $/\n/'
}

get_installed_plugins() {
	log "Getting installed plugins..."
	brew list -1 --full-name | sort
}

update_manifest() {
	log "Updating manifest file..."
	new_manifest=$(get_installed_plugins)
	echo "$new_manifest" >"$MANIFEST_FILE"
}

remove_plugins() {
	log "Checking plugins to remove..."
	plugins=$1

	if [ "$plugins" == "" ]; then
		echo waaa
		return
	fi

	fmted_to_remove=$(substitute_newline_with_space "$plugins")
	echo "**Plugins to Remove**: $fmted_to_remove" | gum format

	# shellcheck disable=2086
	gum confirm "Are you sure you want to remove these plugins?" && brew uninstall $fmted_to_remove
}

install_plugins() {
	log "Checking plugins to install..."
	plugins=$1

	if [ "$plugins" == "" ]; then
		echo wa
		return
	fi

	fmted_to_install=$(substitute_newline_with_space "$plugins")
	echo "**Plugins to Install**: $fmted_to_install" | gum format

	# shellcheck disable=2086
	gum confirm "Are you sure you want to install these plugins?" && brew install $fmted_to_install
}

installed_plugins=$(get_installed_plugins)
plugins_to_remove=$(echo "$installed_plugins" | comm -23 - <(sort "$MANIFEST_FILE"))
plugins_to_install=$(echo "$installed_plugins" | comm -13 - <(sort "$MANIFEST_FILE"))

remove_plugins "$plugins_to_remove"
install_plugins "$plugins_to_install"

update_manifest
