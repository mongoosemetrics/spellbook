#!/bin/bash

# If no arguments were passed in
if [ "$#" == "0" ]; then
    # Display the usage instructions for this script, then stop
    echo "Usage: spellbook remove-campaign-audio-file [campaign name]"
    exit 1
fi

# Grab the name of the audio file we are looking for
audio_file=$1

# Grab the list of the legacy www servers
www_servers=`spellbook get-legacy-www-servers`

# Loop over each of the web servers
for server in $www_servers; do
    # Log on and remove the audio file from the www server
    ssh root@$server 'rm -f /var/www/html/www.mongoosemetrics.com/sounds/'$audio_file'*'
    ssh root@$server 'rm -f /var/www/html/www.mongoosemetrics.com/sounds-source/'$audio_file'*'
done

# Grab the list of switch servers
switch_servers=`spellbook get-switch-servers`

# Loop over each of the switches
for server in $switch_servers; do
    # Log on and remove the audio file from the current switch
    ssh root@$server 'rm -f /var/lib/asterisk/sounds/'$audio_file'*'
done

