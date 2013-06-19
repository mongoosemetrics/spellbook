#!/bin/bash
me=get-atlas-servers
if [ $# != 1 ]; then
  spellbook help $me; exit 1
fi
case $1 in
  live)
    for i in {1..10}
    do
      echo wc-fb-atlas"$i".sjc.kixeye.com
    done
  ;;
  *)
    spellbook help $me; exit 1
  ;;
esac
