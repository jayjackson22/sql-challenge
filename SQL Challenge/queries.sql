create view data_analysis_1 as
 SELECT e.emp_no AS "employee number",
    e.last_name AS "last name",
    e.first_name AS "first name",
    e.sex,
    s.salary
   FROM employees e
     LEFT JOIN salaries s ON e.emp_no = s.emp_no;
	 
create view data_analysis_2 as
 SELECT employees.first_name AS "first name",
    employees.last_name AS "last name",
    employees.hire_date AS "hire date"
   FROM employees
  WHERE employees.hire_date >= '1986-01-01' AND employees.hire_date <= '1986-12-31';

create view data_analysis_3 as
 SELECT dm.dept_no AS "department number",
    d.dept_name AS "department name",
    e.emp_no AS "employee number",
    e.last_name AS "last name",
    e.first_name AS "first name"
   FROM employees e
     JOIN dept_manager dm ON e.emp_no = dm.emp_no
     JOIN departments d ON d.dept_no = dm.dept_no;

create view data_analysis_4 as
 SELECT e.emp_no AS "employee number",
    e.last_name AS "last name",
    e.first_name AS "first name",
    d.dept_name AS "department name"
   FROM employees e
     JOIN dept_emp de ON e.emp_no = de.emp_no
     JOIN departments d ON d.dept_no = de.dept_no;

create view data_analysis_5 as
 SELECT employees.first_name as "first name",
    employees.last_name as "last name",
    employees.sex
   FROM employees
  WHERE employees.first_name = 'Hercules' AND employees.last_name like 'B%';

create view data_analysis_6 as
 SELECT *
   FROM data_analysis_4
  WHERE "department name" = 'Sales';

create view data_analysis_7 as
 SELECT *
   FROM data_analysis_4
  WHERE "department name" = 'Sales' OR "department name" = 'Development';

create view data_analysis_8 as
 SELECT employees.last_name AS "last name",
    count(employees.last_name) AS count
   FROM employees
  GROUP BY last_name
  ORDER BY count DESC;