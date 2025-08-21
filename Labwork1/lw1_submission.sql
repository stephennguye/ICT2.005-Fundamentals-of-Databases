-- 1. Write a SQL statement to create a new database name “Company”
CREATE DATABASE Company;

-- 2. Write a SQL statement to create to set the default working database to “Company”
USE Company;

-- 3. Write SQL statements to define tables of “Company” databases with contraints and columns illustrated by igures below

-- DEPARTMENT Table 
CREATE TABLE Department (
    Dname VARCHAR(50),
    Dnumber INT PRIMARY KEY,
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE
);

-- Create EMPLOYEE Table
CREATE TABLE Employee (
    Fname VARCHAR(50),
    Minit CHAR(1),
    Lname VARCHAR(50),
    Ssn CHAR(9) PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    Super_ssn CHAR(9),
    Dno INT,
    Partner_ssn CHAR(9),  -- Added as requested in step 4
    FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn),
    FOREIGN KEY (Dno) REFERENCES Department(Dnumber)
);

-- Now, add the foreign key constraint in DEPARTMENT referencing EMPLOYEE
ALTER TABLE Department
ADD CONSTRAINT fk_manager_ssn FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn);

-- Create DEPT_LOCATIONS Table
CREATE TABLE Dept_Locations (
    Dnumber INT,
    Dlocation VARCHAR(50),
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

-- Create PROJECT Table
CREATE TABLE Project (
    Pname VARCHAR(50),
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(50),
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES Department(Dnumber)
);

-- Create WORKS_ON Table
CREATE TABLE Works_On (
    Essn CHAR(9),
    Pno INT,
    Hours DECIMAL(3, 1),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES Employee(Ssn),
    FOREIGN KEY (Pno) REFERENCES Project(Pnumber)
);

-- Create DEPENDENT Table
CREATE TABLE Dependent (
    Essn CHAR(9),
    Dependent_name VARCHAR(50),
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(50),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES Employee(Ssn)
);
-- 4. Add column Partner_ssn to the table EMPLOYEE
ALTER TABLE Employee
ADD Partner_ssn CHAR(9);

-- 5. Insert Sample Data

-- Insert into EMPLOYEE
INSERT INTO Employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES ('John', 'A', 'Doe', '123456789', '1985-01-15', '123 Main St', 'M', 60000, NULL, 1);

-- Insert into DEPARTMENT
INSERT INTO Department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Research', 1, '123456789', '2020-01-01');

-- Insert into DEPT_LOCATIONS
INSERT INTO Dept_Locations (Dnumber, Dlocation)
VALUES (1, 'New York');

-- Insert into PROJECT
INSERT INTO Project (Pname, Pnumber, Plocation, Dnum)
VALUES ('ProjectX', 1, 'New York', 1);

-- Insert into WORKS_ON
INSERT INTO Works_On (Essn, Pno, Hours)
VALUES ('123456789', 1, 20);

-- Insert into DEPENDENT
INSERT INTO Dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES ('123456789', 'Jane Doe', 'F', '1987-03-25', 'Spouse');

-- View Table Structures
DESCRIBE Employee;
DESCRIBE Department;
DESCRIBE Dept_Locations;
DESCRIBE Project;
DESCRIBE Works_On;
DESCRIBE Dependent;

-- View Data in Tables
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Dept_Locations;
SELECT * FROM Project;
SELECT * FROM Works_On;
SELECT * FROM Dependent;

-- 6. Delete Tables

DROP TABLE IF EXISTS Dependent;
DROP TABLE IF EXISTS Works_On;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Dept_Locations;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Employee;
