### **Program 6.1: Swap Two Numbers Without a Third Variable**
```sql
DECLARE
  a NUMBER := 10;
  b NUMBER := 20;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Before Swap: a = ' || a || ', b = ' || b);
  a := a + b; -- a becomes 30
  b := a - b; -- b becomes 10 (30 - 20)
  a := a - b; -- a becomes 20 (30 - 10)
  DBMS_OUTPUT.PUT_LINE('After Swap: a = ' || a || ', b = ' || b);
END;
```

### **Output**
```bash
Statement processed.
Before Swap: a = 10, b = 20
After Swap: a = 20, b = 10
```

---

### **Program 6.2: Swap Two Numbers Using a Third Variable**
```sql
DECLARE
  a NUMBER := 10;
  b NUMBER := 20;
  temp NUMBER;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Before Swap: a = ' || a || ', b = ' || b);
  temp := a;
  a := b;
  b := temp;
  DBMS_OUTPUT.PUT_LINE('After Swap: a = ' || a || ', b = ' || b);
END;
```

### **Output**
```bash
Statement processed.
Before Swap: a = 10, b = 20
After Swap: a = 20, b = 10
```

---

### **Program 6.3: Find the Largest of Two Numbers**
```sql
DECLARE
  num1 NUMBER := 15;
  num2 NUMBER := 25;
  result NUMBER;
BEGIN
	DBMS_OUTPUT.PUT_LINE('num1 = ' || num1 || ', num2 = ' || num2);
  IF num1 > num2 THEN
    result := num1;
  ELSE
    result := num2;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Largest Number: ' || result);
END;
```

### **Output**
```bash
Statement processed.
num1 = 15, num2 = 25
Largest Number: 25
```
---

### **Program 6.4: Total, Average, and Grade of 6 Subjects**
```sql
DECLARE
  s1 NUMBER := 85;
  s2 NUMBER := 90;
  s3 NUMBER := 78;
  s4 NUMBER := 92;
  s5 NUMBER := 88;
  s6 NUMBER := 95;
  total NUMBER;
  average NUMBER;
  grade VARCHAR2(2);
BEGIN
  total := s1 + s2 + s3 + s4 + s5 + s6;
  average := total / 6;
  
  -- Determine Grade
  CASE
    WHEN average >= 90 THEN grade := 'A';
    WHEN average >= 80 THEN grade := 'B';
    WHEN average >= 70 THEN grade := 'C';
    WHEN average >= 60 THEN grade := 'D';
    ELSE grade := 'F';
  END CASE;
  
  DBMS_OUTPUT.PUT_LINE('Total: ' || total || ', Average: ' || average || ', Grade: ' || grade);
END;
```

### **Output**
```bash
Statement processed.
Total: 528, Average: 88, Grade: B
```
---

### **Program 6.5: Sum of Digits in a Number**
```sql
DECLARE
  num NUMBER := 12345;
  sum_digits NUMBER := 0;
  temp NUMBER;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Number: ' || num);
  temp := num;
  WHILE temp > 0 LOOP
    sum_digits := sum_digits + MOD(temp, 10); -- Add last digit
    temp := TRUNC(temp / 10); -- Remove last digit
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Sum of Digits: ' || sum_digits);
END;
```

### **Output**
```bash
Statement processed.
Number: 12345
Sum of Digits: 15
```
---

### **Program 6.6: Reverse a Number**
```sql
DECLARE
  num NUMBER := 1234;
  reversed_num NUMBER := 0;
  temp NUMBER;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Original Number: ' || num);
  temp := num;
  WHILE temp > 0 LOOP
    reversed_num := reversed_num * 10 + MOD(temp, 10);
    temp := TRUNC(temp / 10);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Reversed Number: ' || reversed_num);
END;
```

### **Output**
```bash
Statement processed.
Original Number: 1234
Reversed Number: 4321
```

---

### **Program 6.7: Check Prime Number**
```sql
DECLARE
  num NUMBER := 17;
  is_prime BOOLEAN := TRUE;
BEGIN
  IF num <= 1 THEN
    is_prime := FALSE;
  ELSE
    FOR i IN 2..TRUNC(SQRT(num)) LOOP
      IF MOD(num, i) = 0 THEN
        is_prime := FALSE;
        EXIT;
      END IF;
    END LOOP;
  END IF;
  
  IF is_prime THEN
    DBMS_OUTPUT.PUT_LINE(num || ' is Prime');
  ELSE
    DBMS_OUTPUT.PUT_LINE(num || ' is Not Prime');
  END IF;
END;
```

### **Output**
```bash
Statement processed.
17 is Prime
```

---

### **Program 6.8: Factorial of a Number**
```sql
DECLARE
  num NUMBER := 5;
  factorial NUMBER := 1;
BEGIN
  FOR i IN 1..num LOOP
    factorial := factorial * i;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ': ' || factorial);
END;
```

### **Output**
```bash
Statement processed.
Factorial of 5: 120
```

---

### **Program 6.9: Area of Circle (Store in Table)**
**Step 1: Create Table**
```sql
CREATE TABLE areas (
  radius NUMBER,
  area NUMBER
);
```

**Step 2: PL/SQL Block**
```sql
DECLARE
  pi CONSTANT NUMBER := 3.14;
BEGIN
  FOR r IN 3..7 LOOP
    INSERT INTO areas (radius, area) VALUES (r, pi * r * r);
  END LOOP;
  COMMIT;
END;
```

**Step 3: Display Table**
```sql
SELECT *
FROM areas;
```

### **Output**
| RADIUS | AREA |
| ---  | --- |
| 3 | 28.26 |
| 4 | 50.24 |
| 5 | 78.5 |
| 6 | 113.04 |
| 7 | 153.86 |
---

### **Program 6.10: Deduct Rs. 100 if Balance < Minimum**
**Assumption**: `acct` table has columns `account_no`, `balance`, and `min_balance`.
```sql
DECLARE
  v_account_no acct.account_no%TYPE := &account_no; -- User input
  v_balance acct.balance%TYPE;
  v_min_balance acct.min_balance%TYPE;
BEGIN
  SELECT balance, min_balance INTO v_balance, v_min_balance
  FROM acct
  WHERE account_no = v_account_no;

  IF v_balance < v_min_balance THEN
    UPDATE acct
    SET balance = balance - 100
    WHERE account_no = v_account_no;
    DBMS_OUTPUT.PUT_LINE('Rs. 100 Deducted.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('No Deduction.');
  END IF;
END;
```