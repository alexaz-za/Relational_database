--2513110664 anawat sudla
--week 11
--1
create or replace view emp_dep_job
as select employee_id, first_name || ' ' || last_name name, to_char(salary,'$9,999.99') salary, job_title, department_name
    from employees e join jobs j
    on e.job_id = j.job_id
    join departments d
    on e.department_id = d.department_id
    where employee_id between 150 and 200;
    
--2
create or replace view dept2
as select employee_id, last_name, department_name
    from employees e join departments d
    on e.department_id = d.department_id
    where salary < (select avg(salary)
                    from employees)
    order by 2;
    
--3
create sequence book_id_seq
        increment by 20
        start with 1000
        maxvalue 3000
        nocache
        nocycle;
        
--4
create table Book 
(
book_id number(4) primary key,
book_name varchar(50) not null
);

insert into book (book_id, book_name)
values (book_id_seq.nextval,'Harry Potter and the Chamber of Secrets');

insert into book (book_id, book_name)
values (book_id_seq.nextval,'Warhammer 40k Siege of Vraks');

insert into book (book_id, book_name)
values (book_id_seq.nextval,'Destiny: The official Cookbook');

--5
create or replace view JCount
as select job_id, count(job_id) "Number of job"
    from employees
    group by job_id;

--6
drop view emp_dep_job;
drop view dept2;
drop sequence book_id_seq;
drop table book;
drop view jcount;