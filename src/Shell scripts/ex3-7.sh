#!/bin/bash
for i in $(seq 0 4); do
  file_names="$file_names file${i}"
done

if [ ! -d $1 ]; then
  mkdir $1
fi

cd $1

for fname in $file_names; do
  touch ${fname}.txt
  mkdir $fname
  ln -s ../${fname}.txt $fname/${fname}.txt
done
