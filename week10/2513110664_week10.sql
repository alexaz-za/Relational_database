--2513110664 anawat sudla
--week 10
--1
create table vendor
(
v_id number(5) primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
update_date date default sysdate,
email varchar(50)
);

create table item
(
ite_id number(4) primary key,
ite_name varchar(40) not null,
price number(7,2) not null,
price_vat number(7,2)
);

create table log_history
(
ite_id number(4) references item(ite_id),
v_id number(5) references vendor(v_id),
transac varchar(3) check(transac in ('IN','OUT')),
price_vat number(7,2),
update_date date default sysdate,
primary key (ite_id,v_id)
);

--2
--2.1
insert into vendor(v_id,first_name,last_name)
values (&v_id ,'&first_name','&last_name');

select * from vendor;
/*
10001	Lalita	    Na Nongkhai 	08-SEP-26	
10002	Amonpan	    Chomklin	    08-SEP-26	
10003	Pranisa	    Israsena	    08-SEP-26	
10004	Pichitchai	Kamin	        08-SEP-26	
10005	Salinla	    Chevakidagarn	08-SEP-26	
*/

--2.2
insert into item (ite_id,ite_name,price)
values (&ite_id,'&ite_name',&price);

select * from item;
/*
2001	Tequila	1500
2002	Vodka	599	 
2003	Wine	799	
2004	Rum	    999	 
2005	Whiskey	899	 
*/

--2.3
insert into log_history (ite_id,v_id,transac)
values (&ite_id,&v_id,'&transac');

select * from log_history;
/*
2001	10001			08-SEP-26
2002	10002			08-SEP-26
2003	10003			08-SEP-26
2004	10004			08-SEP-26
2005	10005			08-SEP-26
*/

--3
update item
set price_vat = price * 1.07;

select * from item;
/*
2001	Tequila	1500	1605
2002	Vodka	599	    640.93
2003	Wine	799	    854.93
2004	Rum	    999	    1068.93
2005	Whiskey	899 	961.93
*/

--4
update vendor
set email = substr(last_name,1,2) || '.' || first_name || '@vend.ac.th';

select email from vendor;
/*
Na.Lalita@vend.ac.th
Ch.Amonpan@vend.ac.th
Is.Pranisa@vend.ac.th
Ka.Pichitchai@vend.ac.th
Ch.Salinla@vend.ac.th
*/

--5
create table contract_vendor
as select ite_name,email,transac,v.update_date,
case transac when 'IN' then sysdate - 100
             else sysdate
end Date_transac
   from vendor v join log_history l
   on v.v_id = l.v_id
   join item i
   on l.ite_id = i.ite_id;

select * from contract_vendor;
/*
Tequila	Na.Lalita@vend.ac.th	    IN	08-SEP-26	31-MAY-26
Vodka	Ch.Amonpan@vend.ac.th	    IN	08-SEP-26	31-MAY-26
Wine	Is.Pranisa@vend.ac.th	    OUT	08-SEP-26	08-SEP-26
Rum	    Ka.Pichitchai@vend.ac.th	IN	08-SEP-26	31-MAY-26
Whiskey	Ch.Salinla@vend.ac.th	    OUT	08-SEP-26	08-SEP-26
*/

drop table log_history;
drop table item;
drop table vendor;