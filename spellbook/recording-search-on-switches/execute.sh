#!/bin/bash

# If no arguments were passed in
if [ "$#" == "0" ]; then
    # Display the usage instructions for this script, then stop
    echo "Usage: spellbook recording-search-on-switches [code]"
    exit 1
fi

# Grab the code of the file we are looking for
code=$1

# Define the list of switch servers
servers=`spellbook get-switch-servers`

# Loop over all of the files in the current directory
for server in $servers; do
    # Display the current hostname
    echo $server
    # Display the result of 'df -h' on the current host
    ssh root@$server 'ls /recordings/'$code'*'
done
