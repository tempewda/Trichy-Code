-- Create Department Table
CREATE TABLE YOUR_INITIALS_DEPT (
    DEPTNO NUMBER(3) PRIMARY KEY,
    DNAME VARCHAR2(20),
    LOC VARCHAR2(20)
);

-- Create Employee Table
CREATE TABLE YOUR_INITIALS_EMP (
    EMPNO NUMBER(6) PRIMARY KEY,
    ENAME VARCHAR2(20),
    JOB VARCHAR2(20),
    MGR NUMBER(6),
    DEPTNO NUMBER(3),
    SAL NUMBER(10, 2),
    COMM NUMBER(10, 2),
    DOB DATE,
    CONSTRAINT FK_DEPT FOREIGN KEY (DEPTNO) REFERENCES YOUR_INITIALS_DEPT(DEPTNO)
);

-- Insert Departments
INSERT INTO YOUR_INITIALS_DEPT VALUES (10, 'Maintenance', 'Mumbai');
INSERT INTO YOUR_INITIALS_DEPT VALUES (20, 'Development', 'Delhi');
INSERT INTO YOUR_INITIALS_DEPT VALUES (30, 'Sales', 'Chennai');
INSERT INTO YOUR_INITIALS_DEPT VALUES (40, 'HR', 'Kolkata');

-- Insert Employees
INSERT INTO YOUR_INITIALS_EMP VALUES (7500, 'John', 'MANAGER', NULL, 10, 6000, 1000, TO_DATE('14-JUL-1990', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7501, 'Steve', 'DEVELOPER', 7500, 20, 4500, NULL, TO_DATE('15-AUG-1985', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7502, 'Sally', 'SUPERVISOR', 7500, 10, 4000, NULL, TO_DATE('16-JAN-1980', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7503, 'Mark', 'HR', 7500, 40, 5000, NULL, TO_DATE('14-FEB-1992', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7504, 'Chris', 'SALES', 7501, 30, 3000, 500, TO_DATE('20-MAR-1988', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7505, 'Betty', 'DEVELOPER', 7501, 20, 4000, NULL, TO_DATE('25-APR-1995', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7506, 'Shawn', 'SALES', 7503, 30, 3500, NULL, TO_DATE('19-MAY-1987', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7507, 'Sarah', 'MANAGER', NULL, 20, 8000, 2000, TO_DATE('12-JUN-1984', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7508, 'Brian', 'DEVELOPER', 7507, 20, 5000, NULL, TO_DATE('21-JUL-1983', 'DD-MON-YYYY'));
INSERT INTO YOUR_INITIALS_EMP VALUES (7509, 'Tina', 'HR', 7507, 40, 4500, NULL, TO_DATE('14-FEB-1990', 'DD-MON-YYYY'));


Problem 3.1 - Select all employees from the departments “Maintenance” and “development”
SELECT * FROM YOUR_INITIALS_EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM YOUR_INITIALS_DEPT WHERE DNAME IN ('Maintenance', 'Development'));

 EMPNO ENAME                JOB                         MGR     DEPTNO        SAL       COMM DOB
---------- -------------------- -------------------- ---------- ---------- ---------- ---------- ---------
      7500 John                 MANAGER                                 10       6000       1000 14-JUL-90
      7501 Steve                DEVELOPER                  7500         20       4500            15-AUG-85
      7502 Sally                SUPERVISOR                 7500         10       4000            16-JAN-80
      7505 Betty                DEVELOPER                  7501         20       4000            25-APR-95
      7507 Sarah                MANAGER                                 20       8000       2000 12-JUN-84
      7508 Brian                DEVELOPER                  7507         20       5000            21-JUL-83

6 rows selected.

Problem 3.2 - Display all the details of the records whose employee names start with ‘S’.
SELECT * FROM YOUR_INITIALS_EMP
WHERE ENAME LIKE 'S%';

     EMPNO ENAME                JOB                         MGR     DEPTNO        SAL       COMM DOB
---------- -------------------- -------------------- ---------- ---------- ---------- ---------- ---------
      7501 Steve                DEVELOPER                  7500         20       4500            15-AUG-85
      7502 Sally                SUPERVISOR                 7500         10       4000            16-JAN-80
      7506 Shawn                SALES                      7503         30       3500            19-MAY-87
      7507 Sarah                MANAGER                                 20       8000       2000 12-JUN-84

Problem 3.3 - Display all the details of the records whose employee name  does not start with ‘S’.
SELECT * FROM YOUR_INITIALS_EMP
WHERE ENAME NOT LIKE 'S%';

     EMPNO ENAME                JOB                         MGR     DEPTNO        SAL       COMM DOB
---------- -------------------- -------------------- ---------- ---------- ---------- ---------- ---------
      7500 John                 MANAGER                                 10       6000       1000 14-JUL-90
      7503 Mark                 HR                         7500         40       5000            14-FEB-92
      7504 Chris                SALES                      7501         30       3000        500 20-MAR-88
      7505 Betty                DEVELOPER                  7501         20       4000            25-APR-95
      7508 Brian                DEVELOPER                  7507         20       5000            21-JUL-83
      7509 Tina                 HR                         7507         40       4500            14-FEB-90

6 rows selected.

Problem 3.4 - Display the rows whose empno ranges from 7500 to 7600.
SELECT * FROM YOUR_INITIALS_EMP
WHERE EMPNO BETWEEN 7500 AND 7600;

     EMPNO ENAME                JOB                         MGR     DEPTNO        SAL       COMM DOB
---------- -------------------- -------------------- ---------- ---------- ---------- ---------- ---------
      7500 John                 MANAGER                                 10       6000       1000 14-JUL-90
      7501 Steve                DEVELOPER                  7500         20       4500            15-AUG-85
      7502 Sally                SUPERVISOR                 7500         10       4000            16-JAN-80
      7503 Mark                 HR                         7500         40       5000            14-FEB-92
      7504 Chris                SALES                      7501         30       3000        500 20-MAR-88
      7505 Betty                DEVELOPER                  7501         20       4000            25-APR-95
      7506 Shawn                SALES                      7503         30       3500            19-MAY-87
      7507 Sarah                MANAGER                                 20       8000       2000 12-JUN-84
      7508 Brian                DEVELOPER                  7507         20       5000            21-JUL-83
      7509 Tina                 HR                         7507         40       4500            14-FEB-90

10 rows selected.

Problem 3.5 - Display the rows whose empno not in range from 7500 to 7600.
SELECT * FROM YOUR_INITIALS_EMP
WHERE EMPNO NOT BETWEEN 7500 AND 7600;

no rows selected

Problem 3.6 - Calculate the square root of the salary of all employees.
SELECT ENAME, SAL, ROUND(SQRT(SAL), 2) AS SALARY_SQRT
FROM YOUR_INITIALS_EMP;

ENAME                       SAL SALARY_SQRT
-------------------- ---------- -----------
John                       6000       77.46
Steve                      4500       67.08
Sally                      4000       63.25
Mark                       5000       70.71
Chris                      3000       54.77
Betty                      4000       63.25
Shawn                      3500       59.16
Sarah                      8000       89.44
Brian                      5000       70.71
Tina                       4500       67.08

10 rows selected.

Problem 3.7 - Count the total records in the emp table.
SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM YOUR_INITIALS_EMP;

TOTAL_EMPLOYEES
---------------
             10

Problem 3.8 - Calculate the total and average salary amount of the emp  table.
SELECT SUM(SAL) AS TOTAL_SALARY, AVG(SAL) AS AVG_SALARY FROM YOUR_INITIALS_EMP;

TOTAL_SALARY AVG_SALARY
------------ ----------
       47500       4750

Problem 3.9 - Determine the max and min salary and  display  as max_salary and min_salary.
SELECT MAX(SAL) AS MAX_SALARY, MIN(SAL) AS MIN_SALARY FROM YOUR_INITIALS_EMP;

MAX_SALARY MIN_SALARY
---------- ----------
      8000       3000

Problem 3.10 - Display total salary spent for employees.
SELECT SUM(SAL) AS TOTAL_SALARY FROM YOUR_INITIALS_EMP;

TOTAL_SALARY
------------
       47500

Problem 3.11 - Display total salary spent for each job category.
SELECT JOB, SUM(SAL) AS TOTAL_SALARY FROM YOUR_INITIALS_EMP
GROUP BY JOB;

JOB                  TOTAL_SALARY
-------------------- ------------
SUPERVISOR                   4000
HR                           9500
MANAGER                     14000
DEVELOPER                   13500
SALES                        6500
    
Problem 3.12 - Display the month name of date “14-jul-09” in full.
SELECT TO_CHAR(TO_DATE('14-JUL-09', 'DD-MON-YY'), 'MONTH') AS MONTH_NAME
FROM DUAL;

MONTH_NAM
---------
JULY

Problem 3.13 - Display the Dob of all employees in the format “dd-mm-yy”.
SELECT ENAME, TO_CHAR(DOB, 'DD-MM-YY') AS FORMATTED_DOB
FROM YOUR_INITIALS_EMP;

ENAME                FORMATTE
-------------------- --------
John                 14-07-90
Steve                15-08-85
Sally                16-01-80
Mark                 14-02-92
Chris                20-03-88
Betty                25-04-95
Shawn                19-05-87
Sarah                12-06-84
Brian                21-07-83
Tina                 14-02-90

10 rows selected.

Problem 3.14 - Display the date two months after the Dob of employees.
SELECT ENAME, DOB, ADD_MONTHS(DOB, 2) AS DOB_PLUS_TWO_MONTHS
FROM YOUR_INITIALS_EMP;

ENAME                DOB       DOB_PLUS_
-------------------- --------- ---------
John                 14-JUL-90 14-SEP-90
Steve                15-AUG-85 15-OCT-85
Sally                16-JAN-80 16-MAR-80
Mark                 14-FEB-92 14-APR-92
Chris                20-MAR-88 20-MAY-88
Betty                25-APR-95 25-JUN-95
Shawn                19-MAY-87 19-JUL-87
Sarah                12-JUN-84 12-AUG-84
Brian                21-JUL-83 21-SEP-83
Tina                 14-FEB-90 14-APR-90

10 rows selected.

Problem 3.15 - Display the last date of that month in “05-Oct-09”.
SELECT LAST_DAY(TO_DATE('05-OCT-09', 'DD-MON-YY')) AS LAST_DATE
FROM DUAL;

LAST_DATE
---------
31-OCT-09

Problem 3.16 - Display the rounded date in the year format, month format, day format in the employees.
SELECT ENAME, 
       ROUND(DOB, 'YEAR') AS DOB_YEAR, 
       ROUND(DOB, 'MONTH') AS DOB_MONTH, 
       ROUND(DOB, 'DAY') AS DOB_DAY
FROM YOUR_INITIALS_EMP;

ENAME                DOB_YEAR  DOB_MONTH DOB_DAY
-------------------- --------- --------- ---------
John                 01-JAN-91 01-JUL-90 15-JUL-90
Steve                01-JAN-86 01-AUG-85 18-AUG-85
Sally                01-JAN-80 01-FEB-80 13-JAN-80
Mark                 01-JAN-92 01-FEB-92 16-FEB-92
Chris                01-JAN-88 01-APR-88 20-MAR-88
Betty                01-JAN-95 01-MAY-95 23-APR-95
Shawn                01-JAN-87 01-JUN-87 17-MAY-87
Sarah                01-JAN-84 01-JUN-84 10-JUN-84
Brian                01-JAN-84 01-AUG-83 24-JUL-83
Tina                 01-JAN-90 01-FEB-90 11-FEB-90

10 rows selected.

Problem 3.17 - List all employee names , salary and 15% rise in salary.
SELECT ENAME, SAL, SAL * 1.15 AS SALARY_WITH_RAISE
FROM YOUR_INITIALS_EMP;

ENAME                       SAL SALARY_WITH_RAISE
-------------------- ---------- -----------------
John                       6000              6900
Steve                      4500              5175
Sally                      4000              4600
Mark                       5000              5750
Chris                      3000              3450
Betty                      4000              4600
Shawn                      3500              4025
Sarah                      8000              9200
Brian                      5000              5750
Tina                       4500              5175

10 rows selected.

Problem 3.18 - List all employee names which start with either B or C.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE ENAME LIKE 'B%' OR ENAME LIKE 'C%';

ENAME
--------------------
Chris
Betty
Brian

Problem 3.19-Display the employee names who got less than the average salary of all employees.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE SAL < (SELECT AVG(SAL) FROM YOUR_INITIALS_EMP);

ENAME
--------------------
Steve
Sally
Chris
Betty
Shawn
Tina

6 rows selected.

Problem 3.20 - Display lowest paid employee details under each manager.
SELECT MGR, MIN(SAL) AS LOWEST_SALARY
FROM YOUR_INITIALS_EMP
GROUP BY MGR;

       MGR LOWEST_SALARY
---------- -------------
                    6000
      7501          3000
      7507          4500
      7503          3500
      7500          4000
Problem 3.21 - Display number of employees working in each department and their department name.
SELECT DNAME, COUNT(*) AS NUM_EMPLOYEES
FROM YOUR_INITIALS_EMP E JOIN YOUR_INITIALS_DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY DNAME;

DNAME                NUM_EMPLOYEES
-------------------- -------------
Maintenance                      2
Development                      4
HR                               2
Sales                            2

Problem 3.22 - Display the employee names whose name contains up to 5 characters.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE LENGTH(ENAME) <= 5;

ENAME
--------------------
John
Steve
Sally
Mark
Chris
Betty
Shawn
Sarah
Brian
Tina

10 rows selected.

Problem 3.23 - List all employee names and their manager whose manager is 77499 or 7566 0r 7611.
SELECT ENAME, MGR
FROM YOUR_INITIALS_EMP
WHERE MGR IN (77499, 7566, 7611);

no rows selected

Problem 3.24 - Find how many job titles are available in employee table.
SELECT COUNT(DISTINCT JOB) AS TOTAL_JOBS FROM YOUR_INITIALS_EMP;

TOTAL_JOBS
----------
         5

Problem 3.25 - What is the difference between maximum and minimum salaries of employees in the organization?
SELECT MAX(SAL) - MIN(SAL) AS SALARY_DIFFERENCE FROM YOUR_INITIALS_EMP;

SALARY_DIFFERENCE
-----------------
             5000

Problem 3.26 - Find no.of depts in employee table.
SELECT COUNT(DISTINCT DEPTNO) AS TOTAL_DEPTS FROM YOUR_INITIALS_EMP;

TOTAL_DEPTS
-----------
          4
    
Problem 3.27 - Display the names and dob of all employees who were born  in February.
SELECT ENAME, DOB
FROM YOUR_INITIALS_EMP
WHERE TO_CHAR(DOB, 'MM') = '02';

ENAME                DOB
-------------------- ---------
Mark                 14-FEB-92
Tina                 14-FEB-90

Problem 3.28 - List out the employee names who will celebrate their  birth days during current month.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE TO_CHAR(DOB, 'MM') = TO_CHAR(SYSDATE, 'MM');

ENAME
--------------------
Sally

Problem 3.29 - List out the employee names whose names starts with s  and ends with h.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE UPPER(ENAME) LIKE 'S%H';

ENAME
--------------------
Sarah

Problem 3.30 - List out the employee names whose salary is greater than  5000.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE SAL > 5000;

ENAME
--------------------
John
Sarah
