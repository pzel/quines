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

test_q "lua"
test_q "ruby"
test_q "scheme"
test_q "elixir"

