--2513110664 anawat sudla
--week 9
--1
create table dept2
(
d_id number(4),
d_name varchar(40),
street_address varchar(40),
c_id char(2)
);

--2
insert into dept2
select department_id, department_name, street_address, country_id
from departments d join locations l
on d.location_id = l.location_id
where manager_id is not null
order by 1;

--3
create table country2
(
c_id char(2),
c_name varchar(40),
r_name varchar(25)
);

--4
insert into country2
select country_id, country_name, region_name
from countries c join regions r
on c.region_id = r.region_id;

--5
alter table dept2
modify (d_name varchar(45));

--6
alter table dept2
add constraint d_id_pk primary key(d_id);

--7
alter table country2
add constraint c_id_pk primary key(c_id);

--8
alter table dept2
add constraint c_id_fk foreign key(c_id) references country2(c_id);

--9
drop table dept2;
drop table country2;