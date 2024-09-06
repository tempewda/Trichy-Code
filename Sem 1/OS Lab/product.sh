#! /bin/ssh
# Sum of 2 numbers

echo "Enter 2 numbers: "
read a b
c=`expr $a \* $b`
#c=$(( a+b ))
echo "Product: $c"
echo "Script ended"
