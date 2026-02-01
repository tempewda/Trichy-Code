# DBMS - Placement Preparation Notes

## 1. DBMS Architecture

### Three-Level Architecture (ANSI-SPARC)

```
┌─────────────────────────────────────────────────────────────────┐
│                        EXTERNAL LEVEL                           │
│                         (View Level)                            │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐                         │
│  │ View 1  │  │ View 2  │  │ View 3  │   ← Different users     │
│  │ (Admin) │  │(Student)│  │(Faculty)│     see different data  │
│  └─────────┘  └─────────┘  └─────────┘                         │
├─────────────────────────────────────────────────────────────────┤
│                 ↕ External/Conceptual Mapping                   │
├─────────────────────────────────────────────────────────────────┤
│                      CONCEPTUAL LEVEL                           │
│                      (Logical Level)                            │
│                                                                 │
│   ┌─────────────────────────────────────────────────────────┐  │
│   │  Complete logical structure of entire database          │  │
│   │  - What data is stored                                  │  │
│   │  - Relationships between data                           │  │
│   │  - Constraints, security                                │  │
│   └─────────────────────────────────────────────────────────┘  │
├─────────────────────────────────────────────────────────────────┤
│                 ↕ Conceptual/Internal Mapping                   │
├─────────────────────────────────────────────────────────────────┤
│                       INTERNAL LEVEL                            │
│                      (Physical Level)                           │
│                                                                 │
│   ┌─────────────────────────────────────────────────────────┐  │
│   │  How data is physically stored                          │  │
│   │  - File organization                                    │  │
│   │  - Indexing, Hashing                                    │  │
│   │  - Storage allocation                                   │  │
│   └─────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                              ↓
                    ┌─────────────────┐
                    │  PHYSICAL DISK  │
                    └─────────────────┘
```

### Quick Comparison Table

| Level | Also Called | Describes | Users |
|-------|-------------|-----------|-------|
| External | View | Subset of data for specific user | End Users |
| Conceptual | Logical | Complete logical structure | DBA, Designers |
| Internal | Physical | Storage details | System Programmers |

---

### Data Independence

```
┌────────────────────────────────────────────────────────────────┐
│                    DATA INDEPENDENCE                           │
│         (Ability to modify schema without affecting            │
│                    higher levels)                              │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  1. LOGICAL DATA INDEPENDENCE                                  │
│     ─────────────────────────                                  │
│     • Change CONCEPTUAL schema without changing EXTERNAL       │
│     • Example: Add new column → Views still work               │
│     • HARDER to achieve                                        │
│                                                                │
│  2. PHYSICAL DATA INDEPENDENCE                                 │
│     ─────────────────────────                                  │
│     • Change INTERNAL schema without changing CONCEPTUAL       │
│     • Example: Change storage from HDD to SSD                  │
│     • EASIER to achieve                                        │
│                                                                │
└────────────────────────────────────────────────────────────────┘
```

---

### DBMS Components/Architecture

```
                    ┌─────────────────┐
                    │   End Users     │
                    └────────┬────────┘
                             ↓
                    ┌─────────────────┐
                    │ Application     │
                    │ Programs        │
                    └────────┬────────┘
                             ↓
┌────────────────────────────────────────────────────────────────┐
│                         DBMS                                   │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │                    Query Processor                        │ │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐       │ │
│  │  │   Parser    │→ │  Optimizer  │→ │  Executor   │       │ │
│  │  └─────────────┘  └─────────────┘  └─────────────┘       │ │
│  └──────────────────────────────────────────────────────────┘ │
│                             ↓                                  │
│  ┌──────────────────────────────────────────────────────────┐ │
│  │                   Storage Manager                         │ │
│  │  ┌────────────┐ ┌────────────┐ ┌────────────┐            │ │
│  │  │ Buffer Mgr │ │ File Mgr   │ │Transaction │            │ │
│  │  │            │ │            │ │ Manager    │            │ │
│  │  └────────────┘ └────────────┘ └────────────┘            │ │
│  └──────────────────────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────────────┘
                             ↓
              ┌──────────────────────────┐
              │     Data Dictionary      │
              │   (Metadata/Catalog)     │
              └──────────────────────────┘
                             ↓
              ┌──────────────────────────┐
              │      Database Files      │
              └──────────────────────────┘
```

### Component Functions

| Component | Function |
|-----------|----------|
| **Parser** | Checks SQL syntax, validates table/column names |
| **Optimizer** | Finds most efficient execution plan |
| **Executor** | Executes the query plan |
| **Buffer Manager** | Manages RAM buffers, caching |
| **File Manager** | Manages disk space allocation |
| **Transaction Manager** | Ensures ACID properties |
| **Data Dictionary** | Stores metadata (table structures, constraints) |

---

### Two-Tier vs Three-Tier Architecture

```
TWO-TIER (Client-Server)          THREE-TIER (Web Applications)
─────────────────────────          ────────────────────────────

┌──────────────┐                  ┌──────────────┐
│   Client     │                  │   Client     │
│ (App + UI)   │                  │  (Browser)   │  ← Presentation
└──────┬───────┘                  └──────┬───────┘
       │                                 │
       │ Direct                          │ HTTP
       │ Connection                      ↓
       │                          ┌──────────────┐
       │                          │ Application  │  ← Business Logic
       │                          │   Server     │
       │                          └──────┬───────┘
       ↓                                 ↓
┌──────────────┐                  ┌──────────────┐
│   Database   │                  │   Database   │  ← Data
│    Server    │                  │    Server    │
└──────────────┘                  └──────────────┘

Pros: Simple, Fast                Pros: Scalable, Secure
Cons: Less secure,                Cons: Complex
      Not scalable
```

---

## 2. Normalization

### What & Why?

```
┌─────────────────────────────────────────────────────────────────┐
│ NORMALIZATION = Process of organizing data to reduce           │
│                 redundancy and improve data integrity          │
└─────────────────────────────────────────────────────────────────┘

WHY NORMALIZE?
─────────────────
To eliminate these ANOMALIES:

┌─────────────────┬──────────────────────────────────────────────┐
│ Insertion       │ Cannot insert data without other data       │
│ Anomaly         │ Ex: Can't add new course without student    │
├─────────────────┼──────────────────────────────────────────────┤
│ Update          │ Same data in multiple places = inconsistent │
│ Anomaly         │ Ex: Update phone in one row, not others     │
├─────────────────┼──────────────────────────────────────────────┤
│ Deletion        │ Deleting data causes loss of other data     │
│ Anomaly         │ Ex: Delete student = lose course info       │
└─────────────────┴──────────────────────────────────────────────┘
```

---

### Keys - Foundation of Normalization

```
┌─────────────────────────────────────────────────────────────────┐
│                           KEYS                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  SUPER KEY                                                      │
│  ─────────                                                      │
│  Any set of attributes that uniquely identifies a tuple         │
│  Example: {StudentID}, {StudentID, Name}, {StudentID, Email}    │
│                                                                 │
│  CANDIDATE KEY                                                  │
│  ─────────────                                                  │
│  Minimal super key (no subset is a super key)                   │
│  Example: {StudentID}, {Email}                                  │
│                                                                 │
│  PRIMARY KEY                                                    │
│  ───────────                                                    │
│  Chosen candidate key to identify tuples                        │
│  Example: {StudentID}                                           │
│                                                                 │
│  FOREIGN KEY                                                    │
│  ───────────                                                    │
│  Attribute referencing primary key of another table             │
│  Example: DeptID in Student table → DeptID in Department        │
│                                                                 │
│  PRIME ATTRIBUTE                                                │
│  ───────────────                                                │
│  Attribute that is part of ANY candidate key                    │
│                                                                 │
│  NON-PRIME ATTRIBUTE                                            │
│  ───────────────────                                            │
│  Attribute that is NOT part of any candidate key                │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

```
EXAMPLE:
─────────
Table: Student(StudentID, Email, Name, Age, DeptID)

Super Keys:     {StudentID}, {Email}, {StudentID, Name}, 
                {StudentID, Email}, {StudentID, Name, Age}...

Candidate Keys: {StudentID}, {Email}  ← Minimal

Primary Key:    {StudentID}  ← Chosen one

Prime Attrs:    StudentID, Email
Non-Prime:      Name, Age, DeptID
```

---

### Functional Dependency (FD)

```
┌─────────────────────────────────────────────────────────────────┐
│  FUNCTIONAL DEPENDENCY: X → Y                                   │
│  ────────────────────────────                                   │
│  "X determines Y" or "Y is functionally dependent on X"         │
│                                                                 │
│  If two tuples have same X value, they MUST have same Y value   │
└─────────────────────────────────────────────────────────────────┘

EXAMPLE:
─────────
StudentID → Name        ✓ (Each ID has one name)
StudentID → {Name, Age} ✓ (ID determines both)
Name → StudentID        ✗ (Two students can have same name)

TYPES OF FDs:
─────────────
┌─────────────────┬─────────────────────────────────────────────┐
│ Trivial FD      │ X → Y where Y ⊆ X                           │
│                 │ Ex: {A,B} → A  (Always true)                │
├─────────────────┼─────────────────────────────────────────────┤
│ Non-trivial FD  │ X → Y where Y ⊄ X                           │
│                 │ Ex: StudentID → Name                        │
├─────────────────┼─────────────────────────────────────────────┤
│ Partial FD      │ Part of candidate key → Non-prime attr      │
│                 │ Ex: {A,B} is key, A → C                     │
├─────────────────┼─────────────────────────────────────────────┤
│ Transitive FD   │ X → Y → Z (X → Z through Y)                 │
│                 │ Ex: StudentID → DeptID → DeptName           │
└─────────────────┴─────────────────────────────────────────────┘
```

---

### Armstrong's Axioms (Finding Closure)

```
┌─────────────────────────────────────────────────────────────────┐
│                    ARMSTRONG'S AXIOMS                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  PRIMARY (Sound & Complete):                                    │
│  ─────────────────────────                                      │
│  1. Reflexivity:  If Y ⊆ X, then X → Y                          │
│                                                                 │
│  2. Augmentation: If X → Y, then XZ → YZ                        │
│                                                                 │
│  3. Transitivity: If X → Y and Y → Z, then X → Z                │
│                                                                 │
│  DERIVED RULES:                                                 │
│  ─────────────                                                  │
│  4. Union:        If X → Y and X → Z, then X → YZ               │
│                                                                 │
│  5. Decomposition: If X → YZ, then X → Y and X → Z              │
│                                                                 │
│  6. Pseudo-trans: If X → Y and WY → Z, then WX → Z              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Attribute Closure (X⁺)

```
ALGORITHM: Find X⁺ given FDs
───────────────────────────
1. Start: X⁺ = X
2. For each FD (A → B):
   If A ⊆ X⁺, then X⁺ = X⁺ ∪ B
3. Repeat until no change

EXAMPLE:
─────────
R(A, B, C, D, E)
FDs: A → B, B → C, C → D, D → E

Find A⁺:
  A⁺ = {A}
  A → B:  A ⊆ {A}? Yes → A⁺ = {A,B}
  B → C:  B ⊆ {A,B}? Yes → A⁺ = {A,B,C}
  C → D:  C ⊆ {A,B,C}? Yes → A⁺ = {A,B,C,D}
  D → E:  D ⊆ {A,B,C,D}? Yes → A⁺ = {A,B,C,D,E}
  
  A⁺ = {A,B,C,D,E} = All attributes
  ∴ A is a CANDIDATE KEY
```

---

### Normal Forms Hierarchy

```
        ┌─────────────────────────────────────────┐
        │              5NF (PJNF)                 │
        │         (Project-Join NF)              │
        └────────────────┬────────────────────────┘
                         ↑
        ┌────────────────┴────────────────────────┐
        │                4NF                      │
        │    (No multi-valued dependencies)       │
        └────────────────┬────────────────────────┘
                         ↑
        ┌────────────────┴────────────────────────┐
        │               BCNF                      │
        │   (Every determinant is candidate key)  │
        └────────────────┬────────────────────────┘
                         ↑
        ┌────────────────┴────────────────────────┐
        │               3NF                       │
        │     (No transitive dependency)          │
        └────────────────┬────────────────────────┘
                         ↑
        ┌────────────────┴────────────────────────┐
        │               2NF                       │
        │      (No partial dependency)            │
        └────────────────┬────────────────────────┘
                         ↑
        ┌────────────────┴────────────────────────┐
        │               1NF                       │
        │       (Atomic values only)              │
        └─────────────────────────────────────────┘

        Higher NF ⊂ Lower NF
        (BCNF ⊂ 3NF ⊂ 2NF ⊂ 1NF)
```

---

### First Normal Form (1NF)

```
┌─────────────────────────────────────────────────────────────────┐
│  1NF RULE: Every attribute must have ATOMIC (indivisible)      │
│            values. No repeating groups or arrays.              │
└─────────────────────────────────────────────────────────────────┘

VIOLATION EXAMPLE:
──────────────────
┌───────────┬─────────────────────┬────────────────┐
│ StudentID │ Name                │ Phone          │
├───────────┼─────────────────────┼────────────────┤
│ 1         │ John                │ 123, 456, 789  │  ← Multiple values!
│ 2         │ Jane                │ 111, 222       │
└───────────┴─────────────────────┴────────────────┘

AFTER 1NF:
──────────────────
┌───────────┬─────────────────────┬────────────────┐
│ StudentID │ Name                │ Phone          │
├───────────┼─────────────────────┼────────────────┤
│ 1         │ John                │ 123            │
│ 1         │ John                │ 456            │
│ 1         │ John                │ 789            │
│ 2         │ Jane                │ 111            │
│ 2         │ Jane                │ 222            │
└───────────┴─────────────────────┴────────────────┘

OR better - Create separate table:

Student(StudentID, Name)
Phone(StudentID, Phone)  ← StudentID is FK
```

---

### Second Normal Form (2NF)

```
┌─────────────────────────────────────────────────────────────────┐
│  2NF RULES:                                                     │
│  1. Must be in 1NF                                              │
│  2. No PARTIAL DEPENDENCY                                       │
│     (Non-prime attr must depend on WHOLE candidate key)         │
└─────────────────────────────────────────────────────────────────┘

NOTE: If candidate key is single attribute → Already 2NF!

VIOLATION EXAMPLE:
──────────────────
Table: StudentCourse(StudentID, CourseID, StudentName, CourseName, Grade)

Candidate Key: {StudentID, CourseID}

FDs:
  {StudentID, CourseID} → Grade        ✓ Full dependency
  StudentID → StudentName              ✗ PARTIAL dependency!
  CourseID → CourseName                ✗ PARTIAL dependency!

┌───────────┬──────────┬─────────────┬────────────┬───────┐
│ StudentID │ CourseID │ StudentName │ CourseName │ Grade │
├───────────┼──────────┼─────────────┼────────────┼───────┤
│ 1         │ C1       │ John        │ DBMS       │ A     │
│ 1         │ C2       │ John        │ OS         │ B     │ ← John repeated
│ 2         │ C1       │ Jane        │ DBMS       │ A     │ ← DBMS repeated
└───────────┴──────────┴─────────────┴────────────┴───────┘

AFTER 2NF (Decompose):
──────────────────────
Student(StudentID, StudentName)
  StudentID → StudentName

Course(CourseID, CourseName)
  CourseID → CourseName

Enrollment(StudentID, CourseID, Grade)
  {StudentID, CourseID} → Grade
```

---

### Third Normal Form (3NF)

```
┌─────────────────────────────────────────────────────────────────┐
│  3NF RULES:                                                     │
│  1. Must be in 2NF                                              │
│  2. No TRANSITIVE DEPENDENCY                                    │
│     (Non-prime → Non-prime is NOT allowed)                      │
│                                                                 │
│  FORMAL: For every FD X → A:                                    │
│    - X is superkey, OR                                          │
│    - A is prime attribute                                       │
└─────────────────────────────────────────────────────────────────┘

VIOLATION EXAMPLE:
──────────────────
Table: Student(StudentID, Name, DeptID, DeptName, HOD)

Candidate Key: {StudentID}

FDs:
  StudentID → DeptID     ✓ (Key → Non-prime)
  DeptID → DeptName      ✗ TRANSITIVE! (Non-prime → Non-prime)
  DeptID → HOD           ✗ TRANSITIVE!

  StudentID → DeptID → DeptName  (Transitive chain!)

┌───────────┬──────┬────────┬──────────┬─────────┐
│ StudentID │ Name │ DeptID │ DeptName │ HOD     │
├───────────┼──────┼────────┼──────────┼─────────┤
│ 1         │ John │ D1     │ CS       │ Dr. A   │
│ 2         │ Jane │ D1     │ CS       │ Dr. A   │ ← CS, Dr.A repeated
│ 3         │ Bob  │ D2     │ IT       │ Dr. B   │
└───────────┴──────┴────────┴──────────┴─────────┘

AFTER 3NF:
──────────
Student(StudentID, Name, DeptID)
  StudentID → Name, DeptID

Department(DeptID, DeptName, HOD)
  DeptID → DeptName, HOD
```

---

### Boyce-Codd Normal Form (BCNF)

```
┌─────────────────────────────────────────────────────────────────┐
│  BCNF RULE:                                                     │
│  For EVERY non-trivial FD X → Y:                                │
│    X MUST be a SUPERKEY                                         │
│                                                                 │
│  (Stricter than 3NF - no exception for prime attributes)        │
└─────────────────────────────────────────────────────────────────┘

3NF vs BCNF:
────────────
3NF:  X → A where X is superkey OR A is prime
BCNF: X → A where X is superkey (ONLY condition)

VIOLATION EXAMPLE:
──────────────────
Table: Teaching(Student, Subject, Teacher)

Constraints:
- Each teacher teaches only ONE subject
- Each subject can have multiple teachers
- Each student has one teacher per subject

Candidate Keys: {Student, Subject}, {Student, Teacher}

FDs:
  {Student, Subject} → Teacher   ✓ (Superkey)
  {Student, Teacher} → Subject   ✓ (Superkey)
  Teacher → Subject              ✗ NOT BCNF! (Teacher not superkey)

┌─────────┬─────────┬─────────┐
│ Student │ Subject │ Teacher │
├─────────┼─────────┼─────────┤
│ John    │ DBMS    │ T1      │
│ Jane    │ DBMS    │ T1      │ ← T1→DBMS repeated
│ John    │ OS      │ T2      │
└─────────┴─────────┴─────────┘

AFTER BCNF:
───────────
TeacherSubject(Teacher, Subject)
  Teacher → Subject  ✓ (Teacher is key)

StudentTeacher(Student, Teacher)
  {Student, Teacher} is key

⚠️ NOTE: BCNF decomposition may NOT preserve all FDs!
   Here: {Student, Subject} → Teacher is LOST
```

---

### 3NF vs BCNF - Quick Comparison

```
┌─────────────────┬───────────────────────┬───────────────────────┐
│                 │         3NF           │         BCNF          │
├─────────────────┼───────────────────────┼───────────────────────┤
│ Condition       │ X→A: X is superkey    │ X→A: X is superkey    │
│                 │ OR A is prime         │ (No exception)        │
├─────────────────┼───────────────────────┼───────────────────────┤
│ Strictness      │ Less strict           │ More strict           │
├─────────────────┼───────────────────────┼───────────────────────┤
│ FD Preservation │ Always preserved      │ May NOT be preserved  │
├─────────────────┼───────────────────────┼───────────────────────┤
│ Lossless Join   │ Yes                   │ Yes                   │
├─────────────────┼───────────────────────┼───────────────────────┤
│ Redundancy      │ Some possible         │ Minimal               │
├─────────────────┼───────────────────────┼───────────────────────┤
│ When to use     │ Need FD preservation  │ Minimal redundancy    │
└─────────────────┴───────────────────────┴───────────────────────┘

BCNF ⊂ 3NF (Every BCNF is 3NF, but not vice versa)
```

---

### Fourth Normal Form (4NF)

```
┌─────────────────────────────────────────────────────────────────┐
│  4NF RULE:                                                      │
│  1. Must be in BCNF                                             │
│  2. No MULTI-VALUED DEPENDENCIES (MVD)                          │
│                                                                 │
│  MVD: X →→ Y means for each X, set of Y values is independent   │
│       of other attributes                                       │
└─────────────────────────────────────────────────────────────────┘

VIOLATION EXAMPLE:
──────────────────
Table: StudentHobbyPhone(StudentID, Hobby, Phone)

A student can have multiple hobbies AND multiple phones (independent)

┌───────────┬─────────┬───────┐
│ StudentID │ Hobby   │ Phone │
├───────────┼─────────┼───────┤
│ 1         │ Chess   │ 123   │
│ 1         │ Chess   │ 456   │
│ 1         │ Music   │ 123   │  ← Every combination
│ 1         │ Music   │ 456   │    must exist!
└───────────┴─────────┴───────┘

MVDs:
  StudentID →→ Hobby    (Student's hobbies independent of phones)
  StudentID →→ Phone    (Student's phones independent of hobbies)

AFTER 4NF:
──────────
StudentHobby(StudentID, Hobby)
StudentPhone(StudentID, Phone)
```

---

### Summary Table - Normal Forms

```
┌──────┬───────────────────────────────────────────────────────────┐
│  NF  │ Requirement                                               │
├──────┼───────────────────────────────────────────────────────────┤
│ 1NF  │ Atomic values only (no multi-valued attributes)          │
├──────┼───────────────────────────────────────────────────────────┤
│ 2NF  │ 1NF + No partial dependency                              │
│      │ (Non-prime fully depends on candidate key)               │
├──────┼───────────────────────────────────────────────────────────┤
│ 3NF  │ 2NF + No transitive dependency                           │
│      │ (X→A: X is superkey OR A is prime)                       │
├──────┼───────────────────────────────────────────────────────────┤
│ BCNF │ For every X→A: X must be superkey                        │
│      │ (Stricter than 3NF, may lose FDs)                        │
├──────┼───────────────────────────────────────────────────────────┤
│ 4NF  │ BCNF + No multi-valued dependencies                      │
├──────┼───────────────────────────────────────────────────────────┤
│ 5NF  │ 4NF + No join dependencies                               │
│      │ (Cannot decompose further without loss)                  │
└──────┴───────────────────────────────────────────────────────────┘
```

---

### Quick Tricks for Placements

```
┌─────────────────────────────────────────────────────────────────┐
│                    FINDING CANDIDATE KEYS                       │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. Find attributes that appear ONLY on LEFT side of FDs       │
│     → Must be part of every candidate key                       │
│                                                                 │
│  2. Find attributes that appear ONLY on RIGHT side             │
│     → Never part of any candidate key                          │
│                                                                 │
│  3. Find attributes that appear on NEITHER side                │
│     → Must be part of every candidate key                       │
│                                                                 │
│  4. Compute closure of (Left-only ∪ Neither) attributes        │
│     → If closure = all attrs, that's a candidate key           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘

EXAMPLE:
─────────
R(A, B, C, D, E), FDs: A→B, BC→D, D→E

Left only:  A, C (C appears left in BC→D)
Right only: E
Neither:    None

Try {A,C}:
  {A,C}⁺ = {A,C} → add B (A→B) → {A,B,C}
        → add D (BC→D) → {A,B,C,D}
        → add E (D→E) → {A,B,C,D,E} = All!

∴ {A,C} is candidate key
```

---

### Common Interview Questions

```
Q1: Difference between BCNF and 3NF?
A1: BCNF requires every determinant to be superkey.
    3NF allows exception if RHS is prime attribute.

Q2: Which normal form guarantees no redundancy?
A2: BCNF (mostly), though 4NF handles MVD redundancy.

Q3: Can we always achieve BCNF?
A3: Yes, but we may lose some functional dependencies.

Q4: When is 2NF automatically satisfied?
A4: When candidate key is a single attribute.

Q5: What's the minimum normal form every table should have?
A5: 3NF is generally considered practical minimum.
```

---

Need me to add more topics like **Transactions, ACID, Concurrency Control, Indexing**, etc.?
