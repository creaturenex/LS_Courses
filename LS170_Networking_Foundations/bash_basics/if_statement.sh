#!/bin/bash

int1=1
int2=10

# If statement
if [[ $int1 -lt $int2 ]]
then
  echo $int1 is less than $int2
  echo test 1
fi

# If/Else statement
if [[ $int1 -lt $int2 ]]
then
  echo $int1 is less than $int2
  echo test 2
else
then
  echo $int1 is not less than $int2
fi

#If/elif/else ... notice its elif, not elsif like in Ruby
if [[ $int1 -ge 0 ]]
then
  echo $int1 is equal to or greater than 0
  echo test 3
elif [[ $int1 -gt 0 ]]
then
  echo $int1 is greater than 0
fi
