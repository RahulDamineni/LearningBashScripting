#!/bin/bash

echo $my_random_n_letter_word

echo Script name is $0
echo A total of $# arguments have been passed
echo Frist arg is $1
my_special_arg='Rahul Damineni! '
echo "Last arg is $my_special_arg"

echo "Some random number = $RANDOM"

my_random_word=$(sort -R /usr/share/dict/words | head -1)
echo "Some random word is $my_random_word"
