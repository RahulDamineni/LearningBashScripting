#!/bin/bash


if [ $# -le 1 ]
then
  echo Usage: my_script.sh num1 num2
  echo Supplied only $# arguments...
else
  num1=$1
  num2=$2
fi


if [ $num1 -ge $num2 ]
then
  echo Greater of two numbers is $num1
else
  echo Greater of two numbers is $num2
fi
