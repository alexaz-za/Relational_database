declare 
    j_id jobs.job_id%type;
    j_name jobs.job_title%type;
    min_sal jobs.min_salary%type;
    max_sal jobs.max_salary%type;
begin
    select job_id, job_title, min_salary, max_salary
    into j_id, j_name, min_sal, max_sal
    from jobs
    where job_id = 'IT_PROG';
    dbms_output.put_line('JOB ID = ' || j_id);
    dbms_output.put_line('JOB TITLE = ' || j_name);
    dbms_output.put_line('MIN SALARY = ' || min_sal);
    dbms_output.put_line('MAX SALARY = ' || max_sal);
end;
/
create or replace procedure practice(j_id varchar)
is
    j_name jobs.job_title%type;
    min_sal jobs.min_salary%type;
    max_sal jobs.max_salary%type;
begin
    select job_title, min_salary, max_salary
    into j_name, min_sal, max_sal
    from jobs
    where job_id = j_id;
    dbms_output.put_line('JOB ID = ' || j_id);
    dbms_output.put_line('JOB TITLE = ' || j_name);
    dbms_output.put_line('MIN SALARY = ' || to_char(min_sal,'99,999'));
    dbms_output.put_line('MAX SALARY = ' || to_char(max_sal,'99,999'));
end;
/
exec practice('&job_id');
/
desc jobs;

create table job_bk
(
job_id varchar(10),
job_title varchar(35),
min_salary number(6),
max_salary number(6)
)

begin
insert into job_bk
values ('EN_MGR', 'Engineer Manager', 20000, 60000);
insert into job_bk
values ('COM_EN', 'Computer Engineer', 10000, 25000);
insert into job_bk
values ('INST', 'Instructor', 5000, 10000);
end;

select * from job_bk;

/
declare
    j_id job_bk.job_title%type;
    j_name job_bk.job_title%type;
begin
    update job_bk
    set job_title = 'IT Instructor'
    where job_id = 'INST';
    select job_id, job_title
    into j_id, j_name
    from job_bk
    where job_id = 'INST';
    dbms_output.put_line('Job Id : ' || j_id);
    dbms_output.put_line('New Job Title is ' || j_name);
end;
/
select * from job_bk;
/
begin
    delete from job_bk
    where job_id = 'INST';
    dbms_output.put_line(SQL%ROWCOUNT || ' Record Deleted...');
end;
/
create table emp
as select * from employees;

select * from emp;

select first_name
from emp
where employee_id = 206;

select first_name, salary
from emp
where department_id = 50
and salary < 2500;
/
declare
    fname emp.first_name%type;
begin
    select first_name
    into fname
    from emp
    where employee_id = 206;
    dbms_output.put_line('Name : ' || fname);
    dbms_output.put_line(sql%rowcount || ' Records Retrived');
        
    update emp
    set salary = 3000
    where department_id = 50 
    and salary < 2500;
    dbms_output.put_line(sql%rowcount || ' Records Updated');
end;
/
DECLARE
    v_myage number := 10;
BEGIN
    IF v_myage < 11
    THEN
    DBMS_OUTPUT.PUT_LINE(' I am a child ');  
    END IF;
END;
/
select first_name, salary
from emp
where employee_id = 190;
/
declare
    fname emp.first_name%type;
    sal emp.salary%type;
    inc number(2);
begin
    select first_name, salary
    into fname, sal
    from emp
    where employee_id = 190;
    if sal < 3000 then
        sal := sal * 1.3;
        inc := 30;
    else
        sal := sal * 1.2;
        inc := 20;
    end if;
    dbms_output.put_line('Employee name : ' || fname);
    dbms_output.put_line('New Salary is : ' || sal);
    dbms_output.put_line(inc || ' % increasing');
end;
/
declare
    gr char(1) := upper('&grade');
    st varchar(20);
begin
    case gr
        when 'A' then st := 'Excellent';
        when 'B' then st := 'Very Good';
        when 'C' then st := 'Good';
        else st := 'No such grade';
    end case;
    dbms_output.put_line('Grade: ' || gr || ' Appraisal ' || st);
end;