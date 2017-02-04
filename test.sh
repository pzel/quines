#!/bin/sh
scheme() {
    csi -p "`cat $1`"
}

test_q() {
  lang=$1
  src=$(cat quine.$lang)
  res1=$($lang quine.$lang)
  if [ "$src" = "$res1" ]; 
  then echo "$lang: ✔"
  else echo "\n$lang source:"; echo "$src"
       echo "\n$lang output:"; echo "$res1"
       exit 1
  fi
}

for lang in  lua ruby scheme elixir ocaml ; do test_q $lang; done


