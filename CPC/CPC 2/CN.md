# 🖧 Computer Networks - Complete Placement Guide

## Table of Contents
1. [Data Link Layer](#1-data-link-layer)
2. [Framing](#2-framing)
3. [Error Detection](#3-error-detection)
4. [Medium Access Control](#4-medium-access-control)
5. [Ethernet Bridging](#5-ethernet-bridging)
6. [Mock Tests](#mock-tests)

---

# 1. Data Link Layer

## 📍 Position in OSI Model

```
┌─────────────────────────────────────┐
│  Layer 7: Application               │
├─────────────────────────────────────┤
│  Layer 6: Presentation              │
├─────────────────────────────────────┤
│  Layer 5: Session                   │
├─────────────────────────────────────┤
│  Layer 4: Transport                 │
├─────────────────────────────────────┤
│  Layer 3: Network                   │
├─────────────────────────────────────┤
│  Layer 2: DATA LINK  ◄── WE ARE HERE│
├─────────────────────────────────────┤
│  Layer 1: Physical                  │
└─────────────────────────────────────┘
```

## 🎯 Memory Hook: "FFEN" - Functions of DLL
| Letter | Function | What it means |
|--------|----------|---------------|
| **F** | Framing | Break data into frames |
| **F** | Flow Control | Don't overwhelm receiver |
| **E** | Error Control | Detect/correct errors |
| **N** | Node-to-Node delivery | Hop-by-hop transfer |

## 📦 Data Unit

```
Network Layer gives → PACKET
Data Link Layer creates → FRAME
Physical Layer transmits → BITS
```

## 🔄 Two Sub-Layers of DLL

```
┌─────────────────────────────────────┐
│         DATA LINK LAYER             │
├─────────────────────────────────────┤
│  LLC (Logical Link Control)         │
│  • Flow control                     │
│  • Error control                    │
│  • Multiplexing protocols           │
├─────────────────────────────────────┤
│  MAC (Medium Access Control)        │
│  • Physical addressing              │
│  • Channel access control           │
│  • Frame delimiting                 │
└─────────────────────────────────────┘
```

### 💡 Easy Remember:
- **LLC** = "Logical" = Software-like, handles logic (flow, errors)
- **MAC** = "Medium" = Hardware-like, handles physical medium access

## 🏷️ MAC Address (Physical Address)

```
Example: 00:1A:2B:3C:4D:5E

┌──────────────────┬──────────────────┐
│   First 24 bits  │   Last 24 bits   │
│       OUI        │   Device ID      │
│ (Manufacturer)   │  (Unique ID)     │
└──────────────────┴──────────────────┘

Total: 48 bits = 6 bytes
Written as: 12 hexadecimal digits
```

### Key Points for Placements:
| Property | Value |
|----------|-------|
| Size | 48 bits (6 bytes) |
| Notation | Hexadecimal |
| Scope | Local (single LAN) |
| Assigned by | Manufacturer (burned in NIC) |
| Broadcast address | FF:FF:FF:FF:FF:FF |

## 📊 Frame Structure (Generic)

```
┌─────────┬────────┬────────┬─────────┬─────────┬─────────┐
│  Flag   │  Dest  │ Source │  Data   │   FCS   │  Flag   │
│         │  Addr  │  Addr  │(Payload)│(Checksum│         │
└─────────┴────────┴────────┴─────────┴─────────┴─────────┘
    ▲                                      ▲
    │                                      │
  Start                               Error Check
 Delimiter                           (Frame Check
                                      Sequence)
```

## 🔄 Services Provided to Network Layer

### 1. Unacknowledged Connectionless
```
Sender ────Frame────► Receiver
         (No ACK, No connection)
         
Use: LAN, low error rate environments
Example: Ethernet
```

### 2. Acknowledged Connectionless
```
Sender ────Frame────► Receiver
       ◄────ACK──────
       (ACK, but no connection)
       
Use: Unreliable channels (WiFi)
```

### 3. Acknowledged Connection-Oriented
```
1. Connection Establishment
2. Data Transfer with ACKs
3. Connection Release

Use: Long, unreliable links (WAN)
```

---

# 2. Framing

## 🤔 Why Framing?

```
Physical layer sends: 01010110101010101110101010...
                      (Continuous bit stream)

Problem: Where does one message end and another begin?
Solution: FRAMING - divide into manageable chunks
```

## 📐 Framing Methods

### Method 1: Character Count

```
┌───┬───────────────┬───┬───────────────┬───┬────────────┐
│ 5 │ A  B  C  D    │ 6 │ E  F  G  H  I │ 4 │ J  K  L    │
└───┴───────────────┴───┴───────────────┴───┴────────────┘
  ▲                   ▲                   ▲
  │                   │                   │
Count=5             Count=6             Count=4
(includes          (includes           (includes
 itself)            itself)             itself)
```

**Problem: If count gets corrupted, everything breaks!**

```
Original:  5 A B C D | 6 E F G H I | 4 J K L
Corrupted: 7 A B C D | 6 E F G H I | 4 J K L
           └──────────────┘
           Now count=7, reads: A B C D 6 E
           
Result: Complete synchronization loss!
```

**Verdict:** ❌ Rarely used alone (single point of failure)

---

### Method 2: Byte Stuffing (Character Stuffing)

**Concept:** Use special characters to mark frame boundaries

```
FLAG = Special delimiter (e.g., 01111110 or "F")
ESC  = Escape character (e.g., "E")

Frame Format:
┌──────┬─────────────────────────┬──────┐
│ FLAG │        DATA             │ FLAG │
└──────┴─────────────────────────┴──────┘
```

**The Problem & Solution:**

```
What if data contains FLAG or ESC?

Rule: Insert ESC before FLAG or ESC in data

Example 1: Data = "Hello"
Frame = FLAG + Hello + FLAG  ✓ (No conflict)

Example 2: Data = "Hi FLAG there"
Frame = FLAG + Hi ESC FLAG there + FLAG ✓

Example 3: Data = "Hi ESC there"  
Frame = FLAG + Hi ESC ESC there + FLAG ✓

Example 4: Data = "A ESC FLAG B"
Frame = FLAG + A ESC ESC ESC FLAG B + FLAG ✓
```

**Visual Example:**

```
Original Data:    [A] [B] [FLAG] [ESC] [C]
                           ↓       ↓
After Stuffing:   [A] [B] [ESC][FLAG] [ESC][ESC] [C]

Transmitted:   FLAG + A B ESC FLAG ESC ESC C + FLAG
```

**Receiver's Job (Unstuffing):**
```
1. See ESC → Remove it, keep next character literally
2. See FLAG without preceding ESC → Frame boundary
```

**Used in:** PPP (Point-to-Point Protocol)

---

### Method 3: Bit Stuffing

**Concept:** Work at bit level, not byte level

```
FLAG pattern = 01111110 (six consecutive 1s between 0s)

Rule: After any FIVE consecutive 1s in data, insert a 0
```

**Why this works:**

```
FLAG = 01111110 (has six 1s)

With bit stuffing:
- Data can NEVER have six consecutive 1s
- Only FLAG has six consecutive 1s
- Therefore, FLAG is unambiguous!

┌────────────────────────────────────────────────────────────────┐
│                                                                │
│   ┌──────┐   ┌─────────────────────────────┐   ┌──────┐       │
│   │ FLAG │ + │      STUFFED DATA           │ + │ FLAG │       │
│  │01111110│  │ (no 6+ consecutive 1s)      │  │01111110│      │
│   └──────┘   └─────────────────────────────┘   └──────┘       │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

**Example:**

```
Original Data:    01111110011111100111111111
                  └──────┘ └──────┘
                  Looks    Looks
                  like     like
                  FLAG!    FLAG!

After Stuffing:   011111[0]10011111[0]10011111[0]111
                         ▲          ▲          ▲
                      Inserted  Inserted   Inserted bits

Rule Applied:
01111110  → 011111[0]10  (0 inserted after 11111)
```

**Step-by-step stuffing:**

```
Original Data:  1 1 1 1 1 1 1 0 1 1 1 1 1 0 1
                └─────────┘     └───────┘
                 7 ones          5 ones
                 (Problem!)      (OK)

Step-by-step stuffing:

Position:   1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
Data:       1  1  1  1  1  1  1  0  1  1  1  1  1  0  1
Count:      1  2  3  4  5  ↓     0  1  2  3  4  5  ↓
                           │                       │
                    Insert 0                Insert 0
                    Reset count            Reset count

After Stuffing:
            1  1  1  1  1 [0] 1  1  0  1  1  1  1  1 [0] 0  1
                           ▲                          ▲
                        Stuffed                    Stuffed


TRANSMITTED FRAME:
┌──────────┬───────────────────────────────────┬──────────┐
│ 01111110 │ 1111101100111110̲01                │ 01111110 │
│  (FLAG)  │      (Stuffed Data)               │  (FLAG)  │
└──────────┴───────────────────────────────────┴──────────┘
```

**Receiver's Unstuffing:**
```
RULE: After seeing 5 consecutive 1s, REMOVE the next bit (which will be 0)

Received Data:   1 1 1 1 1 [0] 1 1 0 1 1 1 1 1 [0] 0 1
                            ▲                   ▲
                         Remove               Remove

Recovered Data:  1 1 1 1 1  1  1 0 1 1 1 1 1  0  1
                 └─────────────┘   └───────────────┘
                  Original data perfectly recovered!
```

**Used in:** HDLC, USB, SONET

---

### Method 4: Physical Layer Coding Violations

**Concept:** Use "illegal" signal patterns as delimiters

# Physical Layer Coding Violations - Clear Explanation

## First, Let's Understand Manchester Encoding Properly

### Why Do We Need Encoding?

```
Problem with Raw Binary:

    Sender sends: 0 0 0 0 0 0 0 0 0 0 0 0
    
    Signal:  ────────────────────────────── (flat line)
    
    Receiver: "Is this 10 zeros? 12 zeros? 100 zeros?"
              "Is the connection even working??"
              "How do I sync my clock??"

PROBLEM: No transitions = No way to synchronize clocks!
```

### Manchester Encoding Solution

```
RULE: Every bit MUST have a transition in the MIDDLE of its time slot

┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   Bit 0 = HIGH in first half, LOW in second half  (↓)     │
│   Bit 1 = LOW in first half, HIGH in second half  (↑)     │
│                                                             │
└─────────────────────────────────────────────────────────────┘

       Bit 0                    Bit 1
    ┌────────┐               │        ┌────────┐
    │ HIGH   │               │  LOW   │  HIGH  │
    │        │               │        │        │
    │        └────────┐      └────────┘        │
    │          LOW    │                        │
    └─────────────────┘      └─────────────────┘
           ↓                        ↑
    Transition DOWN          Transition UP
     in middle               in middle
```

## Let's Encode Some Real Data

### Example: Encoding "1 0 1 1 0"

```
Data bits:    1        0        1        1        0

Time slots: |──────|──────|──────|──────|──────|

For bit 1: LOW→HIGH (↑)     For bit 0: HIGH→LOW (↓)


Signal:
        ┌────┐      ┌────┐  ┌────┐      
        │    │      │    │  │    │      
   ─────┘    │ ┌────┘    │  │    │ ┌────┘
             │ │         │  │    │ │     
             └─┘         └──┘    └─┘     
   
   |    1    |    0    |    1    |    1    |    0    |
       ↑          ↓         ↑         ↑         ↓
      L→H        H→L       L→H       L→H       H→L
```

### The KEY Observation

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│   In Manchester Encoding, EVERY bit period has a           │
│   transition in the MIDDLE:                                 │
│                                                             │
│   • Either HIGH → LOW  (representing 0)                    │
│   • Or     LOW → HIGH  (representing 1)                    │
│                                                             │
│   There is NO VALID DATA that can produce NO TRANSITION!   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Now: What is a VIOLATION?

### A Violation = Breaking the Rules on Purpose

```
NORMAL (Valid data):
Every bit slot has a transition in the middle

        ┌────┐      ┌────┐
        │    │      │    │
   ─────┘    └──────┘    └──────
        
        ↑         ↑         ↑
   Transition Transition Transition
     (OK)       (OK)       (OK)


VIOLATION (Impossible in normal data):
NO transition in the middle!

   ─────────────────────────────    ← Stays HIGH, no transition
   
   OR
   
   ─────────────────────────────    ← Stays LOW, no transition
             
             ↑
        No transition here!
        This is ILLEGAL in Manchester encoding
        This can ONLY be a delimiter!
```

## Real-World Example: Ethernet's Use of Violations

### Ethernet Preamble and Start Frame Delimiter

```
Ethernet uses Manchester encoding and needs to mark where frame starts.

PREAMBLE (7 bytes of 10101010):
Normal Manchester encoding - lots of transitions
Purpose: Let receiver synchronize its clock

   ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐
   │ │ │ │ │ │ │ │ │ │ │ │ │ │ │ │
───┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └───
   1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0
   
   "Nice regular pattern, I can sync my clock to this!"


START FRAME DELIMITER (SFD = 10101011):
Ends with TWO consecutive 1s

   ┌─┐ ┌─┐ ┌─┐ ┌───────┐
   │ │ │ │ │ │ │       │    ← Notice: No transition 
───┘ └─┘ └─┘ └─┘       └───     between the two 1s!
   1 0 1 0 1 0 1   1
                 └───┘
            This pattern (11) creates a 
            "violation" of the regular alternating pattern
            
   "Aha! Pattern broke! Frame data starts NOW!"
```

## Another Example: Token Ring

### Token Ring uses Differential Manchester + Violations

```
Differential Manchester:
- Transition at START of bit = 0
- NO transition at START of bit = 1
- ALWAYS transition in MIDDLE (for clocking)


NORMAL DATA:

Bit:      0           1           0           1
      ┌───────┐               ┌───────┐
      │   ↓   │   ┌───────┐   │   ↓   │   ┌───────┐
──────┘       └───┘   ↓   └───┘       └───┘   ↓   └──
      ↑           ↑       ↑   ↑           ↑       ↑
   Start      Middle   Start Middle    Start   Middle
   (has         (has    (no   (has     (has     (has
   trans)       trans)  trans) trans)  trans)   trans)


J VIOLATION (No middle transition, HIGH→HIGH):
      ┌───────────────┐
      │               │      ← Stays HIGH through middle!
──────┘               └──────
      
      "Wait, no middle transition? This is J symbol!"


K VIOLATION (No middle transition, LOW→LOW):

──────┐               ┌──────
      │               │      ← Stays LOW through middle!
      └───────────────┘
      
      "No middle transition again? This is K symbol!"


Frame Delimiter = JK pattern:
      ┌───────────────┐           ┌──────
      │      J        │           │
──────┘               └───────────┘
                            K
                      
      "JK detected! This marks frame boundary!"
```

## Visual Comparison: Normal vs Violation

```
┌─────────────────────────────────────────────────────────────────┐
│                    NORMAL MANCHESTER DATA                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Bit period:  |←────────────→|                                 │
│                                                                 │
│   Bit 0:       ▄▄▄▄▄▄▄▄                                         │
│                        ▄▄▄▄▄▄▄▄                                 │
│                    ↑                                            │
│                 MUST have                                       │
│                transition                                       │
│                                                                 │
│   Bit 1:               ▄▄▄▄▄▄▄▄                                 │
│                ▄▄▄▄▄▄▄▄                                         │
│                    ↑                                            │
│                 MUST have                                       │
│                transition                                       │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│                      VIOLATION                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   No transition in middle:                                      │
│                                                                 │
│   Type 1:      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄                                 │
│                (Stays HIGH)                                     │
│                    ↑                                            │
│                 NO transition!                                  │
│                 IMPOSSIBLE for real data                        │
│                                                                 │
│   Type 2:      ________________                                 │
│                (Stays LOW)                                      │
│                    ↑                                            │
│                 NO transition!                                  │
│                 IMPOSSIBLE for real data                        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Why Is This Clever?

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│  COMPARE WITH OTHER FRAMING METHODS:                            │
│                                                                 │
│  ┌─────────────────┬─────────────────┬───────────────────────┐  │
│  │     Method      │    Overhead     │       Issue           │  │
│  ├─────────────────┼─────────────────┼───────────────────────┤  │
│  │ Character Count │   1 byte/frame  │ Single point failure  │  │
│  ├─────────────────┼─────────────────┼───────────────────────┤  │
│  │ Byte Stuffing   │   Variable      │ Extra ESC bytes       │  │
│  ├─────────────────┼─────────────────┼───────────────────────┤  │
│  │ Bit Stuffing    │   ~1 bit/5 bits │ Extra 0s added        │  │
│  ├─────────────────┼─────────────────┼───────────────────────┤  │
│  │ Code Violation  │   ZERO!         │ Need specific encoding│  │
│  └─────────────────┴─────────────────┴───────────────────────┘  │
│                                                                 │
│  Code Violation = FREE delimiters (no extra bits needed)!       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Complete Frame Example

```
ETHERNET FRAME TRANSMISSION:

Step 1: Idle Line (no data)
────────────────────────────────────────
(Line stays at constant voltage)


Step 2: Preamble (10101010 × 7 bytes)
   ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐
───┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─ ...
"Regular transitions - sync your clock here!"


Step 3: Start Frame Delimiter (10101011)
   ┌─┐ ┌─┐ ┌─┐ ┌─────┐
───┘ └─┘ └─┘ └─┘     └───
            └───────┘
            "11" pattern - different from preamble!
            "Frame is starting NOW!"


Step 4: Actual Frame Data
   [Destination MAC][Source MAC][Type][Data][FCS]
   (All encoded in normal Manchester)


Step 5: End of Frame
   Return to idle...
────────────────────────────────────────
```

## Memory Trick 🧠

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│   Think of it like GRAMMAR RULES:                               │
│                                                                 │
│   Normal English: "Hello, how are you?"                         │
│                   (Follows grammar rules)                       │
│                                                                 │
│   Violation:      "!!!CHAPTER_START!!!"                         │
│                   (Intentionally breaks rules)                  │
│                   (Can NEVER appear in normal text)             │
│                   (So it's a perfect section marker!)           │
│                                                                 │
│   Similarly:                                                    │
│   - Manchester encoding has RULES (must transition in middle)   │
│   - Violation = Intentionally break the rule                    │
│   - Since real data CANNOT break this rule...                   │
│   - Violations are PERFECT frame delimiters!                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Summary

| Aspect | Description |
|--------|-------------|
| **What it is** | Using "illegal" signal patterns as frame markers |
| **Why it works** | Normal data encoding CANNOT produce these patterns |
| **Advantage** | Zero overhead - no extra bits added to data |
| **Disadvantage** | Only works with encoding schemes that have "illegal" patterns |
| **Used in** | Ethernet (10 Mbps), Token Ring, FDDI |

---

## 📊 Framing Methods Comparison

| Method | Overhead | Reliability | Used In |
|--------|----------|-------------|---------|
| Character Count | 1 byte/frame | Poor | Historical |
| Byte Stuffing | Variable | Good | PPP |
| Bit Stuffing | ~0.4% | Excellent | HDLC, USB |
| Code Violation | Zero | Excellent | Ethernet |

---

# 3. Error Detection

## 🎯 Why Errors Occur?

```
Signal Degradation Causes:
┌─────────────────────────────────────────────────┐
│  1. Attenuation (signal weakens with distance)  │
│  2. Noise (electromagnetic interference)        │
│  3. Distortion (signal shape changes)           │
│  4. Cross-talk (interference from other wires)  │
└─────────────────────────────────────────────────┘
```

## 📊 Types of Errors

### Single-Bit Error
```
Sent:     10101001
Received: 10101011
                 ▲
            Only 1 bit changed
            
Cause: Short-duration noise
```

### Burst Error
```
Sent:     10101001 01100110
Received: 10111101 01100110
            ▲▲▲▲
          Multiple consecutive bits changed
          
Cause: Long-duration noise, lightning
Burst Length: First corrupted to last corrupted bit
```

---

## 🔍 Error Detection Techniques

### 1. Simple Parity Check

**Concept:** Add 1 extra bit to make total 1s even (or odd)

```
Even Parity:
Data = 1011001 (four 1s - already even)
Parity bit = 0
Transmitted = 10110010

Data = 1011101 (five 1s - odd)  
Parity bit = 1 (to make it 6 = even)
Transmitted = 10111011
```

**How Receiver Checks:**
```
Count all 1s (including parity bit)
If even → Assume no error
If odd → Error detected!
```

**Limitation:**
```
Can detect: Odd number of bit errors (1, 3, 5...)
Cannot detect: Even number of bit errors (2, 4, 6...)

Example:
Sent:     1011001|0| (even parity)
Received: 1001001|0| (2 bits flipped)
               ▲▲
Check: Count 1s = 4 (even) → "No error" ← WRONG!
```

**Summary:**
- Detects: Single-bit errors ✅
- Misses: Burst errors, even-numbered errors ❌

---

### 2. Two-Dimensional Parity

**Concept:** Arrange data in matrix, add parity for rows AND columns

```
Original Data (7 bytes):
1 0 1 1 0 0 1
1 1 0 1 0 0 1
0 0 1 0 0 1 0
1 1 0 1 1 0 1

Add row parity (even):        Add column parity:
1 0 1 1 0 0 1 | 0              1 0 1 1 0 0 1 | 0
1 1 0 1 0 0 1 | 1              1 1 0 1 0 0 1 | 1
0 0 1 0 0 1 0 | 0              0 0 1 0 0 1 0 | 0
1 1 0 1 1 0 1 | 0              1 1 0 1 1 0 1 | 0
                               ─────────────────
                               1 0 0 1 1 1 1 | 0 ← Corner
                               ▲
                            Column parities
```

**Single-bit Error Detection & Correction:**
```
Error occurs at position (2,3):

1 0 1 1 0 0 1 | 0 ✓
1 1 1 1 0 0 1 | 1 ✗ ← Row 2 fails
    ▲
0 0 1 0 0 1 0 | 0 ✓
1 1 0 1 1 0 1 | 0 ✓
─────────────────
1 0 1 1 1 1 1 | 0
    ▲
    Column 3 fails

Intersection of failed row & column = Error position!
→ Can CORRECT single-bit error!
```

**Capability:**
| Errors | Detection | Correction |
|--------|-----------|------------|
| 1 bit | ✅ | ✅ |
| 2 bits | ✅ | ❌ |
| 3 bits | ✅ (mostly) | ❌ |
| Some burst | ✅ | ❌ |

---

### 3. Checksum

**Concept:** Add all data segments, transmit sum's complement, receiver verifies

#### Internet Checksum Algorithm

```
Step 1: Divide data into fixed-size words (e.g., 8-bit or 16-bit)
Step 2: Add all words (wrap around carry if overflow)
Step 3: Take 1's complement of sum → This is checksum
Step 4: Transmit data + checksum
```

#### Complete Example (8-bit words)

```
┌─────────────────────────────────────────────────────────────────────┐
│                         SENDER'S END                                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  Frame 1:         1 1 0 0 1 1 0 0                                   │
│  Frame 2:       + 1 0 1 0 1 0 1 0                                   │
│                 ─────────────────                                   │
│  Partial Sum:   1 0 1 1 1 0 1 1 0   ← 9 bits! (overflow)            │
│                 ↓                                                   │
│  Wrap carry:      0 1 1 1 0 1 1 0                                   │
│                 +               1   ← Add the carry bit             │
│                 ─────────────────                                   │
│                   0 1 1 1 0 1 1 1                                   │
│                                                                     │
│  Frame 3:       + 1 1 1 1 0 0 0 0                                   │
│                 ─────────────────                                   │
│  Partial Sum:   1 0 1 1 0 0 1 1 1   ← 9 bits! (overflow)            │
│                 ↓                                                   │
│  Wrap carry:      0 1 1 0 0 1 1 1                                   │
│                  +              1   ← Add the carry bit             │
│                 ─────────────────                                   │
│                   0 1 1 0 1 0 0 0                                   │
│                                                                     │
│  Frame 4:       + 1 1 0 0 0 0 1 1                                   │
│                 ─────────────────                                   │
│  Partial Sum:   1 0 0 1 0 1 0 1 1   ← 9 bits! (overflow)            │
│                 ↓                                                   │
│  Wrap carry:      0 0 1 0 1 0 1 1                                   │
│                  +              1   ← Add the carry bit             │
│                 ─────────────────                                   │
│  Final Sum:       0 0 1 0 1 1 0 0                                   │
│                                                                     │
│  Checksum:        1 1 0 1 0 0 1 1   ← 1's complement of sum         │
│                                                                     │
│  TRANSMIT: [Frame1][Frame2][Frame3][Frame4][Checksum]               │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────────────┐
│                        RECEIVER'S END                               │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  Frame 1:         1 1 0 0 1 1 0 0                                   │
│  Frame 2:       + 1 0 1 0 1 0 1 0                                   │
│                 ─────────────────                                   │
│  Partial Sum:   1 0 1 1 1 0 1 1 0   (overflow → wrap)               │
│                   0 1 1 1 0 1 1 1                                   │
│                                                                     │
│  Frame 3:       + 1 1 1 1 0 0 0 0                                   │
│                 ─────────────────                                   │
│  Partial Sum:   1 0 1 1 0 0 1 1 1   (overflow → wrap)               │
│                   0 1 1 0 1 0 0 0                                   │
│                                                                     │
│  Frame 4:       + 1 1 0 0 0 0 1 1                                   │
│                 ─────────────────                                   │
│  Partial Sum:   1 0 0 1 0 1 0 1 1   (overflow → wrap)               │
│                   0 0 1 0 1 1 0 0                                   │
│                                                                     │
│  Checksum:      + 1 1 0 1 0 0 1 1   ← Add received checksum         │
│                 ─────────────────                                   │
│  Result:        1 1 1 1 1 1 1 1     ← ALL 1s!                       │
│                                                                     │
│  Complement:    0 0 0 0 0 0 0 0     ← ALL 0s = NO ERROR!            │
│                                                                     │
│                    ✓ ACCEPT FRAMES                                  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### Why This Works

```
Sum + Checksum = Sum + (1's complement of Sum) = All 1s

  Sum:       00101100
  Checksum:  11010011  (1's complement)
           + ─────────
             11111111  ✓ All 1s = Valid!
```

#### Error Detection

```
If ANY bit changes during transmission:

  Sum:       00101100
  Checksum:  11010001  ← Bit error!
           + ─────────
             11111101  ✗ NOT all 1s = ERROR!
```

#### Limitations

| Limitation | Example |
|------------|---------|
| Cannot detect word swaps | Frame 1 ↔ Frame 2 swapped (same sum) |
| Cannot detect compensating errors | +1 in one word, -1 in another |
| Order-independent | Addition is commutative |

#### Usage

```
Protocol     │ Checksum Size │ Mandatory?
─────────────┼───────────────┼───────────
IP Header    │ 16-bit        │ Yes (IPv4), No (IPv6)
TCP          │ 16-bit        │ Yes
UDP          │ 16-bit        │ Optional (IPv4), Required (IPv6)
```

### 4. Cyclic Redundancy Check (CRC) ⭐

**Most Important for Placements!**

**Concept:** Polynomial division using XOR

```
Components:
- Data: D (k bits)
- Generator: G (n+1 bits) - agreed upon
- CRC: R (n bits) - calculated
- Transmitted: D + R (k+n bits)
```

#### CRC Calculation Steps:

```
Given:
- Data D = 1001 (4 bits)
- Generator G = 1011 (4 bits, so n=3)

Step 1: Append n zeros to data
        D' = 1001 000 (append 3 zeros)

Step 2: Divide D' by G using XOR (mod-2 division)

        1001000 ÷ 1011

            1 0 1 0    ← Quotient (ignored)
           ─────────
    1011 │ 1001000
          1011
          ─────
           0100      ← XOR result
           1011      ← Can't divide (starts with 0)
           ─────
            1000     ← Bring down, try again
            1011
            ─────
             0110    ← Remainder = CRC = 110

Step 3: Transmitted message = D + CRC = 1001 110
```

**Detailed XOR Division:**

```
    1001000
XOR 1011       (when leftmost bit is 1, XOR with G)
    ────────
    0010000    
    
Next: 0010000 (leftmost is 0, just shift)
Continue until remainder has fewer bits than G

    01 0000
XOR  1011     (align with next 1)
    ────────
     01 1000
XOR   1011
    ────────
      0 0110  ← This is CRC (n=3 bits): 110
```

**Receiver Verification:**

```
Received: 1001110

Divide by G = 1011:

1001110 ÷ 1011

If remainder = 0 → No error ✅
If remainder ≠ 0 → Error detected ❌
```

#### Common Generator Polynomials:

| Name | Polynomial | Binary | Detects |
|------|------------|--------|---------|
| CRC-8 | x⁸+x²+x¹+1 | 100000111 | 8-bit |
| CRC-16 | x¹⁶+x¹⁵+x²+1 | ... | 16-bit |
| CRC-32 | x³²+x²⁶+... | ... | Ethernet |

#### CRC Detection Capabilities:

```
For generator G of degree n:

✅ All single-bit errors
✅ All double-bit errors (if G has ≥3 terms)
✅ All odd number of bit errors (if G has (x+1) factor)
✅ All burst errors ≤ n bits
✅ Most burst errors > n bits (probability = 1 - 2^(-n))
```

**Why CRC is powerful:**
```
Mathematical property:
If G divides (D + CRC) perfectly,
then any error E is detected unless G divides E

Probability of undetected error ≈ (1/2)^n

For CRC-32: (1/2)^32 ≈ 0.00000000023%
```

---

### 5. Hamming Code (Error Correction)

**Concept:** Position parity bits at power-of-2 positions

```
Bit positions: 1  2  3  4  5  6  7  8  9  10 11 12...
               P1 P2 D1 P4 D2 D3 D4 P8 D5 D6 D7 D8...
               ▲  ▲     ▲           ▲
               Parity bits at 2^n positions
```

**Parity Bit Coverage:**

```
P1 (position 1) checks: 1, 3, 5, 7, 9, 11... (binary ends in 1)
P2 (position 2) checks: 2, 3, 6, 7, 10, 11... (binary has 1 in 2's place)
P4 (position 4) checks: 4, 5, 6, 7, 12, 13... (binary has 1 in 4's place)
P8 (position 8) checks: 8, 9, 10, 11, 12... (binary has 1 in 8's place)
```

**Visual Coverage Pattern:**

```
Position:  1  2  3  4  5  6  7  8  9  10 11 12
Binary:   01 10 11 100 101 110 111 1000...

P1 (x x x 1): ✓  .  ✓  .  ✓  .  ✓  .  ✓  .  ✓  .
P2 (x x 1 x): .  ✓  ✓  .  .  ✓  ✓  .  .  ✓  ✓  .
P4 (x 1 x x): .  .  .  ✓  ✓  ✓  ✓  .  .  .  .  ✓
P8 (1 x x x): .  .  .  .  .  .  .  ✓  ✓  ✓  ✓  ✓
```

**Example - Encoding Data 1011:**

```
Data bits: D1=1, D2=0, D3=1, D4=1

Place in template:
Position:  1   2   3   4   5   6   7
          P1  P2  D1  P4  D2  D3  D4
          ?   ?   1   ?   0   1   1

Calculate parity bits (even parity):

P1 checks positions 1,3,5,7: P1, 1, 0, 1
   Sum of data = 1+0+1 = 2 (even) → P1 = 0

P2 checks positions 2,3,6,7: P2, 1, 1, 1
   Sum of data = 1+1+1 = 3 (odd) → P2 = 1

P4 checks positions 4,5,6,7: P4, 0, 1, 1
   Sum of data = 0+1+1 = 2 (even) → P4 = 0

Result:    0   1   1   0   0   1   1
          P1  P2  D1  P4  D2  D3  D4
```

**Error Detection & Correction:**

```
Received: 0 1 1 0 1 1 1 (bit 5 flipped: was 0, now 1)
                  ▲

Check each parity:
P1 (1,3,5,7): 0+1+1+1 = 3 (odd) → FAIL → 1
P2 (2,3,6,7): 1+1+1+1 = 4 (even) → PASS → 0
P4 (4,5,6,7): 0+1+1+1 = 3 (odd) → FAIL → 1

Error position = P4 P2 P1 = 1 0 1 = 5 (in binary)

Flip bit 5 to correct!
```

**Hamming Distance:**

```
Minimum Hamming Distance = Minimum bit differences between any two valid codewords

To detect d errors: Need minimum distance ≥ d + 1
To correct d errors: Need minimum distance ≥ 2d + 1

Hamming(7,4) code: Distance = 3
→ Can detect 2-bit errors
→ Can correct 1-bit error
```

---

## 📊 Error Detection Comparison Table

| Method | Detection | Correction | Overhead | Complexity | Used In |
|--------|-----------|------------|----------|------------|---------|
| Simple Parity | 1-bit, odd errors | ❌ | 1 bit | Low | Memory |
| 2D Parity | 1-3 bits, some burst | 1-bit | ~√n bits | Medium | Historical |
| Checksum | Most errors | ❌ | 16-32 bits | Low | TCP/IP |
| CRC | Burst up to n bits | ❌ | n bits | Medium | Ethernet, WiFi |
| Hamming | Multi-bit | 1-bit | log₂n bits | High | ECC Memory |

---

# 4. Medium Access Control (MAC)

## 🤔 The Fundamental Problem

```
Multiple devices, ONE shared channel

    Device A ──┐
    Device B ──┼── Shared Medium ── 
    Device C ──┘
    
If A and B transmit simultaneously → COLLISION → Data lost!

Question: Who gets to transmit when?
```

## 📊 Classification of MAC Protocols

```
                    MAC Protocols
                         │
        ┌────────────────┼────────────────┐
        │                │                │
   Random Access    Controlled       Channelization
        │            Access               │
        │                │                │
   ┌────┴────┐     ┌─────┴─────┐    ┌─────┴─────┐
   │  ALOHA  │     │  Polling  │    │   FDMA    │
   │  CSMA   │     │  Token    │    │   TDMA    │
   │  CSMA/CD│     │  Reserv.  │    │   CDMA    │
   │  CSMA/CA│     │           │    │           │
   └─────────┘     └───────────┘    └───────────┘
```

---

## 🎲 Random Access Protocols

### 1. Pure ALOHA

**Concept:** Transmit whenever you want. Hope for the best!

```
Station has data → Transmit immediately
Wait for ACK
No ACK? → Wait random time, retransmit
```

**Visual Timeline:**

```
Time ──────────────────────────────────────────────►

Station A:    ████████
Station B:           ████████
                     ▲▲▲▲
                   Collision!
                   
Station C:                      ████████  (Success)
```

**Vulnerable Time:**

```
Frame transmission time = Tf

For successful transmission of frame at time t,
no other station should transmit in [t-Tf, t+Tf]

Vulnerable Period = 2 × Tf

     ─────────────►
     ◄──── Tf ────►
   ──────────────────────►
     ◄────── 2Tf ───────►
         Vulnerable
```

**Throughput Calculation:**

```
Let G = average frames generated per frame time (offered load)
Let S = throughput (successful transmissions)

Probability of no collision = e^(-2G)
S = G × e^(-2G)

Maximum throughput when G = 0.5:
S_max = 0.5 × e^(-1) = 0.184 = 18.4%
```

**Graph:**
```
   S ▲
     │        * Max at G=0.5
0.184│.......*.*
     │     *     *
     │   *         *
     │ *             *
     │*               *
     └──────────────────► G
        0.5  1.0
```

---

### 2. Slotted ALOHA

**Concept:** Divide time into slots. Transmit only at slot beginning.

```
Slot size = Frame transmission time

     Slot 1   Slot 2   Slot 3   Slot 4
   ──┬────────┬────────┬────────┬────────┬──
     │        │        │        │        │
     │ Station│  Empty │Collision│Station │
     │ A sends│        │ B & C  │ B retry│
     │        │        │        │        │
```

**Advantage:** Vulnerable time reduced to Tf (half of Pure ALOHA)

**Throughput:**
```
Probability of success = e^(-G)
S = G × e^(-G)

Maximum at G = 1:
S_max = 1 × e^(-1) = 0.368 = 36.8%

Double the efficiency of Pure ALOHA!
```

**Comparison:**

| Metric | Pure ALOHA | Slotted ALOHA |
|--------|------------|---------------|
| Vulnerable time | 2Tf | Tf |
| Max throughput | 18.4% | 36.8% |
| Requires sync | No | Yes |
| Complexity | Simple | Needs slot sync |

---

### 3. CSMA (Carrier Sense Multiple Access)

**Concept:** Listen before you talk!

```
"Sense the carrier (channel) before transmitting"

Channel busy? → Wait
Channel idle? → Transmit
```

**But wait... why do collisions still happen?**

```
Propagation Delay Problem:

Time 0:    A starts transmitting
           Signal traveling... 
           B senses: "Channel idle!" (signal hasn't reached yet)
           B starts transmitting
           
Time t_p:  Signals meet → COLLISION!

     A ═══════════════════════════► B
       ──────────────────►
              Signal traveling
       
       Collision happens because of propagation delay!
```

#### CSMA Variants:

**a) 1-Persistent CSMA**
```
┌─────────────────────────────────────────────┐
│ Sense channel                               │
│ If IDLE → Transmit immediately (p=1)        │
│ If BUSY → Keep sensing, transmit when idle  │
└─────────────────────────────────────────────┘

Problem: If multiple stations waiting, ALL transmit when idle!
→ Guaranteed collision
```

**b) Non-Persistent CSMA**
```
┌─────────────────────────────────────────────┐
│ Sense channel                               │
│ If IDLE → Transmit immediately              │
│ If BUSY → Wait random time, sense again     │
└─────────────────────────────────────────────┘

Advantage: Reduces collision probability
Disadvantage: Channel may go idle while waiting → Wasted capacity
```

**c) p-Persistent CSMA**
```
┌─────────────────────────────────────────────┐
│ Sense channel                               │
│ If IDLE →                                   │
│    Transmit with probability p              │
│    Wait one slot with probability (1-p)     │
│ If BUSY → Wait for idle, then apply above   │
└─────────────────────────────────────────────┘

Balance between 1-persistent and non-persistent
```

**Comparison Flow:**

```
         Channel State?
              │
     ┌────────┴────────┐
     │                 │
   IDLE              BUSY
     │                 │
     │          ┌──────┴──────┐
     │          │             │
     │     1-Persist    Non-Persist
     │     "keep         "random
     │     sensing"       wait"
     │
┌────┴────┐
│         │
1-Persist p-Persist
"transmit "transmit
immediately with prob p"
```

---

### 4. CSMA/CD (Collision Detection) ⭐

**Used in: Ethernet (Wired Networks)**

**Concept:** Listen while transmitting. Detect collision early, abort.

```
┌────────────────────────────────────────────────┐
│ 1. Sense channel                               │
│ 2. If IDLE → Start transmitting               │
│ 3. WHILE transmitting:                         │
│    - Monitor channel                           │
│    - If collision detected → ABORT            │
│    - Send JAM signal (48 bits)                │
│    - Wait random time (Binary Exponential      │
│      Backoff)                                  │
│    - Retry                                     │
│ 4. If no collision → Success!                  │
└────────────────────────────────────────────────┘
```

**Collision Detection Mechanism:**

```
Normal signal level: ─────────
During collision:    ═════════  (Higher amplitude due to overlap)

Station monitors its own transmission
If received signal ≠ transmitted signal → Collision!
```

**JAM Signal Purpose:**

```
When collision detected:
1. Stop transmitting data
2. Send 48-bit JAM signal
3. Ensures all stations know about collision

Why 48 bits?
- Enough for signal to reach all stations
- All stations detect collision reliably
```

**Binary Exponential Backoff:**

```
After collision #n:
Wait time = Random(0, 2^n - 1) × slot time

n    Wait slots (range)    Max wait
1    [0, 1]                1 slot
2    [0, 3]                3 slots
3    [0, 7]                7 slots
4    [0, 15]               15 slots
...
10   [0, 1023]             1023 slots

After 16 collisions → Give up, report failure
```

**Minimum Frame Size Calculation:**

```
Key Insight: Sender must be transmitting when collision signal returns

Round-trip time = 2 × propagation delay = 2τ

Transmission time ≥ 2τ
Frame size ≥ 2τ × Bandwidth

For Ethernet:
- Max distance: 2500m
- Propagation speed: 2×10^8 m/s
- τ = 2500/(2×10^8) = 12.5 μs
- 2τ = 25 μs
- At 10 Mbps: Min frame = 25μs × 10Mbps = 250 bits

Rounded up to 512 bits (64 bytes) for safety margin
```

**Ethernet Minimum Frame Size = 64 bytes = 512 bits**

```
Why 64 bytes?

┌──────┬──────┬──────┬─────────┬─────┐
│Dest  │Source│Type  │  Data   │ FCS │
│ MAC  │ MAC  │      │ 46-1500 │     │
│  6B  │  6B  │  2B  │  bytes  │ 4B  │
└──────┴──────┴──────┴─────────┴─────┘

Minimum: 6+6+2+46+4 = 64 bytes
```

---

### 5. CSMA/CA (Collision Avoidance) ⭐

**Used in: WiFi (Wireless Networks)**

**Why not CSMA/CD for wireless?**

```
Problems in Wireless:

1. Hidden Terminal Problem:
   
   A ──────── AP ──────── B
   
   A and B can't hear each other
   Both think channel is free
   Both transmit → Collision at AP!

2. Exposed Terminal Problem:

   A ←─── B ───► C ───► D
   
   B transmitting to A
   C hears B, thinks it can't transmit
   But C could safely transmit to D!

3. Collision Detection difficult:
   - Transmitted signal >> Received signal
   - Can't detect collisions while transmitting
```

**CSMA/CA Mechanisms:**

**a) Interframe Spacing (IFS)**
```
Different priorities using different wait times:

SIFS (Short IFS):     Highest priority (ACK, CTS)
PIFS (Point IFS):     Medium priority (PCF)  
DIFS (Distributed IFS): Normal priority (data)

SIFS < PIFS < DIFS

After channel becomes idle:
- Wait DIFS before attempting transmission
- Prevents collision with high-priority frames
```

**b) Contention Window (Random Backoff)**
```
┌─────────────────────────────────────────────────┐
│ 1. Wait DIFS after channel idle                 │
│ 2. Pick random backoff in [0, CW]               │
│ 3. Countdown when channel idle                  │
│ 4. Pause countdown when channel busy            │
│ 5. Transmit when counter = 0                    │
└─────────────────────────────────────────────────┘

CW starts small, doubles after collision (like CSMA/CD)
```

**c) RTS/CTS (Request to Send / Clear to Send)**

```
Solves Hidden Terminal Problem:

    A                   AP                    B
    │                    │                    │
    │──── RTS ─────────►│                    │
    │                    │                    │
    │◄──── CTS ─────────│────── CTS ─────────►│
    │                    │                    │
    │==== DATA =========►│    (B hears CTS,   │
    │                    │     stays quiet)    │
    │◄──── ACK ─────────│                    │
    │                    │                    │

RTS contains: Duration of transmission
CTS contains: Duration (rebroadcast)
Others: Set NAV (Network Allocation Vector), stay quiet
```

**Virtual Carrier Sensing (NAV):**

```
NAV = Timer indicating channel busy

Stations hearing RTS/CTS:
- Set NAV based on duration field
- Don't transmit until NAV expires
- No need to physically sense channel

    Physical sensing: Listen to channel
    Virtual sensing: Check NAV timer
```

**CSMA/CD vs CSMA/CA Comparison:**

| Feature | CSMA/CD | CSMA/CA |
|---------|---------|---------|
| Medium | Wired (Ethernet) | Wireless (WiFi) |
| Collision handling | Detect & abort | Avoid |
| Detection method | Signal amplitude | Not possible |
| RTS/CTS | No | Optional |
| ACK | No (at Data Link) | Yes |
| Efficiency | Higher | Lower |
| Overhead | JAM signal | IFS, RTS/CTS |

---

## 🎛️ Controlled Access Protocols

### 1. Polling

```
Central controller (Primary) manages access

Primary: "Station 1, anything to send?"
Station 1: "Yes" → [Sends data]
Primary: "Station 2, anything to send?"
Station 2: "No"
Primary: "Station 3, anything to send?"
...

    ┌─────────────────────────────────────┐
    │            Primary                   │
    │           (Polls)                    │
    └──────┬──────────┬──────────┬────────┘
           │          │          │
       ┌───▼───┐  ┌───▼───┐  ┌───▼───┐
       │ Sec 1 │  │ Sec 2 │  │ Sec 3 │
       └───────┘  └───────┘  └───────┘
```

**Pros:** No collisions, fair access
**Cons:** Polling overhead, single point of failure

---

### 2. Token Passing

```
Token = Special frame granting transmission rights

Rule: Only token holder can transmit

    ┌───────┐     ┌───────┐
    │   A   │◄────│   B   │
    └───┬───┘     └───▲───┘
        │             │
        ▼             │
    ┌───────┐     ┌───────┐
    │   D   │────►│   C   │
    └───────┘     └───────┘
    
Token circulates: A → B → C → D → A → ...
```

**Operation:**
```
1. Station receives token
2. Has data? → Transmit, then pass token
   No data? → Pass token immediately
3. Token reaches next station
4. Repeat
```

**Token Holding Time (THT):**
```
Maximum time a station can hold token
Ensures fairness - no station hogs the channel
```

**Token Ring Efficiency:**
```
a = propagation delay / transmission time = τ/Tt

Efficiency = 1/(1 + a/N)   for a < 1
           = 1/(a + a/N)   for a > 1

Where N = number of stations
```

---

### 3. Reservation

```
Time divided into intervals with reservation slots

Interval Structure:
┌────────────────────────────────────────────────────┐
│ Reservation Slots │         Data Slots             │
│ 1 │ 2 │ 3 │ 4 │ 5 │ Data1 │ Data2 │ Data3 │ ...  │
└────────────────────────────────────────────────────┘

Station 3 wants to send:
→ Marks reservation slot 3
→ Transmits in corresponding data slot
```

---

## 📡 Channelization Protocols

### 1. FDMA (Frequency Division Multiple Access)

```
Divide frequency band into smaller channels

    Frequency ▲
              │ ┌─────────────────┐
              │ │   Channel 4     │
              │ ├─────────────────┤
              │ │   Channel 3     │ Guard bands prevent
              │ ├─────────────────┤ interference
              │ │   Channel 2     │
              │ ├─────────────────┤
              │ │   Channel 1     │
              └─┴─────────────────┴────────► Time
              
Each station gets dedicated frequency band
```

**Used in:** Traditional cellular, radio broadcasting

---

### 2. TDMA (Time Division Multiple Access)

```
Divide time into slots, each station gets a slot

    Time ──────────────────────────────────────────►
    
    Frame 1                  Frame 2
    ┌────┬────┬────┬────┐   ┌────┬────┬────┬────┐
    │ S1 │ S2 │ S3 │ S4 │   │ S1 │ S2 │ S3 │ S4 │
    └────┴────┴────┴────┘   └────┴────┴────┴────┘
    
Each station transmits only in its time slot
```

**Requires:** Synchronization
**Used in:** GSM cellular networks

---

### 3. CDMA (Code Division Multiple Access)

```
All stations transmit simultaneously on same frequency!
Each station has unique "code" (chip sequence)

Station A code: +1 -1 +1 +1
Station B code: +1 +1 -1 +1
Station C code: -1 +1 +1 +1

Properties:
- Codes are orthogonal (dot product = 0)
- Receiver uses sender's code to extract data
```

**How it works:**

```
Station A sends bit 1:  Transmit: +1 -1 +1 +1
Station A sends bit 0:  Transmit: -1 +1 -1 -1 (inverted)

Multiple stations transmit simultaneously:
Received = Sum of all signals

To decode Station A:
1. Multiply received by A's code
2. Sum and divide by code length
3. Result > 0 → bit 1, Result < 0 → bit 0
```

**Example:**

```
A's code: (+1, -1, +1, +1)
B's code: (+1, +1, -1, +1)

A sends 1: (+1, -1, +1, +1)
B sends 0: (-1, -1, +1, -1) [inverted]

Combined signal: (0, -2, +2, 0)

Decode A:
(0×1) + (-2×-1) + (2×1) + (0×1) = 0 + 2 + 2 + 0 = 4
4/4 = +1 → A sent bit 1 ✓

Decode B:
(0×1) + (-2×1) + (2×-1) + (0×1) = 0 - 2 - 2 + 0 = -4
-4/4 = -1 → B sent bit 0 ✓
```

**Used in:** 3G cellular (WCDMA), GPS

---

## 📊 MAC Protocols Summary Table

| Protocol | Type | Collision | Efficiency | Use Case |
|----------|------|-----------|------------|----------|
| Pure ALOHA | Random | Yes | 18.4% | Simple, low traffic |
| Slotted ALOHA | Random | Yes | 36.8% | Satellite |
| CSMA/CD | Random | Detect | High | Ethernet |
| CSMA/CA | Random | Avoid | Medium | WiFi |
| Token Ring | Controlled | No | Very High | IBM LANs |
| Polling | Controlled | No | High | Industrial |
| FDMA | Channel | No | High | Cellular |
| TDMA | Channel | No | High | GSM |
| CDMA | Channel | No | Very High | 3G |

---

# 5. Ethernet Bridging

## 🌉 What is a Bridge?

```
A bridge connects two or more LAN segments

Before Bridge:
    Segment 1              Segment 2
    [A][B][C] ═══════════ [D][E][F]
    
    All traffic seen by everyone! (One collision domain)

After Bridge:
    Segment 1    Bridge    Segment 2
    [A][B][C] ══[    ]══ [D][E][F]
    
    Traffic filtered! Bridge learns which devices are where.
```

## 📍 Bridge vs Repeater vs Router

```
┌────────────┬─────────────┬──────────────────────────────┐
│  Device    │   Layer     │   Function                   │
├────────────┼─────────────┼──────────────────────────────┤
│  Repeater  │  Layer 1    │  Amplify signal              │
│            │  Physical   │  No filtering                │
├────────────┼─────────────┼──────────────────────────────┤
│  Bridge    │  Layer 2    │  Filter by MAC address       │
│  /Switch   │  Data Link  │  Separate collision domains  │
├────────────┼─────────────┼──────────────────────────────┤
│  Router    │  Layer 3    │  Route by IP address         │
│            │  Network    │  Separate broadcast domains  │
└────────────┴─────────────┴──────────────────────────────┘
```

## 🧠 Learning Bridge (Transparent Bridge)

**Three Key Functions:**

### 1. Learning

```
Bridge maintains: MAC Address Table (Forwarding Table)

┌──────────────────┬──────────┬──────────┐
│   MAC Address    │   Port   │   Age    │
├──────────────────┼──────────┼──────────┤
│  AA:AA:AA:AA:AA  │    1     │   10s    │
│  BB:BB:BB:BB:BB  │    1     │   45s    │
│  CC:CC:CC:CC:CC  │    2     │   30s    │
└──────────────────┴──────────┴──────────┘

Learning Process:
1. Frame arrives on Port 1 from Source MAC AA:AA:AA:AA:AA
2. Bridge records: "AA:AA:AA:AA:AA is on Port 1"
3. Reset aging timer for this entry
```

### 2. Forwarding

```
Frame arrives with Destination MAC

Case 1: Destination in table, different port
        → Forward to that port only
        
Case 2: Destination in table, same port
        → Discard (source and dest on same segment)
        
Case 3: Destination not in table (unknown)
        → Flood to all ports except source port
        
Case 4: Broadcast address (FF:FF:FF:FF:FF:FF)
        → Flood to all ports except source port
```

**Example:**

```
Port 1: [A][B][C]  ══Bridge══  [D][E][F] :Port 2

MAC Table:
┌─────┬──────┐
│ MAC │ Port │
├─────┼──────┤
│  A  │  1   │
│  B  │  1   │
│  D  │  2   │
└─────┴──────┘

Scenario 1: A sends to D
- Check table: D is on Port 2
- Forward to Port 2 only ✓

Scenario 2: A sends to B
- Check table: B is on Port 1 (same as source)
- Discard frame (they're on same segment)

Scenario 3: A sends to F
- Check table: F not found
- Flood to Port 2 (all except source port)
- When F replies, learn F is on Port 2
```

### 3. Aging

```
Each entry has an age timer (typically 300 seconds)

1. Frame from MAC X arrives → Reset timer for X
2. No frames from X for 300 seconds → Delete entry

Why aging?
- Devices may move to different ports
- Remove stale entries
- Adapt to network changes
```

## 🔄 Bridge Learning Example Timeline

```
Time 0: Table empty
        ┌─────┬──────┐
        │ MAC │ Port │
        ├─────┼──────┤
        │     │      │
        └─────┴──────┘

Time 1: A sends to D (via Port 1)
        → Learn A on Port 1
        → D unknown, flood to Port 2
        ┌─────┬──────┐
        │  A  │  1   │
        └─────┴──────┘

Time 2: D replies to A (via Port 2)
        → Learn D on Port 2
        → A known on Port 1, forward only there
        ┌─────┬──────┐
        │  A  │  1   │
        │  D  │  2   │
        └─────┴──────┘

Time 3: B sends to C (both on Port 1)
        → Learn B on Port 1
        → C unknown, flood to Port 2 (unnecessary!)
        ┌─────┬──────┐
        │  A  │  1   │
        │  D  │  2   │
        │  B  │  1   │
        └─────┴──────┘
```

## 🌲 Spanning Tree Protocol (STP)

### The Loop Problem

```
What if bridges are connected in a loop?

     ┌───Bridge 1───┐
     │              │
     ▼              ▼
   Seg A          Seg B
     ▲              ▲
     │              │
     └───Bridge 2───┘
     
Problem: Broadcast from Seg A
1. Bridge 1 forwards to Seg B
2. Bridge 2 forwards to Seg A (came from B)
3. Bridge 1 forwards to Seg B again
...INFINITE LOOP!

Results:
- Broadcast storm
- Multiple frame copies
- MAC table instability
```

### STP Solution

**Goal:** Create loop-free topology by blocking some ports

```
                    Root Bridge
                    (Lowest ID)
                        │
           ┌────────────┼────────────┐
           │            │            │
        Bridge 2     Bridge 3     Bridge 4
           │            │            │
           └────────────┼────────────┘
                        │
                    (Blocked)
```

### STP Concepts

**1. Bridge ID**
```
Bridge ID = Priority (16 bits) + MAC Address (48 bits)
           = 8 bytes total

Default priority = 32768 (0x8000)

Lower Bridge ID = Higher priority
Example:
- Bridge A: 32768 + AA:AA:AA:AA:AA:AA
- Bridge B: 32768 + BB:BB:BB:BB:BB:BB
- Bridge A wins (smaller MAC)
```

**2. Root Bridge Election**
```
1. Initially, every bridge thinks it's root
2. Bridges exchange BPDUs (Bridge Protocol Data Units)
3. Bridge with lowest ID becomes Root Bridge
4. All others update their information
```

**3. Port States**
```
┌─────────────┬───────────────────────────────────────┐
│   State     │            Description                │
├─────────────┼───────────────────────────────────────┤
│  Blocking   │  No forwarding, receives BPDUs        │
│  Listening  │  Transitional, builds topology        │
│  Learning   │  Learning MACs, not forwarding        │
│  Forwarding │  Normal operation                     │
│  Disabled   │  Administratively down                │
└─────────────┴───────────────────────────────────────┘

State transitions:
Blocking → Listening → Learning → Forwarding
           (15 sec)    (15 sec)
```

**4. Port Roles**
```
┌───────────────────┬─────────────────────────────────┐
│      Role         │         Description             │
├───────────────────┼─────────────────────────────────┤
│  Root Port (RP)   │  Best path to root bridge       │
│                   │  One per non-root bridge        │
├───────────────────┼─────────────────────────────────┤
│  Designated Port  │  Best path from segment to root │
│  (DP)             │  Forwards traffic on segment    │
├───────────────────┼─────────────────────────────────┤
│  Blocked Port     │  Prevents loops                 │
│  (BP)             │  Receives BPDUs only            │
└───────────────────┴─────────────────────────────────┘
```

### STP Example

```
                    Bridge A (Root)
                    ID: 32768.AAA
                Port1(DP)    Port2(DP)
                    │            │
          Cost=10   │            │  Cost=10
                    │            │
              Port1(RP)      Port1(RP)
                Bridge B      Bridge C
              ID: 32768.BBB  ID: 32768.CCC
              Port2(DP)      Port2(BP)
                    │            │
          Cost=10   │            │  Cost=10
                    └─────┬──────┘
                          │
                     Shared Segment

Path costs to Root:
- B via Port1: 10
- C via Port1: 10
- C via B: 10 + 10 = 20 (longer, not used)

Designated port for bottom segment:
- B's port: Cost = 10
- C's port: Cost = 10
- Tie-breaker: Lower Bridge ID (B wins)
- C's Port2 = Blocked!
```

### Path Cost Values

| Speed | Cost (Old) | Cost (New) |
|-------|------------|------------|
| 10 Mbps | 100 | 100 |
| 100 Mbps | 19 | 19 |
| 1 Gbps | 4 | 4 |
| 10 Gbps | 2 | 2 |

## 🔀 Switch vs Bridge

```
┌──────────────────┬─────────────────────────────────────┐
│     Bridge       │              Switch                 │
├──────────────────┼─────────────────────────────────────┤
│  2-4 ports       │  Many ports (8, 24, 48...)         │
│  Software-based  │  Hardware-based (ASICs)            │
│  Store-and-fwd   │  Cut-through possible              │
│  Slower          │  Wire-speed                        │
│  Legacy          │  Modern                            │
└──────────────────┴─────────────────────────────────────┘

Functionally: Switch = Multi-port Bridge
```

## 📡 VLAN (Virtual LAN)

**Concept:** Logical segmentation independent of physical location

```
Physical Layout:
Floor 1: [HR1][IT1][HR2][FIN1]
Floor 2: [HR3][IT2][FIN2][IT3]

Without VLAN: All on same broadcast domain

With VLAN:
┌────────────────────────────────────────────┐
│  VLAN 10 (HR):    HR1, HR2, HR3            │
│  VLAN 20 (IT):    IT1, IT2, IT3            │
│  VLAN 30 (FIN):   FIN1, FIN2               │
└────────────────────────────────────────────┘

Each VLAN = Separate broadcast domain
HR1 broadcast → Only HR2, HR3 receive (not IT or FIN)
```

### VLAN Benefits

```
1. Security: Isolate sensitive departments
2. Performance: Smaller broadcast domains
3. Flexibility: Move users without rewiring
4. Cost: Reduce need for routers
```

### VLAN Tagging (802.1Q)

```
Standard Ethernet Frame:
┌────────┬────────┬──────┬─────────┬─────┐
│Dst MAC │Src MAC │ Type │  Data   │ FCS │
│  6B    │  6B    │  2B  │ 46-1500 │ 4B  │
└────────┴────────┴──────┴─────────┴─────┘

802.1Q Tagged Frame:
┌────────┬────────┬───────────┬──────┬─────────┬─────┐
│Dst MAC │Src MAC │ 802.1Q Tag │ Type │  Data   │ FCS │
│  6B    │  6B    │    4B     │  2B  │ 42-1500 │ 4B  │
└────────┴────────┴───────────┴──────┴─────────┴─────┘

802.1Q Tag Structure (4 bytes):
┌─────────────────┬─────┬─────┬──────────────┐
│      TPID       │ PCP │ DEI │     VID      │
│    (0x8100)     │ 3b  │ 1b  │    12 bits   │
│     16 bits     │     │     │   (VLAN ID)  │
└─────────────────┴─────┴─────┴──────────────┘

VLAN ID: 0-4095 (12 bits)
- 0, 4095: Reserved
- 1: Default VLAN
- 2-4094: User-defined
```

### Port Types

```
Access Port:
- Connected to end devices
- Belongs to ONE VLAN
- Frames untagged (adds tag on ingress, strips on egress)

Trunk Port:
- Connected to other switches
- Carries MULTIPLE VLANs
- Frames tagged (except native VLAN)

          Access        Trunk         Access
[PC1]═══════════[Switch1]════════════[Switch2]══════════[PC2]
    VLAN 10              Tagged           VLAN 10
    (untagged)         (all VLANs)        (untagged)
```

---

# Mock Tests

## 📝 Mock Test 1: Data Link Layer & Framing

**Time: 15 minutes | Questions: 15 | Each: 1 mark**

---

**Q1.** Data Link Layer is which layer in OSI model?
- A) Layer 1
- B) Layer 2 ✓
- C) Layer 3
- D) Layer 4

**Q2.** What is the size of MAC address?
- A) 32 bits
- B) 48 bits ✓
- C) 64 bits
- D) 128 bits

**Q3.** Which sub-layer of DLL handles physical addressing?
- A) LLC
- B) MAC ✓
- C) Both
- D) Neither

**Q4.** The broadcast MAC address is:
- A) 00:00:00:00:00:00
- B) FF:FF:FF:FF:FF:FF ✓
- C) 11:11:11:11:11:11
- D) AA:AA:AA:AA:AA:AA

**Q5.** In bit stuffing, a 0 is inserted after how many consecutive 1s?
- A) 4
- B) 5 ✓
- C) 6
- D) 7

**Q6.** The FLAG pattern used in HDLC is:
- A) 01111110 ✓
- B) 10000001
- C) 11111111
- D) 01010101

**Q7.** Which framing method has the weakness of a single point of failure?
- A) Bit stuffing
- B) Byte stuffing
- C) Character count ✓
- D) Physical layer coding

**Q8.** After byte stuffing, data "ESC FLAG DATA" becomes:
- A) ESC ESC ESC FLAG DATA ✓
- B) ESC FLAG DATA
- C) ESC ESC FLAG DATA
- D) FLAG ESC ESC DATA

**Q9.** PPP uses which framing method?
- A) Bit stuffing
- B) Byte stuffing ✓
- C) Character count
- D) Physical layer coding

**Q10.** What is the data unit at Data Link Layer?
- A) Bit
- B) Packet
- C) Frame ✓
- D) Segment

**Q11.** Which service is NOT provided by Data Link Layer?
- A) Framing
- B) Error control
- C) Routing ✓
- D) Flow control

**Q12.** OUI in MAC address stands for:
- A) Organization Unique Identifier
- B) Organizationally Unique Identifier ✓
- C) Original Unique Identifier
- D) Operational Unique Identifier

**Q13.** Which DLL service is used by Ethernet?
- A) Acknowledged connectionless
- B) Unacknowledged connectionless ✓
- C) Acknowledged connection-oriented
- D) None of the above

**Q14.** Bit stuffing overhead is approximately:
- A) 0.004%
- B) 0.4%
- C) 4%
- D) 0.4% ✓

**Q15.** Physical layer coding violations method advantage is:
- A) Works with all encoding
- B) Zero overhead ✓
- C) Simple implementation
- D) All of the above

---

## 📝 Mock Test 2: Error Detection

**Time: 20 minutes | Questions: 20 | Each: 1 mark**

---

**Q1.** Simple parity check can detect:
- A) All errors
- B) Even number of bit errors
- C) Odd number of bit errors ✓
- D) No errors

**Q2.** CRC stands for:
- A) Cyclic Rotation Check
- B) Cyclic Redundancy Check ✓
- C) Coded Redundancy Check
- D) Circular Redundancy Check

**Q3.** If data is 1001 and generator is 1011, how many zeros are appended?
- A) 2
- B) 3 ✓
- C) 4
- D) 5

**Q4.** Two-dimensional parity can correct:
- A) No errors
- B) Single-bit errors ✓
- C) All burst errors
- D) Multiple-bit errors

**Q5.** Internet checksum uses:
- A) 8-bit words
- B) 16-bit words ✓
- C) 32-bit words
- D) Variable words

**Q6.** Hamming code parity bits are placed at positions:
- A) Even positions
- B) Odd positions
- C) Prime positions
- D) Power of 2 positions ✓

**Q7.** For data 1011, using even parity, the parity bit is:
- A) 0
- B) 1 ✓
- C) Cannot determine
- D) 2

**Q8.** CRC-32 is used in:
- A) USB
- B) Ethernet ✓
- C) Both A and B
- D) Neither

**Q9.** What operation is used in CRC calculation?
- A) AND
- B) OR
- C) XOR ✓
- D) NOT

**Q10.** Burst error of length n means:
- A) n bits are definitely corrupted
- B) First and last corrupted bits are n bits apart ✓
- C) n consecutive bits are corrupted
- D) None of the above

**Q11.** To detect d errors, minimum Hamming distance required is:
- A) d
- B) d + 1 ✓
- C) 2d
- D) 2d + 1

**Q12.** To correct d errors, minimum Hamming distance required is:
- A) d
- B) d + 1
- C) 2d
- D) 2d + 1 ✓

**Q13.** Hamming(7,4) code has Hamming distance of:
- A) 2
- B) 3 ✓
- C) 4
- D) 7

**Q14.** CRC can detect all burst errors up to length:
- A) n (degree of generator)
- B) n + 1
- C) n - 1
- D) n ✓

**Q15.** In checksum, receiver gets all 1s when:
- A) Error occurred
- B) No error ✓
- C) Checksum mismatch
- D) Overflow occurred

**Q16.** Which is strongest error detection method?
- A) Simple parity
- B) 2D parity
- C) Checksum
- D) CRC ✓

**Q17.** FCS in Ethernet frame stands for:
- A) Frame Check Sum
- B) Frame Check Sequence ✓
- C) Final Check Sum
- D) First Check Sequence

**Q18.** Data = 1101011011, Generator = 10011, CRC bits = ?
- A) 3
- B) 4 ✓
- C) 5
- D) 6

**Q19.** Which method is NOT used for error detection in networks?
- A) Parity
- B) CRC
- C) Hamming Code (mainly for correction)
- D) MD5 hash ✓

**Q20.** Checksum limitation is:
- A) Cannot detect reordering of words ✓
- B) Complex computation
- C) Large overhead
- D) Only works for small data

---

## 📝 Mock Test 3: Medium Access Control

**Time: 25 minutes | Questions: 25 | Each: 1 mark**

---

**Q1.** Pure ALOHA maximum throughput is:
- A) 18.4% ✓
- B) 36.8%
- C) 50%
- D) 100%

**Q2.** Slotted ALOHA maximum throughput is:
- A) 18.4%
- B) 36.8% ✓
- C) 50%
- D) 100%

**Q3.** Vulnerable time in Pure ALOHA is:
- A) Tf
- B) 2Tf ✓
- C) 3Tf
- D) 4Tf

**Q4.** CSMA/CD is used in:
- A) WiFi
- B) Ethernet ✓
- C) Bluetooth
- D) LTE

**Q5.** CSMA/CA is used in:
- A) WiFi ✓
- B) Ethernet
- C) Token Ring
- D) FDDI

**Q6.** In 1-persistent CSMA, when channel is busy, station:
- A) Waits random time
- B) Continuously monitors ✓
- C) Backs off exponentially
- D) Gives up

**Q7.** Minimum Ethernet frame size is:
- A) 32 bytes
- B) 46 bytes
- C) 64 bytes ✓
- D) 128 bytes

**Q8.** Why minimum frame size in Ethernet?
- A) Header requirement
- B) Collision detection requirement ✓
- C) Error detection requirement
- D) Speed requirement

**Q9.** Binary Exponential Backoff is used in:
- A) Pure ALOHA
- B) Slotted ALOHA
- C) CSMA/CD ✓
- D) Token Ring

**Q10.** After 3rd collision, backoff range is:
- A) [0, 3]
- B) [0, 7] ✓
- C) [0, 15]
- D) [0, 8]

**Q11.** JAM signal in CSMA/CD is:
- A) 32 bits
- B) 48 bits ✓
- C) 64 bits
- D) 128 bits

**Q12.** RTS/CTS solves which problem?
- A) Exposed terminal
- B) Hidden terminal ✓
- C) Both
- D) Neither

**Q13.** NAV in WiFi stands for:
- A) Network Allocation Vector ✓
- B) Network Access Vector
- C) Node Allocation Vector
- D) Node Access Vector

**Q14.** Which IFS has highest priority?
- A) DIFS
- B) PIFS
- C) SIFS ✓
- D) EIFS

**Q15.** Token passing is a type of:
- A) Random access
- B) Controlled access ✓
- C) Channelization
- D) Hybrid

**Q16.** In FDMA, users are separated by:
- A) Time
- B) Code
- C) Frequency ✓
- D) Space

**Q17.** In CDMA, users are separated by:
- A) Time
- B) Code ✓
- C) Frequency
- D) Space

**Q18.** Which is NOT a channelization technique?
- A) FDMA
- B) TDMA
- C) CDMA
- D) CSMA ✓

**Q19.** Polling has which disadvantage?
- A) Collisions
- B) Single point of failure ✓
- C) Low throughput
- D) Complex

**Q20.** Token Holding Time ensures:
- A) No collisions
- B) Fairness ✓
- C) High speed
- D) Low latency

**Q21.** Maximum collisions before giving up in Ethernet:
- A) 10
- B) 16 ✓
- C) 32
- D) 64

**Q22.** Non-persistent CSMA waits:
- A) Continuously
- B) Random time ✓
- C) Fixed time
- D) Never

**Q23.** p-persistent CSMA transmits with probability:
- A) 0
- B) 1
- C) p ✓
- D) 1-p

**Q24.** G = 1 gives maximum throughput in:
- A) Pure ALOHA
- B) Slotted ALOHA ✓
- C) Both
- D) Neither

**Q25.** WCDMA uses which multiple access?
- A) FDMA
- B) TDMA
- C) CDMA ✓
- D) OFDMA

---

## 📝 Mock Test 4: Ethernet Bridging

**Time: 20 minutes | Questions: 20 | Each: 1 mark**

---

**Q1.** Bridge operates at which layer?
- A) Physical
- B) Data Link ✓
- C) Network
- D) Transport

**Q2.** Switch is also called:
- A) Single-port bridge
- B) Multi-port bridge ✓
- C) Router
- D) Gateway

**Q3.** Learning bridge learns from:
- A) Destination MAC
- B) Source MAC ✓
- C) Both
- D) IP address

**Q4.** When destination is unknown, bridge:
- A) Drops frame
- B) Sends to source port
- C) Floods to all ports except source ✓
- D) Sends error

**Q5.** STP stands for:
- A) Spanning Tree Protocol ✓
- B) Simple Transfer Protocol
- C) Secure Transmission Protocol
- D) Standard Tree Protocol

**Q6.** Root Bridge is selected based on:
- A) Highest Bridge ID
- B) Lowest Bridge ID ✓
- C) Random selection
- D) Administrator choice only

**Q7.** Bridge ID consists of:
- A) Only MAC address
- B) Only Priority
- C) Priority + MAC address ✓
- D) IP address + MAC

**Q8.** Default STP priority is:
- A) 0
- B) 16384
- C) 32768 ✓
- D) 65535

**Q9.** BPDU stands for:
- A) Bridge Protocol Data Unit ✓
- B) Basic Protocol Data Unit
- C) Bridge Port Data Unit
- D) Broadcast Protocol Data Unit

**Q10.** Which is NOT an STP port state?
- A) Blocking
- B) Learning
- C) Transmitting ✓
- D) Forwarding

**Q11.** 802.1Q is used for:
- A) WiFi security
- B) VLAN tagging ✓
- C) Error detection
- D) Flow control

**Q12.** VLAN ID is how many bits?
- A) 8
- B) 12 ✓
- C) 16
- D) 24

**Q13.** Maximum VLAN ID is:
- A) 1023
- B) 4094
- C) 4095 ✓
- D) 65535

**Q14.** Access port belongs to how many VLANs?
- A) 0
- B) 1 ✓
- C) Multiple
- D) All

**Q15.** Trunk port carries:
- A) One VLAN
- B) Multiple VLANs ✓
- C) No VLANs
- D) Only default VLAN

**Q16.** 802.1Q tag adds how many bytes?
- A) 2
- B) 4 ✓
- C) 6
- D) 8

**Q17.** TPID value for 802.1Q is:
- A) 0x8000
- B) 0x8100 ✓
- C) 0x8200
- D) 0x0800

**Q18.** Bridge aging timer default is typically:
- A) 30 seconds
- B) 60 seconds
- C) 300 seconds ✓
- D) 600 seconds

**Q19.** Root Port is:
- A) On root bridge
- B) Best path to root ✓
- C) Blocked port
- D) Connected to end devices

**Q20.** Broadcast storm is prevented by:
- A) VLAN
- B) STP ✓
- C) BPDU
- D) Trunk

---

## 📝 Mock Test 5: Comprehensive Test

**Time: 30 minutes | Questions: 30 | Each: 1 mark**

---

**Q1.** Which layer provides node-to-node delivery?
- A) Physical
- B) Data Link ✓
- C) Network
- D) Transport

**Q2.** 01111110 in HDLC is called:
- A) JAM
- B) FLAG ✓
- C) SYN
- D) ACK

**Q3.** CRC divisor is x³+x+1, how many CRC bits?
- A) 2
- B) 3 ✓
- C) 4
- D) 5

**Q4.** S = G × e^(-2G) is for:
- A) Slotted ALOHA
- B) Pure ALOHA ✓
- C) CSMA
- D) Token Ring

**Q5.** SIFS < PIFS < DIFS is used in:
- A) CSMA/CD
- B) CSMA/CA ✓
- C) Token Ring
- D) Pure ALOHA

**Q6.** VID in 802.1Q occupies:
- A) 8 bits
- B) 12 bits ✓
- C) 16 bits
- D) 24 bits

**Q7.** Hamming(7,4) means:
- A) 7 parity, 4 data
- B) 7 total, 4 data ✓
- C) 7 data, 4 parity
- D) 7 total, 4 parity

**Q8.** FF:FF:FF:FF:FF:FF is:
- A) Null address
- B) Loopback address
- C) Broadcast address ✓
- D) Multicast address

**Q9.** 2τ in Ethernet signifies:
- A) Transmission time
- B) Round trip time ✓
- C) Propagation time
- D) Processing time

**Q10.** Bridge separates:
- A) Broadcast domains
- B) Collision domains ✓
- C) Both
- D) Neither

**Q11.** Router separates:
- A) Broadcast domains ✓
- B) Collision domains only
- C) Neither
- D) MAC domains

**Q12.** For G = 0.5, Pure ALOHA throughput is:
- A) 0.184 ✓
- B) 0.368
- C) 0.500
- D) 0.736

**Q13.** In p-persistent CSMA, if channel idle, transmit with probability:
- A) 0
- B) 1
- C) p ✓
- D) 1-p

**Q14.** ESC ESC in data after byte stuffing becomes:
- A) ESC
- B) ESC ESC ESC
- C) ESC ESC ESC ESC ✓
- D) No change

**Q15.** Path cost for 100 Mbps link in STP is:
- A) 4
- B) 10
- C) 19 ✓
- D) 100

**Q16.** Token Ring is:
- A) Random access
- B) Controlled access ✓
- C) Channelization
- D) Hybrid access

**Q17.** CRC can detect all errors when:
- A) Error pattern = Generator
- B) Error pattern ≠ multiple of Generator ✓
- C) Always
- D) Never

**Q18.** Native VLAN frames on trunk are:
- A) Tagged
- B) Untagged ✓
- C) Dropped
- D) Encrypted

**Q19.** LLC stands for:
- A) Logical Link Control ✓
- B) Local Link Control
- C) Layer Link Control
- D) Linear Link Control

**Q20.** After 10th collision in Ethernet, wait slots range:
- A) [0, 1023] ✓
- B) [0, 2047]
- C) [0, 4095]
- D) [0, 10]

**Q21.** 2D parity overhead is approximately:
- A) O(1)
- B) O(√n) ✓
- C) O(n)
- D) O(log n)

**Q22.** Exposed terminal is a problem in:
- A) Wired networks
- B) Wireless networks ✓
- C) Token Ring
- D) FDDI

**Q23.** CDMA codes are:
- A) Similar
- B) Orthogonal ✓
- C) Random
- D) Sequential

**Q24.** Designated Port provides:
- A) Path from segment to root ✓
- B) Path to any node
- C) Loop in network
- D) Backup path

**Q25.** Listening state duration in STP:
- A) 5 seconds
- B) 15 seconds ✓
- C) 30 seconds
- D) 60 seconds

**Q26.** Checksum method uses:
- A) XOR
- B) 1's complement ✓
- C) 2's complement
- D) AND

**Q27.** Maximum data in Ethernet frame:
- A) 46 bytes
- B) 1000 bytes
- C) 1500 bytes ✓
- D) 1518 bytes

**Q28.** GSM uses which multiple access?
- A) FDMA
- B) TDMA ✓
- C) CDMA
- D) OFDMA

**Q29.** PCP in 802.1Q is for:
- A) VLAN ID
- B) Priority ✓
- C) Protocol type
- D) Error check

**Q30.** After bit stuffing 111111, we get:
- A) 111111
- B) 1111101 ✓
- C) 1111110
- D) 0111111

---

## 📊 Answer Keys

### Mock Test 1
| Q | Ans | Q | Ans | Q | Ans |
|---|-----|---|-----|---|-----|
| 1 | B | 6 | A | 11 | C |
| 2 | B | 7 | C | 12 | B |
| 3 | B | 8 | A | 13 | B |
| 4 | B | 9 | B | 14 | D |
| 5 | B | 10 | C | 15 | B |

### Mock Test 2
| Q | Ans | Q | Ans | Q | Ans | Q | Ans |
|---|-----|---|-----|---|-----|---|-----|
| 1 | C | 6 | D | 11 | B | 16 | D |
| 2 | B | 7 | B | 12 | D | 17 | B |
| 3 | B | 8 | B | 13 | B | 18 | B |
| 4 | B | 9 | C | 14 | D | 19 | D |
| 5 | B | 10 | B | 15 | B | 20 | A |

### Mock Test 3
| Q | Ans | Q | Ans | Q | Ans | Q | Ans | Q | Ans |
|---|-----|---|-----|---|-----|---|-----|---|-----|
| 1 | A | 6 | B | 11 | B | 16 | C | 21 | B |
| 2 | B | 7 | C | 12 | B | 17 | B | 22 | B |
| 3 | B | 8 | B | 13 | A | 18 | D | 23 | C |
| 4 | B | 9 | C | 14 | C | 19 | B | 24 | B |
| 5 | A | 10 | B | 15 | B | 20 | B | 25 | C |

### Mock Test 4
| Q | Ans | Q | Ans | Q | Ans | Q | Ans |
|---|-----|---|-----|---|-----|---|-----|
| 1 | B | 6 | B | 11 | B | 16 | B |
| 2 | B | 7 | C | 12 | B | 17 | B |
| 3 | B | 8 | C | 13 | C | 18 | C |
| 4 | C | 9 | A | 14 | B | 19 | B |
| 5 | A | 10 | C | 15 | B | 20 | B |

### Mock Test 5
| Q | Ans | Q | Ans | Q | Ans | Q | Ans | Q | Ans | Q | Ans |
|---|-----|---|-----|---|-----|---|-----|---|-----|---|-----|
| 1 | B | 6 | B | 11 | A | 16 | B | 21 | B | 26 | B |
| 2 | B | 7 | B | 12 | A | 17 | B | 22 | B | 27 | C |
| 3 | B | 8 | C | 13 | C | 18 | B | 23 | B | 28 | B |
| 4 | B | 9 | B | 14 | C | 19 | A | 24 | A | 29 | B |
| 5 | B | 10 | B | 15 | C | 20 | A | 25 | B | 30 | B |

---

## 🎯 Quick Revision Formulas & Facts

```
┌─────────────────────────────────────────────────────────────────┐
│                    MUST REMEMBER NUMBERS                         │
├─────────────────────────────────────────────────────────────────┤
│  MAC Address: 48 bits (6 bytes)                                  │
│  Ethernet Min Frame: 64 bytes (512 bits)                         │
│  Ethernet Max Frame: 1518 bytes                                  │
│  Ethernet Max Data: 1500 bytes                                   │
│  VLAN ID: 12 bits (0-4095)                                       │
│  802.1Q Tag: 4 bytes                                             │
│  JAM Signal: 48 bits                                             │
│  STP Default Priority: 32768                                     │
│  Pure ALOHA Max: 18.4% at G=0.5                                  │
│  Slotted ALOHA Max: 36.8% at G=1                                 │
│  Max Collisions (Ethernet): 16                                   │
│  STP Timers: 15-15-20 (Listen-Learn-Forward delay)               │
│  Aging Timer: ~300 seconds                                        │
└─────────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────────┐
│                       KEY FORMULAS                               │
├─────────────────────────────────────────────────────────────────┤
│  Pure ALOHA:    S = G × e^(-2G)                                  │
│  Slotted ALOHA: S = G × e^(-G)                                   │
│  Min Frame Size = 2τ × Bandwidth                                 │
│  Hamming bits:  2^r ≥ m + r + 1                                  │
│  Detect d errors: Distance ≥ d+1                                 │
│  Correct d errors: Distance ≥ 2d+1                               │
│  Backoff: Random(0, 2^n - 1) × slot_time                         │
│  CRC bits = Degree of generator polynomial                       │
└─────────────────────────────────────────────────────────────────┘
```
