#!/bin/bash

for val in {1..10}
do
  if (($val % 2 == 0))
  then
    echo $val: Even
  else
    echo $val: Odd
  fi
done
