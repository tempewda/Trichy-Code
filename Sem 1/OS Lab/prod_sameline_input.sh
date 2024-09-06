#! /bin/ssh
# Sum of 2 numbers

read -p "Enter 2 numbers: " a b
#read a b
c=`expr $a \* $b`
#c=$(( a+b ))
echo "Product: $c"
echo "Script ended"
