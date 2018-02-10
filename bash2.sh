#!/bin/bash

n=$1
dict=$2
echo n=$n
my_random_n_letter_word=$(cat $dict | egrep "^.{$n}$" | head -1)

echo $my_random_n_letter_word
export my_random_n_letter_word

./bash1.sh
