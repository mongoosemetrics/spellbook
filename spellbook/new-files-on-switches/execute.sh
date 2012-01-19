#!/bin/bash

# If no arguments were passed in
if [ "$#" == "0" ]; then
    # Display the usage instructions for this script, then stop
    echo "Usage: spellbook new-files-on-switches [minutes-ago]"
    exit 1
fi

# Grab the number of minutes ago we are looking for
minutes=$1

# Define the list of switch servers
servers=`spellbook get-switch-servers`

# Loop over all of the files in the current directory
for server in $servers; do
    # Display the current hostname
    echo $server
    # Display the result of the find command on the current host
    ssh root@$server 'find /recordings/ -type f -mmin -'$minutes
done
