select *
from employees
where department_id = 90;

SELECT employee_id, last_name, job_id, department_id dep --เปลียนชื่อได้แต่เอาชื่อที่เปลี่ยนไปใช้ใน where ไม่ได้
FROM employees
WHERE department_id = 90;

select job_id,job_title,max_salary*12 as max_salary
from jobs
where max_salary*12 = 240960;

SELECT last_name, job_id, department_id
FROM employees
WHERE last_name = 'Whalen';

select last_name
from employees
where hire_date = '17-feb-04';

SELECT last_name, salary
FROM employees
WHERE salary <= 3000;

select first_name, hire_date
from employees
where hire_date < '1-june-04';

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500;

select last_name
from employees
where last_name between 'King' and 'Smith';

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100,101,201);
/*where manager_id = 100 
or manager_id = 101
or manager_id = 201;*/

select employee_id, manager_id, department_id
from employees
where last_name in ('Hartstein','Vargas');

select 'Dep:' || department_id || ' emp''s id:' ||employee_id || ' is ' || last_name || ' Salary =' || salary as "Employee Detail" --alies
from employees
where department_id in (10,20); -- not in

SELECT first_name
FROM employees
WHERE first_name LIKE '__a%'; -- % กี่ตัวก็ได้ , _o% ตัวที่สอง , %s ด้านหลังตัว s

select last_name, hire_date
from employees
where hire_date like '%03'; -- not like
--where hire_date between '1-jan-03' and '31-dec-03';

SELECT employee_id, last_name, job_id
FROM employees
WHERE job_id LIKE 'SA\_%' ESCAPE '\'; --job_id LIKE 'SA_%'

SELECT last_name, manager_id
FROM employees
WHERE manager_id IS not NULL; -- null

select last_name, job_id, commission_pct
from employees
where commission_pct is null;

SELECT *
FROM employees
WHERE ROWNUM <= 3;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > 10000
AND job_id LIKE '%MAN%'; -- ให้ job_id มีคำว่า man , ลงท้าย man = '%man'

select last_name, job_id, commission_pct
from employees
where commission_pct is null
and job_id like 'AD\_%' escape '\';

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date desc; --asc เรียง colums , ใช้ alies ได้

select last_name, department_id
from employees
where department_id in (20,50)
order by 1; --last_name

SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;

SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title';

SELECT employee_id, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;

select job_id,min_salary
from jobs
where &condition_user
order by &column_to_order;

SELECT employee_id, last_name, job_id,
&&column_name
FROM employees
ORDER BY &column_name;

undefine column_name; --clean value of column_name

select employee_id,last_name,job_id,&&column_name
from employees 
where &column_name is not null
ORDER BY &column_name desc;

DEFINE employee_num = 200;
undefine employee_num;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;