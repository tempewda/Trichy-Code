### 1. **Create Tables**
```sql
-- Create DEPT table
CREATE TABLE trdept (
    deptno NUMBER PRIMARY KEY,
    dname VARCHAR2(50),
    loc VARCHAR2(50)
);

-- Create EMP table
CREATE TABLE tremp (
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(50),
    job VARCHAR2(50),
    sal NUMBER,
    deptno NUMBER,
    CONSTRAINT trfk_deptno FOREIGN KEY (deptno) REFERENCES trdept(deptno)
);

-- Create LOG table
CREATE TABLE trlog (
    log_id NUMBER PRIMARY KEY,
    message VARCHAR2(200),
    log_time TIMESTAMP
);

-- Create SALARY_LOG table
CREATE TABLE trsalary_log (
    log_id NUMBER PRIMARY KEY,
    empno NUMBER,
    old_salary NUMBER,
    new_salary NUMBER,
    change_time TIMESTAMP
);
```

---

### 2. **Create Sequences for Auto-Incrementing Primary Keys**
```sql
-- Sequence for LOG table
CREATE SEQUENCE trlog_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

-- Sequence for SALARY_LOG table
CREATE SEQUENCE trsalary_log_seq
START WITH 1
INCREMENT BY 1
NOCACHE;
```

---

### 3. **Triggers for Auto-Incrementing Primary Keys**

#### Trigger for LOG Table
```sql
CREATE OR REPLACE TRIGGER trtrg_log_id
BEFORE INSERT ON trlog
FOR EACH ROW
BEGIN
    IF :NEW.log_id IS NULL THEN
        SELECT log_seq.NEXTVAL INTO :NEW.log_id FROM dual;
    END IF;
END;
/
```

#### Trigger for SALARY_LOG Table
```sql
CREATE OR REPLACE TRIGGER trtrg_salary_log_id
BEFORE INSERT ON trsalary_log
FOR EACH ROW
BEGIN
    IF :NEW.log_id IS NULL THEN
        SELECT salary_log_seq.NEXTVAL INTO :NEW.log_id FROM dual;
    END IF;
END;
/
```

---

### 4. **Trigger to Prevent Duplicate or NULL Values in DEPTNO Column**
```sql
CREATE OR REPLACE TRIGGER trtrg_deptno_check
BEFORE INSERT OR UPDATE ON trdept
FOR EACH ROW
BEGIN
    -- Check for NULL values
    IF :NEW.deptno IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'DEPTNO cannot be NULL');
    END IF;

    -- Check for duplicate values
    IF INSERTING THEN
        FOR rec IN (SELECT deptno FROM trdept WHERE deptno = :NEW.deptno) LOOP
            RAISE_APPLICATION_ERROR(-20002, 'Duplicate DEPTNO not allowed');
        END LOOP;
    END IF;
END;
/
```

#### 1. **Test Case 1: Insert a Valid Record**
This should work without any errors.
```sql
BEGIN
    INSERT INTO trdept (deptno, dname, loc) VALUES (10, 'ACCOUNTING', 'NEW YORK');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Insert successful: DEPTNO = 10');
END;
/
```

#### 2. **Test Case 2: Insert a Record with NULL DEPTNO**
This should raise an error (`DEPTNO cannot be NULL`).
```sql
BEGIN
    INSERT INTO trdept (deptno, dname, loc) VALUES (NULL, 'SALES', 'CHICAGO');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
```

```
Error: ORA-20001: DEPTNO cannot be NULL
ORA-06512: at "SCOTT.TRTRG_DEPTNO_CHECK", line 4
ORA-04088: error during execution of trigger 'SCOTT.TRTRG_DEPTNO_CHECK'
```

#### 3. **Test Case 3: Insert a Duplicate DEPTNO**
This should raise an error (`Duplicate DEPTNO not allowed`).
```sql
BEGIN
    INSERT INTO trdept (deptno, dname, loc) VALUES (10, 'RESEARCH', 'DALLAS');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
```

```
Error: ORA-20002: Duplicate DEPTNO not allowed
ORA-06512: at "SCOTT.TRTRG_DEPTNO_CHECK", line 10
ORA-04088: error during execution of trigger 'SCOTT.TRTRG_DEPTNO_CHECK'
```

#### 4. **Test Case 4: Update a Record with a Valid DEPTNO**
This should work without any errors.
```sql
BEGIN
    -- Insert a new record first
    INSERT INTO trdept (deptno, dname, loc) VALUES (20, 'SALES', 'CHICAGO');
    COMMIT;
END;
/
```

---

### 5. **Trigger to Delete Records from EMP Table When DEPTNO is Deleted from DEPT Table**
```sql
CREATE OR REPLACE TRIGGER trtrg_delete_deptno
AFTER DELETE ON trdept
FOR EACH ROW
BEGIN
    DELETE FROM tremp WHERE deptno = :OLD.deptno;
END;
/
```

Steps to Test the Trigger
1. Populate the tremp Table
Insert some sample data into the tremp table:

```sql
-- Insert employees for DEPTNO = 10
INSERT INTO tremp (empno, ename, job, sal, deptno) VALUES (101, 'John Doe', 'Manager', 50000, 10);
INSERT INTO tremp (empno, ename, job, sal, deptno) VALUES (102, 'Jane Smith', 'Analyst', 40000, 10);

-- Insert employees for DEPTNO = 20
INSERT INTO tremp (empno, ename, job, sal, deptno) VALUES (201, 'Alice Brown', 'Sales Rep', 30000, 20);
INSERT INTO tremp (empno, ename, job, sal, deptno) VALUES (202, 'Bob Johnson', 'Clerk', 25000, 20);

-- Insert employees for DEPTNO = 40
INSERT INTO tremp (empno, ename, job, sal, deptno) VALUES (401, 'Charlie Davis', 'Engineer', 45000, 40);
INSERT INTO tremp (empno, ename, job, sal, deptno) VALUES (402, 'Diana Evans', 'Technician', 35000, 40);

COMMIT;
```

2. Verify the Data
Check the contents of the tremp table:

```sql
SELECT * FROM tremp;
```
Expected Output:

```
EMPNO  ENAME        JOB         SAL     DEPTNO
-----  -----------  ----------  ------  ------
101    John Doe     Manager     50000   10
102    Jane Smith   Analyst     40000   10
201    Alice Brown  Sales Rep   30000   20
202    Bob Johnson  Clerk       25000   20
401    Charlie Davis Engineer   45000   40
402    Diana Evans  Technician  35000   40
```

Test Cases for trtrg_delete_deptno Trigger
Test Case 1: Delete a Department with Employees
Delete a department (e.g., DEPTNO = 10) and verify that all employees in that department are also deleted.

```sql
-- Delete DEPTNO = 10 from trdept
BEGIN
    DELETE FROM trdept WHERE deptno = 10;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Department 10 deleted successfully.');
END;
/
```
Verification:

Check the trdept table:

```sql
SELECT * FROM trdept;
```

```
DEPTNO  DNAME       LOC
------  ----------  --------
20     SALES       CHICAGO
40     OPERATIONS  BOSTON
Check the tremp table:
```

```sql
SELECT * FROM tremp;
```

```
EMPNO  ENAME        JOB         SAL     DEPTNO
-----  -----------  ----------  ------  ------
201    Alice Brown  Sales Rep   30000   20
202    Bob Johnson  Clerk       25000   20
401    Charlie Davis Engineer   45000   40
402    Diana Evans  Technician  35000   40
```

---

### 6. **Trigger to Log Deleted Records from EMP Table**
```sql
CREATE OR REPLACE TRIGGER trtrg_log_deleted_emp
AFTER DELETE ON tremp
FOR EACH ROW
BEGIN
    INSERT INTO trlog (log_id, message, log_time)
    VALUES (log_seq.NEXTVAL, 'Record deleted from EMP table: EMPNO = ' || :OLD.empno, SYSTIMESTAMP);
END;
/
```

Test Case 1: Delete a Single Employee
Delete an employee (e.g., EMPNO = 201) and verify that a log entry is created in the trlog table.

```sql
-- Delete EMPNO = 201 from tremp
BEGIN
    DELETE FROM tremp WHERE empno = 201;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employee 201 deleted successfully.');
END;
/
```
Verification:

Check the tremp table:

sql
Copy
SELECT * FROM tremp;
Expected Output:

Copy
EMPNO  ENAME        JOB         SAL     DEPTNO
-----  -----------  ----------  ------  ------
202    Bob Johnson  Clerk       25000   20
401    Charlie Davis Engineer   45000   40
402    Diana Evans  Technician  35000   40
Check the trlog table:

sql
Copy
SELECT * FROM trlog;
Expected Output:

Copy
LOG_ID  MESSAGE                                      LOG_TIME
------  ------------------------------------------  -------------------
1       Record deleted from EMP table: EMPNO = 201   2023-10-25 12:34:56

---

### 7. **Trigger to Log Changes to EMP Table**
```sql
CREATE OR REPLACE TRIGGER trtrg_log_emp_changes
BEFORE INSERT OR UPDATE OR DELETE ON tremp
BEGIN
    INSERT INTO trlog (log_id, message, log_time)
    VALUES (log_seq.NEXTVAL, 'Employees table being changed', SYSTIMESTAMP);
END;
/
```

Test Case 1: Insert a Record into tremp
Insert a new employee into the tremp table and verify that a log entry is created in the trlog table.

sql
Copy
-- Insert a new employee
BEGIN
    INSERT INTO tremp (empno, ename, job, sal, deptno) VALUES (101, 'John Doe', 'Manager', 50000, 20);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employee 101 inserted successfully.');
END;
/
Verification:

Check the tremp table:

sql
Copy
SELECT * FROM tremp;
Expected Output:

Copy
EMPNO  ENAME      JOB       SAL     DEPTNO
-----  ---------  --------  ------  ------
101    John Doe   Manager   50000   10
Check the trlog table:

sql
Copy
SELECT * FROM trlog;
Expected Output:

Copy
LOG_ID  MESSAGE                          LOG_TIME
------  ------------------------------  -------------------
1       Employees table being changed    2023-10-25 12:34:56
Test Case 2: Update a Record in tremp
Update an existing employee's salary and verify that a log entry is created in the trlog table.

sql
Copy
-- Update employee 101's salary
BEGIN
    UPDATE tremp SET sal = 55000 WHERE empno = 101;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employee 101 updated successfully.');
END;
/
Verification:

Check the tremp table:

sql
Copy
SELECT * FROM tremp;
Expected Output:

Copy
EMPNO  ENAME      JOB       SAL     DEPTNO
-----  ---------  --------  ------  ------
101    John Doe   Manager   55000   10
Check the trlog table:

sql
Copy
SELECT * FROM trlog;
Expected Output:

Copy
LOG_ID  MESSAGE                          LOG_TIME
------  ------------------------------  -------------------
1       Employees table being changed    2023-10-25 12:34:56
2       Employees table being changed    2023-10-25 12:35:10

---

### 8. **Trigger to Log Salary Updates in EMP Table**
```sql
CREATE OR REPLACE TRIGGER trtrg_log_salary_changes
BEFORE UPDATE ON tremp
FOR EACH ROW
WHEN (OLD.sal <> NEW.sal)
BEGIN
    INSERT INTO trsalary_log (log_id, empno, old_salary, new_salary, change_time)
    VALUES (salary_log_seq.NEXTVAL, :OLD.empno, :OLD.sal, :NEW.sal, SYSTIMESTAMP);
END;
/
```

3. Test the Trigger
Update the salary of the employee and verify that a log entry is created in the trsalary_log table.

sql
Copy
-- Update employee 101's salary
BEGIN
    UPDATE tremp SET sal = 45000 WHERE empno = 101;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employee 101 salary updated successfully.');
END;
/
4. Verify the Log Entry
Check the trsalary_log table to ensure the salary change was logged:

sql
Copy
SELECT * FROM trsalary_log;
Expected Output:

Copy
LOG_ID  EMPNO  OLD_SALARY  NEW_SALARY  CHANGE_TIME
------  -----  ----------  ----------  -------------------
1       101    50000       55000       2023-10-25 12:34:56


---

### 9. **Trigger to Log Salary Revisions for Employees with Salary > 20000**
```sql
CREATE OR REPLACE TRIGGER trtrg_log_high_salary_changes
BEFORE UPDATE ON tremp
FOR EACH ROW
WHEN (OLD.sal > 20000 AND OLD.sal <> NEW.sal)
BEGIN
    INSERT INTO trlog (log_id, message, log_time)
    VALUES (log_seq.NEXTVAL, 'Salary revised for EMPNO = ' || :OLD.empno || ' from ' || :OLD.sal || ' to ' || :NEW.sal, SYSTIMESTAMP);
END;
/
```

Test Case 1: Update Salary for Employee with Salary > 20000
Update the salary of an employee with a salary greater than 20000 and verify that a log entry is created.

sql
Copy
-- Update employee 101's salary
BEGIN
    UPDATE tremp SET sal = 35000 WHERE empno = 101;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Employee 101 salary updated successfully.');
END;
/
