1. confidentiality
2. 

Caesar cipher

1. Substitute - shift key = 3  ABC converted to DEF

   a. Symmetric - DES, AES

   b. Asymmetric - RSA

3. Transposition


Encryption 
```java
import java.io.*;

import java.util.*;

public class Encription { //to keep track of index

public static final String alpha "abcdefghijklmnopqrstuvwxyz";

public static String encrypt(String message, int shiftkey) {

message message.toLowerCase();

String cipherText = "";

for (int ii = 0; ii message.length(); ii++) {

int charPosition alpha.indexOf(message.charAt(ii));

int keyVal (shiftKey + charPosition) % 26;

char replaceVal alpha.charAt(keyVal);

cipherText += replaceVal;

}

return cipherText;

}

public static void main(String[] args) {

Scanner sc = new Scanner(System.in);

String message new String();

int key = 0;

System.out.print("Enter the String for Encryption:");

message sc.next();

System.out.println("\n\nEnter Shift Key:");

key= sc.nextInt();

System.out.println("\nEncrpyted msg:" + encrypt(message, key));

}//main method ends

}//Solution Class End
```

Decryption 
```java
import java.io.*;

import java.util.*;

public class Decryption { //to keep track of index

public static final String ALPHABET = "abcdefghijklmnopqrstuvwxyz";

public static String decrypt(String cipherText, int shiftKey) {

cipherText = cipherText.toLowerCase();

String message = "";

for (int ii = 0; 11 < cipherText.length(); i++) {

int charPosition ALPHABET.indexOf(cipherText.charAt(ii));

int keyval (charPosition shiftkey) % 26;

if (keyVal< 0) {

keyVal ALPHABET.length() + keyval;

} char replaceval ALPHABET.charAt(keyVal);

message + replaceval;

}

return message;

} public static void main(String[] args) {

Scanner sc = new Scanner(System.in);

String message = new String();

int key 0;

System.out.print("Enter the String for Encryption:");

message sc.next();

System.out.println("\n\nEnter Shift Key:");

key sc.nextInt();

//System.out.println("\nEncrpyted msg:"+encrypt(message, key));

System.out.println("\nDecrypted Message:" + decrypt (message, key));
```




