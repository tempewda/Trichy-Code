``` SQL
CREATE TABLE TR_DEPT (
    DEPTNO NUMBER PRIMARY KEY,
    DNAME VARCHAR2(50),
    LOC VARCHAR2(50)
);


INSERT INTO TR_DEPT (DEPTNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO TR_DEPT (DEPTNO, DNAME, LOC) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO TR_DEPT (DEPTNO, DNAME, LOC) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO TR_DEPT (DEPTNO, DNAME, LOC) VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE TR_EMP (
    EMPNO NUMBER PRIMARY KEY,
    ENAME VARCHAR2(50),
    JOB VARCHAR2(50),
    HIREDATE DATE,
    MGR NUMBER,
    SAL NUMBER(10,2),
    COMM NUMBER(10,2),
    DEPTNO NUMBER
);

INSERT INTO TR_EMP VALUES (7369, 'SMITH', 'CLERK', TO_DATE('17-DEC-80', 'DD-MON-YY'), 7902, 800, NULL, 20);
INSERT INTO TR_EMP VALUES (7499, 'ALLEN', 'SALESMAN', TO_DATE('20-FEB-81', 'DD-MON-YY'), 7698, 1600, 300, 30);
INSERT INTO TR_EMP VALUES (7521, 'WARD', 'SALESMAN', TO_DATE('22-FEB-81', 'DD-MON-YY'), 7698, 1250, 500, 30);
INSERT INTO TR_EMP VALUES (7566, 'JONES', 'MANAGER', TO_DATE('02-APR-81', 'DD-MON-YY'), 7839, 2975, NULL, 20);
INSERT INTO TR_EMP VALUES (7654, 'MARTIN', 'SALESMAN', TO_DATE('28-SEP-81', 'DD-MON-YY'), 7698, 1250, 1400, 30);
INSERT INTO TR_EMP VALUES (7698, 'BLAKE', 'MANAGER', TO_DATE('01-MAY-81', 'DD-MON-YY'), 7839, 2850, NULL, 30);
INSERT INTO TR_EMP VALUES (7782, 'CLARK', 'MANAGER', TO_DATE('09-JUN-81', 'DD-MON-YY'), 7839, 2450, NULL, 10);
INSERT INTO TR_EMP VALUES (7788, 'SCOTT', 'ANALYST', TO_DATE('19-APR-87', 'DD-MON-YY'), 7566, 3000, NULL, 20);
INSERT INTO TR_EMP VALUES (7839, 'KING', 'PRESIDENT', TO_DATE('17-NOV-81', 'DD-MON-YY'), NULL, 5000, NULL, 10);
INSERT INTO TR_EMP VALUES (7844, 'TURNER', 'SALESMAN', TO_DATE('08-SEP-81', 'DD-MON-YY'), 7698, 1500, 0, 30);
INSERT INTO TR_EMP VALUES (7876, 'ADAMS', 'CLERK', TO_DATE('23-MAY-87', 'DD-MON-YY'), 7788, 1100, NULL, 20);
INSERT INTO TR_EMP VALUES (7900, 'JAMES', 'CLERK', TO_DATE('03-DEC-81', 'DD-MON-YY'), 7698, 950, NULL, 30);
INSERT INTO TR_EMP VALUES (7902, 'FORD', 'ANALYST', TO_DATE('03-DEC-81', 'DD-MON-YY'), 7566, 3000, NULL, 20);
INSERT INTO TR_EMP VALUES (7934, 'MILLER', 'CLERK', TO_DATE('23-JAN-82', 'DD-MON-YY'), 7782, 1300, NULL, 10);

```


## Problem 4.1:
Select all employees from ‘maintainance’ and ‘development’ dept.

### Query
``` sql
SELECT *
FROM TR_EMP
WHERE DEPTNO IN
(SELECT DEPTNO FROM TR_DEPT WHERE
DNAME = 'MAINTAINANCE' OR
DNAME = 'DEVELOPMENT');
```

### Output
``` bash
```

## Problem 4.2: 
Display all employee names and salary whose salary is greater than minimum salary of the company and job title starts with ‘M’.

### Query
``` sql
SELECT ENAME, SAL
FROM TR_EMP
WHERE SAL > (SELECT MIN(SAL) FROM TR_EMP)
AND JOB LIKE 'M%';
```

### Output
``` bash
ENAME                       SAL
-------------------- ----------
JONES                      2975
BLAKE                      2850
CLARK                      2450
```


## Problem 4.3: 
Issue a query to find all the employees who work in the same job as jones.

### Query
``` SQL
SELECT *
FROM TR_EMP
WHERE JOB = (SELECT JOB FROM TR_EMP WHERE ENAME = 'JONES');
```

### Output
``` bash
     EMPNO ENAME                JOB                  HIREDATE         MGR        SAL       COMM     DEPTNO
---------- -------------------- -------------------- --------- ---------- ---------- ---------- ----------
      7566 JONES                MANAGER              02-APR-81       7839       2975                    20
      7698 BLAKE                MANAGER              01-MAY-81       7839       2850                    30
      7782 CLARK                MANAGER              09-JUN-81       7839       2450                    10
```


## Problem 4.4:
Issue a query to display information about employees who earn more than any employee in dept 30.

### Query
``` SQL
SELECT *
FROM TR_EMP
WHERE SAL > ALL (SELECT SAL FROM TR_EMP WHERE DEPTNO = 30);
```

### Output
``` bash
     EMPNO ENAME                JOB                  HIREDATE         MGR        SAL       COMM     DEPTNO
---------- -------------------- -------------------- --------- ---------- ---------- ---------- ----------
      7566 JONES                MANAGER              02-APR-81       7839       2975                    20
      7788 SCOTT                ANALYST              19-APR-87       7566       3000                    20
      7839 KING                 PRESIDENT            17-NOV-81                  5000                    10
      7902 FORD                 ANALYST              03-DEC-81       7566       3000                    20
```


## Problem 4.5:
Display the employees who have the same job as jones and whose salary >= fords.

### Query
``` SQL
SELECT *
FROM TR_EMP
WHERE JOB = (SELECT JOB FROM TR_EMP WHERE ENAME = 'JONES')
AND SAL >= (SELECT SAL FROM TR_EMP WHERE ENAME = 'FORD');
```

### Output
``` bash
no rows selected
```


## Problem 4.6:
Write a query to display the name and job of all employees in Management dept.

### Query
``` SQL
SELECT ENAME, JOB
FROM TR_EMP
WHERE DEPTNO = (SELECT DEPTNO FROM TR_DEPT WHERE DNAME = 'MANAGEMENT');
```

### Output
``` bash
```


## Problem 4.7: 
Issue a query to list all the employees who salary is > the average salary of their own dept.

### Query
``` SQL
SELECT *
FROM TR_EMP E
WHERE SAL > (
SELECT AVG(SAL)
FROM TR_EMP
WHERE DEPTNO = E.DEPTNO
);
```

### Output
``` bash
     EMPNO ENAME                JOB                  HIREDATE         MGR        SAL       COMM     DEPTNO
---------- -------------------- -------------------- --------- ---------- ---------- ---------- ----------
      7499 ALLEN                SALESMAN             20-FEB-81       7698       1600        300         30
      7566 JONES                MANAGER              02-APR-81       7839       2975                    20
      7698 BLAKE                MANAGER              01-MAY-81       7839       2850                    30
      7788 SCOTT                ANALYST              19-APR-87       7566       3000                    20
      7839 KING                 PRESIDENT            17-NOV-81                  5000                    10
      7902 FORD                 ANALYST              03-DEC-81       7566       3000                    20

6 rows selected.
```

## Problem 4.8:
Write a query that would display the empname, job, location and the name of their dept.

### Query
``` SQL
SELECT E.ENAME, E.JOB, D.LOC, D.DNAME
FROM TR_EMP E
JOIN TR_DEPT D
ON E.DEPTNO = D.DEPTNO;
```

### Output
``` bash
ENAME                JOB                  LOC                  DNAME
-------------------- -------------------- -------------------- --------------------
SMITH                CLERK                DALLAS               RESEARCH
ALLEN                SALESMAN             CHICAGO              SALES
WARD                 SALESMAN             CHICAGO              SALES
JONES                MANAGER              DALLAS               RESEARCH
MARTIN               SALESMAN             CHICAGO              SALES
BLAKE                MANAGER              CHICAGO              SALES
CLARK                MANAGER              NEW YORK             ACCOUNTING
SCOTT                ANALYST              DALLAS               RESEARCH
KING                 PRESIDENT            NEW YORK             ACCOUNTING
TURNER               SALESMAN             CHICAGO              SALES
ADAMS                CLERK                DALLAS               RESEARCH

ENAME                JOB                  LOC                  DNAME
-------------------- -------------------- -------------------- --------------------
JAMES                CLERK                CHICAGO              SALES
FORD                 ANALYST              DALLAS               RESEARCH
MILLER               CLERK                NEW YORK             ACCOUNTING

14 rows selected.
```


## Problem 4.9:
Write a query to list the employees having the same job as employees located in ‘ mainblock’. (use multiple subquery)

### Query
``` SQL
SELECT * 
FROM TR_EMP 
WHERE JOB IN (
    SELECT JOB 
    FROM TR_EMP 
    WHERE DEPTNO IN (
        SELECT DEPTNO 
        FROM TR_DEPT 
        WHERE LOC = 'Mainblock'
    )
);
```

### Output
``` bash
```


## Problem 4.10:
Write a query to list the employees in dept 10 with the same job as anyone in the development dept.

### Query
``` SQL
SELECT * 
FROM TR_EMP 
WHERE DEPTNO = 10 
  AND JOB IN (
    SELECT JOB 
    FROM TR_EMP 
    WHERE DEPTNO = (SELECT DEPTNO FROM TR_DEPT WHERE DNAME = 'DEVELOPMENT')
);
```

### Output
``` bash
```


## Problem 4.11:
Write a query to list the employees with the same job and salary as ‘ford’.

### Query
``` SQL
SELECT *
FROM TR_EMP
WHERE JOB = (SELECT JOB FROM TR_EMP WHERE ENAME = 'FORD')
AND SAL = (SELECT SAL FROM TR_EMP WHERE ENAME = 'FORD');
```

### Output
``` bash
     EMPNO ENAME                JOB                  HIREDATE         MGR        SAL       COMM     DEPTNO
---------- -------------------- -------------------- --------- ---------- ---------- ---------- ----------
      7788 SCOTT                ANALYST              19-APR-87       7566       3000                    20
      7902 FORD                 ANALYST              03-DEC-81       7566       3000                    20
```


## Problem 4.12:
Write a query to list all depts. with at least 2 salesman.

### Query
``` SQL
SELECT DEPTNO
FROM TR_EMP
WHERE JOB = 'SALESMAN'
GROUP BY DEPTNO
HAVING COUNT(*) >= 2;
```

### Output
``` bash
    DEPTNO
----------
        30
```


## Problem 4.13:
Write a query to list the employees in dept 20 with the same job as anyone in dept 30.

### Query
``` SQL
SELECT *
FROM TR_EMP
WHERE DEPTNO = 20
AND JOB IN (SELECT JOB FROM TR_EMP WHERE DEPTNO = 30);
```

### Output
``` bash
     EMPNO ENAME                JOB                  HIREDATE         MGR        SAL       COMM     DEPTNO
---------- -------------------- -------------------- --------- ---------- ---------- ---------- ----------
      7566 JONES                MANAGER              02-APR-81       7839       2975                    20
      7876 ADAMS                CLERK                23-MAY-87       7788       1100                    20
      7369 SMITH                CLERK                17-DEC-80       7902        800                    20
```


## Problem 4.14:
List out the employee names who get the salary greater than the maximum salaries of dept with dept no 20, 30

### Query
``` SQL
SELECT *
FROM TR_EMP
WHERE SAL > (
SELECT MAX(SAL)
FROM TR_EMP
WHERE DEPTNO IN (20, 30)
);
```

### Output
``` bash
     EMPNO ENAME                JOB                  HIREDATE         MGR        SAL       COMM     DEPTNO
---------- -------------------- -------------------- --------- ---------- ---------- ---------- ----------
      7839 KING                 PRESIDENT            17-NOV-81                  5000                    10
```


## Problem 4.15:
Display the maximum salaries of the departments whose maximum salary is greater than 9000.

### Query
``` SQL
SELECT DEPTNO, MAX(SAL) AS MAX_SALARY
FROM TR_EMP
GROUP BY DEPTNO
HAVING MAX(SAL) > 9000;
```

### Output
``` bash
no rows selected
```


## Problem 4.16:
Display the maximum salaries of the departments whose minimum salary is greater than 1000 and lesser than 5000.

### Query
``` SQL
SELECT DEPTNO, MAX(SAL) AS MAX_SALARY
FROM TR_EMP
GROUP BY DEPTNO
HAVING MIN(SAL) BETWEEN 1000 AND 5000;
```

### Output
``` bash
    DEPTNO MAX_SALARY
---------- ----------
        10       5000
```


### For exercises 4.17 and 4.18  Create one table named Accredit with columns deptno (foreign key of department table), Rank varchar(20)
## Problem 4.17: (EQUI-JOIN)
Display the department names that are accredited by the quality council.

### Query
``` SQL
CREATE TABLE TR_ACCREDIT (
    DEPTNO NUMBER(3) REFERENCES DEPT(DEPTNO), 
    RANK VARCHAR2(20)
);

-- Query
SELECT D.DNAME 
FROM TR_DEPT D 
JOIN TR_ACCREDIT A 
ON D.DEPTNO = A.DEPTNO;
```

### Output
``` bash
```


# Problem 4.18: (NON-EQUIJOIN)
Display the employees of departments which are not accredited by the quality council

### Query
``` SQL
SELECT E.* 
FROM TR_EMP E 
WHERE E.DEPTNO NOT IN (SELECT DEPTNO FROM TR_ACCREDIT);
```

### Output
``` bash
```


# Problem 4.19: (LEFTOUT-JOIN)
Display all	the employees and the departments	implementing a left outer join.

### Query
``` SQL
SELECT E.ENAME, D.DNAME
FROM TR_EMP E
LEFT JOIN TR_DEPT D
ON E.DEPTNO = D.DEPTNO;
```

### Output
``` bash
ENAME                DNAME
-------------------- --------------------
SMITH                RESEARCH
ALLEN                SALES
WARD                 SALES
JONES                RESEARCH
MARTIN               SALES
BLAKE                SALES
CLARK                ACCOUNTING
SCOTT                RESEARCH
KING                 ACCOUNTING
TURNER               SALES
ADAMS                RESEARCH

ENAME                DNAME
-------------------- --------------------
JAMES                SALES
FORD                 RESEARCH
MILLER               ACCOUNTING

14 rows selected.
```


# Problem 4.20: (RIGHTOUTER-JOIN)
Display the employee name and department name in which they are working implementing a right outer join.

### Query
``` SQL
SELECT E.ENAME, D.DNAME 
FROM TR_EMP E 
RIGHT JOIN TR_DEPT D 
ON E.DEPTNO = D.DEPTNO;
```

### Output
``` bash
ENAME                DNAME
-------------------- --------------------
CLARK                ACCOUNTING
KING                 ACCOUNTING
MILLER               ACCOUNTING
JONES                RESEARCH
FORD                 RESEARCH
ADAMS                RESEARCH
SMITH                RESEARCH
SCOTT                RESEARCH
WARD                 SALES
TURNER               SALES
ALLEN                SALES

ENAME                DNAME
-------------------- --------------------
JAMES                SALES
BLAKE                SALES
MARTIN               SALES
                     OPERATIONS

15 rows selected.
```


# Problem 4.21: (FULLOUTER-JOIN)
Display the employee name and department name in which they are working implementing a full outer join.

### Query
``` SQL
SELECT E.ENAME, D.DNAME 
FROM TR_EMP E 
FULL OUTER JOIN TR_DEPT D 
ON E.DEPTNO = D.DEPTNO;
```

### Output
``` bash
ENAME                DNAME
-------------------- --------------------
SMITH                RESEARCH
ALLEN                SALES
WARD                 SALES
JONES                RESEARCH
MARTIN               SALES
BLAKE                SALES
CLARK                ACCOUNTING
SCOTT                RESEARCH
KING                 ACCOUNTING
TURNER               SALES
ADAMS                RESEARCH

ENAME                DNAME
-------------------- --------------------
JAMES                SALES
FORD                 RESEARCH
MILLER               ACCOUNTING
                     OPERATIONS

15 rows selected.
```


# Problem 4.22: (SELFJOIN)
Write a query to display their employee names and their managers name.

### Query
``` SQL
SELECT E1.ENAME AS EMPLOYEE, E2.ENAME AS MANAGER 
FROM TR_EMP E1 
LEFT JOIN TR_EMP E2 
ON E1.MGR = E2.EMPNO;
```

### Output
``` bash
EMPLOYEE             MANAGER
-------------------- --------------------
SMITH                FORD
ALLEN                BLAKE
WARD                 BLAKE
JONES                KING
MARTIN               BLAKE
BLAKE                KING
CLARK                KING
SCOTT                JONES
KING
TURNER               BLAKE
ADAMS                SCOTT

EMPLOYEE             MANAGER
-------------------- --------------------
JAMES                BLAKE
FORD                 JONES
MILLER               CLARK

14 rows selected.
```


# Problem 4.23:
Write a query to display their employee names and their managers salary for every employee 

### Query
``` SQL
SELECT E1.ENAME AS EMPLOYEE, E2.SAL AS MANAGER_SALARY 
FROM TR_EMP E1 
LEFT JOIN TR_EMP E2 
ON E1.MGR = E2.EMPNO;
```

### Output
``` bash
EMPLOYEE             MANAGER_SALARY
-------------------- --------------
SMITH                          3000
ALLEN                          2850
WARD                           2850
JONES                          5000
MARTIN                         2850
BLAKE                          5000
CLARK                          5000
SCOTT                          2975
KING
TURNER                         2850
ADAMS                          3000

EMPLOYEE             MANAGER_SALARY
-------------------- --------------
JAMES                          2850
FORD                           2975
MILLER                         2450

14 rows selected.
```


# Problem 4.24:
Write a query to output the name , job, empno, deptname and location for each dept, even if there are no employees.

### Query
``` SQL
SELECT E.ENAME, E.JOB, E.EMPNO, D.DNAME, D.LOC 
FROM TR_EMP E 
RIGHT JOIN TR_DEPT D 
ON E.DEPTNO = D.DEPTNO;
```

### Output
``` bash
ENAME                JOB                       EMPNO DNAME                LOC
-------------------- -------------------- ---------- -------------------- --------------------
CLARK                MANAGER                    7782 ACCOUNTING           NEW YORK
KING                 PRESIDENT                  7839 ACCOUNTING           NEW YORK
MILLER               CLERK                      7934 ACCOUNTING           NEW YORK
JONES                MANAGER                    7566 RESEARCH             DALLAS
FORD                 ANALYST                    7902 RESEARCH             DALLAS
ADAMS                CLERK                      7876 RESEARCH             DALLAS
SMITH                CLERK                      7369 RESEARCH             DALLAS
SCOTT                ANALYST                    7788 RESEARCH             DALLAS
WARD                 SALESMAN                   7521 SALES                CHICAGO
TURNER               SALESMAN                   7844 SALES                CHICAGO
ALLEN                SALESMAN                   7499 SALES                CHICAGO

ENAME                JOB                       EMPNO DNAME                LOC
-------------------- -------------------- ---------- -------------------- --------------------
JAMES                CLERK                      7900 SALES                CHICAGO
BLAKE                MANAGER                    7698 SALES                CHICAGO
MARTIN               SALESMAN                   7654 SALES                CHICAGO
                                                     OPERATIONS           BOSTON

15 rows selected.
```


# Problem 4.25:
Find the name of the manager for each employee. Include the following in the output: empno, empname, job and his manager’s name.

### Query
``` SQL
SELECT E1.EMPNO, E1.ENAME AS EMPLOYEE, E1.JOB, E2.ENAME AS MANAGER 
FROM TR_EMP E1 
LEFT JOIN TR_EMP E2 
ON E1.MGR = E2.EMPNO;
```

### Output
``` bash
     EMPNO EMPLOYEE             JOB                  MANAGER
---------- -------------------- -------------------- --------------------
      7369 SMITH                CLERK                FORD
      7499 ALLEN                SALESMAN             BLAKE
      7521 WARD                 SALESMAN             BLAKE
      7566 JONES                MANAGER              KING
      7654 MARTIN               SALESMAN             BLAKE
      7698 BLAKE                MANAGER              KING
      7782 CLARK                MANAGER              KING
      7788 SCOTT                ANALYST              JONES
      7839 KING                 PRESIDENT
      7844 TURNER               SALESMAN             BLAKE
      7876 ADAMS                CLERK                SCOTT

     EMPNO EMPLOYEE             JOB                  MANAGER
---------- -------------------- -------------------- --------------------
      7900 JAMES                CLERK                BLAKE
      7902 FORD                 ANALYST              JONES
      7934 MILLER               CLERK                CLARK

14 rows selected.
```


# Problem 4.26:
Display the details of those who draw the same salary.

### Query
``` SQL
SELECT * 
FROM TR_EMP 
WHERE SAL IN (
    SELECT SAL 
    FROM TR_EMP 
    GROUP BY SAL 
    HAVING COUNT(*) > 1
);
```

### Output
``` bash
     EMPNO ENAME                JOB                  HIREDATE         MGR        SAL       COMM     DEPTNO
---------- -------------------- -------------------- --------- ---------- ---------- ---------- ----------
      7521 WARD                 SALESMAN             22-FEB-81       7698       1250        500         30
      7654 MARTIN               SALESMAN             28-SEP-81       7698       1250       1400         30
      7788 SCOTT                ANALYST              19-APR-87       7566       3000                    20
      7902 FORD                 ANALYST              03-DEC-81       7566       3000                    20
```
