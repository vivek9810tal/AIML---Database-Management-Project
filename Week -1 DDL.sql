## *******************************
##  DDL - Data Definition Language 
## *******************************

CREATE SCHEMA learning;

USE learning;

###
### CREATE table
###

CREATE TABLE employee 
(	employee_id INT PRIMARY KEY,
	emp_name VARCHAR(50) NOT NULL,
	email varchar(50)
);

DESCRIBE employee;

DROP TABLE employee;

# Unique key and Default
CREATE TABLE employee 
(	employee_id INT PRIMARY KEY,
	emp_name VARCHAR(50) NOT NULL,
	email varchar(50),
    national_identity_number VARCHAR(20) NOT NULL UNIQUE,
	salary INT NOT NULL, 
    department_id INT DEFAULT 1
	);

DESCRIBE employee;

INSERT INTO employee (employee_id, emp_name, email, national_identity_number, salary, department_id)
VALUES 	(1, 'abc', 'abc@company.com', 'A-123', 10000, 20);

SELECT * FROM employee;

INSERT INTO employee (employee_id, emp_name, email, national_identity_number, salary, department_id)
VALUES 	(2, 'bcd', 'bcd@company.com', 'A-123', 10000, 20);

INSERT INTO employee (employee_id, emp_name, email, national_identity_number, salary, department_id)
VALUES 	(2, NULL, 'bcd@company.com', 'A-234', 10000, 20);

INSERT INTO employee (employee_id, emp_name, email, national_identity_number, salary)
VALUES 	(2, 'bcd', 'bcd@company.com', 'A-234', 10000);

SELECT * FROM employee;

DROP TABLE employee;

# Composite Primary key
CREATE TABLE marksheet (	
student_id   		INT NOT NULL,	
subject 			varchar(20) NOT NULL,	
attempt_number 	INT NOT NULL,    
marks_scored 		INT NOT NULL,
total_marks 		INT NOT NULL,
PRIMARY KEY (student_id, subject, attempt_number) );

DESCRIBE marksheet;

# Define Foreign key
CREATE TABLE department (    
department_id INT PRIMARY KEY,    
department_name VARCHAR(20) NOT NULL);

CREATE TABLE employee (	
employee_id 		INT,	
emp_name 		VARCHAR(50) NOT NULL,	
department_id 	INT NOT NULL,    
PRIMARY KEY (employee_id),    
FOREIGN KEY (department_id) references department (department_id));

DESCRIBE department;
DESCRIBE employee;

DROP TABLE employee;
DROP TABLE department;


# "CHECK" to validate values

CREATE TABLE employee (	
employee_id 	INT PRIMARY KEY,	
emp_name 	VARCHAR(50) NOT NULL,    
emp_type   	CHAR(1) CHECK (emp_type = 'R' or emp_type = 'C'),    
salary INT NOT NULL);

INSERT INTO employee 
VALUES (1, 'abc', 'R', 1000);

INSERT INTO employee 
VALUES (2, 'bcd', 'C', 1000);

INSERT INTO employee 
VALUES (3, 'cde', 'A', 1000);

DROP TABLE employee;

# "CHECK" to validate values (additional example)

CREATE TABLE employee 
(
	employee_id INT PRIMARY KEY,
	emp_name VARCHAR(50) NOT NULL,
    emp_type CHAR(1),
    salary INT NOT NULL,
    CONSTRAINT c1_emp_type CHECK (emp_type = 'R' or emp_type = 'C'),
    CONSTRAINT c1_salary CHECK (salary>1000)
);

INSERT INTO employee 
VALUES (1, 'abc', 'R', 1001);

INSERT INTO employee 
VALUES (2, 'bcd', 'R', 1000);

DROP TABLE employee;


###
### ALTER TABLE
###

CREATE TABLE employee 
(
	employee_id INT PRIMARY KEY,
	emp_name VARCHAR(50) NOT NULL,
	email varchar(50),
    national_identity_number VARCHAR(20) NOT NULL UNIQUE,
	salary INT NOT NULL, 
    department_id INT DEFAULT 1
	);

INSERT INTO employee ( employee_id, emp_name, email,  national_identity_number, salary,  department_id)
VALUES 	(1, 'abc', 'abc@company.com', 'A-123', 10000, 10);


SELECT * FROM employee;

ALTER TABLE employee
ADD COLUMN career_bandd CHAR(2) NOT NULL DEFAULT 'AA';

SELECT * FROM employee;

ALTER TABLE employee
RENAME COLUMN career_bandd TO career_band;

ALTER TABLE employee
MODIFY COLUMN career_band CHAR(2) NULL;

DESCRIBE employee; 

ALTER TABLE employee
DROP COLUMN career_band;

DESCRIBE employee;

SELECT * FROM employee;

DROP TABLE employee;


# ALTER TABLE - PRIMARY KEY

CREATE TABLE employee 
(
	employee_id INT NOT NULL,
	emp_name VARCHAR(50) NOT NULL PRIMARY KEY,
	email varchar(50),
    national_identity_number VARCHAR(20) NOT NULL UNIQUE,
	salary INT NOT NULL, 
    department_id INT DEFAULT 1
	);

DESCRIBE employee;

ALTER TABLE employee
DROP PRIMARY KEY;

ALTER TABLE employee
ADD PRIMARY KEY (employee_id);

DESCRIBE employee;

###
### TRUNCATE TABLE
###

# Insert rows to learn TRUNCATE
INSERT INTO employee ( employee_id, emp_name, email,  national_identity_number, salary,  department_id)
VALUES 	(1, 'abc', 'abc@company.com', 'A-123', 10000, 10);

INSERT INTO employee (employee_id, emp_name, email, national_identity_number, salary,  department_id)
VALUES 	(2, 'bcd', 'bcd@company.com', 'A-234', 10000, 10);

SELECT * FROM employee;

TRUNCATE TABLE employee;

SELECT * FROM employee;


###
### DROP 
###

DROP TABLE employee;

DROP DATABASE learning;

### END 
