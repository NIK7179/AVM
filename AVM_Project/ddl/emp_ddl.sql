
CREATE TABLE P01_EMP.EMP_RAW.EMPLOYEE (
    ESSN CHAR(9) PRIMARY KEY,
    FNAME VARCHAR(20),
    MINIT CHAR(1),
    LNAME VARCHAR(20),
    BDATE DATE,
    ADDRESS VARCHAR(50),
    SEX CHAR(1),
    SALARY NUMERIC(10, 2),
    SUPER_SSN CHAR(9),
    DNO INT
);

CREATE TABLE P01_EMP.EMP_RAW.DEPARTMENT (
    DNUMBER INT PRIMARY KEY,
    DNAME VARCHAR(20),
    MGR_SSN CHAR(9),
    MGR_START_DATE DATE
);

CREATE TABLE P01_EMP.EMP_RAW.DEPT_LOCATIONS (
    DNUMBER INT,
    DLOCATION VARCHAR(20)
);

CREATE TABLE P01_EMP.EMP_RAW.PROJECT (
    PNUMBER INT PRIMARY KEY,
    PNAME VARCHAR(20),
    PLOCATION VARCHAR(20),
    DNUM INT
);

CREATE TABLE P01_EMP.EMP_RAW.WORKS_ON (
    ESSN CHAR(9),
    PNO INT,
    HOURS NUMERIC(3, 1)
);

CREATE TABLE P01_EMP.EMP_RAW.DEPENDENT (
    ESSN CHAR(9),
    DEPENDENT_NAME VARCHAR(20),
    SEX CHAR(1),
    BDATE DATE,
    RELATIONSHIP VARCHAR(20)
);

-- EMP_PROC schema tables
CREATE TABLE P01_EMP.EMP_PROC.emp_sal_greater_mngr (
    ESSN CHAR(9),
    EMP_SALARY NUMERIC(10, 2),
    SUPER_SSN CHAR(9),
    MGR_SALARY NUMERIC(10, 2)
);

CREATE TABLE P01_EMP.EMP_PROC.emp_project_dept (
    ESSN CHAR(9),
    PNAME VARCHAR(20),
    EMP_DEPT_NAME VARCHAR(20),
    PROJ_DEPT_NAME VARCHAR(20)
);

CREATE TABLE P01_EMP.EMP_PROC.emp_dept_least (
    DEPT_NAME VARCHAR(20),
    DEPT_NO INT,
    NO_OF_EMP INT
);

CREATE TABLE P01_EMP.EMP_PROC.emp_tot_hrs_spent (
    ESSN CHAR(9),
    DEPENDENT_NAME VARCHAR(20),
    PNO INT,
    TOTAL_HOURS_SPENT NUMERIC(10, 2)
);

CREATE TABLE P01_EMP.EMP_PROC.emp_full_details (
    ESSN CHAR(9),
    FNAME VARCHAR(20),
    MINIT CHAR(1),
    LNAME VARCHAR(20),
    BDATE DATE,
    ADDRESS VARCHAR(50),
    SEX CHAR(1),
    SALARY NUMERIC(10, 2),
    SUPER_SSN CHAR(9),
    DNO INT,
    DNAME VARCHAR(20),
    DLOCATION VARCHAR(20),
    PNAME VARCHAR(20),
    PNUMBER INT,
    PLOCATION VARCHAR(20),
    TOTAL_HOURS NUMERIC(10, 2),
    DEPENDENT_NAME VARCHAR(20),
    DEPENDENT_SEX CHAR(1),
    DEPENDENT_RELATION VARCHAR(20)
);
