# 📚 Data Structures & Algorithms - Quick Revision Guide

---

## 1️⃣ STACK

### **Definition**
Linear data structure following **LIFO** (Last In First Out)

```
    │ 40 │ ← TOP (Last In, First Out)
    │ 30 │
    │ 20 │
    │ 10 │
    └────┘
```

---

### **Basic Operations**

| Operation | Description | Time Complexity |
|-----------|-------------|-----------------|
| **push(x)** | Insert element at top | O(1) |
| **pop()** | Remove element from top | O(1) |
| **peek()/top()** | View top element (no removal) | O(1) |
| **isEmpty()** | Check if stack is empty | O(1) |
| **isFull()** | Check if stack is full (array) | O(1) |

---

### **Implementation**

#### **Using Array**
```
Pros: Simple, cache-friendly
Cons: Fixed size, overflow possible

top = -1 (empty stack)
push: top++, arr[top] = x
pop:  return arr[top--]
```

#### **Using Linked List**
```
Pros: Dynamic size, no overflow
Cons: Extra memory for pointers

push: Insert at head
pop:  Delete from head
```

---

### **Stack Conditions**

```
┌─────────────────────────────────────────────┐
│  UNDERFLOW: pop() when stack is EMPTY       │
│  OVERFLOW:  push() when stack is FULL       │
└─────────────────────────────────────────────┘
```

---

### **Applications of Stack**

| Application | How Stack is Used |
|-------------|-------------------|
| **Function calls** | Call stack stores return addresses |
| **Recursion** | Internally uses stack |
| **Undo operation** | Store previous states |
| **Browser back button** | Store visited pages |
| **Balanced parentheses** | Match opening/closing brackets |
| **Infix to Postfix** | Operator precedence handling |
| **Expression evaluation** | Postfix/Prefix evaluation |
| **DFS traversal** | Graph/Tree traversal |
| **Backtracking** | N-Queens, Maze solving |

---

### **Parentheses Matching Algorithm**

```
For each character:
  If '(' or '{' or '[' → PUSH
  If ')' or '}' or ']' → 
     If stack empty → NOT BALANCED
     If top matches → POP
     Else → NOT BALANCED
     
End: If stack empty → BALANCED
```

---

### **Infix, Prefix, Postfix**

| Type | Operator Position | Example |
|------|-------------------|---------|
| **Infix** | Between operands | A + B |
| **Prefix** (Polish) | Before operands | + A B |
| **Postfix** (Reverse Polish) | After operands | A B + |

#### **Infix to Postfix Conversion**

**Example:** `A + B * C`

```
Step 1: B * C → BC*
Step 2: A + BC* → ABC*+

Answer: ABC*+
```

**Operator Precedence (High to Low):**
```
^  (Right to Left associativity)
*, /  (Left to Right)
+, -  (Left to Right)
```

#### **Postfix Evaluation**
```
Scan left to right:
  If operand → PUSH
  If operator → POP two, apply operator, PUSH result
```

**Example:** `5 3 + 2 *`
```
5 → push 5
3 → push 3
+ → pop 3,5 → 5+3=8 → push 8
2 → push 2
* → pop 2,8 → 8*2=16 → push 16

Result: 16
```

---

### 🎯 **Stack MCQ Traps**

1. **LIFO** not FIFO
2. **Underflow** = pop from empty, **Overflow** = push to full
3. Recursion uses **stack** internally (not queue)
4. DFS uses **stack**, BFS uses **queue**
5. **Postfix** evaluation: operands pushed, operators pop two
6. **Array implementation**: top = -1 means empty

---

## 2️⃣ QUEUE

### **Definition**
Linear data structure following **FIFO** (First In First Out)

```
FRONT                           REAR
  ↓                               ↓
┌────┬────┬────┬────┬────┬────┐
│ 10 │ 20 │ 30 │ 40 │ 50 │    │
└────┴────┴────┴────┴────┴────┘
  ↑                         ↑
DELETE                    INSERT
(Dequeue)                (Enqueue)
```

---

### **Basic Operations**

| Operation | Description | Time Complexity |
|-----------|-------------|-----------------|
| **enqueue(x)** | Insert at rear | O(1) |
| **dequeue()** | Remove from front | O(1) |
| **front()/peek()** | View front element | O(1) |
| **rear()** | View rear element | O(1) |
| **isEmpty()** | Check if empty | O(1) |

---

### **Types of Queue**

#### **1. Simple/Linear Queue**
```
Problem: Space wastage after deletions

[_, _, _, 40, 50]
         ↑     ↑
       front  rear
       
Front spaces wasted!
```

#### **2. Circular Queue**
```
Rear wraps around to beginning
Solves space wastage problem

Formulas:
  rear = (rear + 1) % SIZE
  front = (front + 1) % SIZE
  
Empty: front == -1
Full:  (rear + 1) % SIZE == front
```

```
        ┌───┐
      4 │   │ 0
       ╲│   │╱
     3 ─┤   ├─ 1
       ╱│   │╲
      2 │   │
        └───┘
```

#### **3. Priority Queue**
```
Elements have PRIORITY
Higher priority served first (not FIFO)

Types:
  - Max Priority Queue: Largest first
  - Min Priority Queue: Smallest first
  
Implementation: Usually HEAP
```

#### **4. Deque (Double-Ended Queue)**
```
Insert and Delete from BOTH ends

┌────────────────────────────────┐
│ ←INSERT    DELETE→             │
│ ←DELETE    INSERT→             │
└────────────────────────────────┘
  FRONT                    REAR

Types:
  - Input Restricted: Insert at one end only
  - Output Restricted: Delete from one end only
```

---

### **Queue Conditions**

```
Simple Queue:
  Empty: front == -1 OR front > rear
  Full:  rear == SIZE - 1

Circular Queue:
  Empty: front == -1
  Full:  (rear + 1) % SIZE == front
```

---

### **Implementation**

#### **Using Array**
```python
# Simple Queue
enqueue: rear++, arr[rear] = x
dequeue: return arr[front++]

# Circular Queue
enqueue: rear = (rear+1) % SIZE, arr[rear] = x
dequeue: front = (front+1) % SIZE
```

#### **Using Linked List**
```
enqueue: Insert at tail
dequeue: Delete from head

Advantage: No overflow (dynamic)
```

---

### **Applications of Queue**

| Application | Description |
|-------------|-------------|
| **CPU Scheduling** | Process scheduling (FCFS) |
| **BFS Traversal** | Graph/Tree traversal |
| **Print Spooling** | Print job queue |
| **IO Buffers** | Keyboard buffer |
| **Call Center** | Customer waiting queue |
| **Web Server** | Request handling |

---

### **Stack vs Queue Comparison**

| Aspect | Stack | Queue |
|--------|-------|-------|
| **Principle** | LIFO | FIFO |
| **Insert** | push (top) | enqueue (rear) |
| **Delete** | pop (top) | dequeue (front) |
| **Pointers** | 1 (top) | 2 (front, rear) |
| **Traversal** | DFS | BFS |
| **Example** | Plates stack | Ticket line |

---

### **Implement Queue using Stacks**

#### **Method 1: Costly Enqueue**
```
enqueue: O(n), dequeue: O(1)

enqueue(x):
  While S1 not empty: push S1.pop() to S2
  Push x to S1
  While S2 not empty: push S2.pop() to S1
```

#### **Method 2: Costly Dequeue**
```
enqueue: O(1), dequeue: O(n)

enqueue(x): Push to S1
dequeue(): 
  If S2 empty: move all S1 to S2
  Return S2.pop()
```

---

### **Implement Stack using Queues**

#### **Method 1: Costly Push**
```
push(x):
  Enqueue x to Q2
  Move all Q1 to Q2
  Swap Q1 and Q2
```

#### **Method 2: Costly Pop**
```
push(x): Enqueue to Q1
pop(): 
  Move all except last from Q1 to Q2
  Return last element
  Swap Q1 and Q2
```

---

### 🎯 **Queue MCQ Traps**

1. **FIFO** not LIFO
2. **Circular queue** formula: `(rear + 1) % SIZE`
3. **BFS uses Queue**, DFS uses Stack
4. **Priority Queue** ≠ FIFO (priority matters)
5. **Deque**: Insert/Delete at BOTH ends
6. Simple queue has **space wastage** problem

---

## 3️⃣ DYNAMIC PROGRAMMING

### **Definition**
Optimization technique that solves problems by:
1. Breaking into **overlapping subproblems**
2. Storing solutions to avoid **recomputation**

```
"Those who cannot remember the past are condemned to repeat it"
                                        - Dynamic Programming motto
```

---

### **When to Use DP?**

Look for these properties:

| Property | Meaning |
|----------|---------|
| **Optimal Substructure** | Optimal solution contains optimal solutions of subproblems |
| **Overlapping Subproblems** | Same subproblems solved multiple times |

```
✅ DP Suitable: Fibonacci, Knapsack, LCS
❌ Not Suitable: Binary Search, Merge Sort (no overlapping)
```

---

### **Two Approaches**

#### **1. Memoization (Top-Down)**
```
Start from MAIN problem
Recursively solve smaller problems
STORE results in table/array
Check table before computing

Direction: Top → Down
Uses: Recursion + Cache
```

```python
# Fibonacci - Memoization
def fib(n, memo={}):
    if n in memo: return memo[n]
    if n <= 1: return n
    memo[n] = fib(n-1) + fib(n-2)
    return memo[n]
```

#### **2. Tabulation (Bottom-Up)**
```
Start from SMALLEST subproblem
Build solution iteratively
Fill table from base case up

Direction: Bottom → Up
Uses: Iteration + Table
```

```python
# Fibonacci - Tabulation
def fib(n):
    dp = [0] * (n+1)
    dp[1] = 1
    for i in range(2, n+1):
        dp[i] = dp[i-1] + dp[i-2]
    return dp[n]
```

---

### **Comparison: Memoization vs Tabulation**

| Aspect | Memoization | Tabulation |
|--------|-------------|------------|
| **Approach** | Top-Down | Bottom-Up |
| **Technique** | Recursion + Cache | Iteration + Table |
| **Solves** | Only needed subproblems | All subproblems |
| **Stack overflow** | Possible (deep recursion) | No (iterative) |
| **Easier to write** | ✅ Yes (natural recursion) | Requires thinking order |
| **Space optimization** | Harder | Easier |

---

### **Classic DP Problems**

#### **1. Fibonacci Series**
```
F(n) = F(n-1) + F(n-2)
Base: F(0)=0, F(1)=1

Without DP: O(2^n)
With DP:    O(n) time, O(n) space
Optimized:  O(n) time, O(1) space
```

#### **2. 0/1 Knapsack**
```
Given: weights[], values[], capacity W
Find: Maximum value without exceeding W

Recurrence:
  dp[i][w] = max(
    dp[i-1][w],                    // Don't take item i
    dp[i-1][w-wt[i]] + val[i]      // Take item i
  )

Time: O(n×W)
Space: O(n×W) → Can optimize to O(W)
```

#### **3. Longest Common Subsequence (LCS)**
```
Find longest subsequence common to both strings

Recurrence:
  If X[i] == Y[j]: dp[i][j] = dp[i-1][j-1] + 1
  Else: dp[i][j] = max(dp[i-1][j], dp[i][j-1])

Time: O(m×n)
Space: O(m×n)
```

**Example:**
```
X = "ABCD", Y = "AEBD"
LCS = "ABD" (length 3)
```

#### **4. Longest Increasing Subsequence (LIS)**
```
Find longest strictly increasing subsequence

Recurrence:
  dp[i] = max(dp[j] + 1) for all j < i where arr[j] < arr[i]

Time: O(n²) → Can optimize to O(n log n)
Space: O(n)
```

**Example:**
```
arr = [10, 22, 9, 33, 21, 50, 41, 60]
LIS = [10, 22, 33, 50, 60] (length 5)
```

#### **5. Coin Change**
```
Minimum coins to make amount

Recurrence:
  dp[amount] = min(dp[amount - coin] + 1) for all coins

Time: O(amount × coins)
Space: O(amount)
```

#### **6. Edit Distance (Levenshtein)**
```
Minimum operations to convert string A to B
Operations: Insert, Delete, Replace

Recurrence:
  If A[i] == B[j]: dp[i][j] = dp[i-1][j-1]
  Else: dp[i][j] = 1 + min(
    dp[i-1][j],      // Delete
    dp[i][j-1],      // Insert
    dp[i-1][j-1]     // Replace
  )

Time: O(m×n)
```

#### **7. Matrix Chain Multiplication**
```
Minimum multiplications to multiply matrices

Time: O(n³)
Space: O(n²)
```

---

### **DP Problem Categories**

| Category | Examples |
|----------|----------|
| **1D DP** | Fibonacci, Climbing Stairs, House Robber |
| **2D DP** | LCS, Edit Distance, Knapsack |
| **String DP** | LCS, Edit Distance, Palindrome |
| **Grid DP** | Unique Paths, Min Path Sum |
| **Interval DP** | Matrix Chain, Burst Balloons |
| **Tree DP** | Diameter, Max Path Sum |

---

### **Common DP Patterns**

#### **Pattern 1: Linear DP**
```
dp[i] depends on previous elements
Examples: Fibonacci, House Robber, LIS
```

#### **Pattern 2: Grid DP**
```
dp[i][j] depends on adjacent cells
Examples: Unique Paths, Min Path Sum
```

#### **Pattern 3: String DP**
```
Two strings → 2D table
dp[i][j] for first i chars of S1, first j chars of S2
Examples: LCS, Edit Distance
```

#### **Pattern 4: Decision DP**
```
Take or not take decision
dp[i][capacity]
Examples: 0/1 Knapsack, Subset Sum
```

---

### **Time Complexity of Classic Problems**

| Problem | Time | Space |
|---------|------|-------|
| Fibonacci | O(n) | O(1) optimized |
| 0/1 Knapsack | O(n×W) | O(n×W) |
| LCS | O(m×n) | O(m×n) |
| LIS | O(n²) or O(n log n) | O(n) |
| Edit Distance | O(m×n) | O(m×n) |
| Coin Change | O(n×amount) | O(amount) |
| Matrix Chain | O(n³) | O(n²) |

---

### **How to Identify DP Problem?**

```
✅ Asks for OPTIMAL (min/max/longest/shortest)
✅ Asks for COUNT of ways
✅ Choices at each step
✅ Can break into smaller similar subproblems
✅ Keywords: "minimum", "maximum", "count ways", "possible"
```

---

### **DP vs Other Techniques**

| Technique | Overlapping Subproblems | Optimal Substructure |
|-----------|------------------------|---------------------|
| **DP** | ✅ Yes | ✅ Yes |
| **Divide & Conquer** | ❌ No | ✅ Yes |
| **Greedy** | N/A | ✅ Yes (local optimal) |

```
Merge Sort: Divide & Conquer (subproblems independent)
Fibonacci: DP (subproblems overlap)
```

---

### **Space Optimization Trick**

Many 2D DP can be reduced to 1D:

```
If dp[i] only depends on dp[i-1]:
  → Use two rows or single row
  → O(n²) space → O(n) space

Example: Knapsack
Original: dp[n][W]
Optimized: dp[W] (fill right to left)
```

---

## 🚀 QUICK REFERENCE CHEAT SHEET

```
┌─────────────────────────────────────────────────────────┐
│ STACK                                                   │
│   LIFO | push/pop: O(1) | Uses: DFS, recursion, undo    │
├─────────────────────────────────────────────────────────┤
│ QUEUE                                                   │
│   FIFO | enqueue/dequeue: O(1) | Uses: BFS, scheduling  │
│   Circular: (rear+1) % SIZE                             │
├─────────────────────────────────────────────────────────┤
│ DYNAMIC PROGRAMMING                                     │
│   Overlapping subproblems + Optimal substructure        │
│   Memoization: Top-Down (Recursion + Cache)             │
│   Tabulation: Bottom-Up (Iteration + Table)             │
└─────────────────────────────────────────────────────────┘
```

---

## 💡 MOST COMMON MCQ TRAPS

### **Stack & Queue**
1. Stack = **LIFO**, Queue = **FIFO**
2. **DFS = Stack**, **BFS = Queue**
3. Circular queue: `(rear+1) % SIZE == front` means FULL
4. Priority Queue is **NOT** FIFO
5. Function calls use **Stack** (call stack)

### **Dynamic Programming**
6. **Greedy ≠ DP** (Greedy: local optimal, DP: global optimal)
7. **Memoization = Top-Down**, **Tabulation = Bottom-Up**
8. DP needs **BOTH**: overlapping subproblems + optimal substructure
9. **LCS ≠ LIS** (Subsequence vs Increasing)
10. Without DP, Fibonacci = O(2ⁿ), With DP = O(n)

---

Good luck with your placements! 🎯
