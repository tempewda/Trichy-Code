#! /bin/sh
# Greatest of 3 numbers

read -p "Enter 3 numbers: " a b c
if [ $a -gt $b -a $a -gt $c ]
then
echo "$a is greatest"
elif [ $b -gt $a -a $b -gt $c ]
then
echo "$b is greatest"
elif [ $c -gt $a -a $c -gt $b ]
then
echo "$c is greatest"
else
echo "They are equal"
fi
