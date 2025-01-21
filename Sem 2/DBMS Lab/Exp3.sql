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

Problem 3.2 - Display all the details of the records whose employee names start with ‘S’.
SELECT * FROM YOUR_INITIALS_EMP
WHERE ENAME LIKE 'S%';

Problem 3.3 - Display all the details of the records whose employee name  does not start with ‘S’.
SELECT * FROM YOUR_INITIALS_EMP
WHERE ENAME NOT LIKE 'S%';

Problem 3.4 - Display the rows whose empno ranges from 7500 to 7600.
SELECT * FROM YOUR_INITIALS_EMP
WHERE EMPNO BETWEEN 7500 AND 7600;

Problem 3.5 - Display the rows whose empno not in range from 7500 to 7600.
SELECT * FROM YOUR_INITIALS_EMP
WHERE EMPNO NOT BETWEEN 7500 AND 7600;

Problem 3.6 - Calculate the square root of the salary of all employees.
SELECT ENAME, SAL, ROUND(SQRT(SAL), 2) AS SALARY_SQRT
FROM YOUR_INITIALS_EMP;

Problem 3.7 - Count the total records in the emp table.
SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM YOUR_INITIALS_EMP;

Problem 3.8 - Calculate the total and average salary amount of the emp  table.
SELECT SUM(SAL) AS TOTAL_SALARY, AVG(SAL) AS AVG_SALARY FROM YOUR_INITIALS_EMP;

Problem 3.9 - Determine the max and min salary and  display  as max_salary and min_salary.
SELECT MAX(SAL) AS MAX_SALARY, MIN(SAL) AS MIN_SALARY FROM YOUR_INITIALS_EMP;

Problem 3.10 - Display total salary spent for employees.
SELECT SUM(SAL) AS TOTAL_SALARY FROM YOUR_INITIALS_EMP;

Problem 3.11 - Display total salary spent for each job category.
SELECT JOB, SUM(SAL) AS TOTAL_SALARY FROM YOUR_INITIALS_EMP
GROUP BY JOB;

Problem 3.12 - Display the month name of date “14-jul-09” in full.
SELECT TO_CHAR(TO_DATE('14-JUL-09', 'DD-MON-YY'), 'MONTH') AS MONTH_NAME
FROM DUAL;

Problem 3.13 - Display the Dob of all employees in the format “dd-mm-yy”.
SELECT ENAME, TO_CHAR(DOB, 'DD-MM-YY') AS FORMATTED_DOB
FROM YOUR_INITIALS_EMP;

Problem 3.14 - Display the date two months after the Dob of employees.
SELECT ENAME, DOB, ADD_MONTHS(DOB, 2) AS DOB_PLUS_TWO_MONTHS
FROM YOUR_INITIALS_EMP;

Problem 3.15 - Display the last date of that month in “05-Oct-09”.
SELECT LAST_DAY(TO_DATE('05-OCT-09', 'DD-MON-YY')) AS LAST_DATE
FROM DUAL;

Problem 3.16 - Display the rounded date in the year format, month format, day format in the employees.
SELECT ENAME, 
       ROUND(DOB, 'YEAR') AS DOB_YEAR, 
       ROUND(DOB, 'MONTH') AS DOB_MONTH, 
       ROUND(DOB, 'DAY') AS DOB_DAY
FROM YOUR_INITIALS_EMP;

Problem 3.17 - List all employee names , salary and 15% rise in salary.
SELECT ENAME, SAL, SAL * 1.15 AS SALARY_WITH_RAISE
FROM YOUR_INITIALS_EMP;

Problem 3.18 - List all employee names which start with either B or C.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE ENAME LIKE 'B%' OR ENAME LIKE 'C%';

Problem 3.19-Display the employee names who got less than the average salary of all employees.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE SAL < (SELECT AVG(SAL) FROM YOUR_INITIALS_EMP);

Problem 3.20 - Display lowest paid employee details under each manager.
SELECT MGR, MIN(SAL) AS LOWEST_SALARY
FROM YOUR_INITIALS_EMP
GROUP BY MGR;

Problem 3.21 - Display number of employees working in each department and their department name.
SELECT DNAME, COUNT(*) AS NUM_EMPLOYEES
FROM YOUR_INITIALS_EMP E JOIN YOUR_INITIALS_DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY DNAME;

Problem 3.22 - Display the employee names whose name contains up to 5 characters.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE LENGTH(ENAME) <= 5;

Problem 3.23 - List all employee names and their manager whose manager is 77499 or 7566 0r 7611.
SELECT ENAME, MGR
FROM YOUR_INITIALS_EMP
WHERE MGR IN (77499, 7566, 7611);

Problem 3.24 - Find how many job titles are available in employee table.
SELECT COUNT(DISTINCT JOB) AS TOTAL_JOBS FROM YOUR_INITIALS_EMP;

Problem 3.25 - What is the difference between maximum and minimum salaries of employees in the organization?
SELECT MAX(SAL) - MIN(SAL) AS SALARY_DIFFERENCE FROM YOUR_INITIALS_EMP;

Problem 3.26 - Find no.of depts in employee table.
SELECT COUNT(DISTINCT DEPTNO) AS TOTAL_DEPTS FROM YOUR_INITIALS_EMP;

Problem 3.27 - Display the names and dob of all employees who were born  in February.
SELECT ENAME, DOB
FROM YOUR_INITIALS_EMP
WHERE TO_CHAR(DOB, 'MM') = '02';

Problem 3.28 - List out the employee names who will celebrate their  birth days during current month.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE TO_CHAR(DOB, 'MM') = TO_CHAR(SYSDATE, 'MM');

Problem 3.29 - List out the employee names whose names starts with s  and ends with h.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE ENAME LIKE 'S%H';

Problem 3.30 - List out the employee names whose salary is greater than  5000.
SELECT ENAME
FROM YOUR_INITIALS_EMP
WHERE SAL > 5000;
