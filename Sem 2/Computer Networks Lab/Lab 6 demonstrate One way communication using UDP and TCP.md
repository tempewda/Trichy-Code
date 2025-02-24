### Aim
Demonstrate One way communication using UDP and TCP

### UDP
#### Receiver Code
``` java
import java.net.*;
public class DReceiver {
    public static void main(String[] args) throws Exception {
        DatagramSocket ds = new DatagramSocket(3000);
        byte[] buf = new byte[1024]; 
        DatagramPacket dp = new DatagramPacket(buf, 1024);
        ds.receive(dp);
        String str = new String(dp.getData(), 0, dp.getLength());
        System.out.println(str);
        ds.close();
    }
}
```

#### Sender Code
``` java
import java.net.*;
public class DSender {
    public static void main(String[] args) throws Exception {
        DatagramSocket ds = new DatagramSocket();
        String str = "Welcome Java";
        InetAddress ip = InetAddress.getByName("127.0.0.1");

        DatagramPacket dp = new DatagramPacket(str.getBytes(), str.length(), ip, 3000);
        ds.send(dp);
        ds.close();
        
    }
}
```

#### Output
``` bash
PS D:\JAVA> javac DSender.java
PS D:\JAVA> java DSender

PS D:\JAVA> javac DReceiver.java
PS D:\JAVA> java DReceiver      
Welcome Java
```


### TCP
#### Server Code
``` java
import java.io.*;
import java.net.*;

public class MyServer {
    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(6666);
            Socket s = ss.accept(); // establishes connection
            DataInputStream dis = new DataInputStream(s.getInputStream());
            String str = (String) dis.readUTF();
            System.out.println("message = " + str);
            ss.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }
}
```

#### Client Code
``` java
import java.io.*;
import java.net.*;

public class MyClient {
    public static void main(String[] args) {
        try {
            Socket s = new Socket("localhost", 6666);
            DataOutputStream dout = new DataOutputStream(s.getOutputStream());
            dout.writeUTF("Hello Server");
            dout.flush();
            dout.close();
            s.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }
}
```

#### Output
``` bash
PS D:\JAVA> javac MyClient.java
PS D:\JAVA> java MyClient

PS D:\JAVA> javac MyServer.java
PS D:\JAVA> java MyServer      
message = Hello Server
```
