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


DECLARE
	-- %ROWTYPE �Ӽ����� �ο츦 ������ �� �ִ� ���۷��� ���� ����
	vemployees employees%ROWTYPE;
	vsalary NUMBER(8, 2);
BEGIN
	DBMS_OUTPUT.PUT_LINE('��� / �̸� / �޿�');
	DBMS_OUTPUT.PUT_LINE('-------------------');
	-- Pat ����� ��ü ������ �ο� ������ ���� vemployees�� �����Ѵ�.
	SELECT * INTO vemployees
	FROM employees
	WHERE first_name = 'Pat';
	-- Ŀ�̼��� NULL�� ��� �̸� 0���� �����ؾ� �ùٸ� �޿� ����� �����ϴ�.
	IF (vemployees.commission_pct IS NULL) THEN
		vemployees.commission_pct := 0;
	END IF;

	--��Į�� ������ �޿��� ����� ����� �����Ѵ�.
	vsalary := vemployees.salary + (vemployees.salary * vemployees.commission_pct);
	--���۷��� ������ ��Į�� ������ ����� ���� ����Ѵ�.
	DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || vemployees.employee_id ||
												'/����� : ' ||vemployees.first_name ||
												'/�޿� : ' || to_char(vsalary, '$999,999'));
END;
/

DECLARE
	-- %ROWTYPE �Ӽ����� �ο츦 ������ �� �ִ� ���۷��� ���� ����
	vemployees employees%ROWTYPE;
	vsalary NUMBER(8, 2);
BEGIN
	DBMS_OUTPUT.PUT_LINE('��� / �̸� / �޿�');
	DBMS_OUTPUT.PUT_LINE('----------------------------');
	-- Jack ����� ��ü ������ �ο� ������ ���� vemployees�� ����
	SELECT * INTO vemployees
	FROM employees
	WHERE first_name = 'Jack';
	-- Ŀ�̼��� NULL �� ��� �̸� 0���� �����ؾ� �ùٸ� �޿� ����� �����ϴ�.
	IF(vemployees.commission_pct IS NULL) THEN
		vsalary := vemployees.salary;
	ELSE                  -- Ŀ�̼��� NULL�� �ƴϸ�
		vsalary := vemployees.salary + (vemployees.salary * vemployees.commission_pct);
	END IF;

	-- ���۷��� ������ ��Į�� ������ ����� ���� ���
	DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || vemployees.employee_id ||
											'/ ����� : ' || vemployees.first_name ||
											' / �޿� : ' || to_char(vsalary, '$999,999'));

END;
/

DECLARE
  -- %ROWTYPE �Ӽ����� �ο츦 ������ �� �ִ� ���۷��� ���� ����
  vemployees employees%ROWTYPE; 
  vdepartment_name departments.department_name%TYPE;

BEGIN
  DBMS_OUTPUT.PUT_LINE('��� / �̸� / �μ���ȣ / �μ���'); 
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
  -- �����ȣ�� 192 ����� ��ü ������ �ο� ������ ���� vemployees�� �����Ѵ�. 
  SELECT * INTO vemployees FROM employees WHERE employee_id=192;

  IF (vemployees.department_id = 10) THEN
    vdepartment_name := 'Administration';
  ELSIF (vemployees.department_id = 20) THEN
    vdepartment_name := 'Marketing';
  ELSIF (vemployees.department_id = 30) THEN
    vdepartment_name := 'Purchasing';
  ELSIF (vemployees.department_id = 40) THEN 
    vdepartment_name := 'Human Resources';
  ELSIF (vemployees.department_id = 50) THEN 
    vdepartment_name := 'Shipping';
  END IF;

  DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || ' /' || vemployees.first_name || ' /' || 
                       RPAD(vemployees.department_id,4) || ' /' || vdepartment_name ); 
END;
/


-- DBMS_RANDOM.VALUE
-- ������ ���ڸ� �����Ѵ�.
-- ���� : DBMS_RANDOM.VALUE(�ּ� ������ ����, �ִ� ������ ����)

-- (����)
SELECT DBMS_RANDOM.VALUE(1, 5) FROM dual;
SELECT ROUND (DBMS_RANDOM.VALUE(1, 5)) FROM dual;
SELECT TRUNC (DBMS_RANDOM.VALUE(1, 5)) FROM dual;
-- ������ �μ���ȣ ����� �� ��
SELECT ROUND(DBMS_RANDOM.VALUE(10, 270), -1) FROM dual;

--DMBS_RANDOM.STRING
-- ������ ���ڿ��� ����
-- ���� : DBMS_RANDOM.STRING(�ɼǹ���, ���̼�)
-- �ɼǹ��ڴ� �Ʒ��� ����.
 -- ��u�� ��U�� : �빮��
 -- ��x��, ��X�� : �����ڿ� ���� ȥ��
 -- ��l��, ��L��  : �ҹ���
 -- ��p��, ��P�� : ���� ȥ��
 -- ��a��, ��A�� : ��ҹ��� ���о��� ������
 
 -- (����)
 SELECT DBMS_RANDOM.STRING('U', 1) FROM DUAL; -- 1���� ������ ����
 SELECT DBMS_RANDOM.STRING('A', 2) FROM DUAL; -- ��ҹ��� ������� 2���� ������ ����
 SELECT DBMS_RANDOM.STRING('X', 8) FROM DUAL; -- �����ڿ� ���� ȥ�� 8���� ������ ����
 
 DECLARE
	vsalary NUMBER := 0;
	vdepartment_id NUMBER := 0;
BEGIN
	SELECT ROUND(DBMS_RANDOM.VALUE(10, 270), -1) INTO vdepartment_id FROM DUAL;

	SELECT salary INTO vsalary
	FROM employees
	WHERE department_id = vdepartment_id AND ROWNUM = 1;
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || vdepartment_id || '�޿� : ' || vsalary);

IF vsalary BETWEEN 1 AND 6000 THEN
	DBMS_OUTPUT.PUT_LINE('����');
ELSIF vsalary BETWEEN 6001 AND 10000 THEN
	DBMS_OUTPUT.PUT_LINE('�߰�');
ELSIF vsalary BETWEEN 10001 AND 20000 THEN
	DBMS_OUTPUT.PUT_LINE('����');
ELSE
	DBMS_OUTPUT.PUT_LINE('�ֻ���');
END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(vdepartment_id || '�μ��� �ش� ����� �����ϴ�');
END;
/

DECLARE
	vn_base_num NUMBER := 3;
	vn_cnt NUMBER := 1;
BEGIN
	DBMS_OUTPUT.PUT_LINE('*****������ 3�� *****');
	LOOP
		DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' || vn_cnt || '=' || vn_base_num * vn_cnt);
		vn_cnt := vn_cnt + 1;
--	EXIT WHEN vn_cnt > 9;
		IF vn_cnt > 9 THEN
			EXIT;
		END IF;
	END LOOP;
END;
/

DECLARE
	vdepartments departments%ROWTYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������');
	DBMS_OUTPUT.PUT_LINE('--------------------------------------');
	-- ���� cnt�� 1���� 1�� �����ϴٰ� 27�� �����ϸ� �ݺ����� �����.
	FOR cnt IN 1..27 LOOP
		SELECT * INTO vdepartments FROM departments
		WHERE department_id = 10 * cnt;
		DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' / '||
		vdepartments.department_name || ' / ' || vdepartments.location_id);
	END LOOP;
END;
/

DECLARE
	i NUMBER := 1;
	vdepartments departments%ROWTYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������');
	DBMS_OUTPUT.PUT_LINE('---------------------------------');
	WHILE i <= 27 LOOP
		IF i MOD 2 = 0 THEN
			SELECT * INTO vdepartments FROM departments WHERE department_id = 10 * i;
			DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' / ' ||
			vdepartments.department_name || ' / ' || vdepartments.location_id);
		END IF;
		i := i + 1;
	END LOOP;
END;
/

DECLARE
	vdepartments departments%ROWTYPE;
	CURSOR C1 -- Ŀ���� �̸�
	IS
	SELECT department_id, department_name, location_id FROM departments; -- �μ� ���̺��� ��ü ���� ��ȸ
BEGIN
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������');
	DBMS_OUTPUT.PUT_LINE('------------------------------');

	OPEN C1;
	-- ������ C1Ŀ���� SELEC������ ���� �˻��� �Ѱ��� ���������� �о�´�.
	LOOP -- �о�� ������ INTO �ڿ� ����� ������ ����
		FETCH C1 INTO vdepartments.department_id, vdepartments.department_name,
		vdepartments.location_id;
		EXIT WHEN C1%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' ' ||
	RPAD(vdepartments.department_name, 20) || ' ' || vdepartments.location_id);
	END LOOP;
    DBMS_OUTPUT.PUT_LINE(CONCAT('�о�帰 ���ڵ�� : ', C1%ROWCOUNT));
	CLOSE C1;
END;
/

DECLARE
	vdepartments departments%ROWTYPE;
	CURSOR C1
	IS
	SELECT * FROM departments;
BEGIN
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------');
	FOR vdepartments IN C1 LOOP
		DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' '
												|| RPAD(vdepartments.department_name, 20) || ' '
												|| vdepartments.location_id);
	END LOOP;
END;
/

DECLARE
	vdepartments departments%ROWTYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������');
	DBMS_OUTPUT.PUT_LINE('----------------------------------');
	FOR vdepartments IN (SELECT * FROM departments) LOOP -- Ŀ������ �κ��� FOR������ ���� ���
		DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' '
		|| RPAD(vdepartments.department_name, 20) || ' ' || vdepartments.location_id);
	END LOOP;
END;
/

DECLARE
	vrandomid employees.department_id%TYPE; -- ������ �μ���ȣ
	vsalarystring VARCHAR2(20); -- �޿����
  -- Ŀ�� ����� �Ű������� ����� �� �ִ�. CURSOR Ŀ����(�Ű�����) IS ������.
	CURSOR cur_employees(vdepartment_id employees.department_id%TYPE)
	IS
	SELECT salary, first_name FROM employees WHERE department_id = vdepartment_id;
BEGIN
	-- ������ �μ���ȣ�� ��� ���
	SELECT ROUND(DBMS_RANDOM.VALUE(10, 270), -1) INTO vrandomid FROM DUAL;
	DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || vrandomid);

	-- �� �μ���ȣ�� 120���� 270������ �Ҽӵ� ����� ���⿡ ����.
	IF vrandomid between 120 and 270 THEN
		DBMS_OUTPUT.PUT_LINE(vrandomid || '�μ��� �ش� ����� �����ϴ�');
		RETURN; -- ����� ����
	END IF;

	DBMS_OUTPUT.PUT_LINE('����� / �޿� / �޿�����');
	DBMS_OUTPUT.PUT_LINE('---------------------------');

	FOR vemployees IN cur_employees(vrandomid) LOOP
		IF vemployees.salary BETWEEN 1 AND 6000 THEN
			vsalarystring := '����';
		ELSIF vemployees.salary BETWEEN 6001 AND 10000 THEN
			vsalarystring := '�߰�';
		ELSIF vemployees.salary BETWEEN 10001 AND 20000 THEN
			vsalarystring := '����';
		ELSE
			vsalarystring := '�ֻ���';
		END IF;
		DBMS_OUTPUT.PUT_LINE(RPAD(vemployees.first_name, 6) || '/' || RPAD(vemployees.salary, 5) || '/' ||vsalarystring);
	END LOOP;
END;
/


DECLARE
	vfirst_name employees.first_name%TYPE;
	TYPE employeescursor IS REF CURSOR;     -- Ŀ�� Ÿ�� ����
	vemployees employeescursor;             -- Ŀ�� ���� ����
BEGIN
	-- Ŀ�� ������ ����� Ŀ�� ���� �� ����
	OPEN vemployees FOR SELECT first_name FROM employees WHERE department_id = 60;

	-- LOOP��
	LOOP
	-- Ŀ�� ������ ����� ��� ������ EMPNAME ������ �Ҵ�
	FETCH vemployees INTO vfirst_name;
	EXIT WHEN vemployees%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE('����� : ' || vfirst_name); -- ������� ���
	END LOOP;
END;
/


CREATE OR REPLACE PROCEDURE EMPPOC
IS
	vword VARCHAR2(1);
	vemployees employees%ROWTYPE;
	CURSOR C1 (vword VARCHAR2)
	IS
	SELECT employee_id, first_name, salary
	FROM employees WHERE first_name LIKE '%' || vword ||'%';
BEGIN
	vword := DBMS_RANDOM.STRING('U', 1);
	DBMS_OUTPUT.PUT_LINE('������ ���� : ' || vword);
	OPEN C1(vword);
	DBMS_OUTPUT.PUT_LINE('��� / ����� / �޿�');
	DBMS_OUTPUT.PUT_LINE('----------------------------');
	LOOP
		FETCH C1 INTO vemployees.employee_id, vemployees.first_name, vemployees.salary;
		IF C1%ROWCOUNT = 0 THEN
			DBMS_OUTPUT.PUT_LINE('�ش� ����� �������� �ʽ��ϴ�.');
		END IF;
		EXIT WHEN C1%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || '/' || vemployees.first_name || '/' ||
		vemployees.salary);
	END LOOP;
END;
/

execute emppoc;

select * from user_source;

CREATE OR REPLACE PROCEDURE EMPPROC02 ( vdepartment_id IN employees.department_id%TYPE )
IS
	CURSOR C1
	IS
	SELECT * FROM employees WHERE department_id = vdepartment_id;
BEGIN
	DBMS_OUTPUT.PUT_LINE('�����ȣ / ����� / �޿�');
	DBMS_OUTPUT.PUT_LINE('----------------------------');
	FOR vemployees IN C1 LOOP
		DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || ' / '
													|| vemployees.first_name || ' / ' || vemployees.salary);
	END LOOP;
END;
/
SHOW ERROR;

select distinct department_id, first_name from employees;

execute EMPPROC02(40);

CREATE OR REPLACE PROCEDURE EMPPROC_INMODE
(vdepartment_id IN employees01.department_id%TYPE)
IS
BEGIN
	UPDATE employees01 SET salary = DECODE(vdepartment_id, 10, salary * 1.1, 20, salary * 1.2, salary)
	WHERE department_id = vdepartment_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('������ �Ϸ�Ǿ����ϴ�.');
END EMPPROC_INMODE;
/
SHOW ERRORS;

execute empproc_inmode(20);


CREATE TABLE dept01 (
    deptno NUMBER(2),
    dname VARCHAR2(30) NOT NULL,
    LOC VARCHAR2(15) NOT NULL,
    CONSTRAINT DEPT01_DEPTNO_PK PRIMARY KEY(deptno)
);

create sequence dept01_seq
start with 10
increment by 10
minvalue 10
maxvalue 100000
nocycle
cache 2;

ALTER TABLE dept01
ADD(CREDATE DATE DEFAULT SYSDATE);

INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '�λ��','����');
INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '�ѹ���','����');
INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '������','����');
INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '�����','��õ');
INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '�ü�������','����');

SELECT * FROM dept01;

CREATE OR REPLACE PROCEDURE deptproc_inmode
(deptno IN dept01.deptno%TYPE,
 dname IN dept01.dname%TYPE,
 loc IN dept01.loc%TYPE)
IS
BEGIN
    INSERT INTO dept01 (deptno, dname, loc, credate)
    VALUES(deptno, dname, loc, SYSDATE);
    COMMIT;
END;
/
SHOW ERROR;

EXECUTE DEPTPROC_INMODE(60, '��ȹ��', '�λ�');
select * from dept01;

BEGIN
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������ / �����');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    
    FOR vdept IN (SELECT * FROM dept01 ORDER BY deptno) LOOP
        DBMS_OUTPUT.PUT_LINE(vdept.deptno || ' / ' || RPAD(vdept.dname, 10) || ' / '
                                    || vdept.loc || ' / ' ||TO_CHAR(vdept.credate, 'YYYY-MM-DD'));
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE deptproc_inup
( pdeptno IN dept01.deptno%TYPE,
  pdname IN dept01.dname%TYPE,
	ploc IN dept01.loc%TYPE )
IS
	cnt NUMBER := 0;
	vdept dept01%ROWTYPE;
BEGIN
	SELECT COUNT(*) INTO cnt FROM dept01 WHERE deptno = pdeptno;
	IF cnt = 0 THEN
		INSERT INTO dept01(deptno, dname, loc, credate)
		VALUES(pdeptno, pdname, ploc, SYSDATE);
	ELSE
		UPDATE dept01
		SET dname = pdname, loc = ploc, credate = sysdate
		WHERE deptno = pdeptno;
	END IF;
	COMMIT;

	DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������ / �����');
	DBMS_OUTPUT.PUT_LINE('------------------------------------');
	SELECT deptno, dname, loc, credate INTO vdept
	FROM dept01 WHERE deptno = pdeptno;
	DBMS_OUTPUT.PUT_LINE(vdept.deptno || ' / ' || RPAD(vdept.dname, 10) || ' / '
											|| vdept.loc || ' / ' || TO_CHAR(vdept.CREDATE, 'YYYY-MM-DD'));
END;
/
SHOW ERROR;
EXECUTE deptproc_inup(60, '��ȹ��', '����');

CREATE OR REPLACE PROCEDURE empproc_outmode(
	vemployee_id IN employees.employee_id%TYPE,
	vfirst_name OUT employees.first_name%TYPE,
	vsalary OUT employees.salary%TYPE,
	vjob_id OUT employees.job_id%TYPE
)
IS
BEGIN
	SELECT first_name, salary, job_id INTO vfirst_name, vsalary, vjob_id
	FROM employees
	WHERE employee_id = vemployee_id;
END;
/
show error;

DECLARE
	vemployee employees%ROWTYPE;
BEGIN
	empproc_outmode(120, vemployee.first_name, vemployee.salary, vemployee.job_id);
	DBMS_OUTPUT.PUT_LINE('����� : ' || vemployee.first_name);
	DBMS_OUTPUT.PUT_LINE('�� �� : ' || vemployee.salary);
	DBMS_OUTPUT.PUT_LINE('�� �� : ' || vemployee.job_id);
END;
/


CREATE OR REPLACE PROCEDURE dept_data
(dept_id IN employees.department_id%TYPE,
 dept_count OUT employees.salary%TYPE,
 dept_sal_sum OUT employees.salary%TYPE,
 dept_sal_avg OUT employees.salary%TYPE
)
IS
BEGIN
	SELECT COUNT(*), SUM(salary), AVG(salary) INTO dept_count, dept_sal_sum, dept_sal_avg
	FROM employees
	WHERE department_id = dept_id;
END;
/
show error;

DECLARE
	dept_cnt NUMBER(10);
	dept_sum NUMBER(10);
	dept_avg NUMBER(10);
BEGIN
	dept_data(30, dept_cnt, dept_sum, dept_avg);
	
	DBMS_OUTPUT.PUT_LINE('�μ� ����� : ' || dept_cnt);
	DBMS_OUTPUT.PUT_LINE('�޿��� �� : ' || dept_sum);
	DBMS_OUTPUT.PUT_LINE('�޿��� ��� : ' || dept_avg);
END;
/


CREATE OR REPLACE PROCEDURE empproc02_outmode
(vemployee_id IN employees.employee_id%TYPE,
 vfirst_name OUT employees.first_name%TYPE,
 vsalary OUT employees.salary%TYPE,
 dept_name OUT departments.department_name%TYPE,
 dept_avg OUT employees.salary%TYPE
)
IS
BEGIN
	SELECT first_name, salary, department_name, avg 
    INTO vfirst_name, vsalary, dept_name, dept_avg
	FROM
	(SELECT employee_id, e.first_name, e.salary, d.department_name,
					TRUNC(AVG(e.salary) OVER(PARTITION BY d.department_id)) AS avg
	FROM employees e INNER JOIN departments d
	ON e.department_id = d.department_id)
	WHERE employee_id = vemployee_id;
END;
/
SHOW ERROR;

DECLARE
	vfirst_name VARCHAR2(20);
	vsalary NUMBER;
	dept_name VARCHAR2(20);
	dept_avg NUMBER;
	
BEGIN
	empproc02_outmode(201, vfirst_name, vsalary, dept_name, dept_avg);

	DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || 201);
	DBMS_OUTPUT.PUT_LINE('�޿� : ' || vsalary);
	DBMS_OUTPUT.PUT_LINE('�μ��� : ' || dept_name);
	DBMS_OUTPUT.PUT_LINE('�μ���� : ' || dept_avg);
END;
/
SHOW error;


