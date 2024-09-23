DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
title_id CHAR(5) PRIMARY KEY,
title VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
emp_no INT PRIMARY KEY,
emp_title_id CHAR(5) NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(50) NOT NULL,
sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
hire_date DATE NOT NULL
);

CREATE TABLE departments (
dept_no CHAR(4) PRIMARY KEY,
dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE dept_manager (
dept_no CHAR(4),
emp_no INT,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
emp_no INT NOT NULL,
dept_no CHAR(4) NOT NULL,
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
emp_no INT NOT NULL,
salary INT NOT NULL,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
