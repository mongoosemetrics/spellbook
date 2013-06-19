#!/bin/bash
me=cache-read
if [ $# != 1 ]; then
  spellbook help $me
  exit 1
fi
key=$1
cache_directory=.cache
if [ ! -f $cache_directory/$key ]; then
  exit 0
fi
read line < $cache_directory/$key
echo $line
exit 0
