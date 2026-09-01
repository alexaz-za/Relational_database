create table customer
(
CUST_NO NUMBER(5) primary key,
NAME CHAR(20) not null,
ADDRESS VARCHAR(40) not null,
DOB DATE,
ID_CARD_NO NUMBER(13) unique,
CUST_TYPE CHAR(1) check(CUST_TYPE in ('A','B','C'))
);

desc customer; -- check data type of table
select * from customer; -- check data inside table

create table order1
(
ORD_NO NUMBER(5) primary key,
ORD_DATE DATE default sysdate not null,
AMOUNT NUMBER(9,2) not null,
CUST_NO NUMBER(5) references customer(CUST_NO) -- references = FK
);

create table suppliers
(
sup_id number(5) primary key,
sup_name varchar(25) not null,
sup_address varchar(40) not null
);

create table customers
(
cust_id number(5) primary key,
cust_name varchar(25) not null,
age number(2)
);

desc customers;

ALTER TABLE customers
ADD (address varchar2(50),
     salary number(10,2)
);

ALTER TABLE customers
RENAME COLUMN cust_id to id;

ALTER TABLE customers
RENAME COLUMN cust_name to name;

ALTER TABLE customers RENAME TO contacts;

CREATE TABLE dept80
AS  SELECT employee_id, last_name,
    salary,hire_date
    FROM employees
    WHERE department_id = 80;

select * from dept80;
desc dept80;

ALTER TABLE dept80
ADD (fname char(30));

ALTER TABLE dept80
MODIFY (last_name char(30));

ALTER TABLE dept80
DROP COLUMN fname;

create table sales_reps (id, name, salary, commission)
as  select employee_id, first_name, salary, commission_pct
    from employees
    where job_id = 'SA_REP';
    
select * from sales_reps;
desc sales_reps;

ALTER TABLE sales_reps
ADD CONSTRAINT emp_id_pk PRIMARY KEY(id);

-- Delete Tables
drop table contacts;
drop table order1;
drop table customer;
drop table dept80;
drop table sales_reps;
drop table suppliers;

create table dept
(
dep_id number(4),
dep_name varchar(30)
);

desc dept;
select * from dept;

insert into dept
select department_id, department_name
from departments;

drop table dept;