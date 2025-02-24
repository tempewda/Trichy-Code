### Aim
Java program to print the ARP Table

### Code
``` java
// Lab 4 - JAVA progra to print the ARP Table
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class ARPTablePrinter {
  public static void main(String[] args) {
    try {
      // create process builder to execute the 'arp - a' command
      ProcessBuilder processBuilder = new ProcessBuilder("arp", "-a");
      Process process = processBuilder.start();
  
      // Read the output of the command
      // BufferedReader used to read undefined size input
      BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
      String line;
      while((line = reader.readLine()) != null) {
        System.out.println(line);
      }
  
      // Wait for the process to complete
      int exitCode = process.waitFor();
      if (exitCode != 0) { // exitCode = 0 means no error
        System.err.println("Error: The arp command executed unsuccessfully");
      }
    } catch (IOException | InterruptedException e) {
      e.printStackTrace();
    }
  }
}
```

### Output
``` bash
D:\JAVA>javac ARPTablePrinter.java

D:\JAVA>java ARPTablePrinter

Interface: 192.168.56.1 --- 0x11
  Internet Address      Physical Address      Type
  192.168.56.255        ff-ff-ff-ff-ff-ff     static
  224.0.0.2             01-00-5e-00-00-02     static
  224.0.0.22            01-00-5e-00-00-16     static
  224.0.0.251           01-00-5e-00-00-fb     static
  224.0.0.252           01-00-5e-00-00-fc     static
  239.255.255.250       01-00-5e-7f-ff-fa     static

Interface: 10.1.26.152 --- 0x12
  Internet Address      Physical Address      Type
  10.1.26.1             00-04-96-9b-92-f0     dynamic
  10.1.26.40            4c-d7-17-8d-8d-c1     dynamic
  10.1.26.42            4c-d7-17-8d-87-9f     dynamic
  10.1.26.64            4c-d7-17-8d-85-bc     dynamic
  10.1.26.65            4c-d7-17-8d-98-bb     dynamic
  10.1.26.66            4c-d7-17-8d-8f-db     dynamic
  10.1.26.79            90-b1-1c-96-21-ed     dynamic
  10.1.26.90            4c-d7-17-8d-8e-d0     dynamic
  10.1.26.100           4c-d7-17-8d-8e-8b     dynamic
  10.1.26.106           c8-d3-ff-3f-d9-f6     dynamic
  10.1.26.115           4c-d7-17-8d-93-b5     dynamic
  10.1.26.116           4c-d7-17-8d-8d-29     dynamic
  10.1.26.119           b8-ca-3a-7f-c5-e4     dynamic
  10.1.26.121           90-b1-1c-96-1b-72     dynamic
  10.1.26.122           b8-ca-3a-7f-c7-97     dynamic
  10.1.26.126           4c-d7-17-8d-98-6a     dynamic
  10.1.26.134           90-b1-1c-96-21-0b     dynamic
  10.1.26.141           4c-d7-17-8d-81-7a     dynamic
  10.1.26.142           c8-d3-ff-40-04-26     dynamic
  10.1.26.143           c8-d3-ff-3f-db-11     dynamic
  10.1.26.146           4c-d7-17-8d-88-f4     dynamic
  10.1.26.147           c8-d3-ff-3e-8c-9f     dynamic
  10.1.26.148           4c-d7-17-8d-80-4f     dynamic
  10.1.26.150           4c-d7-17-8d-90-2c     dynamic
  10.1.26.154           4c-d7-17-8d-98-c6     dynamic
  10.1.26.156           4c-d7-17-8d-80-b6     dynamic
  10.1.26.157           4c-d7-17-8d-8e-e6     dynamic
  10.1.26.158           4c-d7-17-8d-98-43     dynamic
  10.1.26.159           4c-d7-17-8d-8f-9d     dynamic
  10.1.26.170           4c-d7-17-8d-88-97     dynamic
  10.1.26.173           4c-d7-17-8d-80-5a     dynamic
  10.1.26.176           4c-d7-17-8d-8d-34     dynamic
  10.1.26.177           4c-d7-17-8d-83-d6     dynamic
  10.1.26.178           c8-d3-ff-40-03-9f     dynamic
  10.1.26.179           b8-ca-3a-7f-d5-4a     dynamic
  10.1.26.180           4c-d7-17-8d-8d-b9     dynamic
  10.1.26.184           30-3a-64-89-42-9d     dynamic
  10.1.26.196           b8-ca-3a-7f-c6-09     dynamic
  10.1.26.199           4c-d7-17-8d-87-12     dynamic
  10.1.26.204           b8-ca-3a-9d-46-5f     dynamic
  10.1.26.208           c8-d3-ff-3f-db-06     dynamic
  10.1.26.216           90-b1-1c-96-1f-fa     dynamic
  10.1.26.219           b8-ca-3a-9d-51-9c     dynamic
  10.1.26.225           90-b1-1c-96-12-0d     dynamic
  10.1.26.230           b8-ca-3a-7f-cd-d2     dynamic
  10.1.26.239           90-b1-1c-96-19-05     dynamic
  10.1.26.248           4c-d7-17-8d-8f-f4     dynamic
  10.1.26.250           c8-d3-ff-40-04-23     dynamic
  10.1.27.3             c8-d3-ff-40-03-c5     dynamic
  10.1.27.97            b8-ca-3a-7f-cf-08     dynamic
  10.1.27.126           90-b1-1c-96-17-b3     dynamic
  10.1.27.255           ff-ff-ff-ff-ff-ff     static
  224.0.0.2             01-00-5e-00-00-02     static
  224.0.0.22            01-00-5e-00-00-16     static
  224.0.0.251           01-00-5e-00-00-fb     static
  224.0.0.252           01-00-5e-00-00-fc     static
  239.255.255.250       01-00-5e-7f-ff-fa     static
  255.255.255.255       ff-ff-ff-ff-ff-ff     static
```
