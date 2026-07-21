--2513110664 anawat sudla
--1
select employee_id,start_date,end_date,add_months(end_date,2) "2 Month after end date",
next_day(start_date,'friday') "Next monday",last_day(end_date) "Last day",months_between(end_date,start_date) "Month work"
from job_history
where trunc(months_between(end_date,start_date)) > 40;

--2
select last_name,length(last_name) length
from employees
where instr(last_name,'e') = 0
and substr(last_name,1,1) = 'G'
or substr(last_name,1,1) = 'K';

--3
select job_id,job_title,max_salary,round(max_salary*1.07) "Max salary with bonus"
from jobs;

--4
select substr(job_title,1,5) || '.' || substr(job_title,instr(job_title,' ')+1) new_name 
--concat(concat(substr(job_title,1,5),'.'),substr(job_title,instr(job_title,' ')+1)) new_name
from jobs;