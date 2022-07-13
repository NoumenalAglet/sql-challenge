--Data Analysis

--(1) List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

--(2) List first name, last name, and hire date for employees who were hired in 1986.
-- Checking if the last four digits in hire_date where equal to that year.
SELECT first_name, last_name, hire_date
FROM employees
WHERE RIGHT (hire_date,4) = '1986';

--(3) For all managers of each department, list their: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e ON e.emp_no = dm.emp_no;

--(4) List the department of each employee with: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

--(5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- Using the wildcard 'B%' to find last names starting with 'B'
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY e.last_name;

--(6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--(7) All employees in Sales and Development departments, inc. employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--(8) In desc order, list the frequency count of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
