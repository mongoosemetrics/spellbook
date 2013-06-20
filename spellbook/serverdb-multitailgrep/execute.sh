#!/bin/bash
me=serverdb-list
if [ $# != 2 ]; then
  spellbook help $me; exit 1
fi
category=$1
environment=$2
if [ ! -f ~/.serverdb ]; then
  spellbook serverdb-reset
fi
sqlite3 ~/.serverdb "select hostname from servers where category='$category' and environment='$environment'"
