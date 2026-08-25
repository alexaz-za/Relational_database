select first_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
on worker.manager_id = manager.employee_id
where worker.last_name = 'Lorentz';

SELECT e.last_name, d.department_id,
d.department_name
FROM employees e right OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT e.last_name, d.department_id,
d.department_name
FROM employees e full OUTER JOIN departments d
ON e.department_id = d.department_id;

select department_name, state_province
from departments d left outer join locations l
on d.location_id = l.location_id
where department_id in (10,20,30,40);

select employee_id, first_name || ' ' || last_name fullname, e.job_id, min_salary
from employees e join jobs j
on e.job_id = j.job_id
where substr(job_title,1,1) not in ('A','P')
-- where job_title not like 'A%' and job_title not like 'P%' -- percent need Like, Like need column_name
and min_salary = 4000;

--chapter 7

select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');
                
SELECT last_name
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE employee_id = 149);
                
select last_name, job_id, salary
from employees
where salary < (select avg(salary)
                from employees);
                
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = (select job_id
                from employees
                where employee_id = 141)
and salary > (select salary
              from employees
              where employee_id = 141);
              
SELECT last_name, job_id, salary
FROM employees
WHERE (job_id,salary) = (select job_id,salary
                from employees
                where employee_id = 141);
                
SELECT last_name,job_id, salary
FROM employees
WHERE salary = (select min(salary)
                from employees);
                
select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                      from employees
                      where department_id = 50);
                      
select job_id, avg(salary)
from employees
group by job_id
having avg(salary) = (select min(avg(salary))
                      from employees
                      group by job_id);
                      
select employee_id, last_name
from employees
where salary in (select min(salary)
                from employees
                group by department_id);
                
select last_name, salary, department_id
from employees
where salary in (select min(salary)
                from employees
                group by department_id);
                
select employee_id, last_name
from employees
where department_id in (select department_id
                       from employees
                       where last_name like '%u%');
                       
select employee_id, last_name, job_id, salary
from employees
where job_id <> 'IT_PROG'
and salary < any (select salary
                from employees
                where job_id = 'IT_PROG');

select employee_id, last_name, job_id, salary
from employees
where job_id <> 'IT_PROG'
and salary < all (select salary
                from employees
                where job_id = 'IT_PROG');

select first_name || '  ' || last_name fullname, to_char(salary,'99,999') salary, e.job_id, job_title
from employees e join jobs j
on e.job_id = j.job_id
where salary > (select avg(salary)
                from employees)
and job_title not like '%t%';