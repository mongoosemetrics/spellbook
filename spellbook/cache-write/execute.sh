#!/bin/bash
me=cache-write
if [ $# != 2 ]; then
  spellbook help $me
  exit 1
fi
key=$1
value=$2
cache_directory=.cache
if [ ! -d $cache_directory ]; then
  mkdir $cache_directory
fi
echo $value > $cache_directory/$key
exit 0