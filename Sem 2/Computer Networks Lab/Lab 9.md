1. confidentiality
2. 

Caesar cipher

1. Substitute - shift key = 3  ABC converted to DEF

   a. Symmetric - DES, AES

   b. Asymmetric - RSA

3. Transposition


### **Encryption**
```java
import java.util.*;

public class Encryption { //to keep track of index
    public static final String alpha = "abcdefghijklmnopqrstuvwxyz";

    public static String encrypt(String message, int shiftkey) {
        message = message.toLowerCase();
        String cipherText = "";
        for (int ii = 0; ii < message.length(); ii++) {
            int charPosition = alpha.indexOf(message.charAt(ii));
            int keyVal = (shiftkey + charPosition) % 26;
            char replaceVal = alpha.charAt(keyVal);
            cipherText += replaceVal;
        }
        return cipherText;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String message = new String();
        int key = 0;
        System.out.print("Enter the String for Encryption: ");
        message = sc.next();
        System.out.println("Enter Shift Key: ");
        key= sc.nextInt();
        System.out.println("Encrpyted msg: " + encrypt(message, key));
        sc.close();
    }
}
```

### **Output**
```bash
Enter the String for Encryption: aaaaa
Enter Shift Key: 
3
Encrpyted msg: ddddd
```


### **Decryption**
```java
import java.util.*;

public class Decryption { //to keep track of index
    public static final String ALPHABET = "abcdefghijklmnopqrstuvwxyz";

    public static String decrypt(String cipherText, int shiftKey) {
        cipherText = cipherText.toLowerCase();
        String message = "";
        for (int ii = 0; ii < cipherText.length(); ii++) {
            int charPosition = ALPHABET.indexOf(cipherText.charAt(ii));
            int keyval = (charPosition - shiftKey) % 26;
            if (keyval< 0) 
                keyval = ALPHABET.length() + keyval;
            char replaceval = ALPHABET.charAt(keyval);
            message += replaceval;
        }
        return message;
    } 

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String message = new String();
        int key = 0;
        System.out.print("Enter the String for Encryption: ");
        message = sc.next();
        System.out.println("Enter Shift Key: ");
        key = sc.nextInt();
        //System.out.println("\nEncrpyted msg:"+encrypt(message, key));
        System.out.println("Decrypted Message:" + decrypt (message, key));
        sc.close();
    }
}
```

### **Output**
```bash
Enter the String for Encryption: ddddd
Enter Shift Key: 3
Decrypted Message:aaaaa
```

### **Transposition**
### **Encryption**
```java
package cnlab;
import java.util.*;
public class tencrpt {
    public static String encrypt(String message,int key){
        StringBuilder column[]=new StringBuilder[key];
        for(int i=0;i<key;i++){
            column[i]=new StringBuilder();
        }
        for(int i=0;i<message.length();i++){
            int col=i%key;
            column[col].append(message.charAt(i));
        }
        StringBuilder cipher=new StringBuilder();
        for(StringBuilder col:column){
            cipher.append(col);
        }
        return cipher.toString();
    }
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the message: ");
        String text=sc.nextLine();
        System.out.println("Enter key: ");
        int key=sc.nextInt();
        System.out.println("Encrypted text is : "+ encrypt(text,key));
    }
}
```

### **Decryption**
```java
package cnlab;
import java.util.Scanner;

public class tdecrypt {
    public static String decrypt(String message, int key) {
        int numRow = (int) Math.ceil((double) message.length() / key);
        int numFullCol = message.length() % key;
        char[][] grid = new char[numRow][key];
        int index = 0;

        for (int i = 0; i < key; i++) {
            int currColLen = (i < numFullCol || numFullCol == 0) ? numRow : numRow - 1;
            for (int j = 0; j < currColLen && index < message.length(); j++) {
                grid[j][i] = message.charAt(index++);  // ✅ fix is here: grid[row][col]
            }
        }

        StringBuilder plainText = new StringBuilder();
        for (int i = 0; i < numRow; i++) {
            for (int j = 0; j < key; j++) {
                if (grid[i][j] != 0) {
                    plainText.append(grid[i][j]);
                }
            }
        }
        return plainText.toString();
    }

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the cipher text: ");
        String cipher = sc.nextLine();
        System.out.println("Enter the key: ");
        int key = sc.nextInt();
        System.out.println("Decrypted message is: " + decrypt(cipher, key));
    }
}



