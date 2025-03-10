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




