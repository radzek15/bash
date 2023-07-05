#!/bin/bash

echo "Firstly ensure that you have super user privilages."

generate_password() {

    upp=$(tr -dc 'A-Z' </dev/urandom | head -c 4)
    low=$(tr -dc 'a-z' </dev/urandom | head -c 4)
    dig=$(tr -dc '0-9' </dev/urandom | head -c 4)
    spe=$(tr -dc '!?!@#$%*' </dev/urandom | head -c 4)

    PASSWORD=$(echo "$upp$low$dig$spe" | fold -w1 | shuf | tr -d '\n' | head -c 16)
    echo $PASSWORD
}

read -p "How many users you want to add: " add_num

for (( i = 1; i <= $add_num; i++ )); do
  password=$(generate_password)
  read -p "Enter username #$i you want to create: " user_add
  adduser $user_add --disabled-password --gecos ""
  echo "$user_add:$password" | chpasswd
  echo "User: $user_add, password: $password" >> new_users
done

echo "All information about created accounts you can find in file new_users in your current directory"

read -p "How many users you want to delete: " del_num
for (( i = 1; i <= $del_num; i++ )); do
  read -p "Enter username #$i you want to remove: " user_del
  deluser $user_del
  read -e -i 'y' -p "Do you want to delete his/her home directory: " del_home
  if [ $del_home == 'y' ]; then
    rm -r /home/$user_del
  fi
done
