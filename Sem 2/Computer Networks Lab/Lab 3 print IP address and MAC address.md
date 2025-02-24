### Aim
Java program to print IP address and MAC address

### Code
``` java
// Java program to print ip address and MAC address
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;

public class IPAndMACAddress {
  public static void main(String[] args) {
    try {
      // Get the local host
      InetAddress ip = InetAddress.getLocalHost();
      System.out.println("IP Address: " + ip.getHostAddress());

      // Get the network interface for the IP address
      NetworkInterface network = NetworkInterface.getByInetAddress(ip);

      if (network != null) {
        // Get the MAC address
        byte[] mac = network.getHardwareAddress();

        if (mac != null) {
          System.out.println("MAC Address: ");
          for (int i = 0; i < mac.length; i++) {
            // Convert the MAC address bytes to hexadecimal
            System.out.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : "");
          }
          System.out.println();
        } else {
          System.out.println("MAC Address not available.");
        }
      } else {
        System.out.println("Network Interface not found.");
      }
    } catch (UnknownHostException e) {
      System.out.println("Error fetching IP address: " + e.getMessage());
    } catch (SocketException e) {
      System.out.println("Error fetching MAC address: " + e.getMessage());
    }
  }
}
```

### Sample Output
``` bash
D:\JAVA>javac IPAndMACAddress.java

D:\JAVA>java IPAndMACAddress
IP Address: 10.1.26.152
MAC Address:
4C-D7-17-8D-93-FE
```
