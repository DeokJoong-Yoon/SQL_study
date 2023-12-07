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

--drop�� emp01 ���̺��� emp02 �̸����� �����Ѵ�.
FLASHBACK TABLE emp01 TO BEFORE DROP RENAME TO emp02;

SELECT
    *
FROM
    tab;

-- EMPLOYEES02 ���̺��� �̸��� EMPLOYEES01���� ����
RENAME employees02 TO employees01;

SELECT
    *
FROM
    tab;
    
-- EMPLOYEES01 ���̺��� ��� �ο츦 ����
SELECT
    *
FROM
    employees01;

TRUNCATE TABLE employees01; -- �ڵ�Ŀ�Եȴ�. ( = ���� �Ұ� )

CREATE TABLE tb_customer (
    customer_cd  CHAR(7 BYTE) NOT NULL PRIMARY KEY,
    customer_nm  VARCHAR2(15 CHAR) NOT NULL,
    mw_flg       CHAR(1) NOT NULL,
    birth_day    CHAR(8) NOT NULL,
    phone_number VARCHAR2(16),
    email        VARCHAR2(50),
    total_point  NUMBER(10),
    reg_dttm     CHAR(14)
);

CREATE TABLE member (
    id      NUMBER(20) NOT NULL PRIMARY KEY,
    name    VARCHAR2(20) NOT NULL,
    regno   CHAR(8) NOT NULL,
    hp      VARCHAR2(13) NOT NULL,
    address VARCHAR(100) NOT NULL
);

-- memeber ���̺��� ȸ��ID�� �������� ������������ ����
ALTER TABLE member MODIFY (
    id VARCHAR2(20)
);

DESC member;

CREATE TABLE book (
    code    NUMBER(4) NOT NULL PRIMARY KEY,
    title   VARCHAR2(100) NOT NULL,
    count   NUMBER(6) NOT NULL,
    price   NUMBER(10) NOT NULL,
    publish VARCHAR2(50) NOT NULL
);

DESC book;

CREATE TABLE book_order (
    no      VARCHAR2(10) NOT NULL PRIMARY KEY,
    id      VARCHAR(20) NOT NULL,
    code    NUMBER(4) NOT NULL,
    count   NUMBER(6) NOT NULL,
    or_date DATE NOT NULL
);

CREATE TABLE dept (
    deptno NUMBER(2),
    dname  VARCHAR2(14),
    loc    VARCHAR2(13)
);

INSERT INTO dept (
    deptno,
    dname,
    loc
) VALUES (
    10,
    'ACCOUNTING',
    'NEW YORK'
);

INSERT INTO dept VALUES (
    20,
    'RESEARCH',
    'DALLAS'
);

ALTER TABLE dept MODIFY (
    deptno NOT NULL
);

ALTER TABLE dept MODIFY (
    dname NOT NULL
);

DESC dept;

SELECT
    *
FROM
    dept;

INSERT INTO dept (
    deptno,
    dname
) VALUES (
    30,
    'SALES'
);

INSERT INTO dept VALUES (
    40,
    'OPERATIONS',
    NULL
);

INSERT INTO dept VALUES (
    50,
    ' ',
    NULL
);

ALTER TABLE dept MODIFY (
    deptno NUMBER(4),
    dname VARCHAR2(30)
);

INSERT INTO dept
    SELECT
        department_id,
        department_name,
        location_id
    FROM
        departments;

SELECT
    *
FROM
    dept;

desc tb_customer;

-- <����> TB_CUSTOMER ���̺� �Ʒ� �����͸� �߰��϶�
INSERT INTO tb_customer (
    customer_cd,
    customer_nm,
    mw_flg,
    birth_day,
    phone_number,
    email,
    total_point,
    reg_dttm
) VALUES (
    '2017042',
    '������',
    'M',
    '19810603',
    '010-8202-8790',
    'wjgang@navi.com',
    280300,
    '20170123132432'
);

INSERT INTO tb_customer (
    customer_cd,
    customer_nm,
    mw_flg,
    birth_day,
    phone_number,
    email,
    total_point,
    reg_dttm
) VALUES (
    '2017053',
    '�����',
    'W',
    '19891225',
    '010-4509-0043',
    'ksna@boram.co.kr',
    4500,
    ' 20170210180930 '
);

INSERT INTO tb_customer (
    customer_cd,
    customer_nm,
    mw_flg,
    birth_day,
    phone_number,
    email,
    total_point,
    reg_dttm
) VALUES (
    '2017108',
    '�ڽ���',
    'm',
    '19711430',
    NULL,
    'sdpark@haso.com',
    280300,
    '20170123132432'
);

DELETE FROM tb_customer;

SELECT
    *
FROM
    tb_customer;

INSERT ALL INTO tb_customer (
    customer_cd,
    customer_nm,
    mw_flg,
    birth_day,
    phone_number,
    email,
    total_point,
    reg_dttm
) VALUES (
    '2017042',
    '������',
    'M',
    '19810603',
    '010-8202-8790',
    'wjgang@navi.com',
    280300,
    '20170123132'
) INTO tb_customer VALUES (
    '2017053',
    '�����',
    'W',
    '19891225',
    '010-4509-0043',
    'ksna@boram.co.kr',
    4500,
    ' 20170210130 '
) INTO tb_customer VALUES (
    '2017108',
    '�ڽ���',
    'm',
    '19711430',
    NULL,
    'sdpark@haso.com',
    280300,
    '20170123132'
) SELECT
      *
  FROM
      dual;

desc dual;

SELECT
    100 + 4
FROM
    dual;

SELECT
    sysdate
FROM
    dual;

SELECT
    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') AS now
FROM
    dual;

SELECT
    *
FROM
    tb_customer;

CREATE TABLE emp01
    AS
        SELECT
            employee_id,
            first_name,
            department_id,
            hire_date
        FROM
            employees
        WHERE
            1 = 0;

DESC emp01;

CREATE TABLE emp_manager
    AS
        SELECT
            employee_id,
            first_name,
            manager_id
        FROM
            employees
        WHERE
            1 = 0;

DESC emp_manager;

-- EMP01 ���̺� EMPLOYEES ���̺��� �μ��ڵ尡 30�� ������ ���, �̸�, �ҼӺμ�, �Ի����� �����ϰ�
-- EMP_MANAGER ���̺� EMPLOYEES ���̺��� �μ��ڵ尡 30�� ������ ���, �̸�, ������ ����� ��ȸ�Ͽ� ����
INSERT ALL INTO emp01 VALUES (
    employee_id,
    first_name,
    department_id,
    hire_date
) INTO emp_manager VALUES (
    employee_id,
    first_name,
    manager_id
) SELECT
        employee_id,
        first_name,
        department_id,
        hire_date,
        manager_id
    FROM
        employees
  WHERE
      department_id = 30;

SELECT
    *
FROM
    emp01;

SELECT
    *
FROM
    emp_manager;

-- EMPLOYEES ���̺��� ������ �����Ͽ� ���, �Ի���, �޿��� ������ �� �ִ� ���̺� EMP_OLD�� EMP_NEW ����
CREATE TABLE emp_old
    AS
        SELECT
            employee_id,
            first_name,
            hire_date,
            salary
        FROM
            employees
        WHERE
            1 = 0;

DESC emp_old;

SELECT
    *
FROM
    emp_old;

CREATE TABLE emp_new
    AS
        SELECT
            employee_id,
            first_name,
            hire_date,
            salary
        FROM
            employees
        WHERE
            1 = 0;

DESC emp_new;

SELECT
    *
FROM
    emp_new;
-- EMPLOYEES ���̺��� �Ի��� ��������
-- 2006�� 1�� 1�� ���� �Ի��� ����� ���, �̸�, �Ի���, �޿��� ��ȸ�ؼ� EMP_OLD ���̺� ����
--                       �Ŀ� �Ի��� ����� ������ EMP_NEW ���̺� ����

INSERT
    ALL WHEN hire_date < '2006/01/01' THEN
        INTO emp_old
        VALUES (
            employee_id,
            first_name,
            hire_date,
            salary
        )
        WHEN hire_date >= '2006/01/01' THEN
            INTO emp_new
            VALUES (
                employee_id,
                first_name,
                hire_date,
                salary
            )
SELECT
    employee_id,
    first_name,
    hire_date,
    salary
FROM
    employees;

SELECT
    *
FROM
    emp_old;

SELECT
    *
FROM
    emp_new;

CREATE TABLE emp
    AS
        SELECT
            *
        FROM
            employees;

UPDATE emp
SET
    department_id = 30;

UPDATE emp
SET
    salary = salary * 1.1;

UPDATE emp
SET
    hire_date = sysdate;

UPDATE emp
SET
    department_id = 30
WHERE
    department_id = 10;

-- �޿��� 3000�̻��� ����� �޿��� 10% �λ�
UPDATE emp
SET
    salary = salary * 1.3
WHERE
    salary >= 3000;
    
-- 2007�⿡ �Ի��� ����� �Ի����� ���÷� �����Ѵ�.
UPDATE emp
SET
    hire_date = sysdate
WHERE
--    substr(hire_date, 1, 2) = '07';
    hire_date BETWEEN '2007/01/01' AND '2007/12/31';

SELECT
    hire_date,
    first_name
FROM
    emp
WHERE
--    substr(hire_date, 1, 2) = '07';
    hire_date BETWEEN '2007/01/01' AND '2007/12/31';

SELECT
    hire_date,
    first_name
FROM
    emp
WHERE
    hire_date >= '2023/12/07';

SELECT
    *
FROM
    emp
WHERE
    first_name = 'Susan';

UPDATE emp
SET
    department_id = 29,
    job_id = 'FI_MGR'
WHERE
    first_name = 'Susan';

SELECT
    *
FROM
    emp
WHERE
    last_name = 'Russell';

UPDATE emp
SET
    salary = 17000,
    commission_pct = 0.45
WHERE
    last_name = 'Russell';

DELETE FROM dept;

desc dept;

DELETE FROM emp
WHERE
    last_name = 'Russell';

SELECT
    *
FROM
    emp
WHERE
    last_name = 'Russell';

-- ������ ���� �� ���� ���̺��� �ϳ��� ���̺�� ��ġ�� ��� ����
-- �� ���̺��� �����ϴ� ������ ���� �����ϸ� UPDATE�ǰ� ������ ���� ������ INSERT ��
MERGE INTO tb_customer cu
USING tb_add_customer nc ON ( cu.customer_cd = nc.customer_cd )
WHEN MATCHED THEN UPDATE
SET cu.customer_nm = nc.custmer_nm,
    cu.mw_flg = nc.mw_flg,
    cu.birth_day = nc.birth_day,
    cu.phone_number = nc.phone_number
WHEN NOT MATCHED THEN
INSERT (
    cu.customer_cd,
    cu.customer_nm,
    cu.mw_flg,
    cu.birth_day,
    cu.phone_number,
    cu.email,
    cu.total_point,
    cu.reg_dttm )
VALUES
    ( nc.custmer_cd,
      nc.customer_nm,
      nc.mw_flg,
      nc.birgh_day,
      nc.phone_number,
    '',
    0,
    to_char(sysdate, 'YYYYMMDDHHMISS') );

SELECT
    *
FROM
    tb_customer;
    
select * from book;
select * from book_order;

DROP table emp01 purge;

create table emp01(
empno number(4) not null,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)        
);

create table emp02 (
    empno number(4) unique,
    ename varchar2(10) not null,
    job varchar(9),
    deptno number(4)
);
insert into emp02(empno, ename, job, deptno)
values (7499, 'allen', 'salesman', 30);

select TABLE_NAME from user_tables
order by table_name desc;

select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP02';

select owner, constraint_name, table_name, column_name from user_cons_columns where table_name = 'EMP02';

create table emp03(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(4)
);
select * from emp03;
insert into emp03 values(7499, 'allen', 'salesman', 30);
insert into emp03 values(null, 'allen', 'salesman', 30);
select constraint_name, constraint_type, table_name from user_constraints where table_name = 'EMP03';

create table dept01(
    deptno number(2) primary key,
    dname varchar2(14) not null,
    loc varchar2(13)
);
insert into dept01 (deptno, dname, loc) values (10, 'ACCOUNTING', 'NEW YORK');
insert into dept01 (deptno, dname, loc) values (20, 'RESEARCH', 'DALLAS');
insert into dept01 (deptno, dname, loc) values (30, 'SALES', 'CHICAGO');
insert into dept01 (deptno, dname, loc) values (40, 'OPERATIONS', 'BOSTON');
select * from dept01 order by deptno;
insert into emp03 values(7566, 'JONES', 'MANAGER', 50);
select * from emp03;

create table emp04(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2) references dept01(deptno)
);

insert into emp04 values(1234, 'asfd', 'qwer', 40);

select constraint_name, constraint_type, table_name, r_constraint_name from user_constraints where table_name = 'EMP04';

create table emp05(
    empno number(4) primary key,
    ename varchar2(10) not null,
    gender char(1) check (gender in ('M', 'F')),
    regdate date default sysdate
);
insert into emp05(empno, ename, gender) values(1234, 'asdf', 'M');

select * from emp05;

select constraint_name constraint_type, table_name, search_condition from user_constraints where table_name = 'EMP05';