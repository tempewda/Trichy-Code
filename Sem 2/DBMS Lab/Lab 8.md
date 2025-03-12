### 1. **Create Tables**
```sql
-- Create DEPT table
CREATE TABLE dept (
    deptno NUMBER PRIMARY KEY,
    dname VARCHAR2(50),
    loc VARCHAR2(50)
);

-- Create EMP table
CREATE TABLE emp (
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(50),
    job VARCHAR2(50),
    sal NUMBER,
    deptno NUMBER,
    CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

-- Create LOG table
CREATE TABLE log (
    log_id NUMBER PRIMARY KEY,
    message VARCHAR2(200),
    log_time TIMESTAMP
);

-- Create SALARY_LOG table
CREATE TABLE salary_log (
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
CREATE SEQUENCE log_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

-- Sequence for SALARY_LOG table
CREATE SEQUENCE salary_log_seq
START WITH 1
INCREMENT BY 1
NOCACHE;
```

---

### 3. **Triggers for Auto-Incrementing Primary Keys**

#### Trigger for LOG Table
```sql
CREATE OR REPLACE TRIGGER trg_log_id
BEFORE INSERT ON log
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
CREATE OR REPLACE TRIGGER trg_salary_log_id
BEFORE INSERT ON salary_log
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
CREATE OR REPLACE TRIGGER trg_deptno_check
BEFORE INSERT OR UPDATE ON dept
FOR EACH ROW
BEGIN
    -- Check for NULL values
    IF :NEW.deptno IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'DEPTNO cannot be NULL');
    END IF;

    -- Check for duplicate values
    IF INSERTING THEN
        FOR rec IN (SELECT deptno FROM dept WHERE deptno = :NEW.deptno) LOOP
            RAISE_APPLICATION_ERROR(-20002, 'Duplicate DEPTNO not allowed');
        END LOOP;
    END IF;
END;
/
```

---

### 5. **Trigger to Delete Records from EMP Table When DEPTNO is Deleted from DEPT Table**
```sql
CREATE OR REPLACE TRIGGER trg_delete_deptno
AFTER DELETE ON dept
FOR EACH ROW
BEGIN
    DELETE FROM emp WHERE deptno = :OLD.deptno;
END;
/
```

---

### 6. **Trigger to Log Deleted Records from EMP Table**
```sql
CREATE OR REPLACE TRIGGER trg_log_deleted_emp
AFTER DELETE ON emp
FOR EACH ROW
BEGIN
    INSERT INTO log (log_id, message, log_time)
    VALUES (log_seq.NEXTVAL, 'Record deleted from EMP table: EMPNO = ' || :OLD.empno, SYSTIMESTAMP);
END;
/
```

---

### 7. **Trigger to Log Changes to EMP Table**
```sql
CREATE OR REPLACE TRIGGER trg_log_emp_changes
BEFORE INSERT OR UPDATE OR DELETE ON emp
BEGIN
    INSERT INTO log (log_id, message, log_time)
    VALUES (log_seq.NEXTVAL, 'Employees table being changed', SYSTIMESTAMP);
END;
/
```

---

### 8. **Trigger to Log Salary Updates in EMP Table**
```sql
CREATE OR REPLACE TRIGGER trg_log_salary_changes
BEFORE UPDATE ON emp
FOR EACH ROW
WHEN (OLD.sal <> NEW.sal)
BEGIN
    INSERT INTO salary_log (log_id, empno, old_salary, new_salary, change_time)
    VALUES (salary_log_seq.NEXTVAL, :OLD.empno, :OLD.sal, :NEW.sal, SYSTIMESTAMP);
END;
/
```

---

### 9. **Trigger to Log Salary Revisions for Employees with Salary > 20000**
```sql
CREATE OR REPLACE TRIGGER trg_log_high_salary_changes
BEFORE UPDATE ON emp
FOR EACH ROW
WHEN (OLD.sal > 20000 AND OLD.sal <> NEW.sal)
BEGIN
    INSERT INTO log (log_id, message, log_time)
    VALUES (log_seq.NEXTVAL, 'Salary revised for EMPNO = ' || :OLD.empno || ' from ' || :OLD.sal || ' to ' || :NEW.sal, SYSTIMESTAMP);
END;
/
```