SELECT *
FROM departments;

select * from jobs;

SELECT department_id, location_id
FROM departments;

SELECT employee_id,first_name,last_name
from employees;

SELECT first_name, salary, salary+300
FROM employees;

SELECT first_name, salary, 12*salary+100
FROM employees;

SELECT first_name, salary, 12*(salary+100)
FROM employees;

select job_id,job_title,min_salary ms,
min_salary*1.05 "Min Salary"
from jobs;

SELECT last_name,job_id,salary,commission_pct,
12*salary*commission_pct
FROM employees;

SELECT last_name AS name, commission_pct comm
FROM employees;

SELECT last_name "Name",
salary*12 "Annual Salary"
FROM employees;

select employee_id code,first_name "Emp Name",salary*12 "Annual Salary",commission_pct com
from employees;

SELECT first_name, last_name,
first_name || ' ' ||last_name "Name"
FROM employees;

select location_id,street_address,postal_code,
city || ' ' || state_province city
from locations;

select last_name || ': 1 Month salary = ' || salary monthly
from employees;

select department_name || ' Department''s Manager Id:' || manager_id "Dept Manager"
from departments;

SELECT distinct department_id, job_id
FROM employees;

