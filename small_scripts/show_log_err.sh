#!/usr/bin/env bash

# Script that displays the number of failed login attempts by IP address and location.

limit=10

if [[ ! -e "$1" ]]
then
  echo "Cannot open log file: $1" >&2
  exit 1
fi

cat $1 | grep 'Failed' | awk '{print $(NF-3)}' | sort -r | uniq -c | while read count IP; do
  if [ $count -gt $limit ]; then
    location=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
    echo "$count":"$IP":$location
  fi
done
