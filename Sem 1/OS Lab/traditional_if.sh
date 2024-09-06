#! /bin/sh
# Simple if

read -p "Enter 2 values: " a b
if test $a -gt $b
then
echo "$a -is greater"
else
echo "$b -is greater"
echo "Script ended"
fi
