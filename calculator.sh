#!/bin/bash

read -p "Enter first number:" num1
read -p "Choose operation type{1:add, 2:substract, 3:multiply, 4:divide}: " choice
read -p "Enter second number:" num2

SUM=$(($num1+$num2))
SUB=$(($num1-$num2))
MUL=$(($num1*$num2))
DIV=$(($num1/$num2))

if [ $choice  == 1 ]; then
  echo result is: $SUM
elif [ $choice == 2 ]; then
  echo result is: $SUB
elif [ $choice == 3 ]; then
  echo result is: $MUL
elif [ $choice == 4 ]; then
  echo result is: $DIV
else
  echo Your pick is out of range. Calculator will be terminated.
fi
