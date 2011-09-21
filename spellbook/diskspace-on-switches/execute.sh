#!/bin/bash

# Define the list of switch servers
servers=`spellbook get-switch-servers`

# Loop over all of the files in the current directory
for server in $servers; do
    # Display the current hostname
    echo $server
    # Display the result of 'df -h' on the current host
    ssh root@$server 'df -h'
done
