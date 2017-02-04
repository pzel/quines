#!/bin/sh
scheme() {
    csi -p "`cat $1`"
}

test_q() {
  lang=$1
  src=$(cat $lang.quine)
  res1=$($lang $lang.quine)
  if [ "$src" = "$res1" ]; 
  then echo "$lang: ✔"
  else echo "\n$lang source:"; echo "$src"
       echo "\n$lang output:"; echo "$res1"
       exit 1
  fi
}

for lang in `ls *.quine`; do
    test_q `basename $lang .quine`
done
