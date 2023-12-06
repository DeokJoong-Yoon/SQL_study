-- ������ �ּ�

-- ���� ������ �����ϰ� �ִ� ��� ���̺� ��ȸ
SELECT
    *
FROM
    tab;

-- �μ����̺��� ��� ������ ��ȸ
SELECT
    *
FROM
    departments;

-- ������̺� ��� ������ ��ȸ
SELECT
    *
FROM
    employees;

-- employees ���̺� ���� Ȯ��
DESC EMPLOYEES;

-- DEPARTMENTS ���̺��� �μ���ȣ�� �μ��� ���
SELECT
    department_id,
    department_name
FROM
    departments;

-- <����>����� �̸��� �޿��� �Ի����� ���� ����ϴ� SQL�� �ۼ�
-- ��� ������ ����� ���̺��� EMPLOYEES, ����̸� �÷��� FIRST_NAME, LAST_NAME��, �޿��÷��� SALARY, �Ի����� �÷��� HIRE_DATE
SELECT
    first_name,
    last_name,
    salary,
    hire_date
FROM
    employees;

-- �÷��� �̸��� AS�� ��Ī ����
-- DEPARTMENT_ID �÷��� DepartmentNo��  DEPARTMENT_NAME �÷��� DepartmentName���� ��Ī
SELECT
    department_id   AS departmentno,
    department_name AS departmentname
FROM
    departments;

-- AS ���� �÷��� ��Ī �ο�
SELECT
    department_id   "Department No",
    department_name "Department Name"
FROM
    departments;

-- ��Ī���� �ѱ� ����� ����
SELECT
    department_id   �μ���ȣ,
    department_name �μ���
FROM
    departments;    
    
-- Concatenation �������� ���ǿ� ���(���� ������)
SELECT
    first_name
    || '�� ������ '
    || job_id
    || '�Դϴ�' AS ����
FROM
    employees;

SELECT
    first_name
    || ' '
    || last_name �̸�,
    salary       �޿�,
    hire_date    �Ի���
FROM
    employees;
    
-- EMPLOYEES ���̺��� Į�� JOB_ID�� ǥ���ϵ� �ߺ��� ���� �ѹ��� ǥ��
SELECT DISTINCT
    job_id
FROM
    employees;
    
-- <����>�������� � �μ��� �ҼӵǾ� �ִ��� �Ҽ� �μ���ȣ(DEPARTMENT_ID) ����ϵ� �ߺ����� �ʰ� �ѹ��� ����ϴ� ����
SELECT DISTINCT
    department_id
FROM
    employees;

-- �޿��� 10000 �̻� �޴� ������ ���
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary >= 10000;
    
-- �޿��� 3000�̸� �޴� ������ ���
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary < 3000;
    
-- EMPLOYEES ���̺��� �μ���ȣ�� 110���� ������ ���� ��� ������ ���
SELECT
    *
FROM
    employees
WHERE
    department_id = 110;

-- EMPLOYEES ���̺��� �޿��� 5000�̸��� �Ǵ� ������ ���� �߿��� ���, �̸�, �޿� ���
SELECT
    department_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary < 5000;
    
-- ����� �޿��� 1000�λ��Ͽ� �����ȣ, �����, �޿�, �λ�޿�, �Ի����� ���
SELECT
    department_id �����ȣ,
    first_name    �����,
    salary        �޿�,
    salary + 1000 AS �λ�޿�,
    hire_date
FROM
    employees;
    
-- ���� ������ ��ȸ
-- �̸� (FISRT_NAME)�� 'Lex'�� ����
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    first_name = 'Lex';
    
-- �̸��� John�� ����� �����ȣ�� ������ ����ID�� ����϶�
SELECT
    department_id �����ȣ,
    job_id        ����id
FROM
    employees
WHERE
    first_name = 'John'; -- ���� ��ҹ��� �����Ѵ� 'john' ���� select �� ��� ������ ����
    
-- ��¥ ������ ��ȸ
-- 2008�� ���Ŀ� �Ի��� ����
SELECT
    first_name,
    hire_date
FROM
    employees
WHERE
--    hire_date >= '2008'; -- ���� �߻�
--    hire_date >= '2008-01-01';
    hire_date >= '2008/01/01';

-- ��������
-- �޿��� 5000���� 10000���� ���� ���� ���
SELECT
    employee_id,
    first_name,
    phone_number,
    department_id,
    job_id
FROM
    employees
WHERE
        salary >= 5000
    AND salary <= 10000;
    
-- �μ���ȣ�� 100���̰ų� ������ FI_MGR�� ����
SELECT
    employee_id,
    first_name,
    phone_number,
    department_id,
    job_id
FROM
    employees
WHERE
    department_id = 100
    OR job_id = 'FI_MGR';
    
-- <����> ���� ID�� FI_MGR�� �ƴ� ����
SELECT
    employee_id,
    first_name,
    department_id,
    job_id
FROM
    employees
WHERE
    NOT job_id = 'FI_MGR';

SELECT
    employee_id,
    first_name,
    department_id,
    job_id
FROM
    employees
WHERE
    job_id <> 'FI_MGR';

-- �����ȣ�� 134 �̰ų� 201�̰ų� 107�� ���� ���� ���
SELECT
    employee_id,
    first_name,
    department_id,
    job_id
FROM
    employees
WHERE
    employee_id = 134
    OR employee_id = 201
    OR employee_id = 107;
    
-- �μ���ȣ�� 100���� �ƴ� ����
SELECT
    employee_id,
    first_name,
    phone_number,
    department_id,
    job_id
FROM
    employees
WHERE
    NOT department_id = 100;
    
-- �޿��� 1000�������� 3000������ ���� ���� ����
SELECT
    employee_id,
    first_name,
    email,
    salary
FROM
    employees
WHERE
    salary BETWEEN 1000 AND 3000; 
    
-- <����> �޿��� 2500���� 4500������ ������ ���� ������ ������ȣ, �̸�, �޿��� ���
-- ( AND �����ڿ� BETWEEN AND ������ ��� )
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 2500 AND 4500;

SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
        salary >= 2500
    AND salary <= 4500;

-- IN ������
-- ������ȣ�� 177�̰ų� 101�̰ų� 184�� ���
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    employee_id = 177
    OR employee_id = 101
    OR employee_id = 184;

SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    employee_id IN ( 177, 101, 184 );
    
-- <����> �μ���ȣ�� 10, 20, 30 �� �ϳ��� �Ҽӵ� ������ ������ȣ, �̸�, �޿��� ���
-- (OR ������, IN ������ ���
SELECT
    employee_id ������ȣ,
    first_name  �̸�,
    salary      �޿�
FROM
    employees
WHERE
    department_id = 10
    OR department_id = 20
    OR department_id = 30;

SELECT
    employee_id ������ȣ,
    first_name  �̸�,
    salary      �޿�
--    ,department_id -- ������
FROM
    employees
WHERE
    department_id IN ( 10, 20, 30 );
    
-- <����> ������̺��� JOB_ID�� 'SA_MAN', 'ST_MAN', 'PU_MAN', 'AC_MGR'��
-- �����ȣ, �����, ������ȣ�� ����϶�
SELECT
    employee_id ������ȣ,
    first_name  �̸�,
    job_id      �޿�
FROM
    employees
WHERE
    job_id IN ( 'SA_MAN', 'ST_MAN', 'PU_MAN' );

-- K�� �����ϴ� ���
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    first_name LIKE 'K%';
    
-- �̸� �߿� k�� �����ϴ� ���
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    lower(first_name) LIKE '%k%';

-- �̸��� k�� ������ ���
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    first_name LIKE '%k';

-- �̸��� �� ��° ���ڰ� d�� ���
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    first_name LIKE '_d%';

-- �ڵ�����ȣ���� 5��° 1�� ���ڵ� ��ȸ
SELECT
    phone_number
FROM
    employees
WHERE
    phone_number LIKE '____1%';
    
-- ESCAPE(' \ ', '@')
-- LIKE �������� '%' �� '_' �� ���Ե� ���ڸ� �˻��ϰ��� �Ҷ� ���ȴ�.
--  '%' �� '_' �տ� ESCAPE�� Ư�����ڸ� �����ϸ� �˻��� �� �ִ�.
-- Ư�����ڴ� �ƹ��ų� ������� ��� �����ϴ�.
-- ���� ������ EXCAPE�� ����� ���ڿ��� �������ָ� '_' �� '%' �� �˻��� ����� �� �ְ� �����ش�.

-- ������̺�(EMPLOYEES)���� ����ID�� 3��° _�� �����ϰ� 4��° �ڸ��� ���� P�� ���ڵ带 ��ȸ
SELECT
    *
FROM
    employees
WHERE
    job_id LIKE '__\_P%' ESCAPE '\';

SELECT
    *
FROM
    employees
WHERE
    job_id LIKE '__@_P%' ESCAPE '@';
    
-- �̸��� a�� �������� ���� ������ ������ȣ, �̸��� ���
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    lower(first_name) NOT LIKE '%a%';
    
-- Ŀ�̼��� ���� �ʴ� ���
SELECT
    employee_id,
    first_name,
    commission_pct,
    job_id
FROM
    employees
WHERE
--    comission_pct = NULL; -- ������ ��ã��
    commission_pct IS NULL;

-- Ŀ�̼��� �޴� ���
SELECT
    employee_id,
    first_name,
    commission_pct,
    job_id
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
    
-- <����> �ڽ��� ���ӻ���� ���� ������ ��ü �̸��� ������ȣ, ����ID�� ������϶�
-- SELECT * FROM EMPLOYEES;
SELECT
    first_name
    || ' '
    || last_name ��ü�̸�,
    employee_id  ������ȣ,
    job_id       ����id
FROM
    employees
WHERE
    manager_id IS NULL;
    
-- <����> Ŀ�̼��� �޴� ����� ����ϵ� �����ȣ, �̸�, �޿�, ������, ����ݾ�(���� - �޿� * ������)�� ����϶�.
SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    salary * commission_pct commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- <��>����� �������� ������������ ����
SELECT
    employee_id,
    first_name
FROM
    employees
ORDER BY
--    employee_id -- ORDER BY �� default ���� ASC
    employee_id ASC;

SELECT
    employee_id,
    first_name
FROM
    employees
ORDER BY
    employee_id DESC;
    
-- �ڹ� �ε��� : 0 ~
-- ����Ŭ�� �ε��� ��ȣ : 1 ~ 

SELECT
    employee_id,
    first_name
FROM
    employees
ORDER BY
-- ORDER BY �÷��� ( �Ǵ� ����)
    1 DESC;

-- NULL�� ������ �÷�ó��
-- ASC : NULL ���ڵ带 ���� ������ ���
-- DESC : NULL ���ڵ带 ���� ���� ��� 
SELECT
    employee_id,
    first_name,
    department_id
FROM
    employees
ORDER BY
    department_id DESC;
    
-- <����> ������ȣ, �̸�, �޿�, �μ���ȣ�� �޿��� ���� ������ ����϶�.
-- ���� �޿��� ��� ������ȣ ������������ ���
SELECT
    employee_id,
    first_name,
    salary,
    department_id
FROM
    employees
ORDER BY
--    salary DESC, employee_id DESC;
    3 DESC,
    1 DESC;
    
-- <����> �Ի����� ���� �ֱ��� ���� ������ ������ȣ, �̸�, �Ի����� ����϶�
SELECT
    employee_id,
    first_name,
    hire_date
FROM
    employees
ORDER BY
    hire_date DESC;
    
--<����> �μ���ȣ�� 20, 50�� �μ����� �ٹ��ϴ� ��� ������� �̸�(FIRST_NAME), �μ� ��ȣ, �޿���
--����� �̸���(���ĺ���)���� ����϶�.
SELECT
    first_name,
    department_id,
    salary
FROM
    employees
WHERE
--    department_id = 20 OR
--    department_id = 50
    department_id IN ( 20, 50 )
ORDER BY
    first_name;
    
--�����ȣ, �����, �޿� 3���� Į������ ������ emp01 ���̺�
CREATE TABLE emp01 (
    empno NUMBER(4),
    ename VARCHAR(20),
    sal   NUMBER(7, 2)
);

DESC emp01;
-- ���ʵ�� �� ��� ���θ� �����Ѵ�.

SELECT
    *
FROM
    tab;

-- employee ���̺�� employee���̺��� ��� Į���� �����Ͽ� employees02 ���̺��� �����Ѵ�.
CREATE TABLE employees02
    AS
        SELECT
            *
        FROM
            employees;

DESC employees02;

-- EMP01 ���̺� ���� Ÿ���� ����(JOB) Į���� �߰�
ALTER TABLE emp01 ADD (
    job VARCHAR2(9)
);

DESC emp01;

--<����>�̹� �����ϴ� EMP01 ���̺� �Ի��� Į��(CREDATE)�� ��¥������ �߰�
ALTER TABLE emp01 ADD (
    credate DATE
);

DESC emp01;

--������ �ִ� 30�ڱ��� �Է��� �� �ֵ��� ũ�� ����
ALTER TABLE emp01 MODIFY (
    job VARCHAR2(30)
);

DESC emp01;

--�Ի��� �÷��� �̸��� CREDATE���� REGDATE�� �÷��� ����
ALTER TABLE emp01 RENAME COLUMN credate TO regdate;

DESC emp01;

-- ����(JOB) Į���� ����
ALTER TABLE emp01 DROP COLUMN job;

DESC emp01;

--emp01 ���̺� ����
DROP TABLE emp01;

desc emp01;