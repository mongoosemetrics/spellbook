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
sed -i -e 's/^"//g;s/"$//g;s/\\//g;s/{/{\n/g;s/}/\n}/g;s/,/,\n/g;' $TMPFILE
vim -c 'argdo execute "normal gg=G" | update' $TMPFILE
sed -i -e 's/^[ \t]*//g;s/"/\\"/g' $TMPFILE
VALUE=$( printf '"' ; cat $TMPFILE | tr -d "\n" ; printf '"' )
echo
echo $VALUE
echo
echo -n "Send these changes to redis? (y/n): "
read N
if [[ "$N" =~ ^[yY]([eE][sS])?$ ]] ; then
    redis-cli -h r1-dev set $KEY $VALUE
fi 
rm $TMPFILE
