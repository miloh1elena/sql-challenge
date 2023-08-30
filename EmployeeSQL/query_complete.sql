-- Query 1: List employee number, last name, first name, gender, and salary for each employee.

SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	E.GENDER,
	S.SALARY
FROM EMPLOYEES E
JOIN SALARIES S ON E.EMP_NO = S.EMP_NO;

-- Query 2: List first name, last name, and hire date for employees hired in 1986.

SELECT FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM EMPLOYEES
WHERE EXTRACT(YEAR
														FROM HIRE_DATE) = 1986;

-- Query 3: List department number, department name, manager's employee number, last name, and first name.

SELECT D.DEPT_NO,
	D.DEPT_NAME,
	DM.EMP_NO AS MANAGER_EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM DEPARTMENTS D
JOIN DEPT_MANAGERS DM ON D.DEPT_NO = DM.DEPT_NO
JOIN EMPLOYEES E ON DM.EMP_NO = E.EMP_NO;

-- Query 4: List employee number, last name, first name, department number, and department name.

SELECT DE.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	DE.DEPT_NO,
	D.DEPT_NAME
FROM DEPT_EMP DE
JOIN EMPLOYEES E ON DE.EMP_NO = E.EMP_NO
JOIN DEPARTMENTS D ON DE.DEPT_NO = D.DEPT_NO;

-- Query 5: List first name, last name, and gender of employees named Hercules whose last name starts with 'B'.

SELECT FIRST_NAME,
	LAST_NAME,
	GENDER
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules'
	AND LAST_NAME LIKE 'B%';

-- Query 6: List employee number, last name, and first name of employees in the 'Sales' department.

SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM EMPLOYEES E
JOIN DEPT_EMP DE ON E.EMP_NO = DE.EMP_NO
JOIN DEPARTMENTS D ON DE.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NAME = 'Sales';

-- Query 7: List employee number, last name, first name, and department name of employees in 'Sales' and 'Development' departments.

SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	D.DEPT_NAME
FROM EMPLOYEES E
JOIN DEPT_EMP DE ON E.EMP_NO = DE.EMP_NO
JOIN DEPARTMENTS D ON DE.DEPT_NO = D.DEPT_NO
WHERE D.DEPT_NAME IN ('Sales',
																							'Development');

-- Query 8: List the frequency counts of last names in descending order.

SELECT LAST_NAME,
	COUNT(*) AS FREQUENCY
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY FREQUENCY DESC;