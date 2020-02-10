--1
select employees.emp_no, last_name, first_name, gender, salaries.salary 
from employees
join salaries on employees.emp_no = salaries.emp_no;

--2
select emp_no, last_name, first_name, hire_date
from employees
where hire_date like '1986%';

--3
select dept_manager.emp_no, last_name, first_name, departments.dept_no, dept_name, to_date, from_date
from dept_manager
inner join employees on dept_manager.emp_no = employees.emp_no
inner join departments on dept_manager.dept_no = departments.dept_no;

--4
select employees.emp_no, last_name, first_name, dept_name 
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no;

--5
select last_name, first_name 
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6
select employees.emp_no, last_name, first_name, dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales';

--7
select employees.emp_no, last_name, first_name, dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

--8
select last_name, count(last_name) as "Last Name Count"
from employees
group by last_name
order by last_name desc;