BEGIN
        DBMS_OUTPUT.PUT_LINE('Hello World!');
END;
/

DESC employees;

declare
        vemployee_id number(6);
        vfirst_name varchar2(20);
begin
        vemployee_id := 105;
        vfirst_name := 'David';

        dbms_output.put_line('��� / �̸�');
        dbms_output.put_line('-------------------------');
        dbms_output.put_line(vemployee_id || ' / ' || vfirst_name);
end;
/

declare
        -- %TYPE �Ӽ����� �÷� ������ �����͸� ������ �� �ִ� �������� ���� ����
        vemployee_id employees.employee_id%type;
        vfirst_name employees.first_name%type;
begin
        dbms_output.put_line('��� / �̸�');
        dbms_output.put_line('----------------');
        -- select ���� ������ ��� ���� into �ڿ� ����� ������ ����
        select employee_id, first_name into vemployee_id, vfirst_name
        from employees
        where first_name = 'Susan';
        
        -- ���۷��� ������ ����� ���� ���
        dbms_output.put_line(vemployee_id || ' / ' || vfirst_name);
end;
/

declare
        -- ���ڵ�� ���� ����
        vemployees employees%rowtype;
begin
        -- Lisa ����� ������ ���۷��� ������ ����
        select *
        into vemployees
        from employees
        where first_name='Lisa';
        
        -- ���ڵ� ������ ����� ��� ������ ���
        dbms_output.put_line('�����ȣ : ' || to_char(vemployees.employee_id));
        dbms_output.put_line('��      �� : ' || vemployees.first_name);
        dbms_output.put_line('��      �� : ' || vemployees.salary);
        dbms_output.put_line('�Ի����� : ' || to_char(vemployees.hire_date, 'YYYY-MM-DD'));
        dbms_output.put_line('�μ���ȣ : ' || vemployees.department_id);
end;
/


--<����> employees ���̺� ��ϵ� �ѻ���� ���� �޿��� ��, �޿��� ����� ������ �����Ͽ� ���
DECLARE
        vcnt number;
        vsum number;
        vavg number;
BEGIN
        SELECT count(*), sum(salary), floor(avg(salary)) INTO vcnt, vsum, vavg FROM employees;

        DBMS_OUTPUT.PUT_LINE('��� �� : ' || vcnt);
        DBMS_OUTPUT.PUT_LINE('�޿��� �� : ' || vsum);
        DBMS_OUTPUT.PUT_LINE('�޿��� ��� : ' || vavg);
END;
/

--<����> Jack ����� ����, �޿�, �Ի�����, �μ����� ������ �����Ͽ� ���
DECLARE
        vjob_id employees.job_id%type;
        vsalary employees.salary%type;
        vhire_date employees.hire_date%type;
        vdepartment_name departments.department_name%type;

BEGIN
        select job_id, salary, hire_date, department_name  into vjob_id, vsalary, vhire_date, vdepartment_name
        from employees e inner join departments d
        on e.department_id = d.department_id
        where first_name = 'Jack';
        
        dbms_output.put_line('����� ���� : ' || vjob_id);
        dbms_output.put_line('�޿� : ' || vsalary);
        dbms_output.put_line('�Ի����� : ' || vhire_date);
        dbms_output.put_line('�μ��� : ' || vdepartment_name);

end;
/

--<����> ��� ���̺�(employees01)���� �����ȣ�� ���� ū ����� ã�Ƴ� ��, �� ��ȣ +3������
-- �Ʒ��� ����� ������̺� �ű� �Է��ϴ� PL_SQL �ۼ�

declare
        max_employee_id employees01.employee_id%TYPE;
begin
        select max(employee_id) into max_employee_id from employees01;
        
        insert into employees01 ( employee_id, first_name, last_name, email, salary, hire_date, manager_id, job_id, department_id )
        values ( max_employee_id  + 3, 'Olivia', 'Gee', 'Spring', 2800, SYSDATE, 100, 'PR_REP', 20 );
        
        commit;

end;
/

select * from employees01;


