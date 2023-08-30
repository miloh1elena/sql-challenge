-- Create the Tables

CREATE TABLE DEPARTMENTS (DEPT_NO VARCHAR(4) PRIMARY KEY,
																											DEPT_NAME VARCHAR(100));


CREATE TABLE EMPLOYEES (EMP_NO INT PRIMARY KEY,
																									EMP_TITLE VARCHAR(100),
																									BIRTH_DATE DATE, FIRST_NAME VARCHAR(100),
																									LAST_NAME VARCHAR(100),
																									GENDER VARCHAR(1),
																									HIRE_DATE DATE);


CREATE TABLE DEPT_EMP (EMP_NO INT REFERENCES EMPLOYEES(EMP_NO),
																								DEPT_NO VARCHAR(4) REFERENCES DEPARTMENTS(DEPT_NO));


CREATE TABLE DEPT_MANAGERS (DEPT_NO VARCHAR(4) REFERENCES DEPARTMENTS(DEPT_NO),
																													EMP_NO INT REFERENCES EMPLOYEES(EMP_NO));


CREATE TABLE SALARIES (EMP_NO INT REFERENCES EMPLOYEES(EMP_NO),
																								SALARY BIGINT);

-- Create the Titles Table

CREATE TABLE TITLES (EMP_NO INT REFERENCES EMPLOYEES(EMP_NO),
																						TITLE VARCHAR(100),
																						TITLE_ID VARCHAR(5));

-- Populate title_id based on title

UPDATE TITLES
SET TITLE_ID = CASE
																			WHEN TITLE = 'Staff' THEN 's0001'
																			WHEN TITLE = 'Senior Staff' THEN 's0002'
																			WHEN TITLE = 'Assistant Engineer' THEN 'e0001'
																			WHEN TITLE = 'Engineer' THEN 'e0002'
																			WHEN TITLE = 'Senior Engineer' THEN 'e0003'
																			WHEN TITLE = 'Technique Leader' THEN 'e0004'
																			WHEN TITLE = 'Manager' THEN 'm0001'
																			ELSE NULL -- Handle any other cases as needed

															END;

-- Copy data from CSV files
COPY DEPARTMENTS
FROM 'C:/Users/Administrator/Downloads/sql-challenge/EmployeeSQL/Starter_Code/data/departments.csv'
DELIMITER ',' CSV HEADER;

COPY EMPLOYEES
FROM 'C:/Users/Administrator/Downloads/sql-challenge/EmployeeSQL/Starter_Code/data/employees.csv'
DELIMITER ',' CSV HEADER;

COPY DEPT_EMP
FROM 'C:/Users/Administrator/Downloads/sql-challenge/EmployeeSQL/Starter_Code/data/dept_emp.csv'
DELIMITER ',' CSV HEADER;

COPY DEPT_MANAGERS
FROM 'C:/Users/Administrator/Downloads/sql-challenge/EmployeeSQL/Starter_Code/data/dept_manager.csv'
DELIMITER ',' CSV HEADER;

COPY SALARIES
FROM 'C:/Users/Administrator/Downloads/sql-challenge/EmployeeSQL/Starter_Code/data/salaries.csv'
DELIMITER ',' CSV HEADER;