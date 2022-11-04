#!/bin/bash
if [ -z $1 ]; then
  iter_cnt=10
else
  iter_cnt=$1
fi

for i in $(seq 1 $iter_cnt); do
  echo hello world
done
