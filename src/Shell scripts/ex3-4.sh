#!/bin/bash
echo '리눅스가 재미있나요? (yes / no)'
read input
case $input in
[Yy]*)
  echo yes;;
[Nn]*)
  echo no;;
*)
  echo 'yes or no로 입력해주세요.';;
esac
