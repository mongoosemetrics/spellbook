#!/bin/bash

# If no arguments were passed in
if [ "$#" != "2" ]; then
    # Display the usage instructions for this script, then stop
    echo "Usage: spellbook cache-write [key] [value]"
    exit 1
fi

# Grab the key of the cache entry we are looking for
key=$1
value=$2

# Determine what the cache directory should be
cache_directory=.cache

# If the cache directory does not exist
if [ ! -d $cache_directory ]; then
    # Create it
    mkdir $cache_directory
fi

# Echo the value into the cache file
echo $value > $cache_directory/$key

# Halt execution
exit 0
