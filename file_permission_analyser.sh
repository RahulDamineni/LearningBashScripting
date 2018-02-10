#!/bin/bash

if [ $# != 1 ]
then
  echo Usage: my_script.sh /path/to/file

else
  file=$1

  if [ -s $file ] && [ -r $file ]
  then
    echo File: $file has some content and is readable

  else
    echo File: $file is either not readable or has no content in it

  fi

fi
