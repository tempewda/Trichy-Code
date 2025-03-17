DES

PT = 64

K = 56

AES

PT = 128

### **RSA**
```java
import java.math.*; 

public class RSA { 
    public static int getGCD(int mod, int num) { 
        // If the mod is zero, return the num 
        if (mod == 0) 
            return num; 
        else 
            // recursive function call 
            return getGCD(num % mod, mod); 
    } 


    public static void main(String args[]) { 
        int d = 0, e; // Initialization 
        int message = 32; // number message 
        int prime1 = 17; // 1st prime number p 
        int prime2 = 11; // 2nd prime number q 
        int primeMul = prime1 * prime2; // performing operations 
        int primeMull = (prime1 - 1) * (prime2 - 1); 
        System.out.println("primeMull is equal to: " + primeMull);
        // Finding the valid public key 
        for (e = 2; e < primeMull; e++) { 
            // Here e is a public key 
            if (getGCD(e, primeMull) == 1)
                break; 
        } 

        // Printing the public key 
        System.out.println("Public key e is = " + e); 
        // Calculating the private key 
        for (int m = 0; m <= 9; m++) { 
            // get the value of temp 
            int temp = 1 + (m* primeMull); 
            // private key 
            if (temp% e == 0) { 
                d = temp/e; 
                break; 
            } 
        } 
        System.out.println("d is: " + d); 
        double cipher; 
        BigInteger d_message; 
        // getting the cipher text 
        cipher = (Math.pow(message, e)) % primeMul; 
        System.out.println("Cipher text is: " + cipher); 
        // Int to BigInteger 
        BigInteger bigN = BigInteger.valueOf(primeMul); 
        // Float to bigINt 
        BigInteger bigC = BigDecimal.valueOf(cipher).toBigInteger(); 
        // decrypting the message 
        d_message = (bigC.pow(d)).mod(bigN); 
        // print decrypted message 
        System.out.println("Decrypted text is: " + d_message); 
    } 
} 
```

### **Output**
```
primeMull is equal to: 160
Public key e is = 3  
d is: 107
Cipher text is: 43.0 
Decrypted text is: 32
```

### **DES**
```java
import javax.crypto.Cipher; 
import javax.crypto.KeyGenerator; 
import javax.crypto.SecretKey; 
import java.util.Base64;

public class DES { 
    public static void main(String[] args) throws Exception { 
        // Step 1: Generate a DES key 
        KeyGenerator keyGenerator = KeyGenerator.getInstance("DES"); 
        SecretKey secretkey = keyGenerator.generateKey(); 

        // Step 2: Create a DES Cipher instance 
        Cipher cipher = Cipher.getInstance("DES"); 
        String plainText = "HelloWorld"; // Message to be encrypted 

        // Step 3: Encrypt the plaintext 
        cipher.init(Cipher.ENCRYPT_MODE, secretkey); 
        byte[] encryptedBytes = cipher.doFinal (plainText.getBytes()); 
        String encryptedText = Base64.getEncoder().encodeToString(encryptedBytes); 
        System.out.println("Encrypted Text: " + encryptedText); 

        // Step 4: Decrypt the ciphertext 
        cipher.init(Cipher.DECRYPT_MODE, secretkey); 
        byte[] decryptedBytes = cipher.doFinal (Base64.getDecoder().decode(encryptedText)); 
        String decryptedText = new String(decryptedBytes); 
        System.out.println("Decrypted Text: " + decryptedText); 
    } 
}
```

### **Output**
```
Encrypted Text: a4vBLS5iiPILwWJddUCijw==
Decrypted Text: HelloWorld
```
