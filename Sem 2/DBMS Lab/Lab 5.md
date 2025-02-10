
### Problem 5.1: 
Display all the dept numbers available with the dept and accdept tables avoiding
duplicates.

### Query
``` sql
SELECT DEPTNO FROM TR_DEPT
UNION
SELECT DEPTNO FROM TR_ACCREDIT;
```

### Output
``` bash
    DEPTNO
----------
        10
        20
        30
        40
        50
        60

6 rows selected.
```

### Problem 5.2: 
Display all the dept numbers available with the dept and accdept tables.

### Query
```sql
SELECT DEPTNO FROM TR_DEPT
UNION ALL
SELECT DEPTNO FROM TR_ACCREDIT;
```
### Output
```bash
    DEPTNO
----------
        10
        20
        30
        40
        50
        60
        10
        20
        30

9 rows selected.
```

### Problem 5.3: 
Display dept no available in both the dept and acc dept tables.

### Query
```sql
SELECT DEPTNO FROM TR_DEPT
INTERSECT
SELECT DEPTNO FROM TR_ACCREDIT;
```

### Output
```bash
    DEPTNO
----------
        10
        20
        30
```

### Problem 5.4: 
Display all the dept numbers available in dept and not in accdept tables.

### Query
```sql
SELECT DEPTNO FROM TR_DEPT
MINUS
SELECT DEPTNO FROM TR_ACCREDIT;
```

### Output
```bash
    DEPTNO
----------
        40
        50
        60
```

### Problem 5.5: 
The organization wants to display only the details of the employees those who are
managers( horizontal portioning).

### Query
```sql
SELECT * FROM TR_EMP
WHERE JOB = 'MANAGER';
```

### Output
``` bash
     EMPNO ENAME                JOB                  HIREDATE         MGR        SAL       COMM     DEPTNO
---------- -------------------- -------------------- --------- ---------- ---------- ---------- ----------
      7566 JONES                MANAGER              02-APR-81       7839       2975                    20
      7698 BLAKE                MANAGER              01-MAY-81       7839       2850                    30
      8005 TAYLOR               MANAGER              01-JAN-90       7839       3500                    10
      8006 LEE                  MANAGER              15-MAY-91       7839       4000                    20
```
      
### Problem 5.6: 
The organization wants to display only the details like
empno,empname,deptno,deptname of the employees .(vertical portioning)

### Query
```sql
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM TR_EMP E
JOIN TR_DEPT D ON E.DEPTNO = D.DEPTNO;
```

### Output
```bash
     EMPNO ENAME                    DEPTNO DNAME
---------- -------------------- ---------- --------------------
      7499 ALLEN                        30 SALES
      7521 WARD                         30 SALES
      7566 JONES                        20 RESEARCH
      7654 MARTIN                       30 SALES
      7698 BLAKE                        30 SALES
      7782 CLARK                        10 ACCOUNTING
      7788 SCOTT                        20 RESEARCH
      7839 KING                         10 ACCOUNTING
      7844 TURNER                       30 SALES
      7876 ADAMS                        20 RESEARCH
      7900 JAMES                        30 SALES

     EMPNO ENAME                    DEPTNO DNAME
---------- -------------------- ---------- --------------------
      7902 FORD                         20 RESEARCH
      7934 MILLER                       10 ACCOUNTING
      8001 DAVIS                        50 MAINTENANCE
      8002 JOHNSON                      50 MAINTENANCE
      8003 ROBERTS                      60 DEVELOPMENT
      8004 WILSON                       60 DEVELOPMENT
      8005 TAYLOR                       10 ACCOUNTING
      8006 LEE                          20 RESEARCH
      7369 SMITH                        20 RESEARCH

20 rows selected.
```

### Problem 5.7: 
The organization wants to display only the details like empno,empname,deptno,deptname
of the all the employees except the HOD and CEO . (full portioning)

### Query
```sql
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM TR_EMP E
JOIN TR_DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.JOB NOT IN ('CLERK', 'ANALYST');
```

### Output
```bash
     EMPNO ENAME                    DEPTNO DNAME
---------- -------------------- ---------- --------------------
      7499 ALLEN                        30 SALES
      7521 WARD                         30 SALES
      7566 JONES                        20 RESEARCH
      7654 MARTIN                       30 SALES
      7698 BLAKE                        30 SALES
      7782 CLARK                        10 ACCOUNTING
      7839 KING                         10 ACCOUNTING
      7844 TURNER                       30 SALES
      8001 DAVIS                        50 MAINTENANCE
      8002 JOHNSON                      50 MAINTENANCE
      8003 ROBERTS                      60 DEVELOPMENT

     EMPNO ENAME                    DEPTNO DNAME
---------- -------------------- ---------- --------------------
      8004 WILSON                       60 DEVELOPMENT
      8005 TAYLOR                       10 ACCOUNTING
      8006 LEE                          20 RESEARCH

14 rows selected.
```

### Problem 5.8: 
Display all the views generated.

### Query
```sql
SELECT VIEW_NAME FROM USER_VIEWS;
```

### Output
```bash
VIEW_NAME
------------------------------
FULL056
V2
V3
MANAGER_VIEW
EMP_VIEW_24020

126 rows selected.
```

### Problem 5.9: 
Execute the DML commands on the view created.
a.
```sql
CREATE VIEW TR_EMP_VIEW AS
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM TR_EMP;
```

### Output
```bash
View created.
```

b.
```sql
INSERT INTO TR_EMP_VIEW (EMPNO, ENAME, JOB, SAL, DEPTNO)
VALUES (7950, 'RAVI', 'CLERK', 1200, 30);
```

### Output
```bash
1 row created.
```

c.
```sql
UPDATE TR_EMP_VIEW
SET DEPTNO = 40
WHERE EMPNO = 7950;
```

### Output
```bash
1 row updated.
```

d.
```sql
DELETE FROM TR_EMP_VIEW
WHERE EMPNO = 7950;
```

### Output
```bash
1 row deleted.
```

### Problem 5.10: 
Drop a view.
### Query
```sql
DROP VIEW TR_EMP_VIEW;
```

### Output
```bash
View dropped.
```
