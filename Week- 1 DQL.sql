## *************************
## DQL - Data Query Language
## *************************

##
## **  NOTE  **
##
## **  Before using this file, please create schema, tables and load data 
## **  using the file: 1_hr-schema-mysql 

USE hr;

### SELECT and FROM 

SELECT employee_id, first_name, last_name, hire_date 
FROM employees;

SELECT employee_id, salary, salary*12
FROM employees;

# Column Alias
SELECT employee_id, salary, salary*12 AS annual_salary
FROM employees;

# Distinct

SELECT DISTINCT department_id, job_id
FROM Employees;

# Table Alias
SELECT e.employee_id, e.first_name, e.last_name, e.hire_date 
FROM employees e;


### WHERE clause

SELECT employee_id, first_name, last_name 
FROM employees
WHERE employee_id = 100;


SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name = 'David';

SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date < '2000-01-01';

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id <> 100;


SELECT employee_id, first_name, last_name, department_id, salary as monthly_Salary, salary*12 as annual_salary
FROM employees
WHERE department_id = 90 
	AND salary * 12 > 10000;

SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees
WHERE department_id = 60
	AND salary >= 9000 
    AND salary <= 10000;
 
 
SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees
WHERE department_id = 60
	AND salary BETWEEN 9000 AND 10000;
    

SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees
WHERE (department_id = 60 OR department_id = 80)
	AND salary BETWEEN 9000 AND 10000;

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id = 20 
	OR department_id =  30
    OR department_id = 60;

# IN and NOT IN
SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id IN (20, 30, 60);

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id NOT IN (20, 30, 60);


# Understand NULL values
SELECT employee_id, first_name, last_name, manager_id
FROM employees
WHERE manager_id <> 100;

SELECT employee_id, first_name, last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT employee_id, first_name, last_name, manager_id
FROM employees
WHERE manager_id IS NOT NULL;


# LIKE

SELECT employee_id, first_name, last_name
FROM Employees
WHERE first_name LIKE 'da%';

SELECT employee_id, first_name, last_name
FROM Employees
WHERE first_name LIKE '%er';

SELECT employee_id, first_name, last_name
FROM Employees
WHERE first_name LIKE '%v%';

SELECT employee_id, first_name, last_name
FROM Employees
WHERE first_name LIKE '_e%';