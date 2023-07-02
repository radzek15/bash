#!/bin/bash

# Welcome message
echo Hello this is basic math calculator
#Pick your choice
echo -e " What do you want to do? {1:add, 2:substract, 3:multiply, 4:divide}"

#creating a choice
read choice
read -p "Enter first number:" num1
read -p "Enter second number:" num2
((sum=$num1+num2))
((sub=$num1-num2))
((mul=$num1*num2))
((div=$num1/num2))
if [ $choice  == 1 ]
then
echo result is: $sum
elif [ $choice == 2 ]
then
echo result is: $sub
elif [ $choice == 3 ]
then
echo result is: $mul
elif [ $choice == 4 ]
then
echo result is: $div
else
echo Your pick is out of range. Calculator will be terminated.
fi
