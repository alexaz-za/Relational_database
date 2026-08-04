--2513110664 anawat sudla
-- week 5
--1
select job_title, 'Min salary ' || to_char(min_salary,'99,999.00') min, 'Min salary with bouns ' || to_char((min_salary+(min_salary * 0.07)),'99,999.00') "Min with bonus"
from jobs;

--2
select employee_id, first_name, last_name, to_char(add_months(next_day(hire_date, 'friday'), 6), 'ddth Mon YYYY') "Performance Test Date"
from employees;

--3
select department_id, department_name, 
case location_id when 1700 then 'Temporary shutdown'
                when 1800 then 'Schedule for maintenance'
                when 2400 then 'Offline for maintenance'
                else 'Online'
        end "Status"
from departments;

--4
select distinct country_id, count(country_id) "Location in Country"
from locations
where state_province is not null
group by country_id
order by 2 desc;

-- week 6
--1
select employee_id, start_date, end_date, job_id
from job_history
where department_id in (50,80);

--2
select location_id, street_address, country_id, postal_code
from locations
where street_address Between '1' and '9'
and postal_code is null;

--3
select location_id, street_address, city, country_name, region_name
from locations l join countries c
on l.country_id = c.country_id
join regions r
on c.region_id = r.region_id
where r.region_id = 1;

--4
select jh.employee_id, first_name || ' ' || substr(last_name, 1,2) name, job_title, start_date, end_date
from employees e join job_history jh
on e.employee_id = jh.employee_id
join jobs j
on jh.job_id = j.job_id
where jh.department_id in (110,80,50)
order by employee_id;

--5
select e.employee_id, j.job_title, to_char(jh.start_date, 'Dy ddth MON YYYY') start_date
from employees e join job_history jh
on e.employee_id = jh.employee_id
join jobs j
on jh.job_id = j.job_id
where substr(jh.start_date, 4,3) = upper('&MON')
order by employee_id;