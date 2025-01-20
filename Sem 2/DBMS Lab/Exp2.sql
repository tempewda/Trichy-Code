2.1
SQL> INSERT INTO TANMOYDEPT (DEPTNO, DNAME, LOC) VALUES (10, 'ACCOUNTING', 'NEW YORK');
1 row created.
SQL> INSERT INTO TANMOYDEPT (DEPTNO, DNAME, LOC) VALUES (20, 'RESEARCH', 'DALLAS');
1 row created.
SQL> INSERT INTO TANMOYDEPT (DEPTNO, DNAME, LOC) VALUES (30, 'SALES', 'CHICAGO');
1 row created.



  
2.2
SQL> INSERT INTO TANMOYEMP (EMPNO, ENAME, JOB, MGR, DEPTNO, SAL, COMMISSION, DOB) VALUES (101, 'SMITH', 'CLERK', 100, 20, 800, NULL, TO_DATE ('1990-01-01', 'YYYY-MM-DD'));
1 row created.
SQL> INSERT INTO TANMOYEMP (EMPNO, ENAME, JOB, MGR, DEPTNO, SAL, COMMISSION, DOB) VALUES (102, 'ALLEN', 'SALESMAN', 101, 30, 1600, 300, TO_DATE ('1985-06-15', 'YYYY-MM-DD'));
1 row created.
  
SQL> INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'));
Enter value for empno: 103
Enter value for ename: WARD
Enter value for job: SALESMAN
Enter value for mgr: 102
Enter value for deptno: 30
Enter value for sal: 1250
Enter value for commission: 500
Enter value for dob: 1983-09-25
old   1: INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'))
new   1: INSERT INTO TANMOYEMP VALUES (103, 'WARD', 'SALESMAN', 102, 30, 1250, 500, TO_DATE('1983-09-25', 'YYYY-MM-DD'))
1 row created.
  
SQL> /
Enter value for empno: 104
Enter value for ename: JONES
Enter value for job: MANAGER
Enter value for mgr: 105
Enter value for deptno: 20
Enter value for sal: 2975
Enter value for commission: NULL
Enter value for dob: 1979-03-28
old   1: INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'))
new   1: INSERT INTO TANMOYEMP VALUES (104, 'JONES', 'MANAGER', 105, 20, 2975, NULL, TO_DATE('1979-03-28', 'YYYY-MM-DD'))
1 row created.
  
SQL> /
Enter value for empno: 105
Enter value for ename: BLAKE
Enter value for job: MANAGER
Enter value for mgr: 106
Enter value for deptno: 30
Enter value for sal: 2850
Enter value for commission: NULL
Enter value for dob: 1975-05-01
old   1: INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'))
new   1: INSERT INTO TANMOYEMP VALUES (105, 'BLAKE', 'MANAGER', 106, 30, 2850, NULL, TO_DATE('1975-05-01', 'YYYY-MM-DD'))
1 row created.
  
SQL> /
Enter value for empno: 106
Enter value for ename: CLARK
Enter value for job: MANAGER
Enter value for mgr: 107
Enter value for deptno: 10
Enter value for sal: 2450
Enter value for commission: NULL
Enter value for dob: 1976-11-17
old   1: INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'))
new   1: INSERT INTO TANMOYEMP VALUES (106, 'CLARK', 'MANAGER', 107, 10, 2450, NULL, TO_DATE('1976-11-17', 'YYYY-MM-DD'))
1 row created.
  
SQL> /
Enter value for empno: 107
Enter value for ename: SCOTT
Enter value for job: ANALYST
Enter value for mgr: 104
Enter value for deptno: 20
Enter value for sal: 4000
Enter value for commission: NULL
Enter value for dob: 1981-12-07
old   1: INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'))
new   1: INSERT INTO TANMOYEMP VALUES (107, 'SCOTT', 'ANALYST', 104, 20, 4000, NULL, TO_DATE('1981-12-07', 'YYYY-MM-DD'))
1 row created.
  
SQL> /
Enter value for empno: 108
Enter value for ename: TURNER
Enter value for job: SALESMAN
Enter value for mgr: 105
Enter value for deptno: 30
Enter value for sal: 1500
Enter value for commission: 0
Enter value for dob: 1983-08-21
old   1: INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'))
new   1: INSERT INTO TANMOYEMP VALUES (108, 'TURNER', 'SALESMAN', 105, 30, 1500, 0, TO_DATE('1983-08-21', 'YYYY-MM-DD'))
1 row created.

SQL> /
Enter value for empno: 109
Enter value for ename: ADAMS
Enter value for job: CLERK
Enter value for mgr: 107
Enter value for deptno: 20
Enter value for sal: 1100
Enter value for commission: NULL
Enter value for dob: 1985-04-03
old   1: INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'))
new   1: INSERT INTO TANMOYEMP VALUES (109, 'ADAMS', 'CLERK', 107, 20, 1100, NULL, TO_DATE('1985-04-03', 'YYYY-MM-DD'))
1 row created.

SQL> /
Enter value for empno: 110
Enter value for ename: MILLER
Enter value for job: CLERK
Enter value for mgr: 106
Enter value for deptno: 10
Enter value for sal: 1300
Enter value for commission: NULL
Enter value for dob: 1982-01-21
old   1: INSERT INTO TANMOYEMP VALUES (&EMPNO, '&ENAME', '&JOB', &MGR, &DEPTNO, &SAL, &COMMISSION, TO_DATE('&DOB', 'YYYY-MM-DD'))
new   1: INSERT INTO TANMOYEMP VALUES (110, 'MILLER', 'CLERK', 106, 10, 1300, NULL, TO_DATE('1982-01-21', 'YYYY-MM-DD'))
1 row created.



  
2.3
SQL> UPDATE TANMOYEMP
  2  SET COMMISSION = 1000
  3  WHERE JOB = 'MANAGER';
3 rows updated.



  
2.4
SQL> CREATE TABLE TANEMPLOYEE AS SELECT * FROM TANMOYEMP;
Table created.



  
2.5
SQL> DELETE FROM TANMOYEMP
  2  WHERE JOB = 'SUPERVISOR';
0 rows deleted.


  
2.6
SQL> DELETE FROM TANMOYEMP
  2  WHERE EMPNO = 7599;
0 rows deleted.


  
2.7
SQL> SELECT * FROM TANMOYEMP
  2  ORDER BY SAL ASC;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       101 SMITH                CLERK                       100         20
       800            01-JAN-90

       109 ADAMS                CLERK                       107         20
      1100            03-APR-85

       103 WARD                 SALESMAN                    102         30
      1250        500 25-SEP-83
       
     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       110 MILLER               CLERK                       106         10
      1300            21-JAN-82

       108 TURNER               SALESMAN                    105         30
      1500          0 21-AUG-83

       102 ALLEN                SALESMAN                    101         30
      1600        300 15-JUN-85

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       106 CLARK                MANAGER                     107         10
      2450       1000 17-NOV-76

       105 BLAKE                MANAGER                     106         30
      2850       1000 01-MAY-75

       104 JONES                MANAGER                     105         20
      2975       1000 28-MAR-79

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       107 SCOTT                ANALYST                     104         20
      4000            07-DEC-81
10 rows selected.





       
2.8
SQL> SELECT * FROM TANMOYEMP
  2  ORDER BY SAL DESC;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       107 SCOTT                ANALYST                     104         20
      4000            07-DEC-81

       104 JONES                MANAGER                     105         20
      2975       1000 28-MAR-79

       105 BLAKE                MANAGER                     106         30
      2850       1000 01-MAY-75


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       106 CLARK                MANAGER                     107         10
      2450       1000 17-NOV-76

       102 ALLEN                SALESMAN                    101         30
      1600        300 15-JUN-85

       108 TURNER               SALESMAN                    105         30
      1500          0 21-AUG-83


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       110 MILLER               CLERK                       106         10
      1300            21-JAN-82

       103 WARD                 SALESMAN                    102         30
      1250        500 25-SEP-83

       109 ADAMS                CLERK                       107         20
      1100            03-APR-85


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       101 SMITH                CLERK                       100         20
       800            01-JAN-90
10 rows selected.




       
2.9
SQL> SELECT * FROM TANMOYEMP
  2  WHERE DEPTNO = 30;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       102 ALLEN                SALESMAN                    101         30
      1600        300 15-JUN-85

       103 WARD                 SALESMAN                    102         30
      1250        500 25-SEP-83

       105 BLAKE                MANAGER                     106         30
      2850       1000 01-MAY-75


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       108 TURNER               SALESMAN                    105         30
      1500          0 21-AUG-83



       
2.10
SQL> SELECT DISTINCT DEPTNO
  2  FROM TANEMPLOYEE;

    DEPTNO
----------
        30
        20
        10

      
2.11
SQL> SELECT * FROM TANMOYEMP
  2  ORDER BY ENAME ASC;

     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       109 ADAMS                CLERK                       107         20
      1100            03-APR-85

       102 ALLEN                SALESMAN                    101         30
      1600        300 15-JUN-85

       105 BLAKE                MANAGER                     106         30
      2850       1000 01-MAY-75


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       106 CLARK                MANAGER                     107         10
      2450       1000 17-NOV-76

       104 JONES                MANAGER                     105         20
      2975       1000 28-MAR-79

       110 MILLER               CLERK                       106         10
      1300            21-JAN-82


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       107 SCOTT                ANALYST                     104         20
      4000            07-DEC-81

       101 SMITH                CLERK                       100         20
       800            01-JAN-90

       108 TURNER               SALESMAN                    105         30
      1500          0 21-AUG-83


     EMPNO ENAME                JOB                         MGR     DEPTNO
---------- -------------------- -------------------- ---------- ----------
       SAL COMMISSION DOB
---------- ---------- ---------
       103 WARD                 SALESMAN                    102         30
      1250        500 25-SEP-83
10 rows selected.




       
2.12
SQL> CREATE TABLE TANMANAGER AS
  2  SELECT * FROM TANMOYEMP
  3  WHERE JOB = 'MANAGER';
Table created.


2.13
SQL> SELECT ENAME
  2  FROM TANMOYEMP
  3  WHERE COMMISSION IS NULL;

ENAME
--------------------
SMITH
SCOTT
ADAMS
MILLER


2.14
SQL> SELECT E.ENAME, D.DNAME
  2  FROM TANMOYEMP E
  3  JOIN TANMOYDEPT D
  4  ON E.DEPTNO = D.DEPTNO;

ENAME                DNAME
-------------------- ----------
SMITH                RESEARCH
ALLEN                SALES
WARD                 SALES
JONES                RESEARCH
BLAKE                SALES
CLARK                ACCOUNTING
SCOTT                RESEARCH
TURNER               SALES
ADAMS                RESEARCH
MILLER               ACCOUNTING
10 rows selected.
