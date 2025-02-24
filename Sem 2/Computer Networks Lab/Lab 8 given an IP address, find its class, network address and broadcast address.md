### Aim
Given an IP address, find its class, network address and broadcast address

### Code
``` java
import java.util.*;
import java.io.*;
import java.net.*;
import java.lang.Math;

class IP { 
    public static int[] bina(String[] str) {
        int re[] = new int[32];
        int a, b, c, d, i, rem;
        a = b = c = d = 1;
        Stack<Integer> st = new Stack<Integer>();
        if (str != null) {
            a = Integer.parseInt(str[0]);
            b = Integer.parseInt(str[1]);
            c = Integer.parseInt(str[2]);
            d = Integer.parseInt(str[3]);
        }

        for (i = 0; i <= 7; ++i) {
            rem = a % 2;
            st.push(rem);
            a = a / 2;
        }

        for (i = 0; i <= 7; ++i) {
            re[i] =  st.pop();
        }
        for (i = 8; i <= 15; ++i) {
            rem =  b % 2;
            st.push(rem);
            b = b / 2;
        }

        for (i = 8; i <= 15; ++i) 
            re[i] = st.pop();

        for (i = 16; i <= 23; ++i) {
            rem = c % 2;
            st.push(rem);
            c = c / 2;
        }

        for (i = 16; i <= 23; ++i)
            re[i] = st.pop();

        for (i = 24; i <= 31; ++i) {
            rem = d % 2;
            st.push(rem);
            d = d / 2;
        }

        for (i = 24; i <= 31; ++i)
            re[i] = st.pop();

        return (re);
    }


    public static char cls(String[] str) {
        int a = Integer.parseInt(str[0]);
        if (a >= 0 && a <= 127)
            return ('A');
        else if ( a>= 128 && a <= 191)
            return ('B');
        else if (a >= 192 && a <= 223)
            return ('C');
        else if (a >= 224 && a <= 239)
            return ('D');
        else    
            return('E');
    }


    public static int[] deci(int[] bi) {
        int[] arr = new int[4];
        int a, b, c, d, i, j;
        a = b = c = d = 0;
        j = 7;
        for (i = 0; i < 8; ++i) {
            a = a + (int)(Math.pow(2, j)) * bi[i];
            j--;
        }
        j = 7;
        for (i = 8; i < 16; i++) {
            b = b + bi[i] * (int)(Math.pow(2, j));
            j--;
        }
        j = 7;
        for (i = 16; i < 24; ++i) {
            c = c + bi[i] * (int)(Math.pow(2, j));
            j--;
        }
        j = 7;
        for (i = 24; i < 32; ++i) {
            d = d + bi[i] * (int)(Math.pow(2, j));
            j--;
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }


    public static void main(String[] args) {
        int i;
        String[] str = new String[4];
        String ipr = "192.168.1.1/24";
        System.out.println("IP addresss CIDR format is:" + ipr);

        String[] str1 = ipr.split("/");
        String tr = str1[0];
        str = tr.split("\\.");
        int[] b = new int[32];
        System.out.println();
        b = bina(str);
        int n = Integer.parseInt(str1[1]);
        int[] ntwk = new int[32];
        int[] brd = new int[32];
        int t = 32 - n;
        for (i = 0; i <= (31 - t); i++) {
            ntwk[i] = b[i];
            brd[i] = b[i];
        }

        for (i = 31; i > (31 - t); --i) {
            ntwk[i] = 0;
        }

        for (i = 31; i  > (31 - t); i--) {
            brd[i] = 1;
        }
        System.out.println();
        char c = cls(str);
        System.out.println("Class: " + c);
        int[] nt = deci(ntwk);
        int[] br = deci(brd);
        System.out.println("Network Address: " + nt[0] + "." + nt[1] + "." + nt[2] + "." + nt[3]);
        System.out.println("Broadcast Address: " + br[0] + "." + br[1] + "." + br[2] + "." + br[3]);
    }
}
```

### Output
```powershell
IP addresss CIDR format is:192.168.1.1/24


Class: C
Network Address: 192.168.1.0    
Broadcast Address: 192.168.1.255


IP addresss CIDR format is:10.0.0.1/8

Class: A
Network Address: 10.0.0.0
Broadcast Address: 10.255.255.255


IP addresss CIDR format is:172.16.5.5/16

Class: B
Network Address: 172.16.0.0
Broadcast Address: 172.16.255.255
```
