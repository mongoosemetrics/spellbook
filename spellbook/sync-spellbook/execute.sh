#!/bin/bash

# Grab the current directory
current_directory=`pwd`

# Hop into the git directory for the spellbook project
cd ~/Workspace/spellbook

# Copy the spells from the project spellbook to my hidden personal spellbook
cp -r spellbook/* ~/.spellbook/

# Go back to the previous directory
cd $current_directory
