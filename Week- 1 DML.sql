## *******************************
## DML - Data Manipulation Language
## *******************************

CREATE SCHEMA learning;

USE learning;

###
### INSERT
###

CREATE TABLE employee 
(
	employee_id INT NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
    gender char(1) NOT NULL,
	hire_date DATE NOT NULL,
	salary INT,
	department_id INT DEFAULT 10,
	PRIMARY KEY (employee_id)
);

DESCRIBE EMPLOYEE;

INSERT INTO employee (employee_id, first_name, last_name, gender, hire_date, salary, department_id)
VALUES (151, 'David','Bernstein','M','1997-03-24',9500,80);

INSERT INTO employee VALUES 
(152, 'Peter','Hall','M','1997-08-20',9000,80);

INSERT INTO employee VALUES 
(153, 'Christopher','Olsen','M','1998-03-30',8000,80),
(154, 'Nanette','Cambrault','F','1998-12-09',7500,80);

SELECT * FROM employee;

INSERT INTO employee (employee_id, first_name, last_name, gender, hire_date) 
VALUES (155, 'Oliver','Tuvault','M','1999-11-23');

SELECT * FROM employee;

INSERT INTO employee VALUES 
(156, 'Janette','King','F','1996-01-30',10000,80),
(157, 'Patrick','Sully','M','1996-03-04',9500,80),
(158, 'Allan','McEwen','M','1996-08-01',9000,80),
(159, 'Lindsey','Smith','F','1997-03-10',8000,80),
(160, 'Louise','Doran','F','1997-12-15',7500,80),
(161, 'Sarath','Sewall','M','1998-11-03',7000,80),
(162, 'Clara','Vishney','F','1997-11-11',10500,80),
(163, 'Danielle','Greene','F','1999-03-19',9500,80),
(164, 'Mattea','Marvins','F','2000-01-24',7200,80),
(165, 'David','Lee','M','2000-02-23',6800,80),
(166, 'Sunder','Ande','M','2000-03-24',6400,80),
(167, 'Amit','Banda','M','2000-04-21',6200,80),
(168, 'Lisa','Ozer','F','1997-03-11',11500,80),
(169, 'Harrison','Bloom','M','1997-03-11',NULL,NULL);

SELECT * FROM EMPLOYEE;


# INSERT using SELECT

CREATE TABLE temp_qualified_employee 
(
	employee_id INT NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	PRIMARY KEY (employee_id)
);


INSERT into temp_qualified_employee
SELECT employee_id, first_name, last_name FROM employee;

SELECT * FROM temp_qualified_employee;


###
###  UPDATE
###

SELECT * FROM employee;

ALTER TABLE employee
ADD COLUMN eligible_allowance INT NULL;

SELECT * FROM employee;

UPDATE employee
SET eligible_allowance = salary * 0.1;

SELECT * FROM employee;

UPDATE employee
SET first_name = 'Pete', last_name = 'Hale'
WHERE employee_id = 152;

SELECT * FROM employee;


###
### DELETE
###

DELETE FROM employee
WHERE employee_id = 151;

SELECT * from employee;

DELETE FROM employee;

SELECT * from employee;

DROP TABLE employee;
DROP TABLE temp_qualified_employee;


###  END