-- --Drop old tables (if required)
-- DROP TABLE IF EXISTS titles, departments, employees, dept_emp, dept_manager, salaries; 

--Create tables
--#1 Titles
CREATE TABLE titles (
    title_id CHAR(5) NOT NULL,
    title VARCHAR(40) NOT NULL,
    PRIMARY KEY (title_id)
);

--#2 Departments
CREATE TABLE departments (
    dept_no CHAR(4) NOT NULL, 
    dept_name VARCHAR(40) NOT NULL,
    PRIMARY KEY (dept_no)
);

--#3 Employees
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id CHAR(5) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--#4 Department Employees (junction table)
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--#5 Department Managers (junction table)
CREATE TABLE dept_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--#6
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Imported each CSV file into the corresponding SQL table.