-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "dept_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

SELECT * FROM "Departments";

CREATE TABLE "titles" (
    "title_id" VARCHAR(255)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL
	
);

SELECT * FROM "titles";

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

SELECT * FROM "employees";

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

SELECT * FROM "salaries";

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL
);

SELECT * FROM "dept_emp";

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL
);

SELECT * FROM "dept_manager";

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no,employees.first_name,employees.last_name,employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON 
employees.emp_no=salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name,last_name,hire_date
FROM employees
WHERE DATE_PART('year',hire_date) = 1986;

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.

SELECT Departments.dept_no, Departments.dept_name, employees.emp_no, employees.first_name,employees.last_name
FROM departments
JOIN dept_manager
ON Departments.dept_no = dept_manager.dept_no
JOIN employees 
ON dept_manager.emp_no = employees.emp_no

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.first_name, employees.last_name,Departments.dept_name
FROM employees
INNER JOIN departments ON 
employees.emp_no = departments.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is
-- "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no,employees.first_name,employees.last_name,Departments.dept_name
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp.no
JOIN departments
ON dept_manager.dept_name = deparments.dept_name
WHERE dept_name = "Sales"


-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT employees.emp_no,employees.first_name,employees.last_name,Departments.dept_name
FROM employees
JOIN dept_manager
ON employees.emp_no = dept_manager.emp.no
JOIN departments
ON dept_manager.dept_name = deparments.dept_name
WHERE dept_name = 'Sales' AND dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

SELECT last_name,
COUNT (last_name) AS "surname"
FROM employees



