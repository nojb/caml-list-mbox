#/bin/bash

set -ex

BASE=http://download.gmane.org/gmane.comp.lang.caml.inria
STEP=4000

c=0
done=0

while [[ $done -ne 1 ]]; do
    i=$(($c * $STEP))
    j=$(($i + $STEP))
    file="caml-list-$(printf '%02d' $c)-$i-$j.mbox"
    wget -O $file $BASE/$i/$j
    c=$(($c + 1))
    if [[ -s $file ]]; then
        done=0
    else
        rm -f $file
        done=1
    fi
done

cat caml-list-*-*-*.mbox > caml-list.mbox
