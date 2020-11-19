SELECT * FROM "Departments";
SELECT * FROM "Titles";
SELECT * FROM "employees";
SELECT * FROM "dept_emp";
SELECT * FROM "dept_manager";
SELECT * FROM "Salaries";

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "employees" e
JOIN "Salaries" s 
ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

-- 3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM "Departments" as d
JOIN dept_manager
ON d.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, d.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments" as d
ON dept_emp.dept_no = d.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, d.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments" as d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, d.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN "Departments" as d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;