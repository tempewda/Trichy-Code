### Aim

### Client Code
``` java
import java.net.*;
import java.io.*;

class MyClient2WC {
    public static void main(String[] args) throws Exception {
        Socket s = new Socket("localhost", 3333);
        DataInputStream din = new DataInputStream(s.getInputStream());
        DataOutputStream dout = new DataOutputStream(s.getOutputStream());
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String str = "", str2 = "";
        while (!str.equals("stop")) {
            str = br.readLine();
            dout.writeUTF(str);
            dout.flush();
            str2 = din.readUTF();
            System.out.println("Server says: " + str2);
        }
        dout.close();
        s.close();
    }
}
```

### Server Code
``` java
import java.net.*;
import java.io.*;

class MyServer2WC {
    public static void main(String[] args) throws Exception {
        ServerSocket ss = new ServerSocket(3333);
        Socket s = ss.accept();
        DataInputStream din = new DataInputStream(s.getInputStream());
        DataOutputStream dout = new DataOutputStream(s.getOutputStream());
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String str = "", str2 = "";
        while (!str.equals("stop")) {
            str = din.readUTF();
            System.out.println("client says: " + str);
            str2 = br.readLine();
            dout.writeUTF(str2);
            dout.flush();
        }
        din.close();
        s.close();
        ss.close();
    }
}
```

### Output
``` bash
PS D:\JAVA> javac MyServer2WC.java
PS D:\JAVA> java MyServer2WC      
client says: Hello Server!!!
Hello Client, acknowledge!!!
client says: over and out...

PS D:\JAVA> javac MyClient2WC.java
PS D:\JAVA> java MyClient2WC      
Hello Server!!!
Server says: Hello Client, acknowledge!!!
over and out...
```
