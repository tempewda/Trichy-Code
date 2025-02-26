### **Program 6.1: Swap Two Numbers Without a Third Variable**
```sql
DECLARE
  a NUMBER := 10;
  b NUMBER := 20;
BEGIN
  a := a + b; -- a becomes 30
  b := a - b; -- b becomes 10 (30 - 20)
  a := a - b; -- a becomes 20 (30 - 10)
  DBMS_OUTPUT.PUT_LINE('After Swap: a = ' || a || ', b = ' || b);
END;
/
```

---

### **Program 6.2: Swap Two Numbers Using a Third Variable**
```sql
DECLARE
  a NUMBER := 10;
  b NUMBER := 20;
  temp NUMBER;
BEGIN
  temp := a;
  a := b;
  b := temp;
  DBMS_OUTPUT.PUT_LINE('After Swap: a = ' || a || ', b = ' || b);
END;
/
```

---

### **Program 6.3: Find the Largest of Two Numbers**
```sql
DECLARE
  num1 NUMBER := 15;
  num2 NUMBER := 25;
  result NUMBER;
BEGIN
  IF num1 > num2 THEN
    result := num1;
  ELSE
    result := num2;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Largest Number: ' || result);
END;
/
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
/
```

---

### **Program 6.5: Sum of Digits in a Number**
```sql
DECLARE
  num NUMBER := 12345;
  sum_digits NUMBER := 0;
  temp NUMBER;
BEGIN
  temp := num;
  WHILE temp > 0 LOOP
    sum_digits := sum_digits + MOD(temp, 10); -- Add last digit
    temp := TRUNC(temp / 10); -- Remove last digit
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Sum of Digits: ' || sum_digits);
END;
/
```

---

### **Program 6.6: Reverse a Number**
```sql
DECLARE
  num NUMBER := 1234;
  reversed_num NUMBER := 0;
  temp NUMBER;
BEGIN
  temp := num;
  WHILE temp > 0 LOOP
    reversed_num := reversed_num * 10 + MOD(temp, 10);
    temp := TRUNC(temp / 10);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Reversed Number: ' || reversed_num);
END;
/
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
/
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
/
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
/
```

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
/
```