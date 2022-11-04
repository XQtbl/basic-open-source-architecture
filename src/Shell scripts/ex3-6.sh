#!/bin/bash
for i in $(seq 0 4); do
  file_names="$file_names file${i}.txt"
done

if [ ! -d $1 ]; then
  mkdir $1
fi

cd $1

for fname in $file_names; do
  touch $fname
done

mkdir files

tar -cf files/files.tar $file_names

cd files
tar -xf files.tar
