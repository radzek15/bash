#!/bin/bash
# BASH script which checks for a given file existence then printing all the locations of the given file name.

echo "If you want to know the exact location of a file, ensure that you have super user privilages."


if [ $# -eq 0 ]; then
  echo "Nothing to find"
else
  file=$(find / -name "$1" 2>/dev/null)
  if [ -n "$file" ]; then
    echo "Found $1."
    echo -e "Locations of a file(s):\n$(find / -name $1)"
  else
    echo "Can't find $1"
  fi
fi
