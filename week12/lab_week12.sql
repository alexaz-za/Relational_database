declare
    v_fname varchar2(20);
begin
    select first_name
    into v_fname -- only accept one value
    from employees
    where employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(' The First Name of the Employee is ' || v_fname);
end;
/
DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
    c NUMBER;
    f NUMBER(5,2);
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('Value of c: ' || c);
    f := 70.0/3.0;
    DBMS_OUTPUT.PUT_LINE('Value of f: ' || f);
END;
/
DECLARE
    service_charge number(2) := &service_charge ;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Service Charge is ' || service_charge || '%');
END;
/
declare
    p_name varchar(20) := '&product';
    qty number(3) := &quantity;
    p_price number(4) := &price;
begin
    dbms_output.put_line('Product : ' || p_name);
    dbms_output.put_line('Quantity : ' || qty);
    dbms_output.put_line('Price : ' || p_price);
    dbms_output.put_line('Total : ' || qty * p_price);
end;
/
DECLARE
    v_fname VARCHAR2(25);
BEGIN
    SELECT first_name 
    INTO v_fname
    FROM employees 
    WHERE employee_id = 200;
    DBMS_OUTPUT.PUT_LINE(' First Name is : '||v_fname);
END;
/
declare
    h_date employees.hire_date%type;
    sal employees.salary%type;
begin
    select hire_date, salary
    into h_date, sal
    from employees
    where employee_id = 100;
    dbms_output.put_line('Hire Date = ' || h_date);
    dbms_output.put_line('Salary =' || to_char(sal,'99,999.99'));
end;
/
create or replace procedure test1(empid number)
is
    h_date employees.hire_date%type;
    sal employees.salary%type;
begin
    select hire_date, salary
    into h_date, sal
    from employees
    where employee_id = empid;
    dbms_output.put_line('Hire Date = ' || h_date);
    dbms_output.put_line('Salary = ' || to_char(sal,'99,999.99'));
end;
/
exec test1(&e_id);
/ 
declare -- anonymous
    sum_sal employees.salary%type;
begin
    select sum(salary)
    into sum_sal
    from employees
    where department_id = 60;
    dbms_output.put_line('The sum of salary is ' || to_char(sum_sal,'99,999.99'));
end;
/ 
create or replace procedure test1(depid number) -- procedure
is
    sum_sal employees.salary%type;
begin
    select sum(salary)
    into sum_sal
    from employees
    where department_id = depid;
    dbms_output.put_line('The sum of salary is ' || to_char(sum_sal,'99,999.99'));
end;
/
exec test1(&depid);
/
DECLARE
    M_FIRST_NAME employees.first_name%type;
    M_LAST_NAME employees.last_name%type;
    M_SALARY employees.salary%type;
BEGIN
    SELECT FIRST_NAME, LAST_NAME, SALARY 
    INTO M_FIRST_NAME, M_LAST_NAME, M_SALARY
    FROM EMPLOYEES WHERE EMPLOYEE_ID = 2052;
    DBMS_OUTPUT.PUT_LINE('NAME IS ' || M_FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('LAST NAME IS ' || M_LAST_NAME);
    DBMS_OUTPUT.PUT_LINE('SALARY IS ' || M_SALARY);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('INVALID EMPLOYEE ID');
END;
/
DECLARE
    c_id customers.id%type := 8;
    c_name customers.name%type;
    c_addr customers.address%type;
BEGIN
    SELECT name, address 
    INTO c_name, c_addr
    FROM customers 
    WHERE id = c_id;
    DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
    DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No such customer');
END;
/
SELECT last_name 
FROM employees
WHERE first_name = 'John';
/
DECLARE
    v_lname employees.last_name%TYPE;
BEGIN
    SELECT last_name INTO v_lname
    FROM employees
    WHERE first_name = 'John';
    DBMS_OUTPUT.PUT_LINE('John''s last name is : ' || v_lname);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('Your select statement retrieved multiple rows.');
END;
/
DECLARE
    v_num1 number := &sv_num1;
    v_num2 number := &sv_num2;
    v_result number;
BEGIN
    v_result := v_num1 / v_num2;
    DBMS_OUTPUT.PUT_LINE ('v_result: ' || v_result);
EXCEPTION
    WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('A number cannot be divided by zero.');
END;
/
DECLARE
    e_hiredate DATE := '&Start_Date';
    e_firstname employees.first_name%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Check the employee is start date');
    SELECT first_name 
    INTO e_firstname
    FROM employees
    WHERE hire_date = e_hiredate;
    DBMS_OUTPUT.PUT_LINE('The employee is ' || e_firstname);
    DBMS_OUTPUT.PUT_LINE('Employ on : ' || e_hiredate);
EXCEPTION
    WHEN too_many_rows THEN
    DBMS_OUTPUT.PUT_LINE('The employee is employed into many person');
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('The employee is not employed');
END;
/
create or replace procedure test1(e_hiredate date)
is
    e_firstname employees.first_name%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Check the employee is start date');
    SELECT first_name 
    INTO e_firstname
    FROM employees
    WHERE hire_date = e_hiredate;
    DBMS_OUTPUT.PUT_LINE('The employee is ' || e_firstname);
    DBMS_OUTPUT.PUT_LINE('Employ on : ' || e_hiredate);
EXCEPTION
    WHEN too_many_rows THEN
    DBMS_OUTPUT.PUT_LINE('The employee is employed into many person');
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('The employee is not employed');
END;
/
exec test1('&Start_Date');