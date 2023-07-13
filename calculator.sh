#!/usr/bin/env bash

read -p "Choose operation type{1:add, 2:substract, 3:multiply, 4:divide}: " choice
read -p "Enter first number:" num1
read -p "Enter second number:" num2

case $choice in
  1) echo "result is: $((num1+num2))";;
  2) echo "result is: $((num1-num2))";;
  3) echo "result is: $((num1*num2))";;
  4) echo "result is: $(echo "scale=2; $num1/$num2" | bc)";;
  *) echo "Your pick is out of range. Calculator will be terminated." && exit 1;;
esac
