#!/bin/bash

int1=1
int2=10

a='Oscar'
b='Romero'
c=''
d='Oscar'

if [[ -n $a ]]
then
  echo "The string ${a} has a length greater than 0, command '-n' used"
fi

if [[ -z $c ]]
then
 echo "The string ${c} has a length of 0, command '-z' used"
fi

if [[ $a = $d ]]
then
  echo "Both string ${a} and ${d} are the same string, command '=' used"
else
  echo "String ${a} and ${d} are not the same string, command '=' used"
fi

if [[ $a != $b ]]
then
 echo "String ${a} and ${b} are not the same string, command '!=' used"
fi

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
