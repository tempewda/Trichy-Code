### Aim
Program to generate randomized MAC Address and IP Address

### Code

``` java
// JAVA program to generate random MAC Address and IP Address
import java.util.Random;

public class RandomAddressGenerator {

  public static void main (String[] args) {
    String randomMac = generateRandomMacAddress();
    String randomIp = generateRandomIpAddress();

    System.out.println("Random MAC Address: " + randomMac);
    System.out.println("Random IP Address: " + randomIp);
  }

  private static String generateRandomMacAddress() {
    Random rand = new Random();
    byte[] macAddr = new byte[6]; // why 6???
    rand.nextBytes(macAddr);

    // Set the locally adminiestered address bit
    macAddr[0] = (byte) (macAddr[0] & (byte) 254);
    StringBuilder macAddress = new StringBuilder(18); // why 18???
    for (byte b : macAddr) {
      if (macAddress.length() > 0) {
        macAddress.append(":");
      }
      macAddress.append(String.format("%02x", b));
    }
    return macAddress.toString();
  }

  private static String generateRandomIpAddress() {
    Random rand = new Random();
    return rand.nextInt(256) + "." + rand.nextInt(256) + "." + rand.nextInt(256) + "." + rand.nextInt(256);
  }
}
```

### Output
``` bash
D:\JAVA>javac RandomAddressGenerator.java

D:\JAVA>java RandomAddressGenerator
Random MAC Address: e0:bd:b8:f1:6b:3c
Random IP Address: 68.200.35.143
```
