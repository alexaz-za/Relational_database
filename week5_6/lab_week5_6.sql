select to_char(avg(salary),'99,999.99') "Average Salary"
from employees
group by department_id;

SELECT department_id DEPT_ID, job_id,
    SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT department_id, COUNT(last_name)
FROM employees
group by department_id;

SELECT department_id, job_id, COUNT(last_name)
FROM employees
GROUP BY department_id, job_id;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id -- group by and having สลับกันได้
having AVG(salary) > 8000; -- if using group by condition must be having

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

select department_id, avg(salary)
from employees
group by department_id
having max(salary) > 12000;

select job_id, to_char(sum(salary),'999,999') payroll
from employees
where job_id like 'S%'
group by job_id
having sum(salary) > 13000
--and job_id like 'S%'
order by job_id;

SELECT max(AVG(salary))
FROM employees
GROUP BY department_id;

--chapter 6

SELECT department_id, department_name,
location_id, city
FROM departments
NATURAL JOIN locations;

select location_id, street_address, city, state_province, country_name
from locations
natural join countries;

SELECT employee_id, last_name, location_id,
department_id
FROM employees JOIN departments
USING (department_id);

select last_name, department_id, department_name
from employees join departments
using (department_id);

SELECT l.city, d.department_name
FROM locations l JOIN departments d
USING (location_id)
WHERE d.location_id = 1400;

SELECT employee_id, last_name, -- column ถ้าชื่อไม่ซ้ำกันในตารางไม่ต้องใส่ตัวย่อก็ได้
d.department_name, city, country_name, region_name, job_title
FROM employees e JOIN departments d
ON e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
join countries c
on l.country_id = c.country_id
join regions r
on c.region_id = r.region_id
join jobs j
on e.job_id = j.job_id;

select department_id, department_name, d.location_id, city
from departments d join locations l
on d.location_id = l.location_id
where department_id in (20,50);