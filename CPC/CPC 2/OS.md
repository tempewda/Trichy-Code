# Operating Systems - Complete Theory Guide

Great initiative! Let me break down each topic comprehensively. I'll cover concepts in a way that helps both MCQs and interview discussions.

---

## 1. PROCESS & THREADS

### What is a Process?

A **process** is a **program in execution**. It's the active entity, while a program is passive (just code stored on disk).

```
Program (passive)  →  loaded into memory  →  Process (active)
   [on disk]                                  [in RAM]
```

### Process Memory Layout

```
┌──────────────────┐  High Address
│      Stack       │  ← Local variables, function calls (grows ↓)
├──────────────────┤
│        ↓         │
│                  │
│        ↑         │
├──────────────────┤
│       Heap       │  ← Dynamic memory allocation (grows ↑)
├──────────────────┤
│       Data       │  ← Global & static variables
├──────────────────┤
│       Text       │  ← Program code (instructions)
└──────────────────┘  Low Address
```

### Process Control Block (PCB)

PCB is the **data structure** that stores all information about a process. It's like an ID card for each process.

```
┌─────────────────────────────┐
│   Process Control Block     │
├─────────────────────────────┤
│ • Process ID (PID)          │
│ • Process State             │
│ • Program Counter (PC)      │
│ • CPU Registers             │
│ • CPU Scheduling Info       │
│ • Memory Management Info    │
│ • I/O Status Info           │
│ • Accounting Info           │
└─────────────────────────────┘
```

**Important for MCQs:** PCB is stored in **kernel memory**, not user space.

### Process States

```
                    ┌──────────────────────────────────────┐
                    ↓                                      │
    ┌─────┐    admitted    ┌───────┐   dispatch   ┌─────────┐
    │ NEW │ ────────────→  │ READY │ ───────────→ │ RUNNING │
    └─────┘                └───────┘              └─────────┘
                               ↑                    │    │
                               │                    │    │
                    I/O done   │    I/O or event    │    │  exit
                  or event     │       wait         │    │
                   occurs      │                    ↓    ↓
                           ┌─────────┐        ┌────────────┐
                           │ WAITING │        │ TERMINATED │
                           │(Blocked)│        └────────────┘
                           └─────────┘
                           
        (Also: Interrupt/Time quantum expire: RUNNING → READY)
```

**5 States:**
| State | Description |
|-------|-------------|
| **New** | Process is being created |
| **Ready** | Waiting to be assigned to CPU |
| **Running** | Instructions being executed |
| **Waiting/Blocked** | Waiting for I/O or event |
| **Terminated** | Finished execution |

**MCQ Trap:** A process waiting for I/O goes to **Waiting/Blocked** state, NOT ready state.

### Context Switching

When CPU switches from one process to another:

```
Process P0                 OS                  Process P1
───────────              ─────                ───────────
 executing
     │
     │ interrupt/system call
     ↓
                    Save state into PCB0
                    Load state from PCB1
                                                executing
                                                    │
                                                    │ interrupt
                                                    ↓
                    Save state into PCB1
                    Load state from PCB0
 executing
```

**Key Point:** Context switch is **pure overhead** - no useful work done during switch.

### Process Scheduling Queues

```
┌──────────────────┐
│    Job Queue     │  ← All processes in system
└────────┬─────────┘
         ↓
┌──────────────────┐
│   Ready Queue    │  ← Processes in main memory, ready to execute
└────────┬─────────┘
         ↓
┌──────────────────┐
│  Device Queues   │  ← Processes waiting for I/O device
└──────────────────┘
```

### Schedulers

| Scheduler | Alternate Name | Function | Frequency |
|-----------|---------------|----------|-----------|
| **Long-term** | Job Scheduler | Selects processes to bring into ready queue | Infrequent (seconds/minutes) |
| **Short-term** | CPU Scheduler | Selects process from ready queue for CPU | Very frequent (milliseconds) |
| **Medium-term** | Swapper | Swapping (removes from memory temporarily) | In between |

**Degree of Multiprogramming:** Number of processes in memory (controlled by long-term scheduler)

### Process Creation

**Parent process creates child processes**, forming a **process tree**.

```c
// fork() system call
pid = fork();

if (pid == 0) {
    // Child process
} else if (pid > 0) {
    // Parent process
} else {
    // Fork failed
}
```

**MCQ Important Points:**
- `fork()` returns **0 to child**, **child's PID to parent**
- Child gets a **copy** of parent's address space
- `exec()` replaces process memory with new program
- `wait()` - parent waits for child to terminate
- **Orphan process:** Parent terminates before child → adopted by `init` (PID 1)
- **Zombie process:** Child terminated but parent hasn't called `wait()` → entry remains in process table

---

## THREADS

### What is a Thread?

A **thread** is a **lightweight process** - the basic unit of CPU utilization.

```
┌────────────────────────────────────────────────┐
│                    PROCESS                      │
├────────────────────────────────────────────────┤
│  Code  │  Data  │  Files (shared by all)       │
├────────┼────────┼────────┼─────────────────────┤
│Thread 1│Thread 2│Thread 3│                     │
├────────┼────────┼────────┤  Each thread has    │
│Register│Register│Register│  its own:           │
│ Stack  │ Stack  │ Stack  │  - Registers        │
│  PC    │  PC    │  PC    │  - Stack            │
└────────┴────────┴────────┴─────────────────────┘
```

### Process vs Thread

| Aspect | Process | Thread |
|--------|---------|--------|
| Definition | Program in execution | Lightweight process |
| Memory | Separate memory space | Shares memory with other threads |
| Creation time | More (heavy) | Less (light) |
| Context switch | Expensive | Cheap |
| Communication | IPC needed (slow) | Shared memory (fast) |
| Independence | Independent | Dependent on process |
| Crash effect | One process crash doesn't affect others | One thread crash can kill entire process |

### Benefits of Threads

1. **Responsiveness** - UI remains responsive while background work happens
2. **Resource Sharing** - Threads share code, data, files
3. **Economy** - Creating/switching threads is cheaper
4. **Scalability** - Can utilize multiple CPU cores

### Types of Threads

#### 1. User-Level Threads (ULT)
- Managed by **user-level library** (not OS)
- Kernel unaware of threads
- Fast creation/switching
- If one thread blocks, **entire process blocks**
- Examples: POSIX Pthreads, Java Green Threads

#### 2. Kernel-Level Threads (KLT)
- Managed by **operating system**
- Kernel aware of each thread
- Slower creation/switching (needs system call)
- If one thread blocks, **other threads can run**
- Examples: Windows threads, Linux threads

### Multithreading Models

#### Many-to-One Model
```
User threads:    T1  T2  T3  T4
                   \  |  /  /
                    \ | / /
Kernel thread:       K1
```
- Many user threads → One kernel thread
- One blocking call blocks all
- No true parallelism
- Example: Green threads

#### One-to-One Model
```
User threads:    T1   T2   T3   T4
                  |    |    |    |
Kernel threads:  K1   K2   K3   K4
```
- Each user thread → One kernel thread
- More concurrency
- Overhead of creating kernel threads
- Example: Windows, Linux

#### Many-to-Many Model
```
User threads:    T1   T2   T3   T4   T5
                   \   |   /\   /   /
                    \  |  /  \ /   /
Kernel threads:      K1    K2    K3
```
- Many user threads → Many kernel threads (≤ user threads)
- Best flexibility
- No blocking issues, true parallelism
- Example: Solaris prior to version 9

---

## 2. SYSTEM CALLS

### What is a System Call?

A **system call** is the **interface between user programs and the operating system**. It's how a program requests services from the kernel.

```
┌─────────────────────────────────────┐
│         User Application            │  ← User Mode
├─────────────────────────────────────┤
│        System Call Interface        │
├─────────────────────────────────────┤  ← Mode Switch
│           OS Kernel                 │  ← Kernel Mode
└─────────────────────────────────────┘
```

### User Mode vs Kernel Mode

| User Mode | Kernel Mode |
|-----------|-------------|
| Limited access | Full access to hardware |
| Cannot execute privileged instructions | Can execute all instructions |
| User applications run here | OS kernel runs here |
| Mode bit = 1 | Mode bit = 0 |

**MCQ Point:** The **mode bit** in the hardware indicates current mode.

### How System Call Works

```
User Program                          Kernel
────────────                          ──────
     │
 1.  │ calls library function (e.g., printf)
     ↓
 2.  Library puts system call number in register
     │
 3.  │ executes TRAP/INT instruction
     ↓
     ══════════════════════════════════════
     │        MODE SWITCH (User → Kernel)
     ═══════════════════════════════════════
                                        │
 4.                              Kernel examines number
                                        │
 5.                              Calls appropriate handler
                                        │
 6.                              Executes system call
                                        │
     ═══════════════════════════════════════
     │        MODE SWITCH (Kernel → User)
     ═══════════════════════════════════════
     ↓
 7.  Returns to user program
```

### Categories of System Calls

#### 1. Process Control
| System Call | Purpose |
|-------------|---------|
| `fork()` | Create new process |
| `exec()` | Load program into process |
| `exit()` | Terminate process |
| `wait()` | Wait for child process |
| `kill()` | Send signal to process |
| `getpid()` | Get process ID |

#### 2. File Management
| System Call | Purpose |
|-------------|---------|
| `open()` | Open a file |
| `close()` | Close a file |
| `read()` | Read from file |
| `write()` | Write to file |
| `lseek()` | Move file pointer |
| `stat()` | Get file information |

#### 3. Device Management
| System Call | Purpose |
|-------------|---------|
| `ioctl()` | Device control operations |
| `read()` | Read from device |
| `write()` | Write to device |

#### 4. Information Maintenance
| System Call | Purpose |
|-------------|---------|
| `getpid()` | Get process ID |
| `alarm()` | Set timer |
| `sleep()` | Suspend execution |
| `time()` | Get system time |

#### 5. Communication
| System Call | Purpose |
|-------------|---------|
| `pipe()` | Create pipe |
| `shmget()` | Shared memory |
| `mmap()` | Memory mapping |
| `socket()` | Create socket |

### Parameter Passing Methods

1. **Registers** - Parameters in CPU registers (limited by register count)
2. **Block/Table** - Parameters in memory block, address passed in register
3. **Stack** - Parameters pushed onto stack, popped by OS

---

## 3. PROCESS SYNCHRONIZATION

### Why Synchronization?

When multiple processes/threads access **shared data** concurrently, we need synchronization to ensure **data consistency**.

### Race Condition

A **race condition** occurs when the outcome depends on the **order of execution** of processes.

**Example: Counter Problem**
```
Shared variable: counter = 5

Process P1: counter++        Process P2: counter--
  (1) Load counter → R1=5      (1) Load counter → R2=5
  (2) R1 = R1 + 1 → R1=6       (2) R2 = R2 - 1 → R2=4
  (3) Store R1 → counter=6     (3) Store R2 → counter=4

Expected: counter = 5 (if both execute)
Actual: Could be 4, 5, or 6 (depending on interleaving!)
```

### Critical Section Problem

**Critical Section:** A code segment where shared resources are accessed.

```
┌───────────────────────┐
│    Entry Section      │  ← Request permission
├───────────────────────┤
│   CRITICAL SECTION    │  ← Access shared resource
├───────────────────────┤
│    Exit Section       │  ← Release permission
├───────────────────────┤
│   Remainder Section   │  ← Other code
└───────────────────────┘
```

### Requirements for Solution (MUST KNOW!)

| Requirement | Meaning |
|-------------|---------|
| **Mutual Exclusion** | Only ONE process in critical section at a time |
| **Progress** | If no one in CS, decision can't be postponed indefinitely; only those not in remainder section participate |
| **Bounded Waiting** | Limit on how many times others can enter CS while a process is waiting |

**MCQ Tip:** These three are asked very frequently. Remember the exact definitions!

### Peterson's Solution

For **two processes** only. Uses two shared variables:

```c
int turn;           // Whose turn to enter CS
bool flag[2];       // flag[i] = true means process i wants to enter

// Process Pi (i = 0 or 1)
flag[i] = true;         // I want to enter
turn = j;               // Give chance to other process
while (flag[j] && turn == j);  // Wait if other wants and it's their turn
    
// CRITICAL SECTION

flag[i] = false;        // I'm done
```

**Key Points:**
- Satisfies all 3 requirements
- Software solution (no hardware support)
- Only for 2 processes
- Assumes atomic load/store

### Hardware Solutions

#### 1. Test-and-Set (TAS)

```c
// Atomic instruction (executed without interruption)
bool test_and_set(bool *target) {
    bool rv = *target;
    *target = true;
    return rv;
}

// Usage
while (test_and_set(&lock));  // Busy wait
// CRITICAL SECTION
lock = false;
```

#### 2. Compare-and-Swap (CAS)

```c
// Atomic instruction
int compare_and_swap(int *value, int expected, int new_value) {
    int temp = *value;
    if (*value == expected)
        *value = new_value;
    return temp;
}

// Usage
while (compare_and_swap(&lock, 0, 1) != 0);  // Busy wait
// CRITICAL SECTION
lock = 0;
```

**Issue:** Both use **busy waiting** (spinlock) - wastes CPU cycles.

### Semaphores

A **semaphore** S is an integer variable accessed only through two atomic operations:

```c
// wait() or P() or down()
wait(S) {
    while (S <= 0);  // Busy wait (in simple implementation)
    S--;
}

// signal() or V() or up()
signal(S) {
    S++;
}
```

#### Types of Semaphores

| Type | Value Range | Usage |
|------|-------------|-------|
| **Binary Semaphore** | 0 or 1 | Mutual exclusion (like mutex) |
| **Counting Semaphore** | 0 to N | Resource counting |

#### Binary Semaphore Usage

```c
semaphore mutex = 1;

// Process
wait(mutex);        // Entry
// CRITICAL SECTION
signal(mutex);      // Exit
```

#### Counting Semaphore Usage

```c
semaphore resources = 5;  // 5 instances available

wait(resources);    // Acquire resource
// USE RESOURCE
signal(resources);  // Release resource
```

### Semaphore Implementation (Without Busy Wait)

```c
typedef struct {
    int value;
    struct process *list;  // Waiting queue
} semaphore;

void wait(semaphore *S) {
    S->value--;
    if (S->value < 0) {
        add this process to S->list;
        block();  // Sleep
    }
}

void signal(semaphore *S) {
    S->value++;
    if (S->value <= 0) {
        remove process P from S->list;
        wakeup(P);
    }
}
```

**Key MCQ Point:** When S->value is negative, |S->value| = number of waiting processes.

### Mutex vs Semaphore

| Mutex | Semaphore |
|-------|-----------|
| Binary only (locked/unlocked) | Can be counting |
| **Ownership** - only locker can unlock | No ownership - any process can signal |
| Used for mutual exclusion | Used for synchronization & mutual exclusion |

### Monitors

A **monitor** is a high-level synchronization construct that encapsulates:
- Shared data
- Operations on that data
- Synchronization

```
┌─────────────────────────────────────┐
│            MONITOR                  │
├─────────────────────────────────────┤
│  Shared Data                        │
├─────────────────────────────────────┤
│  Condition Variables                │
│    - condition x, y;                │
│    - x.wait()    // block           │
│    - x.signal()  // wakeup one      │
├─────────────────────────────────────┤
│  Procedures/Methods                 │
│    - Only ONE process active inside │
└─────────────────────────────────────┘
```

**Key Point:** Mutual exclusion is **automatic** in monitors.

---

## Classical Synchronization Problems

### 1. Producer-Consumer (Bounded Buffer)

**Problem:** Producer produces items into buffer, Consumer consumes. Buffer has limited size.

```c
semaphore mutex = 1;      // Mutual exclusion
semaphore empty = n;      // Number of empty slots
semaphore full = 0;       // Number of full slots

// Producer
while (true) {
    produce item;
    wait(empty);          // Wait for empty slot
    wait(mutex);          // Enter CS
    add to buffer;
    signal(mutex);        // Exit CS
    signal(full);         // Increment full count
}

// Consumer
while (true) {
    wait(full);           // Wait for item
    wait(mutex);          // Enter CS
    remove from buffer;
    signal(mutex);        // Exit CS
    signal(empty);        // Increment empty count
    consume item;
}
```

**MCQ Trap:** Order matters! `wait(empty)` THEN `wait(mutex)`. Reversing can cause deadlock!

### 2. Readers-Writers Problem

**Problem:** Multiple readers can read simultaneously, but writers need exclusive access.

**First Readers-Writers (Readers' Preference):**
```c
semaphore rw_mutex = 1;   // Exclusive access for writing
semaphore mutex = 1;       // Protect read_count
int read_count = 0;

// Writer
wait(rw_mutex);
// WRITE
signal(rw_mutex);

// Reader
wait(mutex);
read_count++;
if (read_count == 1)      // First reader
    wait(rw_mutex);       // Block writers
signal(mutex);

// READ

wait(mutex);
read_count--;
if (read_count == 0)      // Last reader
    signal(rw_mutex);     // Allow writers
signal(mutex);
```

**Issue:** Writers may **starve** if continuous readers.

### 3. Dining Philosophers Problem

**Problem:** 5 philosophers sit around a table with 5 chopsticks. Each needs 2 chopsticks to eat.

```
        P0
    c4      c0
  P4          P1
    c3      c1
      P3  P2
        c2
```

**Naive Solution (DEADLOCK!):**
```c
// Philosopher i
while (true) {
    think();
    wait(chopstick[i]);           // Pick left
    wait(chopstick[(i+1) % 5]);   // Pick right
    eat();
    signal(chopstick[i]);
    signal(chopstick[(i+1) % 5]);
}
```

**Deadlock:** All pick left chopstick simultaneously!

**Solutions:**
1. Allow at most 4 philosophers at table
2. Pick both chopsticks atomically
3. Odd philosophers pick left first, even pick right first
4. Use monitor with condition variables

---

## 4. DEADLOCKS

### What is Deadlock?

A set of processes is in **deadlock** if every process is waiting for an event that can only be caused by another process in the set.

```
Process P1: Has R1, Wants R2
Process P2: Has R2, Wants R1

P1 ──waits──→ R2 ←──held by── P2
 ↑                              │
 │                              │
held by                    waits for
 │                              │
R1 ←────── waits for ─────────┘
```

### Necessary Conditions (Coffman Conditions)

**All four must hold for deadlock to occur:**

| Condition | Meaning |
|-----------|---------|
| **Mutual Exclusion** | At least one resource held in non-sharable mode |
| **Hold and Wait** | Process holding resource(s) is waiting for additional resource(s) |
| **No Preemption** | Resources cannot be forcibly taken away |
| **Circular Wait** | Circular chain of processes waiting for resources |

**MCQ Tip:** These are NECESSARY, not sufficient. All 4 → deadlock MAY occur, but not guaranteed.

### Resource Allocation Graph (RAG)

**Vertices:**
- Circles = Processes (P1, P2, ...)
- Rectangles = Resources (R1, R2, ...), dots inside = instances

**Edges:**
- **Request Edge:** P → R (process requests resource)
- **Assignment Edge:** R → P (resource allocated to process)

```
     Request        Assignment
P1 ───────────→ R1 ────────────→ P2
```

#### Deadlock Detection in RAG

**Single Instance Resources:**
- Cycle in RAG ⟺ Deadlock

**Multiple Instance Resources:**
- Cycle in RAG → Deadlock MAY exist (not definite)
- Need Banker's algorithm for detection

**Example with no deadlock despite cycle:**
```
     ┌──────────┐
     ↓          │
P1 ← R1 ← P2    │
     │    ↓     │
     └── R2 ────┘
     
If R2 has 2 instances and P3 (not in cycle) holds one,
P3 can release, breaking potential deadlock.
```

### Handling Deadlocks

#### 1. Deadlock Prevention

Break one of the four necessary conditions:

| Condition | Prevention Method |
|-----------|-------------------|
| Mutual Exclusion | Use sharable resources (not always possible) |
| Hold and Wait | Request all resources at start OR release all before new request |
| No Preemption | If can't get resource, release all and restart |
| Circular Wait | Order resources numerically, request in increasing order only |

**Most practical:** Circular wait prevention

#### 2. Deadlock Avoidance

Dynamically examine resource state before allocation to ensure system never enters **unsafe state**.

**Safe State:** A sequence exists where all processes can complete.

```
Safe State → May lead to → Unsafe State → May lead to → Deadlock
            (bad allocation)              (not guaranteed)
```

**Key Point:** Safe state = No deadlock. Unsafe state = Deadlock POSSIBLE (not certain).

### Banker's Algorithm

Used for **deadlock avoidance** with multiple resource instances.

**Data Structures:**
- `n` = number of processes
- `m` = number of resource types
- `Available[m]` = available instances of each resource
- `Max[n][m]` = maximum demand of each process
- `Allocation[n][m]` = currently allocated to each process
- `Need[n][m]` = remaining need = Max - Allocation

**Safety Algorithm:**

```
1. Initialize:
   Work = Available
   Finish[i] = false for all i

2. Find process i such that:
   Finish[i] = false AND Need[i] ≤ Work
   
   If no such i exists, go to step 4

3. Work = Work + Allocation[i]
   Finish[i] = true
   Go to step 2

4. If Finish[i] = true for all i → System is SAFE
   Otherwise → UNSAFE
```

**Resource Request Algorithm:**

When process Pi requests resources:

```
1. If Request[i] > Need[i] → ERROR (exceeded max claim)

2. If Request[i] > Available → WAIT (resources not available)

3. Pretend to allocate:
   Available = Available - Request[i]
   Allocation[i] = Allocation[i] + Request[i]
   Need[i] = Need[i] - Request[i]

4. Run Safety Algorithm:
   If SAFE → Actually allocate
   If UNSAFE → Restore old state, make process wait
```

### Banker's Algorithm Example

```
5 processes (P0-P4), 3 resource types (A, B, C)
Available: A=3, B=3, C=2

     Allocation    Max        Need
       A B C      A B C      A B C
P0     0 1 0      7 5 3      7 4 3
P1     2 0 0      3 2 2      1 2 2
P2     3 0 2      9 0 2      6 0 0
P3     2 1 1      2 2 2      0 1 1
P4     0 0 2      4 3 3      4 3 1

Is system safe? Find safe sequence.

Work = [3, 3, 2]

Step 1: P1's Need [1,2,2] ≤ Work [3,3,2] ✓
        Work = [3,3,2] + [2,0,0] = [5,3,2]
        
Step 2: P3's Need [0,1,1] ≤ Work [5,3,2] ✓
        Work = [5,3,2] + [2,1,1] = [7,4,3]
        
Step 3: P4's Need [4,3,1] ≤ Work [7,4,3] ✓
        Work = [7,4,3] + [0,0,2] = [7,4,5]
        
Step 4: P0's Need [7,4,3] ≤ Work [7,4,5] ✓
        Work = [7,4,5] + [0,1,0] = [7,5,5]
        
Step 5: P2's Need [6,0,0] ≤ Work [7,5,5] ✓
        Work = [7,5,5] + [3,0,2] = [10,5,7]

Safe Sequence: P1 → P3 → P4 → P0 → P2
```

#### 3. Deadlock Detection

Allow deadlocks, detect when they occur.

**Single Instance:** Use wait-for graph (simplified RAG)
- Remove resource nodes, keep only process-to-process edges
- Cycle = Deadlock

**Multiple Instances:** Use algorithm similar to Banker's

#### 4. Deadlock Recovery

After detection:

**Process Termination:**
- Abort all deadlocked processes (drastic)
- Abort one at a time until deadlock eliminated (which one?)
  - Priority, time executed, resources held, future needs

**Resource Preemption:**
- Take resource from a process
- Issues: Which victim? Rollback? Starvation?

### Deadlock vs Starvation

| Deadlock | Starvation |
|----------|------------|
| Circular waiting | Indefinite waiting |
| Processes blocked forever | Process waiting indefinitely while others proceed |
| Involves multiple processes | Can affect single process |
| Resources are involved | Can occur due to scheduling policy |
| System comes to halt | System continues, just one process suffers |

---

## Quick Revision - MCQ Hot Topics

### Must-Remember Points:

1. **fork() returns:** 0 to child, child PID to parent

2. **Zombie process:** Child done, parent didn't wait()
   **Orphan process:** Parent done before child

3. **User threads block:** Entire process blocks
   **Kernel threads block:** Only that thread blocks

4. **Peterson's Solution:** 2 processes only, software solution

5. **Semaphore wait/signal:** ATOMIC operations

6. **Producer-Consumer:** Order is empty→mutex (producer), full→mutex (consumer)

7. **Deadlock conditions:** Mutual Exclusion + Hold & Wait + No Preemption + Circular Wait

8. **Safe state:** Can guarantee completion. Unsafe ≠ Deadlock (may lead to)

9. **Banker's Algorithm:** Need = Max - Allocation

10. **RAG with single instance:** Cycle ⟺ Deadlock
    **Multiple instances:** Cycle → Maybe deadlock

---
