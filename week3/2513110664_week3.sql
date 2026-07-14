--2513110664 anawat sudla
--1
select department_id, concat(concat(department_name,' '),location_id) info
from departments
where department_id >= '&dept';

--2
select job_id, job_title, &col
from jobs
where job_id = '&job';

--3
select country_name
from countries
--where country_name like '__i%';
where instr(country_name, 'i') = 3;

--4
select concat(concat(first_name,' '),last_name) emp_name,salary,commission_pct
from employees
where commission_pct between 0.2 and 0.4
and instr(first_name, 'e') !=0 and instr(last_name, 'e') !=0
order by commission_pct;

--5
select location_id, street_address || ' ' || state_province || ' ' || country_id address
from locations
where state_province is not null;
