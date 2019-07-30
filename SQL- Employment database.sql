drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table titles;
drop table salaries;

CREATE TABLE departments (
	dept_no varchar,
	dept_name VARCHAR
);

CREATE TABLE dept_emp (
	emp_no int,
	dept_no varchar,
	from_date date,
	to_date date
);

CREATE TABLE dept_manager (
	dept_no varchar,
	emp_no int,
	from_date date,
	to_date date
);

CREATE TABLE employees (
	emp_no int,
	birth_date date,
	first_name varchar,
	last_name varchar,
	gender VARCHAR,
	hire_date date
);

CREATE TABLE titles (
	emp_no int,
	title varchar,
	from_date date,
	to_date date
);

CREATE TABLE salaries (
	emp_no int,
	salary int,
	from_date date,
	to_date date
);

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no,employees.first_name,employees.last_name,employees.gender,salaries.salary
from employees
inner join salaries on
employees.emp_no=salaries.emp_no;

--2. List employees who were hired in 1986.
select first_name,last_name,hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name,employees.first_name, employees.last_name,dept_manager.emp_no,dept_manager.from_date,dept_manager.to_date
FROM dept_manager
left join employees on (employees.emp_no=dept_manager.emp_no)
left join departments on (departments.dept_no=dept_manager.dept_no)
;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no,employees.first_name,employees.last_name,departments.dept_name
from employees
left join dept_emp on(employees.emp_no=dept_emp.emp_no)
left join departments on (dept_emp.dept_no=departments.dept_no)	
;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name,last_name
from employees
where first_name='Hercules'
	and last_name like 'B%';
	
--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
select employees.first_name, employees.last_name,employees.emp_no,departments.dept_name
from employees
left join dept_emp on(employees.emp_no=dept_emp.emp_no)
left join departments on (departments.dept_no=dept_emp.dept_no)
where dept_name='Sales'	
;

--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
select employees.first_name, employees.last_name,employees.emp_no,departments.dept_name
from employees
left join dept_emp on(employees.emp_no=dept_emp.emp_no)
left join departments on (departments.dept_no=dept_emp.dept_no)
where dept_name in ('Sales','Development')	
;

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, count(last_name) FROM employees
group by last_name
ORDER BY count(last_name) desc;

