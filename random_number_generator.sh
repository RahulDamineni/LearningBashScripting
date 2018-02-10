#!/bin/bash

echo Usage: my_script.sh \<upper_limit\> \<lower_limit\>

upper_limit=$1
lower_limit=$2

my_random=$RANDOM
len_my_random=${#my_random}
condensed_len=$(($len_my_random - 3))
divisor=10**condensed_len
less_than_cent=$(($my_random % $divisor))

echo $((less_than_cent % upper_limit))
