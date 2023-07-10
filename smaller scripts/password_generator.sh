#!/bin/sh

read -p "Enter the length of a password: [16] " length
length=${length:-16}

while [ $length -lt 4 ]; do
  read -p "Password will be too weak (at least 4 characters): " length
done

upp=$(tr -dc 'A-Z' </dev/urandom | head -c $(($length/4 + 1)))
low=$(tr -dc 'a-z' </dev/urandom | head -c $(($length/4 + 1)))
dig=$(tr -dc '0-9' </dev/urandom | head -c $(($length/4 + 1)))
spe=$(tr -dc '!?!@#$%*' </dev/urandom | head -c $(($length/4 + 1)))

PASSWORD=$(echo "$upp$low$dig$spe" | fold -w1 | shuf | tr -d '\n' | head -c $length)

echo $PASSWORD | sed 's/./*/g'

read -p "Do you want to see your password [y, n]?:  [n]" is_visible
is_visible=${is_visible:-n}

if [ $is_visible = 'y' ]; then
  echo $PASSWORD
fi

read -p "Do you want to save your password [y, n]?: [y] " is_save
is_save=${is_save:=y}

if [ $is_save = 'y' ]; then
  echo $PASSWORD >> file
fi
