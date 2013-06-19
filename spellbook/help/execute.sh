#!/bin/bash
me=help
if [ $# == 0 ]; then
  spellbook help $me; exit 1
fi
name=$1
actual_spellbook_directories=`spellbook get-actual-spellbook-directories`
for current_spellbook_directory in $actual_spellbook_directories; do
  help_filename=$current_spellbook_directory"/"$name"/HELP"
  if [ -f $help_filename ]; then
    cat $help_filename
    exit 0
  fi
done
echo "No help file found for $name."
exit 1
