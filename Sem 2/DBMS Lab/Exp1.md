### Problem 1.1  
Create a table called EMP with the following structure.

| Name | Type |
| --- | --- |
| EMPNO |	NUMBER(6) |
| ENAME |	VARCHAR2(20) |
| JOB |	VARCHAR2(10) |
| MGR | NUMBER(4) |
| DEPTNO | NUMBER(3) |
| SAL | NUMBER(7,2) |

Allow NULL for all columns except ename and job.

### Query
```sql
CREATE TABLE TANMOYEMP(
EMPNO NUMBER(6),
ENAME VARCHAR2(20) NOT NULL,
JOB VARCHAR2(10) NOT NULL,
MGR NUMBER(4),
DEPTNO NUMBER(3),
SAL NUMBER(7, 2)
);
```

### Problem 1.2
Add a column commission to the emp table Commission numeric null allowed.

### Query
```sql
ALTER TABLE TANMOYEMP ADD COMMISSION NUMBER;
```

### Problem 1.3
Modify the column width of the job field of Emp table

### Query
```sql
SQL> ALTER TABLE TANMOYEMP MODIFY JOB VARCHAR2(20);
```

### Problem 1.4
Create dept table with the following structure.
| Name | Type |
| --- | --- |
| DEPTNO | NUMBER(2)|
| DNAME | VARCHAR2(10) |
| LOC | VARCHAR2(10) |

Deptno as the primary key

### Query
```sql
CREATE TABLE TANMOYDEPT(
DEPTNO NUMBER(2) PRIMARY KEY,
DNAME VARCHAR2(10),
LOC VARCHAR2(10)
);
```

### Problem 1.5
Add constraints to the emp table that empno as the primary key and deptno as the foreign key.

### Query
```sql
ALTER TABLE TANMOYEMP ADD CONSTRAINT TAN_PK_EMPNO PRIMARY KEY (EMPNO);
ALTER TABLE TANMOYEMP ADD CONSTRAINT TAN_FK_DEPTNO FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO);
```

### Problem 1.6
Add constraints to the emp table to check the empno value while entering (i.e) empno > 100.

### Query
```sql
ALTER TABLE TANMOYEMP ADD CONSTRAINT TAN_CHK_EMPNO CHECK (EMPNO > 100);
```

### Problem 1.7
Salary value by default is 5000, otherwise as entered values

### Query
```sql
ALTER TABLE TANMOYEMP MODIFY SAL DEFAULT 5000;
```

### Problem 1.8
Add columns Dob to the emp table.

### Query
```sql
ALTER TABLE TANMOYEMP ADD DOB DATE;
```
