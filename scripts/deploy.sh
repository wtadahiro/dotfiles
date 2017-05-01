#!/bin/bash

base_path=`pwd`;
ignores=('.' '..' '.git' '.gitignore' '.gitmodules')

isIgnored()
{
  local e
  for e in ${ignores[@]}; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}

for file_path in $base_path/.*; do
  filename=`basename $file_path`
  isIgnored $filename
  if [ $? -eq 1 ]; then
    ln -sf $file_path $HOME/$filename
  fi
done

