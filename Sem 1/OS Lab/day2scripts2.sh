205124100@labca-026:~$ nano sum.sh
205124100@labca-026:~$ sh sum.sh
Enter 2 numbers:
2 3
Sum: 5
Script ended
205124100@labca-026:~$ nano sum.sh
205124100@labca-026:~$ 205124100@labca-026:~$
205124100@labca-026:~$ sh sum.sh
Enter 2 numbers:
2 4
expr: syntax error: unexpected argument ‘a.out’
Product:
Script ended
205124100@labca-026:~$ nano sum.sh
205124100@labca-026:~$ sh sum.sh
Enter 2 numbers:
2 4
Product: 8
Script ended
205124100@labca-026:~$ sh sum.sh
Enter 2 numbers:
24 5
Product: 120
Script ended
205124100@labca-026:~$ cat sum.sh
#! /bin/ssh
# Sum of 2 numbers

echo "Enter 2 numbers: "
read a b
c=`expr $a \* $b`
#c=$(( a+b ))
echo "Product: $c"
echo "Script ended"
205124100@labca-026:~$ nano sum.sh
205124100@labca-026:~$ sh sum.sh
Enter 2 numbers: 3 6
Product: 18
Script ended
205124100@labca-026:~$ cat sum.sh
#! /bin/ssh
# Sum of 2 numbers

read -p "Enter 2 numbers: " a b
#read a b
c=`expr $a \* $b`
#c=$(( a+b ))
echo "Product: $c"
echo "Script ended"
205124100@labca-026:~$ nano iftest.sh
205124100@labca-026:~$ 205124100@labca-026:~$
205124100@labca-026:~$ cat iftest.sh
#! /bin/sh
# Simple if

read -p "Enter 2 values: " a b
if [ $a -gt $b ]
then
echo "$a -is greater"
else
echo "$b -is greater"
echo "Script ended"
fi
205124100@labca-026:~$ sh iftest.sh
Enter 2 values: 13 15
15 -is greater
Script ended
205124100@labca-026:~$ sh iftest.sh
Enter 2 values: 51 55
55 -is greater
Script ended
205124100@labca-026:~$ nano iftest.sh
205124100@labca-026:~$ sh iftest.sh
Enter 2 values: 33 66
66 -is greater
Script ended
205124100@labca-026:~$ cat iftest.sh
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
205124100@labca-026:~$ nano greatest.sh
205124100@labca-026:~$ sh greatest.sh
Enter 3 numbers: 2 3 4
4 is greatest
205124100@labca-026:~$ sh greatest.sh
Enter 3 numbers: 5 3 3
5 is greatest
205124100@labca-026:~$ sh greatest.sh
Enter 3 numbers: 77 77 77
They are equal
205124100@labca-026:~$ cat greatest.sh
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

205124100@labca-026:~$ nano cprocess.c
205124100@labca-026:~$ nano forktest.c
205124100@labca-026:~$ cc forktest.c
forktest.c: In function ‘main’:
forktest.c:6:9: warning: implicit declaration of function ‘fork’ [-Wimplicit-function-declaration]
    6 |         fork();
      |         ^~~~
205124100@labca-026:~$ ./a.out
Hello Children
Hello Children
Hello Children
Hello Children
205124100@labca-026:~$ nano forktest.c
205124100@labca-026:~$ cc forktest.c
forktest.c: In function ‘main’:
forktest.c:6:9: warning: implicit declaration of function ‘fork’ [-Wimplicit-function-declaration]
    6 |         fork();
      |         ^~~~
205124100@labca-026:~$ ./a.out
Hello Children
Hello Children
Hello Children
Hello Children
Hello Children
Hello Children
Hello Children
Hello Children
205124100@labca-026:~$ cat forktest.c
#include <stdio.h>
#include<stdlib.h>

int main()
{
        fork();
        fork();
        fork();
        printf("Hello Children\n");

        return 0;
}
