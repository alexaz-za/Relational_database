--2513110664 anawat sudla
--1
select country_id
from locations;

--2
select first_name || ' ' || last_name || ' email is ' || email || '@tni.ac.th' "Employees's Email"
from employees;

--3
select department_name, location_id, manager_id
from departments
where location_id between 1700 and 2500
and manager_id in (201,203);

--4
select street_address, state_province, location_id
from locations
where state_province is null
and location_id between 1100 and 2000;

--5
select last_name, salary, hire_date
from employees
where salary > 10000
and last_name like 'H%';

--6
select street_address, city, state_province, country_id
from locations
where city like 'S%'
and city not like '%o'
and state_province is not null;