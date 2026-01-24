# Complete Computer Networks Study Guide for CPCS
## NIOT Trichy MCA - Placement Preparation

---

# 📚 SECTION 1: OSI MODEL

## Complete Theory

### What is OSI Model?
- **OSI** = Open Systems Interconnection
- Developed by **ISO (International Organization for Standardization)** in **1984**
- It is a **reference model** (conceptual framework)
- Has **7 layers**
- Follows **vertical approach** (layer-by-layer communication)

---

### The 7 Layers (Bottom to Top)

```
┌─────────────────────────────────────────────────────────────────┐
│  LAYER 7  │  APPLICATION    │  User Interface & Network Services│
├───────────┼─────────────────┼───────────────────────────────────┤
│  LAYER 6  │  PRESENTATION   │  Translation, Encryption, Compress│
├───────────┼─────────────────┼───────────────────────────────────┤
│  LAYER 5  │  SESSION        │  Session Management & Dialog Ctrl │
├───────────┼─────────────────┼───────────────────────────────────┤
│  LAYER 4  │  TRANSPORT      │  End-to-End Delivery & Reliability│
├───────────┼─────────────────┼───────────────────────────────────┤
│  LAYER 3  │  NETWORK        │  Routing & Logical Addressing     │
├───────────┼─────────────────┼───────────────────────────────────┤
│  LAYER 2  │  DATA LINK      │  Framing & Physical Addressing    │
├───────────┼─────────────────┼───────────────────────────────────┤
│  LAYER 1  │  PHYSICAL       │  Bit Transmission                 │
└─────────────────────────────────────────────────────────────────┘
```

---

### Popular Mnemonics

**Bottom to Top (Layer 1→7):**
- **P**lease **D**o **N**ot **T**hrow **S**ausage **P**izza **A**way
- **P**hysical **D**ata **N**etwork **T**ransport **S**ession **P**resentation **A**pplication

**Top to Bottom (Layer 7→1):**
- **A**ll **P**eople **S**eem **T**o **N**eed **D**ata **P**rocessing
- **A**way **P**izza **S**ausage **T**hrow **N**ot **D**o **P**lease

---

### Layer-wise Detailed Information

#### **LAYER 1: PHYSICAL LAYER**

| Aspect | Details |
|--------|---------|
| **PDU** | Bits (0s and 1s) |
| **Function** | Transmits raw bits over physical medium |
| **Deals with** | Cables, connectors, voltage levels, data rates |
| **Devices** | Hub, Repeater, Modem, Cables |
| **Transmission Modes** | Simplex, Half-duplex, Full-duplex |
| **Topologies** | Bus, Star, Ring, Mesh |
| **Examples** | RS-232, Ethernet cables, Fiber optics |

**Key Concepts:**
- Bit synchronization
- Bit rate control
- Physical topology
- Transmission mode
- Line configuration (point-to-point, multipoint)

---

#### **LAYER 2: DATA LINK LAYER**

| Aspect | Details |
|--------|---------|
| **PDU** | Frame |
| **Function** | Node-to-node delivery, Error detection |
| **Addressing** | MAC Address (Physical Address) - 48 bits |
| **Devices** | Switch, Bridge, NIC |
| **Sub-layers** | LLC (Logical Link Control), MAC (Media Access Control) |
| **Protocols** | Ethernet, PPP, HDLC, Frame Relay |

**Key Functions:**
1. **Framing** - Encapsulates packets into frames
2. **Physical Addressing** - Adds MAC address in header
3. **Error Control** - CRC, Checksum
4. **Flow Control** - Stop-and-Wait, Sliding Window
5. **Access Control** - Which device has control over link

**Sub-layers:**
- **LLC (Upper)** - Error control, flow control, multiplexing
- **MAC (Lower)** - Physical addressing, media access control

---

#### **LAYER 3: NETWORK LAYER**

| Aspect | Details |
|--------|---------|
| **PDU** | Packet (or Datagram) |
| **Function** | Routing, Logical Addressing |
| **Addressing** | IP Address (Logical Address) |
| **Devices** | Router, Layer 3 Switch |
| **Protocols** | IP, ICMP, IGMP, ARP, RARP, IPSec |

**Key Functions:**
1. **Logical Addressing** - IP addressing
2. **Routing** - Finding best path
3. **Fragmentation & Reassembly** - Breaking large packets
4. **Packet Forwarding**

**Routing Algorithms:**
- Distance Vector (RIP)
- Link State (OSPF)
- Path Vector (BGP)

---

#### **LAYER 4: TRANSPORT LAYER**

| Aspect | Details |
|--------|---------|
| **PDU** | Segment (TCP) / Datagram (UDP) |
| **Function** | End-to-end delivery, Reliability |
| **Addressing** | Port Numbers (0-65535) |
| **Devices** | Gateway, Firewall |
| **Protocols** | TCP, UDP, SCTP |

**Key Functions:**
1. **Segmentation & Reassembly**
2. **Service Point Addressing** (Port numbers)
3. **Connection Control** - Connectionless/Connection-oriented
4. **Flow Control** - End-to-end
5. **Error Control** - End-to-end

**TCP vs UDP:**
| TCP | UDP |
|-----|-----|
| Connection-oriented | Connectionless |
| Reliable | Unreliable |
| Slower | Faster |
| HTTP, FTP, SMTP | DNS, DHCP, VoIP |
| Guaranteed delivery | Best effort |
| Flow control | No flow control |
| 3-way handshake | No handshake |

**Well-known Port Numbers:**
| Port | Service |
|------|---------|
| 20, 21 | FTP |
| 22 | SSH |
| 23 | Telnet |
| 25 | SMTP |
| 53 | DNS |
| 80 | HTTP |
| 110 | POP3 |
| 143 | IMAP |
| 443 | HTTPS |
| 3306 | MySQL |

---

#### **LAYER 5: SESSION LAYER**

| Aspect | Details |
|--------|---------|
| **PDU** | Data |
| **Function** | Session establishment, maintenance, termination |
| **Protocols** | NetBIOS, PPTP, RPC, SQL |

**Key Functions:**
1. **Dialog Control** - Half-duplex or Full-duplex
2. **Synchronization** - Checkpoints/Recovery points
3. **Session Management** - Authentication, Authorization

**Dialog Types:**
- Simplex
- Half-duplex
- Full-duplex

---

#### **LAYER 6: PRESENTATION LAYER**

| Aspect | Details |
|--------|---------|
| **PDU** | Data |
| **Function** | Translation, Encryption, Compression |
| **Also called** | Syntax Layer, Translation Layer |
| **Protocols** | SSL, TLS, JPEG, MPEG, GIF, ASCII, EBCDIC |

**Key Functions:**
1. **Translation** - ASCII to EBCDIC, etc.
2. **Encryption/Decryption** - Data security
3. **Compression** - Reduce data size

---

#### **LAYER 7: APPLICATION LAYER**

| Aspect | Details |
|--------|---------|
| **PDU** | Data/Message |
| **Function** | User interface, Network services |
| **Protocols** | HTTP, FTP, SMTP, DNS, SNMP, Telnet, DHCP |

**Key Functions:**
1. **Network Virtual Terminal**
2. **File Transfer, Access & Management (FTAM)**
3. **Mail Services**
4. **Directory Services**

**Common Protocols:**
| Protocol | Full Form | Port | Purpose |
|----------|-----------|------|---------|
| HTTP | HyperText Transfer Protocol | 80 | Web browsing |
| HTTPS | HTTP Secure | 443 | Secure web |
| FTP | File Transfer Protocol | 20, 21 | File transfer |
| SMTP | Simple Mail Transfer Protocol | 25 | Send email |
| POP3 | Post Office Protocol v3 | 110 | Receive email |
| IMAP | Internet Message Access Protocol | 143 | Receive email |
| DNS | Domain Name System | 53 | Name resolution |
| DHCP | Dynamic Host Configuration Protocol | 67, 68 | IP assignment |
| Telnet | Terminal Network | 23 | Remote access |
| SSH | Secure Shell | 22 | Secure remote access |
| SNMP | Simple Network Management Protocol | 161 | Network management |

---

### PDU Summary Table

| Layer | PDU Name |
|-------|----------|
| Application | Data/Message |
| Presentation | Data |
| Session | Data |
| Transport | Segment (TCP) / Datagram (UDP) |
| Network | Packet |
| Data Link | Frame |
| Physical | Bits |

**Memory Trick:** "**D**o **S**ome **P**eople **F**ear **B**irthdays" (Data, Segment, Packet, Frame, Bits)

---

### Devices at Each Layer

| Layer | Devices |
|-------|---------|
| Physical | Hub, Repeater, Modem, Cables |
| Data Link | Switch, Bridge, NIC |
| Network | Router, Layer 3 Switch |
| Transport | Gateway, Firewall |
| Session-Application | Gateway, Firewall, Software applications |

---

### Upper vs Lower Layers

| Upper Layers (5, 6, 7) | Lower Layers (1, 2, 3, 4) |
|------------------------|---------------------------|
| Application-oriented | Network-oriented |
| Implemented in software | Hardware + Software |
| Deal with user interface | Deal with data transport |
| Also called Host layers | Also called Media layers |

---

## OSI Model MCQs

### Basic Concept Questions

**Q1. OSI stands for:**
- a) Open System Interface
- b) Open Systems Interconnection ✓
- c) Operating System Interface
- d) Open Source Interconnection

**Q2. OSI model was developed by:**
- a) IEEE
- b) ANSI
- c) ISO ✓
- d) ITU

**Q3. OSI model was introduced in:**
- a) 1974
- b) 1980
- c) 1984 ✓
- d) 1990

**Q4. How many layers are in the OSI model?**
- a) 4
- b) 5
- c) 6
- d) 7 ✓

**Q5. Which layer is at the top of OSI model?**
- a) Physical
- b) Network
- c) Application ✓
- d) Transport

**Q6. Which layer is at the bottom of OSI model?**
- a) Physical ✓
- b) Data Link
- c) Network
- d) Application

---

### Physical Layer Questions

**Q7. PDU of Physical layer is:**
- a) Frame
- b) Packet
- c) Segment
- d) Bits ✓

**Q8. Which device operates at Physical layer?**
- a) Router
- b) Switch
- c) Hub ✓
- d) Bridge

**Q9. Physical layer deals with:**
- a) Logical addressing
- b) Routing
- c) Bit transmission ✓
- d) Error correction

**Q10. Which of the following is NOT a function of Physical layer?**
- a) Bit synchronization
- b) Transmission mode
- c) Physical topology
- d) Error detection ✓

**Q11. Repeater operates at which layer?**
- a) Physical ✓
- b) Data Link
- c) Network
- d) Transport

**Q12. Transmission modes include all EXCEPT:**
- a) Simplex
- b) Half-duplex
- c) Full-duplex
- d) Multiplex ✓

**Q13. RS-232 is a standard associated with:**
- a) Data Link layer
- b) Physical layer ✓
- c) Network layer
- d) Transport layer

---

### Data Link Layer Questions

**Q14. PDU of Data Link layer is:**
- a) Bits
- b) Frame ✓
- c) Packet
- d) Segment

**Q15. Data Link layer provides:**
- a) Logical addressing
- b) Physical addressing ✓
- c) Port addressing
- d) None of above

**Q16. MAC address is how many bits?**
- a) 32 bits
- b) 48 bits ✓
- c) 64 bits
- d) 128 bits

**Q17. Which device operates at Data Link layer?**
- a) Router
- b) Hub
- c) Switch ✓
- d) Repeater

**Q18. Data Link layer is divided into which sub-layers?**
- a) Upper and Lower
- b) LLC and MAC ✓
- c) TCP and UDP
- d) IP and ICMP

**Q19. LLC stands for:**
- a) Logical Link Control ✓
- b) Lower Layer Control
- c) Link Level Control
- d) Local Link Connection

**Q20. Which is NOT a function of Data Link layer?**
- a) Framing
- b) Error control
- c) Routing ✓
- d) Flow control

**Q21. CRC is performed at which layer?**
- a) Physical
- b) Data Link ✓
- c) Network
- d) Transport

**Q22. Bridge operates at which layer?**
- a) Physical
- b) Data Link ✓
- c) Network
- d) Transport

**Q23. Ethernet protocol works at:**
- a) Physical layer only
- b) Data Link layer only
- c) Both Physical and Data Link ✓
- d) Network layer

**Q24. PPP protocol operates at:**
- a) Physical layer
- b) Data Link layer ✓
- c) Network layer
- d) Transport layer

**Q25. NIC operates at which layer?**
- a) Physical only
- b) Data Link only
- c) Both Physical and Data Link ✓
- d) Network

---

### Network Layer Questions

**Q26. PDU of Network layer is:**
- a) Frame
- b) Packet ✓
- c) Segment
- d) Data

**Q27. Network layer provides:**
- a) Physical addressing
- b) Logical addressing ✓
- c) Port addressing
- d) All of above

**Q28. Which device operates at Network layer?**
- a) Hub
- b) Switch
- c) Router ✓
- d) Bridge

**Q29. IP address is how many bits in IPv4?**
- a) 16 bits
- b) 32 bits ✓
- c) 48 bits
- d) 64 bits

**Q30. IP address is how many bits in IPv6?**
- a) 32 bits
- b) 64 bits
- c) 128 bits ✓
- d) 256 bits

**Q31. Which protocol works at Network layer?**
- a) TCP
- b) UDP
- c) IP ✓
- d) HTTP

**Q32. Routing is a function of which layer?**
- a) Physical
- b) Data Link
- c) Network ✓
- d) Transport

**Q33. ICMP works at which layer?**
- a) Data Link
- b) Network ✓
- c) Transport
- d) Application

**Q34. ARP is used to find:**
- a) IP address from MAC address
- b) MAC address from IP address ✓
- c) Port number from IP
- d) Domain from IP

**Q35. RARP is used to find:**
- a) IP address from MAC address ✓
- b) MAC address from IP address
- c) Port from IP
- d) Domain from IP

**Q36. Which is NOT a Network layer protocol?**
- a) IP
- b) ICMP
- c) ARP
- d) TCP ✓

**Q37. Fragmentation is performed at:**
- a) Data Link layer
- b) Network layer ✓
- c) Transport layer
- d) Session layer

**Q38. IGMP stands for:**
- a) Internet Group Message Protocol
- b) Internet Group Management Protocol ✓
- c) Internal Group Management Protocol
- d) Internet Gateway Message Protocol

---

### Transport Layer Questions

**Q39. PDU of Transport layer for TCP is:**
- a) Packet
- b) Frame
- c) Segment ✓
- d) Datagram

**Q40. Transport layer provides:**
- a) Node-to-node delivery
- b) End-to-end delivery ✓
- c) Hop-to-hop delivery
- d) None of above

**Q41. Transport layer uses which addressing?**
- a) MAC address
- b) IP address
- c) Port number ✓
- d) Domain name

**Q42. How many port numbers are possible?**
- a) 1024
- b) 32768
- c) 65535 ✓
- d) 16384

**Q43. Well-known ports range is:**
- a) 0-255
- b) 0-1023 ✓
- c) 1024-49151
- d) 49152-65535

**Q44. Registered ports range is:**
- a) 0-1023
- b) 1024-49151 ✓
- c) 49152-65535
- d) 0-65535

**Q45. TCP is:**
- a) Connectionless
- b) Connection-oriented ✓
- c) Both
- d) None

**Q46. UDP is:**
- a) Connectionless ✓
- b) Connection-oriented
- c) Both
- d) None

**Q47. Which is reliable protocol?**
- a) TCP ✓
- b) UDP
- c) Both
- d) None

**Q48. HTTP uses port number:**
- a) 21
- b) 25
- c) 80 ✓
- d) 443

**Q49. HTTPS uses port number:**
- a) 80
- b) 443 ✓
- c) 8080
- d) 8443

**Q50. FTP uses port numbers:**
- a) 20 and 21 ✓
- b) 22 and 23
- c) 25 and 26
- d) 80 and 443

**Q51. SSH uses port number:**
- a) 21
- b) 22 ✓
- c) 23
- d) 25

**Q52. Telnet uses port number:**
- a) 21
- b) 22
- c) 23 ✓
- d) 25

**Q53. SMTP uses port number:**
- a) 21
- b) 23
- c) 25 ✓
- d) 80

**Q54. DNS uses port number:**
- a) 53 ✓
- b) 67
- c) 80
- d) 110

**Q55. POP3 uses port number:**
- a) 25
- b) 80
- c) 110 ✓
- d) 143

**Q56. IMAP uses port number:**
- a) 110
- b) 143 ✓
- c) 161
- d) 443

**Q57. TCP uses:**
- a) 2-way handshake
- b) 3-way handshake ✓
- c) 4-way handshake
- d) No handshake

**Q58. 3-way handshake sequence is:**
- a) SYN, ACK, SYN-ACK
- b) SYN, SYN-ACK, ACK ✓
- c) ACK, SYN, SYN-ACK
- d) SYN-ACK, SYN, ACK

**Q59. Which layer ensures error-free delivery?**
- a) Data Link
- b) Network
- c) Transport ✓
- d) Application

**Q60. Gateway operates at which layer?**
- a) Data Link
- b) Network
- c) Transport ✓
- d) All layers

---

### Session Layer Questions

**Q61. Session layer is layer number:**
- a) 3
- b) 4
- c) 5 ✓
- d) 6

**Q62. Session layer is responsible for:**
- a) Routing
- b) Dialog control ✓
- c) Encryption
- d) File transfer

**Q63. Checkpointing is a feature of:**
- a) Transport layer
- b) Session layer ✓
- c) Presentation layer
- d) Application layer

**Q64. Which protocol works at Session layer?**
- a) HTTP
- b) TCP
- c) NetBIOS ✓
- d) IP

**Q65. Session layer establishes:**
- a) Physical connection
- b) Logical connection
- c) Session/Dialog ✓
- d) Port connection

---

### Presentation Layer Questions

**Q66. Presentation layer is layer number:**
- a) 4
- b) 5
- c) 6 ✓
- d) 7

**Q67. Encryption is performed at:**
- a) Session layer
- b) Presentation layer ✓
- c) Application layer
- d) Transport layer

**Q68. Data compression is done at:**
- a) Session layer
- b) Presentation layer ✓
- c) Application layer
- d) Physical layer

**Q69. Presentation layer is also called:**
- a) Network layer
- b) Syntax layer ✓
- c) Service layer
- d) User layer

**Q70. SSL/TLS works at:**
- a) Session layer
- b) Presentation layer ✓
- c) Application layer
- d) Transport layer

**Q71. ASCII and EBCDIC translation is done at:**
- a) Session layer
- b) Presentation layer ✓
- c) Application layer
- d) Data Link layer

**Q72. JPEG, MPEG, GIF are associated with:**
- a) Session layer
- b) Presentation layer ✓
- c) Application layer
- d) Transport layer

---

### Application Layer Questions

**Q73. Application layer is layer number:**
- a) 5
- b) 6
- c) 7 ✓
- d) 4

**Q74. HTTP works at which layer?**
- a) Transport
- b) Session
- c) Presentation
- d) Application ✓

**Q75. FTP works at which layer?**
- a) Network
- b) Transport
- c) Presentation
- d) Application ✓

**Q76. SMTP works at which layer?**
- a) Transport
- b) Session
- c) Presentation
- d) Application ✓

**Q77. DNS works at which layer?**
- a) Network
- b) Transport
- c) Presentation
- d) Application ✓

**Q78. DHCP works at which layer?**
- a) Network
- b) Transport
- c) Presentation
- d) Application ✓

**Q79. SNMP works at which layer?**
- a) Network
- b) Transport
- c) Session
- d) Application ✓

**Q80. Telnet is used for:**
- a) File transfer
- b) Remote login ✓
- c) Email
- d) Web browsing

---

### Comparison & Mixed Questions

**Q81. Which layer converts packets to frames?**
- a) Physical
- b) Data Link ✓
- c) Network
- d) Transport

**Q82. Which layer converts segments to packets?**
- a) Data Link
- b) Network ✓
- c) Transport
- d) Session

**Q83. Which layer converts data to segments?**
- a) Network
- b) Transport ✓
- c) Session
- d) Presentation

**Q84. Upper layers of OSI are:**
- a) 1, 2, 3
- b) 1, 2, 3, 4
- c) 5, 6, 7 ✓
- d) 4, 5, 6, 7

**Q85. Lower/Media layers of OSI are:**
- a) 1, 2, 3 ✓
- b) 1, 2, 3, 4
- c) 5, 6, 7
- d) 4, 5, 6, 7

**Q86. Host layers of OSI are:**
- a) 1, 2, 3
- b) 4, 5, 6, 7 ✓
- c) 5, 6, 7
- d) 1, 2

**Q87. Which layer adds MAC address?**
- a) Physical
- b) Data Link ✓
- c) Network
- d) Transport

**Q88. Which layer adds IP address?**
- a) Data Link
- b) Network ✓
- c) Transport
- d) Application

**Q89. Which layer adds port number?**
- a) Network
- b) Transport ✓
- c) Session
- d) Application

**Q90. Encapsulation happens from:**
- a) Bottom to Top
- b) Top to Bottom ✓
- c) Both directions
- d) Neither

**Q91. Decapsulation happens from:**
- a) Bottom to Top ✓
- b) Top to Bottom
- c) Both directions
- d) Neither

**Q92. Ping command uses which protocol?**
- a) TCP
- b) UDP
- c) ICMP ✓
- d) ARP

**Q93. Traceroute uses which protocol?**
- a) TCP
- b) ICMP ✓
- c) ARP
- d) HTTP

**Q94. Which layer handles hop-to-hop delivery?**
- a) Physical
- b) Data Link ✓
- c) Network
- d) Transport

**Q95. Which layer handles source-to-destination delivery?**
- a) Data Link
- b) Network ✓
- c) Transport
- d) Application

**Q96. Flow control at Data Link layer is:**
- a) End-to-end
- b) Node-to-node ✓
- c) Source-to-destination
- d) None

**Q97. Flow control at Transport layer is:**
- a) End-to-end ✓
- b) Node-to-node
- c) Hop-to-hop
- d) None

**Q98. OSI model is a:**
- a) Practical model
- b) Reference/Theoretical model ✓
- c) Implementation model
- d) None

**Q99. In OSI, data flows:**
- a) Horizontally at same layer (virtually)
- b) Vertically between layers (actually)
- c) Both a and b ✓
- d) Neither

**Q100. Services, Protocols, and Interfaces are defined at:**
- a) Only some layers
- b) All layers ✓
- c) Only lower layers
- d) Only upper layers

---

# 📚 SECTION 2: TCP/IP MODEL

## Complete Theory

### What is TCP/IP Model?
- **TCP/IP** = Transmission Control Protocol / Internet Protocol
- Developed by **ARPA (Advanced Research Projects Agency)** / **DoD (Department of Defense)**
- Developed in **1970s**, standardized in **1983**
- It is a **practical/implementation model**
- Also called **Internet Protocol Suite** or **DoD Model**
- Has **4 layers** (original) or **5 layers** (updated version)

---

### TCP/IP Layers

```
┌─────────────────────────────────────────────────────────────────┐
│     4-LAYER MODEL          │        5-LAYER MODEL              │
├─────────────────────────────────────────────────────────────────┤
│                            │                                   │
│  APPLICATION               │  APPLICATION                      │
│  (App + Pres + Session)    │                                   │
├────────────────────────────┼───────────────────────────────────┤
│  TRANSPORT                 │  TRANSPORT                        │
├────────────────────────────┼───────────────────────────────────┤
│  INTERNET                  │  NETWORK                          │
├────────────────────────────┼───────────────────────────────────┤
│  NETWORK ACCESS            │  DATA LINK                        │
│  (Data Link + Physical)    ├───────────────────────────────────┤
│                            │  PHYSICAL                         │
└─────────────────────────────────────────────────────────────────┘
```

---

### Layer-wise Details (4-Layer Model)

#### **LAYER 1: NETWORK ACCESS LAYER (Link Layer)**

| Aspect | Details |
|--------|---------|
| **Equivalent OSI Layers** | Physical + Data Link |
| **Function** | Physical transmission of data |
| **Protocols** | Ethernet, Token Ring, PPP, Frame Relay, ATM |
| **Devices** | Hub, Switch, Bridge, NIC, Cables |

**Responsibilities:**
- Physical addressing (MAC)
- Framing
- Bit transmission
- Media access control

---

#### **LAYER 2: INTERNET LAYER**

| Aspect | Details |
|--------|---------|
| **Equivalent OSI Layer** | Network Layer |
| **Function** | Logical addressing, Routing |
| **Protocols** | IP, ICMP, IGMP, ARP, RARP |
| **Devices** | Router |
| **PDU** | Packet/Datagram |

**Key Protocols:**
- **IP (Internet Protocol)** - Connectionless, unreliable delivery
- **ICMP (Internet Control Message Protocol)** - Error reporting, ping
- **ARP (Address Resolution Protocol)** - IP to MAC
- **RARP (Reverse ARP)** - MAC to IP
- **IGMP (Internet Group Management Protocol)** - Multicast

---

#### **LAYER 3: TRANSPORT LAYER**

| Aspect | Details |
|--------|---------|
| **Equivalent OSI Layer** | Transport Layer |
| **Function** | End-to-end communication |
| **Protocols** | TCP, UDP, SCTP |
| **Addressing** | Port numbers |
| **PDU** | Segment (TCP) / Datagram (UDP) |

**TCP (Transmission Control Protocol):**
- Connection-oriented
- Reliable
- Uses 3-way handshake
- Flow control, Error control
- Used by: HTTP, FTP, SMTP, Telnet

**UDP (User Datagram Protocol):**
- Connectionless
- Unreliable (Best effort)
- No handshake
- Faster, less overhead
- Used by: DNS, DHCP, SNMP, VoIP, Video streaming

---

#### **LAYER 4: APPLICATION LAYER**

| Aspect | Details |
|--------|---------|
| **Equivalent OSI Layers** | Application + Presentation + Session |
| **Function** | User interface, application services |
| **Protocols** | HTTP, FTP, SMTP, DNS, DHCP, Telnet, SSH, SNMP, POP3, IMAP |

**Protocol Categories:**
1. **File Transfer:** FTP, TFTP
2. **Email:** SMTP, POP3, IMAP
3. **Web:** HTTP, HTTPS
4. **Remote Access:** Telnet, SSH
5. **Name Resolution:** DNS
6. **Network Management:** SNMP, DHCP

---

### OSI vs TCP/IP Comparison

| Aspect | OSI Model | TCP/IP Model |
|--------|-----------|--------------|
| **Full Form** | Open Systems Interconnection | Transmission Control Protocol/Internet Protocol |
| **Layers** | 7 | 4 (or 5) |
| **Developed by** | ISO | ARPA/DoD |
| **Type** | Reference/Theoretical | Practical/Implementation |
| **Approach** | Vertical | Horizontal |
| **Usage** | Not widely used practically | Basis of Internet |
| **Protocol dependent** | No | Yes |
| **Layer names** | Physical, Data Link, Network, Transport, Session, Presentation, Application | Network Access, Internet, Transport, Application |
| **Session & Presentation** | Separate layers | Part of Application |
| **Physical & Data Link** | Separate layers | Combined as Network Access |
| **Reliability** | Transport layer | Transport layer (TCP) |
| **Development** | After protocols | Before protocols |
| **Flexibility** | More flexible | Less flexible |

---

### Layer Mapping

| OSI Layer | TCP/IP Layer |
|-----------|--------------|
| Application | Application |
| Presentation | Application |
| Session | Application |
| Transport | Transport |
| Network | Internet |
| Data Link | Network Access |
| Physical | Network Access |

---

### Protocols Summary by Layer

| TCP/IP Layer | Protocols |
|--------------|-----------|
| Application | HTTP, HTTPS, FTP, TFTP, SMTP, POP3, IMAP, DNS, DHCP, Telnet, SSH, SNMP, NFS, LDAP |
| Transport | TCP, UDP, SCTP |
| Internet | IP, IPv6, ICMP, ICMPv6, ARP, RARP, IGMP |
| Network Access | Ethernet, Wi-Fi, PPP, Token Ring, Frame Relay, ATM |

---

## TCP/IP Model MCQs

### Basic Questions

**Q101. TCP/IP model was developed by:**
- a) ISO
- b) IEEE
- c) ARPA/DoD ✓
- d) ANSI

**Q102. TCP/IP model has how many layers (original)?**
- a) 3
- b) 4 ✓
- c) 5
- d) 7

**Q103. TCP/IP model is also called:**
- a) OSI model
- b) DoD model ✓
- c) ISO model
- d) IEEE model

**Q104. TCP/IP is a:**
- a) Theoretical model
- b) Reference model
- c) Practical/Implementation model ✓
- d) Conceptual model

**Q105. TCP/IP model was standardized in:**
- a) 1974
- b) 1983 ✓
- c) 1984
- d) 1990

---

### Layer Questions

**Q106. Bottom layer of TCP/IP is:**
- a) Physical
- b) Internet
- c) Network Access ✓
- d) Transport

**Q107. Top layer of TCP/IP is:**
- a) Transport
- b) Internet
- c) Application ✓
- d) Network Access

**Q108. Internet layer of TCP/IP corresponds to which OSI layer?**
- a) Data Link
- b) Network ✓
- c) Transport
- d) Session

**Q109. Network Access layer corresponds to which OSI layers?**
- a) Physical only
- b) Data Link only
- c) Physical and Data Link ✓
- d) Network and Data Link

**Q110. Application layer of TCP/IP corresponds to which OSI layers?**
- a) Application only
- b) Session and Presentation
- c) Application, Presentation, and Session ✓
- d) All upper 4 layers

**Q111. Which layer is NOT present in TCP/IP model?**
- a) Transport
- b) Internet
- c) Session ✓
- d) Application

**Q112. Presentation layer functionalities are handled by which TCP/IP layer?**
- a) Transport
- b) Internet
- c) Application ✓
- d) Network Access

---

### Protocol Questions

**Q113. IP protocol works at which TCP/IP layer?**
- a) Network Access
- b) Internet ✓
- c) Transport
- d) Application

**Q114. TCP protocol works at which layer?**
- a) Internet
- b) Transport ✓
- c) Application
- d) Network Access

**Q115. UDP protocol works at which layer?**
- a) Internet
- b) Transport ✓
- c) Application
- d) Network Access

**Q116. HTTP works at which TCP/IP layer?**
- a) Transport
- b) Internet
- c) Application ✓
- d) Network Access

**Q117. Ethernet works at which TCP/IP layer?**
- a) Internet
- b) Transport
- c) Application
- d) Network Access ✓

**Q118. ARP works at which TCP/IP layer?**
- a) Network Access
- b) Internet ✓
- c) Transport
- d) Application

**Q119. ICMP works at which TCP/IP layer?**
- a) Network Access
- b) Internet ✓
- c) Transport
- d) Application

**Q120. DNS works at which TCP/IP layer?**
- a) Internet
- b) Transport
- c) Application ✓
- d) Network Access

---

### Comparison Questions

**Q121. OSI has ___ layers while TCP/IP has ___ layers:**
- a) 4, 7
- b) 7, 4 ✓
- c) 5, 4
- d) 7, 5

**Q122. Which model is used as the basis of the Internet?**
- a) OSI
- b) TCP/IP ✓
- c) Both equally
- d) Neither

**Q123. Which model was developed first?**
- a) OSI
- b) TCP/IP ✓
- c) Both simultaneously
- d) Cannot say

**Q124. Which model is protocol dependent?**
- a) OSI
- b) TCP/IP ✓
- c) Both
- d) Neither

**Q125. Which model is protocol independent?**
- a) OSI ✓
- b) TCP/IP
- c) Both
- d) Neither

**Q126. In which model, protocols were developed first?**
- a) OSI
- b) TCP/IP ✓
- c) Both
- d) Neither

**Q127. Which model clearly defines services, interfaces, and protocols?**
- a) OSI ✓
- b) TCP/IP
- c) Both equally
- d) Neither

**Q128. Session layer functionality in TCP/IP is handled by:**
- a) Internet layer
- b) Transport layer
- c) Application layer ✓
- d) Network Access layer

---

### TCP vs UDP Questions

**Q129. TCP is:**
- a) Connection-oriented ✓
- b) Connectionless
- c) Both
- d) Neither

**Q130. UDP is:**
- a) Connection-oriented
- b) Connectionless ✓
- c) Both
- d) Neither

**Q131. Which protocol guarantees delivery?**
- a) TCP ✓
- b) UDP
- c) IP
- d) ICMP

**Q132. Which protocol is faster?**
- a) TCP
- b) UDP ✓
- c) Same speed
- d) Depends on network

**Q133. Video streaming typically uses:**
- a) TCP
- b) UDP ✓
- c) Both
- d) Neither

**Q134. HTTP uses:**
- a) TCP ✓
- b) UDP
- c) Both
- d) Neither

**Q135. DNS uses:**
- a) TCP only
- b) UDP only
- c) Both TCP and UDP ✓
- d) Neither

**Q136. DHCP uses:**
- a) TCP
- b) UDP ✓
- c) Both
- d) Neither

**Q137. FTP uses:**
- a) TCP ✓
- b) UDP
- c) Both
- d) Neither

**Q138. TFTP uses:**
- a) TCP
- b) UDP ✓
- c) Both
- d) Neither

**Q139. VoIP typically uses:**
- a) TCP
- b) UDP ✓
- c) Both
- d) Neither

**Q140. SMTP uses:**
- a) TCP ✓
- b) UDP
- c) Both
- d) Neither

---

### IP Protocol Questions

**Q141. IP is a:**
- a) Connection-oriented protocol
- b) Connectionless protocol ✓
- c) Both
- d) Neither

**Q142. IP provides:**
- a) Reliable delivery
- b) Best-effort delivery ✓
- c) Guaranteed delivery
- d) Secure delivery

**Q143. IPv4 address is:**
- a) 16 bits
- b) 32 bits ✓
- c) 64 bits
- d) 128 bits

**Q144. IPv6 address is:**
- a) 32 bits
- b) 64 bits
- c) 128 bits ✓
- d) 256 bits

**Q145. Loopback address in IPv4 is:**
- a) 0.0.0.0
- b) 127.0.0.1 ✓
- c) 192.168.0.1
- d) 255.255.255.255

**Q146. Broadcast address is:**
- a) 0.0.0.0
- b) 127.0.0.1
- c) 192.168.0.1
- d) 255.255.255.255 ✓

**Q147. Private IP address range for Class A is:**
- a) 10.0.0.0 to 10.255.255.255 ✓
- b) 172.16.0.0 to 172.31.255.255
- c) 192.168.0.0 to 192.168.255.255
- d) All of above

**Q148. Private IP address range for Class C is:**
- a) 10.0.0.0 to 10.255.255.255
- b) 172.16.0.0 to 172.31.255.255
- c) 192.168.0.0 to 192.168.255.255 ✓
- d) All of above

**Q149. APIPA address range is:**
- a) 10.0.0.0 to 10.255.255.255
- b) 169.254.0.0 to 169.254.255.255 ✓
- c) 172.16.0.0 to 172.31.255.255
- d) 192.168.0.0 to 192.168.255.255

**Q150. Class A IP range is:**
- a) 0-126 ✓
- b) 128-191
- c) 192-223
- d) 224-239

**Q151. Class B IP range is:**
- a) 0-126
- b) 128-191 ✓
- c) 192-223
- d) 224-239

**Q152. Class C IP range is:**
- a) 0-126
- b) 128-191
- c) 192-223 ✓
- d) 224-239

**Q153. Class D is used for:**
- a) Unicast
- b) Multicast ✓
- c) Broadcast
- d) Anycast

**Q154. Class E is used for:**
- a) General use
- b) Multicast
- c) Research/Experimental ✓
- d) Broadcast

---

### Advanced Questions

**Q155. SCTP stands for:**
- a) Stream Control Transmission Protocol ✓
- b) Simple Control Transport Protocol
- c) Secure Control Transfer Protocol
- d) Stream Communication Transport Protocol

**Q156. SCTP works at which layer?**
- a) Internet
- b) Transport ✓
- c) Application
- d) Network Access

**Q157. Which protocol provides both reliability and speed?**
- a) TCP
- b) UDP
- c) SCTP ✓
- d) IP

**Q158. NAT stands for:**
- a) Network Address Transfer
- b) Network Address Translation ✓
- c) Network Access Terminal
- d) Network Application Transfer

**Q159. NAT is used for:**
- a) Converting private IP to public IP ✓
- b) Converting MAC to IP
- c) Converting domain to IP
- d) Converting port to IP

**Q160. Which is NOT a valid TCP/IP layer?**
- a) Application
- b) Transport
- c) Presentation ✓
- d) Internet

---

# 📚 SECTION 3: SWITCHING TECHNIQUES

## Complete Theory

### What is Switching?
Switching is the technique of transferring data from source to destination through intermediate nodes in a network.

### Types of Switching

```
                    SWITCHING TECHNIQUES
                           │
           ┌───────────────┼───────────────┐
           │               │               │
      CIRCUIT          PACKET          MESSAGE
      SWITCHING        SWITCHING        SWITCHING
                           │
                 ┌─────────┴─────────┐
                 │                   │
            DATAGRAM          VIRTUAL CIRCUIT
           (Connectionless)   (Connection-oriented)
```

---

## 1. CIRCUIT SWITCHING

### Definition:
A dedicated communication path is established between source and destination for the entire duration of communication.

### Characteristics:
- **Dedicated path** throughout communication
- **Connection-oriented**
- Path established **before** data transfer
- Resources reserved for entire duration
- **No store-and-forward**
- Used in **traditional telephone networks (PSTN)**

### Three Phases:
1. **Connection Establishment** - Path setup
2. **Data Transfer** - Actual communication
3. **Connection Termination** - Path release

### Advantages:
- Guaranteed bandwidth
- No delay during data transfer (after connection)
- No congestion during transmission
- Ordered delivery guaranteed
- Real-time communication possible

### Disadvantages:
- Resource wastage during idle periods
- Connection establishment delay
- Expensive for long-distance calls
- Not suitable for bursty traffic
- Inefficient for data communication

### Examples:
- Traditional telephone network (PSTN)
- ISDN (Integrated Services Digital Network)

---

## 2. PACKET SWITCHING

### Definition:
Data is divided into packets and each packet is routed independently through the network.

### Characteristics:
- Data divided into **packets**
- Each packet routed **independently**
- Uses **store-and-forward**
- No dedicated path
- Resources shared among users
- Used in **data networks, Internet**

### Types of Packet Switching:

### A. Datagram Switching (Connectionless)

| Feature | Description |
|---------|-------------|
| **Connection** | No connection establishment |
| **Packet routing** | Each packet routed independently |
| **Path** | Different packets may take different paths |
| **Order** | Packets may arrive out of order |
| **Header** | Each packet has complete destination address |
| **Reliability** | No guarantee of delivery |
| **Example** | IP, UDP |

**Characteristics:**
- No fixed path
- No sequence guarantee
- Higher header overhead
- More flexible
- Better fault tolerance

---

### B. Virtual Circuit Switching (Connection-oriented)

| Feature | Description |
|---------|-------------|
| **Connection** | Connection established before transfer |
| **Packet routing** | All packets follow same path |
| **Path** | Fixed virtual path |
| **Order** | Packets arrive in order |
| **Header** | Small virtual circuit identifier |
| **Reliability** | More reliable |
| **Example** | ATM, Frame Relay, MPLS, X.25 |

**Three Phases:**
1. Connection establishment (virtual circuit setup)
2. Data transfer
3. Connection termination

**Types of Virtual Circuits:**
1. **PVC (Permanent Virtual Circuit)** - Always available, pre-configured
2. **SVC (Switched Virtual Circuit)** - Established on demand

---

### Packet Switching Advantages:
- Efficient use of bandwidth
- No resource wastage
- Cost-effective
- Suitable for bursty traffic
- Multiple users share resources
- Better error handling

### Packet Switching Disadvantages:
- Variable delay (latency)
- Possible packet loss
- Out-of-order delivery (in datagram)
- Complex processing at nodes
- Not ideal for real-time applications

---

## 3. MESSAGE SWITCHING

### Definition:
The entire message is stored at intermediate nodes and forwarded when the outgoing link is free.

### Characteristics:
- **Store-and-forward** of entire message
- No path establishment
- No size limit on message
- Each node stores complete message
- Also called **"Store-and-Forward"** switching
- Used in **email systems** (historically)

### Advantages:
- No connection establishment needed
- Efficient for different size messages
- More reliable (stored at each node)
- Priority can be assigned to messages

### Disadvantages:
- Large storage required at nodes
- Very high delay
- Not suitable for real-time communication
- Not used much today

---

## Comparison Table

| Feature | Circuit Switching | Packet Switching (Datagram) | Virtual Circuit | Message Switching |
|---------|------------------|-----------------------------|--------------------|-------------------|
| **Dedicated Path** | Yes | No | Yes (virtual) | No |
| **Connection** | Required | Not required | Required | Not required |
| **Data Unit** | Continuous stream | Packets | Packets | Complete message |
| **Path** | Fixed | Variable | Fixed | Variable |
| **Delay** | Establishment delay | Per packet delay | Establishment + transfer | Store-and-forward delay |
| **Bandwidth** | Fixed, reserved | Dynamic | Fixed per circuit | Dynamic |
| **Order** | Guaranteed | Not guaranteed | Guaranteed | Not guaranteed |
| **Storage** | No storage | Packet buffer | Packet buffer | Message storage |
| **Overhead** | Low | High (full header) | Low (VC ID) | High |
| **Efficiency** | Low for bursty | High | High | Moderate |
| **Real-time** | Suitable | Less suitable | Suitable | Not suitable |
| **Example** | Telephone | IP, Internet | ATM, Frame Relay | Email (old) |

---

## Switching MCQs

### Basic Questions

**Q161. In circuit switching, path is:**
- a) Established before data transfer ✓
- b) Established during data transfer
- c) Established after data transfer
- d) Not required

**Q162. Circuit switching is used in:**
- a) Internet
- b) Traditional telephone network ✓
- c) Email systems
- d) File transfer

**Q163. PSTN uses which switching technique?**
- a) Packet switching
- b) Message switching
- c) Circuit switching ✓
- d) Virtual circuit

**Q164. In circuit switching, resources are:**
- a) Shared dynamically
- b) Reserved for entire duration ✓
- c) Not required
- d) Allocated on demand

**Q165. How many phases in circuit switching?**
- a) 2
- b) 3 ✓
- c) 4
- d) 5

**Q166. Phases of circuit switching are:**
- a) Setup, Transfer, Terminate ✓
- b) Connect, Send, Receive
- c) Open, Close, Transfer
- d) Start, Stop, Reset

---

### Packet Switching Questions

**Q167. In packet switching, data is divided into:**
- a) Frames
- b) Packets ✓
- c) Segments
- d) Bits

**Q168. Internet uses which switching technique?**
- a) Circuit switching
- b) Packet switching ✓
- c) Message switching
- d) None of above

**Q169. In datagram switching, each packet is routed:**
- a) On same path
- b) Independently ✓
- c) After connection
- d) On dedicated path

**Q170. In datagram switching, packets may arrive:**
- a) In order
- b) Out of order ✓
- c) Never
- d) On time

**Q171. Datagram switching is:**
- a) Connection-oriented
- b) Connectionless ✓
- c) Both
- d) Neither

**Q172. Virtual circuit switching is:**
- a) Connectionless
- b) Connection-oriented ✓
- c) Both
- d) Neither

**Q173. In virtual circuit, all packets follow:**
- a) Different paths
- b) Same path ✓
- c) Random paths
- d) No path

**Q174. ATM uses which switching?**
- a) Circuit switching
- b) Datagram switching
- c) Virtual circuit switching ✓
- d) Message switching

**Q175. Frame Relay uses:**
- a) Circuit switching
- b) Datagram switching
- c) Virtual circuit switching ✓
- d) Message switching

**Q176. X.25 uses:**
- a) Circuit switching
- b) Datagram switching
- c) Virtual circuit switching ✓
- d) Message switching

**Q177. IP protocol uses:**
- a) Circuit switching
- b) Datagram switching ✓
- c) Virtual circuit switching
- d) Message switching

**Q178. UDP uses which switching concept?**
- a) Circuit switching
- b) Datagram (connectionless) ✓
- c) Virtual circuit
- d) Message switching

**Q179. TCP uses which switching concept?**
- a) Circuit switching
- b) Datagram only
- c) Virtual circuit concept (connection-oriented) ✓
- d) Message switching

**Q180. MPLS uses:**
- a) Circuit switching
- b) Datagram switching
- c) Virtual circuit/Label switching ✓
- d) Message switching

---

### Virtual Circuit Questions

**Q181. PVC stands for:**
- a) Private Virtual Circuit
- b) Permanent Virtual Circuit ✓
- c) Public Virtual Circuit
- d) Packet Virtual Circuit

**Q182. SVC stands for:**
- a) Switched Virtual Circuit ✓
- b) Secure Virtual Circuit
- c) Static Virtual Circuit
- d) Simple Virtual Circuit

**Q183. Which is pre-configured and always available?**
- a) SVC
- b) PVC ✓
- c) Both
- d) Neither

**Q184. Which is established on demand?**
- a) PVC
- b) SVC ✓
- c) Both
- d) Neither

**Q185. Virtual circuit identifier is used in:**
- a) Circuit switching
- b) Datagram switching
- c) Virtual circuit switching ✓
- d) Message switching

**Q186. In virtual circuit, header contains:**
- a) Full destination address
- b) Virtual circuit ID ✓
- c) No address
- d) MAC address

**Q187. In datagram, header contains:**
- a) Full destination address ✓
- b) Virtual circuit ID only
- c) No address
- d) MAC address only

---

### Message Switching Questions

**Q188. Message switching is also called:**
- a) Packet forwarding
- b) Store-and-forward ✓
- c) Circuit forwarding
- d) Virtual forwarding

**Q189. In message switching, complete message is:**
- a) Split into packets
- b) Stored at each node ✓
- c) Sent on dedicated path
- d) Discarded

**Q190. Message switching is suitable for:**
- a) Real-time voice
- b) Video conferencing
- c) Telegrams/Email (historically) ✓
- d) VoIP

**Q191. Which switching requires most storage?**
- a) Circuit switching
- b) Packet switching
- c) Message switching ✓
- d) Virtual circuit

**Q192. Which switching has highest delay?**
- a) Circuit switching
- b) Packet switching
- c) Message switching ✓
- d) Virtual circuit

---

### Comparison Questions

**Q193. Which switching wastes bandwidth during idle time?**
- a) Packet switching
- b) Circuit switching ✓
- c) Message switching
- d) Virtual circuit

**Q194. Which switching is best for bursty traffic?**
- a) Circuit switching
- b) Packet switching ✓
- c) Message switching
- d) None

**Q195. Which switching guarantees bandwidth?**
- a) Packet switching
- b) Circuit switching ✓
- c) Message switching
- d) Datagram

**Q196. Which is most efficient for data networks?**
- a) Circuit switching
- b) Packet switching ✓
- c) Message switching
- d) All equal

**Q197. Which switching is used for voice calls traditionally?**
- a) Packet switching
- b) Circuit switching ✓
- c) Message switching
- d) Virtual circuit

**Q198. VoIP uses which switching?**
- a) Circuit switching
- b) Packet switching ✓
- c) Message switching
- d) None

**Q199. Which provides best real-time performance?**
- a) Circuit switching ✓
- b) Datagram switching
- c) Message switching
- d) All equal

**Q200. Which switching requires setup time?**
- a) Datagram
- b) Message switching
- c) Circuit switching ✓
- d) None

**Q201. Store-and-forward is used in:**
- a) Circuit switching
- b) Packet switching ✓
- c) Both b and message switching ✓
- d) Only circuit switching

**Q202. Which can handle congestion better?**
- a) Circuit switching
- b) Packet switching ✓
- c) Message switching
- d) All equal

**Q203. Connection establishment is required in:**
- a) Datagram switching
- b) Message switching
- c) Circuit switching and Virtual circuit ✓
- d) All

**Q204. Which provides in-order delivery guarantee?**
- a) Datagram switching
- b) Circuit switching and Virtual circuit ✓
- c) Message switching
- d) All

**Q205. Fault tolerance is better in:**
- a) Circuit switching
- b) Datagram switching ✓
- c) Virtual circuit
- d) All equal

---

### Application Questions

**Q206. WhatsApp calls primarily use:**
- a) Circuit switching
- b) Packet switching (VoIP) ✓
- c) Message switching
- d) None

**Q207. Landline telephone uses:**
- a) Packet switching
- b) Circuit switching ✓
- c) Message switching
- d) Virtual circuit

**Q208. Email attachment transfer uses:**
- a) Circuit switching
- b) Packet switching ✓
- c) Message switching
- d) None

**Q209. Video conferencing uses:**
- a) Circuit switching
- b) Packet switching ✓
- c) Message switching
- d) None

**Q210. ATM cell size is:**
- a) Variable
- b) 48 bytes
- c) 53 bytes ✓
- d) 64 bytes

---

# 📚 SECTION 4: CLIENT-SERVER & PEER-TO-PEER ARCHITECTURE

## Complete Theory

## 1. CLIENT-SERVER ARCHITECTURE

### Definition:
A network architecture where clients request services and servers provide those services.

### Components:

**CLIENT:**
- Requests services from server
- Typically a personal computer or workstation
- Has user interface
- Initiates communication
- Lighter workload

**SERVER:**
- Provides services to clients
- Powerful computer with more resources
- Runs continuously
- Responds to client requests
- Handles multiple clients simultaneously

### Types of Servers:
1. **File Server** - Stores and manages files
2. **Web Server** - Hosts websites (Apache, Nginx, IIS)
3. **Database Server** - Manages databases (MySQL, Oracle)
4. **Mail Server** - Handles email (Exchange, Postfix)
5. **Application Server** - Runs applications
6. **Print Server** - Manages printers
7. **DNS Server** - Resolves domain names
8. **DHCP Server** - Assigns IP addresses
9. **Proxy Server** - Acts as intermediary

### Architecture Types:

**1-Tier Architecture:**
- All components on single machine
- Example: MS Access database

**2-Tier Architecture:**
- Client and Server only
- Direct client-server communication
- Example: Simple database applications

**3-Tier Architecture:**
- Client → Application Server → Database Server
- Presentation, Application, Data layers
- Example: Web applications

**N-Tier Architecture:**
- Multiple layers/tiers
- More scalable and flexible

---

### Client-Server Characteristics:

| Aspect | Details |
|--------|---------|
| **Centralized** | Yes |
| **Server dependency** | High |
| **Security** | Better (centralized control) |
| **Maintenance** | Easier |
| **Cost** | Higher (server costs) |
| **Scalability** | Good (add more servers) |
| **Reliability** | Server = Single point of failure |
| **Administration** | Centralized |
| **Performance** | Depends on server |

### Advantages:
1. Centralized data management
2. Better security
3. Easy backup and recovery
4. Access control possible
5. Better resource utilization
6. Easier maintenance
7. Scalable
8. Data integrity

### Disadvantages:
1. Server is single point of failure
2. Server congestion possible
3. Higher cost
4. Requires IT expertise
5. Network dependency
6. Server overload with many clients

### Examples:
- Web browsing (Browser → Web Server)
- Email (Client → Mail Server)
- Database applications
- File sharing in organizations
- Online banking
- E-commerce websites

---

## 2. PEER-TO-PEER (P2P) ARCHITECTURE

### Definition:
A network architecture where all nodes (peers) have equal status and can act as both client and server.

### Characteristics:
- No dedicated server
- Each peer is equal
- Every peer can be client and server
- Decentralized
- Resources shared directly between peers

### Types of P2P:

**1. Pure P2P:**
- No central server at all
- Completely decentralized
- Example: Gnutella (early version)

**2. Hybrid P2P:**
- Has some central components
- Central server for indexing/discovery
- Data transfer is peer-to-peer
- Example: Napster, BitTorrent (with trackers)

**3. Structured P2P:**
- Uses distributed hash tables (DHT)
- Organized network structure
- Example: Chord, Kademlia

**4. Unstructured P2P:**
- Random connections between peers
- Flooding for search
- Example: Gnutella

---

### P2P Characteristics:

| Aspect | Details |
|--------|---------|
| **Centralized** | No |
| **Server dependency** | None |
| **Security** | Lower (distributed) |
| **Maintenance** | Difficult |
| **Cost** | Lower |
| **Scalability** | Very high |
| **Reliability** | High (no single point of failure) |
| **Administration** | Decentralized |
| **Performance** | Increases with more peers |

### Advantages:
1. No single point of failure
2. Cost-effective (no expensive server)
3. Easy to set up
4. Scalable
5. Resources increase with peers
6. Better fault tolerance
7. Load distribution

### Disadvantages:
1. Security concerns
2. Difficult to manage
3. Data inconsistency possible
4. No centralized control
5. Legal issues (piracy)
6. Performance depends on peers
7. Difficult to enforce policies

### Examples:
- BitTorrent
- Napster (historical)
- Gnutella
- eDonkey/eMule
- Skype (hybrid)
- Bitcoin/Blockchain
- Tor network

---

## Comparison: Client-Server vs P2P

| Feature | Client-Server | Peer-to-Peer |
|---------|---------------|--------------|
| **Architecture** | Centralized | Decentralized |
| **Server** | Dedicated server | No dedicated server |
| **Roles** | Fixed (client or server) | Dual (both) |
| **Scalability** | Limited by server | Highly scalable |
| **Cost** | Higher | Lower |
| **Security** | Better | Lower |
| **Management** | Easier | Difficult |
| **Reliability** | Lower (single point of failure) | Higher |
| **Data Consistency** | Better | Difficult to maintain |
| **Performance** | Depends on server | Increases with peers |
| **Setup** | Complex | Simple |
| **Examples** | Web, Email, Database | BitTorrent, Blockchain |
| **Traffic** | Concentrated | Distributed |
| **Bottleneck** | Server | None |
| **Suitable for** | Enterprises | File sharing, Cryptocurrencies |

---

## Client-Server & P2P MCQs

### Client-Server Questions

**Q211. In client-server architecture:**
- a) Client provides services
- b) Server requests services
- c) Server provides services ✓
- d) Both are equal

**Q212. Which initiates communication?**
- a) Server
- b) Client ✓
- c) Both equally
- d) Router

**Q213. Client-server is a:**
- a) Decentralized architecture
- b) Centralized architecture ✓
- c) Hybrid architecture
- d) Distributed architecture

**Q214. Web server example is:**
- a) BitTorrent
- b) Apache ✓
- c) Napster
- d) Gnutella

**Q215. In client-server, server is:**
- a) Optional
- b) Single point of failure ✓
- c) Not required
- d) Same as client

**Q216. DNS uses which architecture?**
- a) Pure P2P
- b) Client-Server ✓
- c) Hybrid
- d) None

**Q217. 2-tier architecture consists of:**
- a) Client only
- b) Server only
- c) Client and Server ✓
- d) Three layers

**Q218. 3-tier architecture has:**
- a) Client and Server only
- b) Presentation, Application, Data layers ✓
- c) Physical, Data Link, Network
- d) None

**Q219. Database server example is:**
- a) Apache
- b) MySQL ✓
- c) Nginx
- d) BitTorrent

**Q220. Mail server example is:**
- a) MySQL
- b) Apache
- c) Exchange ✓
- d) BitTorrent

**Q221. DHCP server provides:**
- a) Domain names
- b) IP addresses ✓
- c) Web pages
- d) Emails

**Q222. DNS server provides:**
- a) Domain name to IP resolution ✓
- b) IP addresses
- c) Web pages
- d) Files

**Q223. Proxy server acts as:**
- a) Main server
- b) Intermediary ✓
- c) Client
- d) Database

**Q224. In client-server, data is stored:**
- a) On clients
- b) On server ✓
- c) Distributed
- d) Nowhere

**Q225. Client-server security is:**
- a) Lower than P2P
- b) Higher than P2P ✓
- c) Same as P2P
- d) None

---

### P2P Questions

**Q226. In P2P architecture:**
- a) There is dedicated server
- b) All peers are equal ✓
- c) Only one peer serves
- d) None

**Q227. P2P stands for:**
- a) Point-to-Point
- b) Peer-to-Peer ✓
- c) Protocol-to-Protocol
- d) Port-to-Port

**Q228. In P2P, each peer can be:**
- a) Only client
- b) Only server
- c) Both client and server ✓
- d) Neither

**Q229. BitTorrent is example of:**
- a) Client-Server
- b) P2P ✓
- c) Hybrid only
- d) None

**Q230. Napster was example of:**
- a) Pure P2P
- b) Client-Server
- c) Hybrid P2P ✓
- d) None

**Q231. P2P is:**
- a) Centralized
- b) Decentralized ✓
- c) Semi-centralized
- d) None

**Q232. In P2P, who provides resources?**
- a) Dedicated server
- b) All peers ✓
- c) Only one peer
- d) Administrator

**Q233. Pure P2P has:**
- a) Central server
- b) No central server ✓
- c) Multiple servers
- d) Client only

**Q234. Hybrid P2P has:**
- a) No central component
- b) Some central components ✓
- c) Only servers
- d) Only clients

**Q235. Gnutella is example of:**
- a) Pure P2P ✓
- b) Hybrid P2P
- c) Client-Server
- d) None

**Q236. Blockchain uses:**
- a) Client-Server
- b) P2P ✓
- c) Hybrid
- d) Centralized

**Q237. Bitcoin network is:**
- a) Centralized
- b) Decentralized P2P ✓
- c) Client-Server
- d) None

**Q238. P2P fault tolerance is:**
- a) Lower than client-server
- b) Higher than client-server ✓
- c) Same as client-server
- d) None

**Q239. Skype uses:**
- a) Pure P2P
- b) Hybrid P2P ✓
- c) Pure Client-Server
- d) None

**Q240. Tor network is:**
- a) Centralized
- b) P2P based ✓
- c) Client-Server
- d) None

---

### Comparison Questions

**Q241. Which is more secure?**
- a) P2P
- b) Client-Server ✓
- c) Both equal
- d) Neither

**Q242. Which is more scalable?**
- a) P2P ✓
- b) Client-Server
- c) Both equal
- d) Neither

**Q243. Which is more cost-effective?**
- a) P2P ✓
- b) Client-Server
- c) Both equal
- d) Neither

**Q244. Which has single point of failure?**
- a) P2P
- b) Client-Server ✓
- c) Both
- d) Neither

**Q245. Which is easier to manage?**
- a) P2P
- b) Client-Server ✓
- c) Both equal
- d) Neither

**Q246. Which is better for enterprise?**
- a) P2P
- b) Client-Server ✓
- c) Both equal
- d) Neither

**Q247. Which is better for file sharing?**
- a) P2P ✓
- b) Client-Server
- c) Both equal
- d) Neither

**Q248. Data consistency is better in:**
- a) P2P
- b) Client-Server ✓
- c) Both equal
- d) Neither

**Q249. Traffic is distributed in:**
- a) P2P ✓
- b) Client-Server
- c) Both
- d) Neither

**Q250. Traffic is concentrated in:**
- a) P2P
- b) Client-Server ✓
- c) Both
- d) Neither

**Q251. Performance increases with more nodes in:**
- a) P2P ✓
- b) Client-Server
- c) Both
- d) Neither

**Q252. Server bottleneck exists in:**
- a) P2P
- b) Client-Server ✓
- c) Both
- d) Neither

**Q253. E-commerce websites typically use:**
- a) P2P
- b) Client-Server ✓
- c) Pure P2P
- d) None

**Q254. Online banking uses:**
- a) P2P
- b) Client-Server ✓
- c) Hybrid
- d) None

**Q255. Cryptocurrency mining typically uses:**
- a) Client-Server
- b) P2P ✓
- c) Centralized
- d) None

---

### Advanced Questions

**Q256. Which architecture is used by most websites?**
- a) P2P
- b) Client-Server ✓
- c) Hybrid
- d) None

**Q257. Which is used by FTP?**
- a) P2P
- b) Client-Server ✓
- c) Hybrid
- d) None

**Q258. Which is used by HTTP/HTTPS?**
- a) P2P
- b) Client-Server ✓
- c) Hybrid
- d) None

**Q259. Distributed Hash Table (DHT) is used in:**
- a) Client-Server
- b) Structured P2P ✓
- c) Centralized systems
- d) None

**Q260. Load balancing is important in:**
- a) Only P2P
- b) Only Client-Server ✓ (to distribute among multiple servers)
- c) Both
- d) Neither

---

# 📝 QUICK REVISION NOTES

## OSI Model - Quick Points

1. **7 Layers** - Physical, Data Link, Network, Transport, Session, Presentation, Application
2. **PDUs** - Bits, Frames, Packets, Segments, Data
3. **Physical** - Hub, Repeater, Bits
4. **Data Link** - Switch, Bridge, Frames, MAC (48 bits)
5. **Network** - Router, Packets, IP (32/128 bits)
6. **Transport** - Segments, TCP/UDP, Ports (0-65535)
7. **Upper Layers** - 5, 6, 7 (Software)
8. **Lower Layers** - 1, 2, 3, 4 (Hardware + Software)

## TCP/IP Model - Quick Points

1. **4 Layers** - Network Access, Internet, Transport, Application
2. **Practical model**, used in Internet
3. **Internet Layer** = OSI Network Layer
4. **Application Layer** = OSI Session + Presentation + Application

## Key Port Numbers

| Port | Service |
|------|---------|
| 20, 21 | FTP |
| 22 | SSH |
| 23 | Telnet |
| 25 | SMTP |
| 53 | DNS |
| 80 | HTTP |
| 110 | POP3 |
| 143 | IMAP |
| 443 | HTTPS |

## Switching - Quick Points

| Type | Key Point |
|------|-----------|
| Circuit | Dedicated path, Telephone, Connection-oriented |
| Packet-Datagram | Independent routing, IP, Connectionless |
| Virtual Circuit | Fixed path, ATM/X.25, Connection-oriented |
| Message | Store complete message, High delay |

## Architecture - Quick Points

| Client-Server | P2P |
|---------------|-----|
| Centralized | Decentralized |
| Server provides | All peers share |
| Single point of failure | No SPOF |
| Better security | Lower security |
| Higher cost | Lower cost |
| Web, Email, DB | BitTorrent, Blockchain |

---

# 🎯 EXAM TIPS

1. **Remember OSI mnemonic**: Please Do Not Throw Sausage Pizza Away
2. **PDU order**: Data → Segment → Packet → Frame → Bits
3. **TCP = Reliable**, **UDP = Fast but unreliable**
4. **Port 80 = HTTP**, **Port 443 = HTTPS**
5. **Circuit switching = Phone**, **Packet switching = Internet**
6. **Client-Server = Web**, **P2P = BitTorrent**
7. **MAC = 48 bits**, **IPv4 = 32 bits**, **IPv6 = 128 bits**
8. **Router = Network layer**, **Switch = Data Link layer**, **Hub = Physical layer**

---

# ✅ ALL THE BEST FOR YOUR EXAM!

This document covers:
- Complete theory for all 4 topics
- 260 MCQs with answers
- Comparison tables
- Quick revision notes
- Exam tips

Study well and stay confident! 🎓
