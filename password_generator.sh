#!/bin/sh

read -p "Enter the length of a password (preffered 16): " length

while [ $length -lt 4 ]; do
  read -p "Password will be too weak (at least 4 characters): " length
done


upp=$(tr -dc 'A-Z' </dev/urandom | head -c $(($length/4 + 1)))
low=$(tr -dc 'a-z' </dev/urandom | head -c $(($length/4 + 1)))
dig=$(tr -dc '0-9' </dev/urandom | head -c $(($length/4 + 1)))
spe=$(tr -dc '!?!@#$%*' </dev/urandom | head -c $(($length/4 + 1)))

echo "$upp$low$dig$spe$res" | sed 's/./&\n/g' | shuf | tr -d '\n' | head -c $length
