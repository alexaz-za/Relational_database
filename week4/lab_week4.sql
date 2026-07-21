SELECT last_name,
ROUND(MONTHS_BETWEEN(SYSDATE, hire_date))
AS MONTHS_WORKED
FROM employees;

select employee_id, hire_date, 
add_months(hire_date, 6) review,
next_day(hire_date, 'friday') "Next Hiredate", 
last_day(hire_date) "Last Hiredate", 
months_between(SYSDATE, hire_date) tenure
from employees
where months_between(SYSDATE, hire_date) > 280;

--chapter 4

SELECT employee_id,hire_date,
TO_CHAR(hire_date, 'Dy dd Month/Yyyy') Month_Hired
FROM employees
WHERE last_name = 'Higgins';

SELECT last_name,
TO_CHAR(hire_date, 'DD Month YYYY') hire_date1,
TO_CHAR(hire_date, 'fmDD Month YYYY') AS HIREDATE --fm mean format each model
FROM employees;

select last_name, to_char(hire_date, 'fmDdspth "of" Month yyyy fmHH12:MI:SS AM') hiredate
from employees;

SELECT salary, TO_CHAR(salary, '$99,999.00') SALARY,TO_CHAR(salary, 'L99,999.00') sal
FROM employees
WHERE last_name = 'Ernst';

SELECT last_name,
UPPER(CONCAT(SUBSTR(last_name,1,8),'_US'))
AS "Last name"
FROM employees
WHERE department_id = 60;

select to_char(next_day(add_months(hire_date,6),'friday'),'fmDay,Month ddth,yyyy') "Next 6 month Review"
from employees;

SELECT last_name, salary, commission_pct,
NVL(commission_pct,0) NVL_COMMISSION_PCT,
(salary*12) + (salary*12*NVL(commission_pct,0)) AN_SAL
FROM employees;

SELECT last_name, salary, commission_pct,
NVL2(commission_pct, salary*commission_pct, salary) AS INCOME
FROM employees
WHERE department_id IN (50, 80);

SELECT first_name, LENGTH(first_name) "expr1",
last_name, LENGTH(last_name) "expr2",
NULLIF(LENGTH(first_name), LENGTH(last_name)) "result"
FROM employees;

SELECT last_name, manager_id, commission_pct,
COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id),
'No commission and No manager') AS EXPRESSION
FROM employees;

select last_name,salary,commission_pct,
coalesce(salary*commission_pct+salary,salary+2000) "New Salary"
from employees;

SELECT last_name, job_id, salary,
CASE job_id WHEN 'IT_PROG' THEN 1.10*salary
            WHEN 'ST_CLERK' THEN 1.15*salary
            WHEN 'SA_REP' THEN 1.20*salary -- salary*20/100 + salary
            ELSE salary
    END AS "REVISED SALARY"
FROM employees;

select last_name,salary,
case when salary < 5000 then 'Low'
    when salary < 10000 then 'Medium'
    when salary < 20000 then 'Good'
end as qualified_salary
from employees;

--method 1
select job_id,job_title,min_salary,
case when job_title like 'A%' then min_salary*1.1
    when job_title like 'P%' then min_salary*1.2
    else min_salary
end as new_min
from jobs;

--method 2
select job_id,job_title,min_salary,
to_char(case substr(job_title,1,1) when 'A' then min_salary*1.1
                           when 'P' then min_salary*1.2
                    else min_salary
end, 'L99,999.00') as new_min
from jobs;

--chapter 5

select max(salary),min(salary)
from employees;

SELECT round(AVG(salary),2), MAX(salary),
       MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

select min(last_name) first_lastname, max(last_name) last_lastname
from employees;

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;

SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;

select count(distinct department_id) -- ¹ÑºäÁè«éÓ¡Ñ¹
from employees;

select avg(commission_pct)
from employees;

select avg(nvl(commission_pct,0)) -- replace null with 0
from employees;