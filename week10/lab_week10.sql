INSERT INTO departments (department_id,department_name)
VALUES (31,'Purchasing');

INSERT INTO departments
VALUES (111,'Finance',NULL,NULL);

INSERT INTO departments
(department_id,department_name,location_id)
VALUES (&department_id,'&department_name',&location_id);

delete departments
where department_id in (31,111,280); -- delete practice

create table contacts
(
ID number(2) primary key,
name varchar(10) not null,
age number(2) ,
address varchar(20) not null,
salary number(7,2) check(salary > 0)
);

insert into contacts
values (1,'Ramesh',35,'Ahmedabad',2000.00);

insert into contacts
values (2,'Khilan',25,'Delhi',1500.00);

insert into contacts
values (3,'kaushik',23,'Kota',2000.00);

insert into contacts
values (4,'Chaitali',25,'Mumbai',6500.00);

insert into contacts
values (5,'Hardik',27,'Bhopal',8500.00);

insert into contacts
values (6,'Komal',22,'MP',4500.00);

insert into contacts
values (7,'Muffy',24,'Indore',10000.00);

select * from contacts;

create table contacts_bkp
as select * from contacts;

select * from contacts;

select * from contacts

where salary in (select salary
                 from contacts_bkp
                 where salary > 4500);
                 
update employees
set job_id = (select job_id
              from employees
              where employee_id = 205),
    salary = (select salary
              from employees
              where employee_id = 205)
where employee_id = 113;

rollback;

select * from contacts;

update contacts
set salary = salary * 0.25
where age in (select age
              from contacts_bkp
              where age >= 27);
              
delete contacts
where age in (select age
              from contacts_bkp
              where age >= 27); -- subquery

select * from contacts_bkp;
delete contacts_bkp;
rollback;

truncate table contacts_bkp;

drop table contacts;
drop table contacts_bkp;