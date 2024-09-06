#! /bin/ssh
# Sum of 2 numbers

echo "Enter 2 numbers: "  # echo similar to printf in c
read a b  # read similar to scanf in C
c =`expr $a + $b`
echo "Sum: $c"E
echo "Script ended"
