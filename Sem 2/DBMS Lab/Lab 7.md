
### **Table Creation**
```sql
CREATE TABLE emp100 (
    empno NUMBER PRIMARY KEY,  -- Employee number (unique identifier)
    ename VARCHAR2(50),        -- Employee name
    job VARCHAR2(50),          -- Job role
    sal NUMBER,                -- Salary
    deptno NUMBER              -- Department number
);

-- Insert sample data
INSERT INTO emp100 (empno, ename, job, sal, deptno) VALUES (1, 'John', 'Manager', 6000, 10);
INSERT INTO emp100 (empno, ename, job, sal, deptno) VALUES (2, 'Alice', 'Developer', 4500, 20);
INSERT INTO emp100 (empno, ename, job, sal, deptno) VALUES (3, 'Bob', 'Analyst', 5500, 20);
INSERT INTO emp100 (empno, ename, job, sal, deptno) VALUES (4, 'Charlie', 'Tester', 4000, 30);
INSERT INTO emp100 (empno, ename, job, sal, deptno) VALUES (5, 'David', 'Designer', 7000, 30);

SELECT * FROM emp100;
```

### **Program 1**
Write a procedure to add an amount of Rs.1000 for the employees whose salaries is greater than 5000  and who belongs to the deptno passed as an argument .

```sql
CREATE OR REPLACE PROCEDURE increase_salary_for_dept(p_deptno IN NUMBER) IS
BEGIN
    UPDATE emp100
    SET sal = sal + 1000
    WHERE deptno = p_deptno AND sal > 5000;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salary updated for employees in department ' || p_deptno);
END;
/

BEGIN
    increase_salary_for_dept(20);
END;
/

SELECT * FROM emp100;
```
### **Output**
```bash
     EMPNO ENAME                                              JOB                                                       SAL     DEPTNO
---------- -------------------------------------------------- -------------------------------------------------- ---------- ----------
         1 John                                               Manager                                                  6000         10
         2 Alice                                              Developer                                                4500         20
         3 Bob                                                Analyst                                                  7500         20
         4 Charlie                                            Tester                                                   4000         30
         5 David                                              Designer                                                 7000         30
```

### **Program 7.2** Write a PL/SQL block to update the salary of the employee with a 10% increase whose empno is to be passed as an argument for the procedure.

```sql
CREATE OR REPLACE PROCEDURE increase_salary(empno_in IN NUMBER) IS
BEGIN
    UPDATE emp100
    SET sal = sal * 1.10
    WHERE empno = empno_in;
    
    DBMS_OUTPUT.PUT_LINE('Salary increased by 10% for employee ' || empno_in);
END;
/

BEGIN
    increase_salary(2);
END;
/

SELECT * FROM emp100;
```

```bash
     EMPNO ENAME                                              JOB                                                       SAL     DEPTNO
---------- -------------------------------------------------- -------------------------------------------------- ---------- ----------
         1 John                                               Manager                                                  6000         10
         2 Alice                                              Developer                                                4500         20
         3 Bob                                                Analyst                                                  8250         20
         4 Charlie                                            Tester                                                   4000         30
         5 David                                              Designer                                                 7000         30
```

### **Program 7.3: Write a function to find the salary of the employee who is working in the deptno 20(to be passed as an argument).**

### **Code**
```sql
CREATE OR REPLACE FUNCTION get_salary_by_dept(deptno_in IN NUMBER) RETURN NUMBER IS
    v_salary NUMBER;
BEGIN
    SELECT sal INTO v_salary
    FROM emp100
    WHERE deptno = deptno_in
    AND ROWNUM = 1; -- Assuming you want the salary of the first employee in the department
    
    RETURN v_salary;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

SELECT get_salary_by_dept(20) FROM dual;
```

```bash
Salary of the first employee working in dept no 20: 4500

PL/SQL procedure successfully completed.
```

### **Program 7.4: Write a function to find the nature of job of the employee whose deptno is 20(to be passed as an argument)**


### **Code**
```sql
CREATE OR REPLACE FUNCTION get_job_by_dept(deptno_in IN NUMBER) RETURN VARCHAR2 IS
    v_job VARCHAR2(50);
BEGIN
    SELECT job INTO v_job
    FROM emp100
    WHERE deptno = deptno_in
    AND ROWNUM = 1; -- Assuming you want the job of the first employee in the department
    
    RETURN v_job;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

SELECT get_job_by_dept(10) FROM dual;
```

### **Program 5**
Write a PL/SQL block to obtain the department name of the employee who works for deptno 30.

### **Code**
```sql

CREATE TABLE dept100 (
    deptno NUMBER PRIMARY KEY,
    dname VARCHAR2(50) NOT NULL
);


INSERT INTO dept100 (deptno, dname) VALUES (10, 'Accounting');
INSERT INTO dept100 (deptno, dname) VALUES (20, 'HR');
INSERT INTO dept100 (deptno, dname) VALUES (30, 'Sales');
INSERT INTO dept100 (deptno, dname) VALUES (40, 'Marketing');

DECLARE
    v_dept_name VARCHAR2(50);
BEGIN
    SELECT dname INTO v_dept_name
    FROM dept100
    WHERE deptno = 30;
    
    DBMS_OUTPUT.PUT_LINE('Department name for deptno 30 is: ' || v_dept_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department not found');
END;
/
```
