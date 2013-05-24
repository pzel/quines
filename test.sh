#!/bin/sh
cmp_buf=./quine_cmp
cmp_buf2=./quine_cmp2

test_q() {
  lang=$1
  $lang quine.$lang > $cmp_buf
  ($lang quine.$lang | $lang )  > $cmp_buf2
  diff $cmp_buf $cmp_buf2
  if [ 0 -eq $(($?)) ]; then
      echo $lang quine is a quine.
  else
      echo $lang quine is not quite a quine.
  fi
}

test_q "lua"
test_q "ruby"
rm -rf $cmp_buf $cmp_buf2
