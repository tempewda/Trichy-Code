
### Problem 5.1: 
Display all the dept numbers available with the dept and accdept tables avoiding
duplicates.

SELECT DEPTNO FROM DEPT_0096
UNION
SELECT DEPTNO FROM ACCREDIT_0096;

Problem 5.2: Display all the dept numbers available with the dept and accdept tables.

SELECT DEPTNO FROM DEPT_0096
UNION ALL
SELECT DEPTNO FROM ACCREDIT_0096;

Problem 5.3: Display dept no available in both the dept and acc dept tables.

SELECT DEPTNO FROM DEPT_0096
INTERSECT
SELECT DEPTNO FROM ACCREDIT_0096;

Problem 5.4: Display all the dept numbers available in dept and not in accdept tables.

SELECT DEPTNO FROM DEPT_0096
MINUS
SELECT DEPTNO FROM ACCREDIT_0096;

Problem 5.5: The organization wants to display only the details of the employees those who are
managers( horizontal portioning).

SELECT * FROM EMP_0096
WHERE JOB = 'MANAGER';

Problem 5.6: The organization wants to display only the details like
empno,empname,deptno,deptname of the employees .(vertical portioning)

SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP_0096 E
JOIN DEPT_0096 D ON E.DEPTNO = D.DEPTNO;

Problem 5.7: The organization wants to display only the details like empno,empname,deptno,deptname
of the all the employees except the HOD and CEO . (full portioning)

SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP_0096 E
JOIN DEPT_0096 D ON E.DEPTNO = D.DEPTNO
WHERE E.JOB NOT IN ('CLERK', 'ANALYST');

Problem 5.8: Display all the views generated.
SELECT VIEW_NAME FROM USER_VIEWS;

Problem 5.9: Execute the DML commands on the view created.
a.
CREATE VIEW EMP_VIEW_0096 AS
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP_0096;
b.
INSERT INTO EMP_VIEW_0096 (EMPNO, ENAME, JOB, SAL, DEPTNO)
VALUES (7950, 'RAVI', 'CLERK', 1200, 30);
c.
UPDATE EMP_VIEW_0096
SET DEPTNO = 40
WHERE EMPNO = 7950;
Page 66
d.
DELETE FROM EMP_VIEW_0096
WHERE EMPNO = 7950;

Problem 5.10: Drop a view.
DROP VIEW EMP_VIEW_0096;