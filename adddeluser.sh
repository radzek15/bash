#!/bin/bash

echo "Firstly ensure that you have super user privilages."
read -p "How many users you want to add: " add_num

for (( i = 1; i <= $add_num; i++ )); do
  read -p "Enter username #$i you want to create: " user_add
  adduser $user_add
done

read -p "How many users you want to delete: " del_num
for (( i = 1; i <= $del_num; i++ )); do
  read -p "Enter username #$i you want to remove: " user_del
  deluser $user_del
  read -e -i 'y' -p "Do you want to delete his/her home directory: " del_home
  if [ $del_home == 'y' ]; then
    rm -r /home/$user_del
  fi
done
