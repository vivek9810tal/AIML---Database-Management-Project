CREATE SCHEMA IF NOT EXISTS learning_1; 

USE learning_1;


CREATE table IF NOT EXISTS employee (
emp_id int NOT NULL,
emp_name varchar(25) );

TRUNCATE TABLE employee;

# Following is needed to set Auto commit off. Otherwise, Commit is done after each SQL statement by default
SET autocommit = 0;


### 
### COMMIT and ROLLBACK
### 
SELECT * FROM employee;

INSERT INTO employee 
VALUES (1, "emp1") , (2, "emp2");

SELECT * FROM employee;

COMMIT;   # The Inserted rows are committed

INSERT INTO employee 
VALUES (3, "emp3") ;

UPDATE employee 
SET emp_name = 'Second Employee'
WHERE emp_id = 2;

SELECT * FROM employee;

ROLLBACK;

SELECT * FROM employee;  # Any Insert / Update after Commmit are rolledback

# End of Commit and Rollback


### 
### SAVEPOINT
### 

TRUNCATE TABLE employee;

SELECT * FROM employee;

INSERT INTO employee 
VALUES (1, "emp A1") , (2, "emp A2");

SELECT * FROM employee;

SAVEPOINT SAVE_A;   # A named Savepoint is defined

INSERT into employee 
values (3, "emp B1") , (4, "emp B2");

SELECT * FROM employee; 

ROLLBACK to SAVE_A;    # Changes made after SAVE_A are rolledback

SELECT * FROM employee; 

# End of Savepoint

# Set the autocommit back to the Default value of 1
SET autocommit = 1;

### END