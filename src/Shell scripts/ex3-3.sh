#!/bin/bash

function my_calc {
  echo "scale=3; $1" | bc
}

height=$(my_calc "$2 / 100")
weight=$1
bmi=$(my_calc "$weight / ( $height * $height )")

if [ $(my_calc "18.5 > $bmi") -ne 0 ]; then
  echo '저체중입니다.'
elif [ $(my_calc "$bmi >= 23") -ne 0 ]; then
  echo '과체중입니다.'
else
  echo '정상체중입니다.'
fi
