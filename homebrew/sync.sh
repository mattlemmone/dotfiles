#!/bin/bash
set -eu

manifest_file=./plugins.txt

substitute_newline_with_space() {
  echo "$1" |  tr '\n' ' ' | sed 's/ $/\n/'  
}

get_installed_plugins() {
  brew list -1 --full-name | sort
}

update_manifest() {
  echo Updating manifest file...
  new_manifest=$(get_installed_plugins)
  echo "$new_manifest" > $manifest_file
}

installed_plugins=$(get_installed_plugins)

plugins_to_remove=$(echo "$installed_plugins" | comm -23 - <(sort $manifest_file)) 

if [  "$plugins_to_remove" != "" ]; then
  fmted_to_remove=$(substitute_newline_with_space "$plugins_to_remove")
  echo "Plugins to Remove: $fmted_to_remove"

  # shellcheck disable=2086
  gum confirm "Are you sure you want to remove these plugins?" &&  brew uninstall $fmted_to_remove
fi

plugins_to_install=$(echo "$installed_plugins" | comm -13 - <(sort $manifest_file)) 

if [  "$plugins_to_install" != "" ]; then
  fmted_to_install=$(substitute_newline_with_space "$plugins_to_install")
  echo "Plugins to Install: $fmted_to_install"

    # shellcheck disable=2086
  gum confirm "Are you sure you want to install these plugins?" && brew install $fmted_to_install
fi

update_manifest
