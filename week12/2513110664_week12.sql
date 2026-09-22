--2513110664 anawat sudla
--week 12
--1
declare
    d_id departments.department_id%type;
    d_name departments.department_name%type;
    avg_sal employees.salary%type;
begin
    select d.department_id, department_name, avg(salary)
    into d_id, d_name, avg_sal
    from employees e join departments d
    on e.department_id = d.department_id
    where d.department_id = 50
    group by d.department_id, department_name;
    dbms_output.put_line('Department ID : ' || d_id);
    dbms_output.put_line('Department Name : ' || d_name);
    dbms_output.put_line('Average salary in this department is' || to_char(avg_sal,'99,999.99') || ' Baht.');
end;
/
create or replace procedure practice(d_id number)
is
    d_name departments.department_name%type;
    avg_sal employees.salary%type;
begin
    select department_name, avg(salary)
    into d_name, avg_sal
    from employees e join departments d
    on e.department_id = d.department_id
    where d.department_id = d_id
    group by d.department_id, department_name;
    dbms_output.put_line('Department ID : ' || d_id);
    dbms_output.put_line('Department Name : ' || d_name);
    dbms_output.put_line('Average salary in this department is' || to_char(avg_sal,'99,999.99') || ' Baht.');
end;
/
exec practice(&d_id);

--2
declare 
    e_id employees.employee_id%type;
    e_fname employees.first_name%type;
    e_lname employees.last_name%type;
    sal employees.salary%type;
    new_sal employees.salary%type;
    e_commission employees.commission_pct%type;
begin
    select employee_id, first_name, last_name, salary, nvl(commission_pct,0)
    into e_id, e_fname, e_lname, sal, e_commission
    from employees
    where employee_id = &employee_id;
    new_sal := 1.20 * (sal * e_commission + sal);
    dbms_output.put_line('Employee ID : ' || e_id);
    dbms_output.put_line('Name : ' || e_fname || ' ' || e_lname);
    dbms_output.put_line('New salary : ' || to_char(new_sal,'99,999.00') || ' Baht.');
end;
/
create or replace procedure practice(e_id number)
is
    e_fname employees.first_name%type;
    e_lname employees.last_name%type;
    sal employees.salary%type;
    new_sal employees.salary%type;
    e_commission employees.commission_pct%type;
begin
    select first_name, last_name, salary, nvl(commission_pct,0)
    into e_fname, e_lname, sal, e_commission
    from employees
    where employee_id = e_id;
    new_sal := 1.20 * (sal * e_commission + sal);
    dbms_output.put_line('Employee ID : ' || e_id);
    dbms_output.put_line('Name : ' || e_fname || ' ' || e_lname);
    dbms_output.put_line('New salary : ' || to_char(new_sal,'99,999.00') || ' Baht.');
end;
/
exec practice(&e_id);

--3
declare
    name varchar(20) := 'Supra Toyota';
    qty number := 9;
    price constant number := 3900;
    total number;
begin
    total := 1.07 * (qty * price);
    dbms_output.put_line('Name : ' || name);
    dbms_output.put_line('Quantity : ' || qty);
    dbms_output.put_line('Price : ' || to_char(price,'99,999.99') || ' Baht.');
    dbms_output.put_line('Total price : ' || to_char(total,'99,999.99') || ' Baht.');
end;
/
create or replace procedure practice(name varchar,qty number)
is
    price constant number := 3900;
    total number;
begin
    total := 1.07 * (qty * price);
    dbms_output.put_line('Name : ' || name);
    dbms_output.put_line('Quantity : ' || qty);
    dbms_output.put_line('Price : ' || to_char(price,'99,999.99') || ' Baht.');
    dbms_output.put_line('Total price : ' || to_char(total,'99,999.99') || ' Baht.');
end;
/
exec practice('&name',&qty);