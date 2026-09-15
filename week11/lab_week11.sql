CREATE VIEW emp80
AS SELECT employee_id, last_name,salary
    FROM employees
    WHERE department_id = 80;
    
select * from emp80;

CREATE OR REPLACE VIEW emp80 (id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' '|| last_name, salary, department_id
    FROM employees
    WHERE department_id = 80;

desc emp80;

create view empit
as select employee_id, last_name, job_title
    from employees e join jobs j
    on e.job_id = j.job_id
    where e.job_id = 'IT_PROG';
    
select * from empit;

create or replace view empit
as select employee_id code, first_name || last_name "Name", salary * 0.03 || ' BAHT' social, job_title "Job Name"
    from employees e join jobs j
    on e.job_id = j.job_id
    where job_title in ('Purchasing Clerk','Stock Clerk');

create view DEPT_VIEW ("Dep No","Dep Name","Emp Name")
as select e.department_id, department_name, first_name
    from departments d join employees e
    on d.department_id = e.department_id
    where e.department_id = 100;
    
select * from dept_view;

CREATE OR REPLACE VIEW dept_sum_vu (name, minsal, maxsal, avgsal)
AS SELECT department_name, MIN(salary), MAX(salary), round(AVG(salary),2)
    FROM employees e,departments d
    WHERE e.department_id = d.department_id
    GROUP BY department_name;
    
select * from dept_sum_vu;

-- join 3 tables
select first_name, department_name, city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

-- join 3 tables by using , = join
select first_name, department_name, city
from employees e , departments d , locations l
where e.department_id = d.department_id
and d.location_id = l.location_id;


create or replace view job_view ("JOB NAME","AVG SAL","TOTAL SAL")
as select job_title, to_char(avg(salary),'99,999.99'), to_char(sum(salary),'999,999.99')
    from jobs j join employees e
    on j.job_id = e.job_id
    group by job_title
    having sum(salary) > 10000
--    and job_title like 'P%'
--    or job_title like 'S%'
    and substr(job_title,1,1) in ('P','S')
    order by 1;
    
select * from job_view;

drop view job_view;
drop view dept_sum_vu;
drop view dept_view;
drop view emp80;
drop view empit;

-- SEQUENCE

CREATE SEQUENCE dept_deptid_seq
        INCREMENT BY 10
        START WITH 300
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;
        
INSERT INTO departments (department_id, department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL,'Support', 2500);

INSERT INTO departments (department_id, department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL,'HR', 1400);

SELECT dept_deptid_seq.CURRVAL FROM dual; -- check current value of dept_deptid_seq

ALTER SEQUENCE dept_deptid_seq
        INCREMENT BY 20
        MAXVALUE 999999
        NOCACHE
        NOCYCLE;
        
INSERT INTO departments (department_id, department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL,'Engineer', 1800);

DROP SEQUENCE dept_deptid_seq;

delete from departments
where department_id in (300,310,330);