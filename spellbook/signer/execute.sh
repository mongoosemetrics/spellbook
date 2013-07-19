#!/bin/bash
me=signer
if [ $# != 2 ]; then
  spellbook help $me; exit 1
fi
hash=$1
json=$2
mydir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $json | php $mydir/signer.php $hash
