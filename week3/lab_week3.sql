SELECT 'The job id for ' || UPPER(last_name) ||
' is ' || LOWER(job_id) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT employee_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins';

SELECT employee_id, last_name, department_id
FROM employees
WHERE initcap(last_name) = 'Higgins';

select SUBSTR('HelloWorld', 1, 5) , SUBSTR('HelloWorld', 6, 5) , SUBSTR('HelloWorld', 6)
from dual;

select INSTR('HelloWorld', 'W'), -- find position of 'W'
INSTR('HelloWorld', 'o'), -- find 'o' from left to right
INSTR('HelloWorld', 'z') 
from dual;

select TRIM('H' FROM 'HelloWorld') ,REPLACE('JACK and JUE', 'J', 'BL')
from dual;

SELECT employee_id,
concat(concat(first_name , ' ') ,last_name) NAME,
job_id,
length(last_name),
instr(last_name,'a') "Contains 'a'?"
FROM employees
--WHERE SUBSTR(job_id,4) = 'REP';
WHERE last_name like '%n';

SELECT LPAD('5000', 10, '*')
FROM dual;

SELECT RPAD('5000', 10, '*')
FROM dual;

select first_name, first_name,lpad(first_name,20,'*') FIRST_NAME2
from employees;

select MOD(1600, 300),
MOD(300, 1600),
MOD(1600,1590)
from dual;

SELECT ROUND(67830.4557, 3),
ROUND(67830.4557, 2),
ROUND(67830.4557, -3), --ไปทางซ้ายของจุด
ROUND(67830.4557, -4)
FROM dual;

SELECT last_name, salary,
mod(salary,5000) "Mod Salary"
FROM employees
where job_id = 'SA_REP';

SELECT SYSDATE
FROM dual;

SELECT last_name,trunc(SYSDATE-hire_date) "date",
trunc((SYSDATE-hire_date)/7) AS WEEKS ,
--trunc((SYSDATE-hire_date)/30) AS month,
months_between(SYSDATE,hire_date)
FROM employees
WHERE department_id = 90;
