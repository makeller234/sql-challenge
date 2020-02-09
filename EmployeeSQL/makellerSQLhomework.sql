-- -- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- -- Link to schema: https://app.quickdatabasediagrams.com/#/d/lr7380
-- -- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- CREATE TABLE "departments" (
--     "dept_no" varchar(30)   NOT NULL,
--     "dept_name" varchar(30)   NOT NULL,
--     CONSTRAINT "pk_departments" PRIMARY KEY (
--         "dept_no"
--      )
-- );

-- CREATE TABLE "dept_emp" (
--     "emp_no" integer   NOT NULL,
--     "dept_no" varchar(30)   NOT NULL,
--     "from_date" varchar(30)   NOT NULL,
--     "to_date" varchar(30)   NOT NULL
-- );

-- CREATE TABLE "dept_manager" (
--     "dept_no" varchar(30)   NOT NULL,
--     "emp_no" integer   NOT NULL,
--     "from_date" varchar(30)   NOT NULL,
--     "to_date" varchar(30)   NOT NULL
-- );

-- CREATE TABLE "employees" (
--     "emp_no" integer   NOT NULL,
--     "birth_date" varchar(30)   NOT NULL,
--     "first_name" varchar(30)   NOT NULL,
--     "last_name" varchar(30)   NOT NULL,
--     "gender" varchar(30)   NOT NULL,
--     "hire_date" varcahr(30)   NOT NULL,
--     CONSTRAINT "pk_employees" PRIMARY KEY (
--         "emp_no"
--      )
-- );

-- CREATE TABLE "salaries" (
--     "emp_no" integer   NOT NULL,
--     "salary" integer   NOT NULL,
--     "from_date" varchar(30)   NOT NULL,
--     "to_date" varchar(30)   NOT NULL
-- );

-- CREATE TABLE "titles" (
--     "emp_no" integer   NOT NULL,
--     "title" varchar(30)   NOT NULL,
--     "from_date" varchar(30)   NOT NULL,
--     "to_date" varchar(30)   NOT NULL
-- );

-- ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "departments" ("dept_no");

-- ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "departments" ("dept_no");

-- ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");


--1
select employees.emp_no, last_name, first_name, gender, salaries.salary 
from employees
join salaries on employees.emp_no = salaries.emp_no;

--2
select emp_no, last_name, first_name, hire_date
from employees
where hire_date like '1986%';

--3 doesn't work
select employees.emp_no, employees.last_name, employees.first_name, dept_manager.dept_no, departments.dept_name, dept_manager.from_date, dept_manager.to_date
from employees
inner join dept_manager on employees.emp_no = dept_manager.emp_no
inner join departments on dept_mananger.dept_no = departments.dept_no;

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
group by last_name;
