``` java
// Lab 4 - JAVA progra to print the ARP Table
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class ARPTablePrinter {
  public static void main(String[] args {
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
        System.err.println("Error: The arp command executed unsuccessfully")
      }
    } catch (IOException | InterruptedException e) {
      e.printStackTrace();
    }
  }
}
```
