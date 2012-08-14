#!/bin/bash
# Script to allow human readable editing of redis data.
# By Ken Mitchner

if [ $# -lt 1 ] ; then
    spellbook help redis-vim
    exit 1
fi
KEY=$1

TMPFILE=$(mktemp /tmp/XXXXXXXXXX.js)

redis-cli -h r1-dev get $1 >$TMPFILE
sed -i -e 's/{/{\n/g;s/}/\n}/g;s/,/,\n/g;' $TMPFILE
vim -c 'argdo execute "normal gg=G" | update' $TMPFILE
sed -i -e 's/^[ \t]*//g;' $TMPFILE
VALUE=$( cat $TMPFILE | tr -d "\n" )
echo
# Bash automatically escapes data in an environment variable.
# I output the sample to reflect how bash escapes it's data.
echo $VALUE | sed -e 's/"/\\"/g;s/$/"/g;s/^/"/g'
echo
echo -n "Send these changes to redis? (y/n): "
read N
if [[ "$N" =~ ^[yY]([eE][sS])?$ ]] ; then
    redis-cli -h r1-dev set $KEY $VALUE
fi 
rm $TMPFILE
