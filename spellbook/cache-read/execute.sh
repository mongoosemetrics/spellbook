#!/bin/bash

# If no arguments were passed in
if [ "$#" == "0" ]; then
    # Display the usage instructions for this script, then stop
    echo "Usage: spellbook cache-read [key]"
    exit 1
fi

# Grab the key of the cache entry we are looking for
key=$1

# Determine what the cache directory should be
cache_directory=.cache

# If the cache file does not exist
if [ ! -f $cache_directory/$key ]; then
    # Halt execution
    exit 0
fi

# If we made it down here, it means we think the file exists, so attempt to
# read the first line from it
read line < $cache_directory/$key

# Echo the line we just read
echo $line

# Halt execution
exit 0
