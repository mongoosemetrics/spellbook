#!/bin/bash
me=serverdb-multitailgrep
if [ $# != 5 ]; then
  spellbook help $me; exit 1
fi
category=$1
environment=$2
username=$3
filename=$4
search=$5
sshpids=""
remotecommand='"tail -f '$filename' | grep '$search'"'
for hostname in `spellbook serverdb-list $category $environment`
do
  ssh "$username"@"$hostname" $remotecommand &
  sshpids="$sshpids $!"
done
sleep 10
kill $sshpids
