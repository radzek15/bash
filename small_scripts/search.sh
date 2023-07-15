#!/usr/bin/env bash

# BASH script which checks for a given file existence then printing all the locations of the given file name.

redirect=false

while getopts "r" option ; do
  case $option in
    r) redirect=true;;
    ?) echo "Invalid option" && exit 1;;
  esac
done
shift $((OPTIND - 1))

if [ $# -eq 0 ]; then
  echo "Nothing to find"
else
  file=$(locate -r '\'"$1"'$')
  count=$(locate -r '\'"$1"'$' | wc -l)
  if [ -n "$file" ]; then
    echo "Found $1 $count time(s)"
    echo -e "Locations of a file(s):\n$file"
  else
    echo "Can't find $1"
  fi
fi

if $redirect && ((count == 1)); then
  cd "$(locate -r '\'"$1"'$')"
fi