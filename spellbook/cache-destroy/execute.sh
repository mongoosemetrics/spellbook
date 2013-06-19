#!/bin/bash
me=cache-destroy
if [ $# != 1 ]; then
  spellbook help $me
  exit 1
fi
key=$1
cache_directory=.cache
if [ ! -f $cache_directory/$key ]; then
  exit 0
fi
rm $cache_directory/$key
if [ ! "$(ls -A $cache_directory)" ]; then
  rmdir $cache_directory
fi
exit 0
