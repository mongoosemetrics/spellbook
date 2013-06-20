#!/bin/bash
me=serverdb-add
if [ $# != 3 ]; then
  spellbook help $me; exit 1
fi
category=$1
environment=$2
hostname=$3
if [ ! -f ~/.serverdb ]; then
  spellbook serverdb-reset
fi
sqlite3 ~/.serverdb "insert into servers values('$category', '$environment', '$hostname')"
