--2513110664 anawat sudla
-- week 8
--1
select first_name || ' ' || substr(last_name,1,2) || '.' name, to_char(salary,'99,999.00') salary
from employees
where salary > (select avg(salary)
                from employees);
                
--2
select employee_id, first_name || ' ' || last_name name
from employees
where employee_id in (select manager_id
                     from departments
                     where location_id in (select location_id
                                          from locations
                                          where country_id = 'UK'))
order by 1;


--3
select location_id, city || ' in ' || country_name info
from locations l join countries c
on l.country_id = c.country_id
where state_province is not null
and location_id in (select location_id
                      from departments
                      where department_name in ('Human Resource','Public Relations','Sales'));
                      
--4
select employee_id, last_name, job_id, salary
from employees
where manager_id like (select employee_id
                       from employees
                       where first_name like 'Eleni')                      
and salary < (select avg(salary) 
              from employees);
              
--5
select last_name, department_id
from employees
where department_id = (select department_id
                     from employees
                     where last_name = '&&Input_Lname')
and last_name <> '&Input_Lname';
                     
undefine Input_Lname;