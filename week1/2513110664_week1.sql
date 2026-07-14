--2513110664 anawat sudla
--1
select * from departments;
--2
select * from locations;
--3
select department_id || ' or ' || department_name name,'Location ID for this department is ' || location_id "Location ID"
from departments;
--4
select 'Emp Id: ' || employee_id || ' get salary ' || salary || ' per month x 12 = ' || salary*12 employee_salary
from employees;
--5
select country_id,'The country''s name is ' || country_name "Country's name"
from countries;
--6
select distinct country_id
from locations;