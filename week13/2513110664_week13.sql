--Final exam
--1
create table author
(
auth_id number(4) primary key,
auth_name varchar(20) not null,
auth_age number(2) check(auth_age > 0)
);

create table book
(
b_id number(5) primary key,
auth_id number(4) references author(auth_id),
b_name varchar(40) not null
);

create table borrow
(
bor_id number(6),
bor_date date default sysdate,
b_id number(5) references book(b_id),
primary key(bor_id, b_id)
);

--2
CREATE SEQUENCE au_aid_seq
        INCREMENT BY 5
        START WITH 1101
        MAXVALUE 9999;
        
CREATE SEQUENCE bo_bid_seq
        INCREMENT BY 3
        START WITH 30121
        MAXVALUE 99999;
        
CREATE SEQUENCE bor_boid_seq
        INCREMENT BY 4
        START WITH 805010
        MAXVALUE 999999;
        
--3
select * from author;

insert into author
values (au_aid_seq.nextval, 'John Smith', 35);

insert into author
values (au_aid_seq.nextval, 'Michael Brown', 40);

insert into author
values (au_aid_seq.nextval, 'David Wilson', 25);

insert into book
values (bo_bid_seq.nextval, 1101, 'Modern Web');
select * from book;

insert into borrow (bor_id, b_id)
values (bor_boid_seq.nextval, 30121);
select * from borrow;

--4
--view

--5
--subquery

--6
--PL/SQL
--procedure