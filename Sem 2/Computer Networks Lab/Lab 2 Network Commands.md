### 1. `ipconfig`

Displays all current TCP/IP network configuration values and refreshes Dynamic Host Configuration Protocol (DHCP) and Domain Name System (DNS) settings. Used without parameters, ipconfig displays Internet Protocol version 4 (IPv4) and IPv6 addresses, subnet mask, and default gateway for all adapters. [source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/ipconfig#:~:text=Displays%20all%20current,for%20all%20adapters.)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>ipconfig

Windows IP Configuration


Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : octa.edu
   Link-local IPv6 Address . . . . . : fe80::f0b6:831f:2786:7de7%18
   IPv4 Address. . . . . . . . . . . : 10.1.26.152
   Subnet Mask . . . . . . . . . . . : 255.255.254.0
   Default Gateway . . . . . . . . . : 10.1.26.1

Ethernet adapter Ethernet 2:

   Connection-specific DNS Suffix  . :
   Link-local IPv6 Address . . . . . : fe80::a451:70a3:923b:1e21%17
   IPv4 Address. . . . . . . . . . . : 192.168.56.1
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . :

Wireless LAN adapter Wi-Fi:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :

Wireless LAN adapter Local Area Connection* 9:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :

Wireless LAN adapter Local Area Connection* 10:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :

Ethernet adapter Bluetooth Network Connection:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :
```


### 2. `ipconfig/all`

Displays the full TCP/IP configuration for all adapters. Adapters can represent physical interfaces, such as installed network adapters, or logical interfaces, such as dial-up connections. [source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/ipconfig#:~:text=Displays%20the%20full%20TCP/IP%20configuration%20for%20all%20adapters.%20Adapters%20can%20represent%20physical%20interfaces%2C%20such%20as%20installed%20network%20adapters%2C%20or%20logical%20interfaces%2C%20such%20as%20dial%2Dup%20connections.)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>ipconfig/all

Windows IP Configuration

   Host Name . . . . . . . . . . . . : CAL-04-3460
   Primary Dns Suffix  . . . . . . . : octa.edu
   Node Type . . . . . . . . . . . . : Hybrid
   IP Routing Enabled. . . . . . . . : No
   WINS Proxy Enabled. . . . . . . . : No
   DNS Suffix Search List. . . . . . : octa.edu

Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : octa.edu
   Description . . . . . . . . . . . : Intel(R) Ethernet Connection (17) I219-LM
   Physical Address. . . . . . . . . : 4C-D7-17-8D-93-FE
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
   Link-local IPv6 Address . . . . . : fe80::f0b6:831f:2786:7de7%18(Preferred)
   IPv4 Address. . . . . . . . . . . : 10.1.26.152(Preferred)
   Subnet Mask . . . . . . . . . . . : 255.255.254.0
   Lease Obtained. . . . . . . . . . : 15 January 2025 16:16:04
   Lease Expires . . . . . . . . . . : 10 February 2025 09:36:30
   Default Gateway . . . . . . . . . : 10.1.26.1
   DHCP Server . . . . . . . . . . . : 10.0.0.38
   DHCPv6 IAID . . . . . . . . . . . : 390911767
   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2E-28-18-55-4C-D7-17-8D-93-FE
   DNS Servers . . . . . . . . . . . : 10.0.0.41
                                       10.0.0.39
   NetBIOS over Tcpip. . . . . . . . : Enabled

Ethernet adapter Ethernet 2:

   Connection-specific DNS Suffix  . :
   Description . . . . . . . . . . . : VirtualBox Host-Only Ethernet Adapter
   Physical Address. . . . . . . . . : 0A-00-27-00-00-11
   DHCP Enabled. . . . . . . . . . . : No
   Autoconfiguration Enabled . . . . : Yes
   Link-local IPv6 Address . . . . . : fe80::a451:70a3:923b:1e21%17(Preferred)
   IPv4 Address. . . . . . . . . . . : 192.168.56.1(Preferred)
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . :
   DHCPv6 IAID . . . . . . . . . . . : 722075687
   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2E-28-18-55-4C-D7-17-8D-93-FE
   DNS Servers . . . . . . . . . . . : fec0:0:0:ffff::1%1
                                       fec0:0:0:ffff::2%1
                                       fec0:0:0:ffff::3%1
   NetBIOS over Tcpip. . . . . . . . : Enabled

Wireless LAN adapter Wi-Fi:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :
   Description . . . . . . . . . . . : Intel(R) Wi-Fi 6E AX211 160MHz
   Physical Address. . . . . . . . . : A0-D3-65-2B-90-99
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes

Wireless LAN adapter Local Area Connection* 9:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :
   Description . . . . . . . . . . . : Microsoft Wi-Fi Direct Virtual Adapter
   Physical Address. . . . . . . . . : A0-D3-65-2B-90-9A
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes

Wireless LAN adapter Local Area Connection* 10:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :
   Description . . . . . . . . . . . : Microsoft Wi-Fi Direct Virtual Adapter #2
   Physical Address. . . . . . . . . : A2-D3-65-2B-90-99
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes

Ethernet adapter Bluetooth Network Connection:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . :
   Description . . . . . . . . . . . : Bluetooth Device (Personal Area Network)
   Physical Address. . . . . . . . . : A0-D3-65-2B-90-9D
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
```


### 3. `nslookup`

Displays information that you can use to diagnose Domain Name System (DNS) infrastructure. Before using this tool, you should be familiar with how DNS works. The nslookup command-line tool is available only if you have installed the TCP/IP protocol.[source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/nslookup#:~:text=Displays%20information%20that%20you%20can%20use%20to%20diagnose%20Domain%20Name%20System%20(DNS)%20infrastructure.%20Before%20using%20this%20tool%2C%20you%20should%20be%20familiar%20with%20how%20DNS%20works.%20The%20nslookup%20command%2Dline%20tool%20is%20available%20only%20if%20you%20have%20installed%20the%20TCP/IP%20protocol.)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>NSLookup google.com
Server:  mars.octa.edu
Address:  10.0.0.41

Non-authoritative answer:
Name:    google.com
Addresses:  2404:6800:4007:82d::200e
          142.250.205.238
```


### 4. `ping`

Verifies IP-level connectivity to another TCP/IP computer by sending Internet Control Message Protocol (ICMP) echo Request messages. The receipt of the corresponding echo Reply messages is displayed, along with round-trip times. ping is the primary TCP/IP command used to troubleshoot connectivity, reachability, and name resolution. [source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/ping#:~:text=Verifies%20IP%2Dlevel,and%20name%20resolution)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>PING google.com

Pinging google.com [142.250.205.238] with 32 bytes of data:
Reply from 142.250.205.238: bytes=32 time=27ms TTL=115
Reply from 142.250.205.238: bytes=32 time=27ms TTL=115
Reply from 142.250.205.238: bytes=32 time=27ms TTL=115
Reply from 142.250.205.238: bytes=32 time=27ms TTL=115

Ping statistics for 142.250.205.238:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 27ms, Maximum = 27ms, Average = 27ms
```


### 5. `tracert`

This diagnostic tool determines the path taken to a destination by sending Internet Control Message Protocol (ICMP) echo Request or ICMPv6 messages to the destination with incrementally increasing time to live (TTL) field values. [source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/tracert#:~:text=This%20diagnostic%20tool%20determines%20the%20path%20taken%20to%20a%20destination%20by%20sending%20Internet%20Control%20Message%20Protocol%20(ICMP)%20echo%20Request%20or%20ICMPv6%20messages%20to%20the%20destination%20with%20incrementally%20increasing%20time%20to%20live%20(TTL)%20field%20values.)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>TRACERT google.com

Tracing route to google.com [142.250.205.238]
over a maximum of 30 hops:

  1    <1 ms    <1 ms    <1 ms  10.1.26.1
  2    <1 ms    <1 ms    <1 ms  192.168.20.1
  3    <1 ms    <1 ms    <1 ms  203.129.195.157
  4     3 ms     2 ms     2 ms  125.17.254.41
  5    13 ms    15 ms     9 ms  116.119.72.22
  6    21 ms    21 ms    21 ms  116.119.158.151
  7    28 ms    27 ms    28 ms  142.250.169.206
  8    22 ms    22 ms    22 ms  142.250.208.105
  9    22 ms    22 ms    22 ms  142.251.60.187
 10    27 ms    27 ms    27 ms  maa05s28-in-f14.1e100.net [142.250.205.238]

Trace complete.
```


### 6. `netstat`

Displays active TCP connections, ports on which the computer is listening, Ethernet statistics, the IP routing table, IPv4 statistics (for the IP, ICMP, TCP, and UDP protocols), and IPv6 statistics (for the IPv6, ICMPv6, TCP over IPv6, and UDP over IPv6 protocols). Used without parameters, this command displays active TCP connections. [source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/netstat#:~:text=Displays%20active%20TCP,active%20TCP%20connections.)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>NETSTAT

Active Connections

  Proto  Local Address          Foreign Address        State
  TCP    10.1.26.152:7680       CAL-64-3460:58241      TIME_WAIT
  TCP    10.1.26.152:49490      20.198.119.84:https    ESTABLISHED
  TCP    10.1.26.152:60966      49.44.116.237:http     ESTABLISHED
  TCP    10.1.26.152:61071      a23-35-89-14:http      ESTABLISHED
  TCP    10.1.26.152:61106      190:https              CLOSE_WAIT
  TCP    10.1.26.152:61111      lb-140-82-114-26-iad:https  ESTABLISHED
  TCP    10.1.26.152:61123      13.107.21.239:https    ESTABLISHED
  TCP    10.1.26.152:61131      a23-11-215-153:https   CLOSE_WAIT
  TCP    10.1.26.152:61133      13.107.213.254:https   CLOSE_WAIT
  TCP    10.1.26.152:61134      sp:https               CLOSE_WAIT
  TCP    10.1.26.152:61148      13.107.21.239:https    ESTABLISHED
  TCP    10.1.26.152:61152      49.44.95.81:https      CLOSE_WAIT
  TCP    10.1.26.152:61167      10.1.54.42:ms-do       SYN_SENT
  TCP    10.1.26.152:61168      10.1.44.82:ms-do       SYN_SENT
  TCP    10.1.26.152:61169      192.168.1.40:ms-do     SYN_SENT
  TCP    127.0.0.1:1521         CAL-04-3460:50689      ESTABLISHED
  TCP    127.0.0.1:50683        CAL-04-3460:50684      ESTABLISHED
  TCP    127.0.0.1:50684        CAL-04-3460:50683      ESTABLISHED
  TCP    127.0.0.1:50689        CAL-04-3460:1521       ESTABLISHED
  TCP    127.0.0.1:50725        CAL-04-3460:50726      ESTABLISHED
  TCP    127.0.0.1:50726        CAL-04-3460:50725      ESTABLISHED
  TCP    127.0.0.1:50756        CAL-04-3460:50757      ESTABLISHED
  TCP    127.0.0.1:50757        CAL-04-3460:50756      ESTABLISHED
```


### 7. `hostname`

Displays the host name portion of the full computer name of the computer. [source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/hostname#:~:text=Displays%20the%20host%20name%20portion%20of%20the%20full%20computer%20name%20of%20the%20computer.)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>HOSTNAME
CAL-04-3460
```


### 8. `arp -a`

Displays and modifies entries in the Address Resolution Protocol (ARP) cache. The ARP cache contains one or more tables that are used to store IP addresses and their resolved Ethernet or Token Ring physical addresses. There is a separate table for each Ethernet or Token Ring network adapter installed on your computer. [source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/arp#:~:text=Displays%20and%20modifies,on%20your%20computer.)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>ARP -a

Interface: 192.168.56.1 --- 0x11
  Internet Address      Physical Address      Type
  192.168.56.255        ff-ff-ff-ff-ff-ff     static
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
  10.1.26.79            90-b1-1c-96-21-ed     dynamic
  10.1.26.100           4c-d7-17-8d-8e-8b     dynamic
  10.1.26.106           c8-d3-ff-3f-d9-f6     dynamic
  10.1.26.115           4c-d7-17-8d-93-b5     dynamic
  10.1.26.116           4c-d7-17-8d-8d-29     dynamic
  10.1.26.134           90-b1-1c-96-21-0b     dynamic
  10.1.26.136           c8-d3-ff-3e-8d-b0     dynamic
  10.1.26.141           4c-d7-17-8d-81-7a     dynamic
  10.1.26.142           c8-d3-ff-40-04-26     dynamic
  10.1.26.145           90-b1-1c-96-10-f9     dynamic
  10.1.26.147           c8-d3-ff-3e-8c-9f     dynamic
  10.1.26.156           4c-d7-17-8d-80-b6     dynamic
  10.1.26.157           4c-d7-17-8d-8e-e6     dynamic
  10.1.26.159           4c-d7-17-8d-8f-9d     dynamic
  10.1.26.170           4c-d7-17-8d-88-97     dynamic
  10.1.26.173           4c-d7-17-8d-80-5a     dynamic
  10.1.26.176           4c-d7-17-8d-8d-34     dynamic
  10.1.26.178           c8-d3-ff-40-03-9f     dynamic
  10.1.26.196           b8-ca-3a-7f-c6-09     dynamic
  10.1.26.199           4c-d7-17-8d-87-12     dynamic
  10.1.26.205           4c-d7-17-8d-88-7b     dynamic
  10.1.26.206           4c-d7-17-8d-98-30     dynamic
  10.1.26.208           c8-d3-ff-3f-db-06     dynamic
  10.1.26.225           90-b1-1c-96-12-0d     dynamic
  10.1.26.248           4c-d7-17-8d-8f-f4     dynamic
  10.1.27.255           ff-ff-ff-ff-ff-ff     static
  224.0.0.2             01-00-5e-00-00-02     static
  224.0.0.22            01-00-5e-00-00-16     static
  224.0.0.251           01-00-5e-00-00-fb     static
  224.0.0.252           01-00-5e-00-00-fc     static
  239.255.255.250       01-00-5e-7f-ff-fa     static
  255.255.255.255       ff-ff-ff-ff-ff-ff     static
```


### 9. `getmac`

Returns the media access control (MAC) address and list of network protocols associated with each address for all network cards in each computer, either locally or across a network. This command is particularly useful either when you want to enter the MAC address into a network analyzer, or when you need to know what protocols are currently in use on each network adapter on a computer. [source](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/getmac#:~:text=Returns%20the%20media,on%20a%20computer.)

#### Sample Output
```
C:\Users\TEMP.OCTA.002>GetMAC

Physical Address    Transport Name
=================== ==========================================================
4C-D7-17-8D-93-FE   \Device\Tcpip_{FBD383A8-ABC1-481D-B26E-75A0E775E528}
A0-D3-65-2B-90-9D   Media disconnected
A0-D3-65-2B-90-99   Media disconnected
0A-00-27-00-00-11   \Device\Tcpip_{F56EDA96-D971-4BDF-A673-D74B1A956A3B}
```


