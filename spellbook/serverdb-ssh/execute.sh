#!/bin/bash
me=serverdb-ssh
if [ $# != 2 ]; then
  spellbook help $me; exit 1
fi
category=$1
environment=$2
ssh -A `spellbook serverdb-list $category $environment`
