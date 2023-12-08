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



--20231208
-----------------------------------------------------------------------------------------------------------------------------------
-- �÷� ���� ���� ��������
create table emp06 (
    empno number(4) constraint emp06_empno_pk primary key,
    ename varchar2(10) constraint emp06_ename_nn not null,
    job varchar2(9) constraint emp06_job_uk unique,
    deptno number(2) constraint emp06_deptno_fk references dept01(deptno)
);
desc emp06;
select constraint_name constraint_type, table_name, r_constraint_name from user_constraints where table_name = 'EMP06';


insert into emp06
values(7499, 'aleen', 'salesman', 30);
select * from emp06;

--ORA-00001: ���Ἲ ���� ����(HR.EMP06_EMPNO_PK)�� ����˴ϴ�
Insert into emp06 values(7499, 'allen', 'salesman', 30);

--ORA-01400: NULL�� ("HR"."EMP06"."ENAME") �ȿ� ������ �� �����ϴ�
insert into emp06 values(7499, NULL, 'salesman', 50);

--ORA-00001: ���Ἲ ���� ����(HR.EMP06_EMPNO_PK)�� ����˴ϴ�
insert into emp06 values(7499, 'allen', 'salesman', 50);

--ORA-00001: ���Ἲ ���� ����(HR.EMP06_JOB_UK)�� ����˴ϴ�
insert into emp06 values(7500, 'allen', 'salesman', 50);

--ORA-02291: ���Ἲ ��������(HR.EMP06_DEPTNO_FK)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
insert into emp06 values(7500, 'ellen',  ' manager', 50);

create table emp08(
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2),
    constraint emp08_empno_pk primary key(empno),
    constraint emp08_job_uk unique(job),
    constraint emp08_emptno_fk foreign key(deptno) references dept01(depno);
);

create table emp09 (
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    deptno number(2)
);
select constraint_name, constraint_type, table_name, r_constraint_name from user_constraints where table_name='EMP09';

-- �������Ǹ��� ������� �ʰ� �⺻Ű �߰�
alter table emp09
add primary key(empno);

-- �������Ǹ��� ����ϰ� �ܷ�Ű �߰�
alter table emp09
add constraint emp09_deptno_fk foreign key(deptno) references dept01(deptno);

-- ENAME �÷��� NOT NULL ���� ���� ����(null, check default�� ���������� �̹� �ֱ� ������ modify�� �����ؾ��Ѵ�.)
alter table emp09
modify (ename varchar2(10)) not null;

alter table emp09
add constraint emp09_empno_pk primary key(empno);

alter table emp09
add constraint emp09_empno_fk foreign key(deptno) references dept01(deptno);

select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints
where table_name = 'dept01';

-- HR ����ڷ� ������ DEPT01 ���̺�� ����Ű(�ܷ�Ű) ���� ���̺� Ȯ��
select fk.owner, fk.constraint_name, fk.table_name
from all_constraints fk, all_constraints pk
where fk.r_constraint_name = pk.constraint_name
    and pk.owner = 'HR'
    and fk.constraint_type = 'R'
    and pk.table_name = 'DEPT01'
    order by fk.table_name;

select * from emp06;
select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints
where table_name = 'EMP06';
-- �������� ����
-- alter table ���̺��
-- drop constraint �������Ǹ�;
alter table emp06
drop constraint emp06_job_uk;

alter table emp06
drop constraint emp06_deptno_fk;

alter table emp06
drop primary key;

create table dept02(
    deptno number(2),
    dname varchar2(14) not null,
    loc varchar2(13),
    constraint dept02_deptno_pk primary key(deptno)
);

select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints
where table_name = 'DEPT02';

insert into dept02 values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept02 values(20, 'RESEARCH', 'DALLAS');
select * from dept02;

DROP TABLE EMP02;

create table emp02(
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2),
    constraint emp02_empno_pk primary key(empno),
    constraint emp02_empno_fk foreign key(deptno) references dept02(deptno)
);

select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints where table_name = 'EMP02';

insert into emp02 values(7499, 'ALLEN', 'SALESMAN', 10);
insert into emp02 values(7369, 'SMITH', 'CLERK', 20);
select * from emp02;
select * from dept02;
delete from dept02 where deptno = 10;

update emp02
set deptno = 20
where empno = 7499;

-- ��� ���̺� �μ���ȣ�� 10�� ����� ���� �����ϰ�
delete from emp02 where deptno =10;

create table treatment(
    t_no number(4) not null,
    t_course_abbr varchar2(3) not null,
    t_course varchar2(30) not null,
    t_tel varchar2(15) not null,
    constraint treatment_no_pk primary key(t_no),
    constraint treatment_course_abbr_uk unique(t_course_abbr)
);

-- ���̺��� �÷��� �ּ��� �ٴ� ����
-- ǥ����
-- comment on column ���̺��.�÷��� IS '�ּ� ����';
comment on column treatment.t_no is '�����ȣ';
comment on column treatment.t_course_abbr is '���������';
comment on column treatment.t_course is '�������';
comment on column treatment.t_tel is '��ȭ��ȣ';
select table_name, column_name, comments
from all_col_comments
where table_name = 'TREATMENT';

insert into treatment values(1001, 'NS', '�Ű�ܰ�', '02-3252-1009');
insert into treatment values(1002, 'OS', '�����ܰ�', '02-3252-2009');
insert into treatment values(1003, 'C', '��ȯ�⳻��', '02-3252-3009');
select * From treatment;

create table doctor(
    d_no number(4) not null,
    d_name varchar2(20) not null,
    d_ssn char(14) not null,
    d_email varchar2(80) not null,
    d_major varchar(50) not null,
    t_no number(4) ,
    constraint doctor_d_no_pk primary key(d_no)
);

alter table doctor
add constraint doctor_t_no foreign key(t_no) references treatment(t_no)
on delete cascade;

insert into doctor values(1, 'ȫ�浿', '660606-1234561', 'javauser@naver.com', 'ô�߽Ű�ܰ�', 1001);
insert into doctor values(2, '����ȯ', '690724-1674536' 'asdf@naver.com', '������, �������ܰ�' 1003);
insert into doctor values(3, '����ȯ', '761212-1958354', 'qwer@naver.com', '�ΰ�����, ������', 1002);
insert into doctor values(4, '�����', '957381-1285746', 'zxv@naver.com', '����ܰ�, �ܻ�����', 1002);

delete from treatment where t_no = 1002;

select * from treatment;
select * from doctor;

rollback;
alter table doctor
drop constraint doctor_t_no;

alter table doctor
add constraint doctor_t_no foreign key(t_no) references treatment(t_no)
on delete set null;

delete from treatment where t_no = 1002;

select * from treatment;
select * from doctor;

-- ���� T_NO �÷��� NOT NULL �� �����Ǿ� �ִٸ� NULL�� ����ϴ� �÷����� ����
alter table doctor
modify (t_no number(4) null);

select * from employees, departments;


-- ���� ( Join )
-----------------------------------------------------------------------------------------------------------------------------------
select employee_id, first_name, department_id from employees;
select department_id, department_name from departments;

select first_name, department_name from employees, departments
where employees.department_id = departments.department_id;

-- ���ν� �����÷��� ��ȸ�ϰ� �Ҷ��� �ݵ�� ���̺��.�÷� �Ǵ� ���̺� ��Ī.�÷����� ���
-- ORA-009128 : ���� ���ǰ� �ָ��մϴ�. ���δ���� ���̺��� ���� �÷��� select �� �÷��� �����ؾ��Ѵ�.
select first_name, department_name, department_id
from employees, departments
where employees.department_id = departments.department_id;

select first_name, department_name, employees.department_id
from employees, departments
where employees.department_id = departments.department_id;

-- ���̺���� ������ ��Ī���� ���ٰ���
select first_name, department_name, e.department_id
from employees e, departments d
where e.department_id = d.department_id;

select e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.first_name = 'Susan';

select * from jobs;
-- ��� ���̺�(EMPLOYEES) �� ���� (JOBS) => �����÷� : JOB_ID
-- ��� ���̺�(EMPLOYEES) �� �μ� (DEPARTMENTS) => �����÷� : DEPARTMENT_ID
-- �����, ����ID, ������(JOB_TITLE), �μ���ȣ, �μ����� ���
select first_name, e.job_id, job_title, e.department_id, department_name
from employees e, jobs j, departments d
where e.job_id = j.job_id and e.department_id = d.department_id;

create table salarygrade  (
    grade number,
    minsalary number,
    maxsalary number
);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(1, 2000, 3000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(2, 3001, 4500);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(3, 4501, 6000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(4, 6001, 8000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(5, 8001, 10000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(6, 10001, 13000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(7, 13001, 20000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(8, 20001, 30000);
select * from salarygrade;

commit;

select * from salarygrade;
select e.first_name, e.salary, s.grade
from employees e, salarygrade s
where e.salary between s.minsalary and s.maxsalary;
--order by grade desc;

select e.first_name, e.salary, s.grade
from employees e, salarygrade s
where e.salary >= s.minsalary and e.salary <= s.maxsalary;

select e.first_name, d.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id
order by d.department_id desc;



select * from departments;

-- Outer Join
-- �μ����̺��� �Ӻμ���ȣ�� ���� ����ϰ� ������̺� �����ʹ� ���ǿ� ��ġ�ϴ� �����͸� ����� ��
-- Outer Join�� ���
select e.first_name, d.department_id, department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.first_name, d.department_id, department_name
from employees e, departments d
where d.department_id = e.department_id(+) order by department_id desc;

-- 2007�⵵ ��ݱ⿡ �Ի��� ����� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ���غ���.
-- (��� ���� �� : 12)
select employee_id, first_name, hire_date, department_id
from employees
--where hire_date >= '2007/01/01' and hire_date <= '2007/06/30';
where hire_date between '2007/01/01' and '2007/06/30';

-- 2007�⵵ ��ݱ⿡ �Ի��� ����� �����ȣ, �̸�, �Ի���, �μ����� ���.
-- (��� ���� �� : 11)
select employee_id, first_name, hire_date, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+) and hire_date between '2007/0101' and '2007/06/30';

-- SELFT JOIN

-- ������ ����� �Ŵ���(���) �̸��� ����ϱ� ���� ������
select  work.first_name �����, manager.first_name �Ŵ�����
from employees work, employees manager
where work.manager_id = manager.employee_id;

-- ��� ���̺� (�����ȣ, �����, �����ڹ�ȣ)
select employee_id, first_name, manager_id
from employees;

-- ������ ���̺�(�����ڹ�ȣ�� �����ȣ�̹Ƿ� �����ڻ����ȣ, �����ڸ�)
select employee_id, first_name
from employees order by employee_id;


select rpad(work.first_name, 11, ' ') || '�� �Ŵ����� ' || manager.first_name || '�̴�.' AS "�� ����� �Ŵ���"
from employees work, employees manager
where work.manager_id = manager.employee_id;

select concat (concat(concat(rpad(work.first_name, 11, ' '), '�� �Ŵ����� '), manager.first_name), '�̴�.')
as "�� ����� �Ŵ���"
from employees work, employees manager
where work.manager_id = manager.employee_id;


-- INNER JOIN
select first_name, department_name
from employees inner join departments
on employees.department_id = departments.department_id;

-- JOIN�� �ۼ� �� �⺻���� INNER JOIN
select first_name, department_name
from employees join departments
on employees.department_id = departments.department_id;

-- ��� ���̺�(EMPLOYEES) �� ���� ���̺� (JOBS) => �����÷� : JOB_ID
-- ��� ���̺�(EMPLOYEES) �� �μ� ���̺� (DEPARTMENTS) => �����÷� : DEPARTMENT_ID
-- �����, ����ID, ������(JOB_TITLE), �μ���ȣ, �μ����� ���
select first_name, e.job_id, job_title, d.department_id, department_name
from employees e inner join jobs j on e.job_id = j.job_id
                          inner join departments d on e.department_id = d.department_id;

-- ���ῡ ����Ϸ��� �÷� ���� ���� ��� USING() ���, �ٸ� ��� ON() ���
select employees.first_name, departments.department_name
from employees inner join departments
using (department_id);

-- ������ ���ǰ� ������ �˻��� ���� ���� �ο�
select first_name, department_name
from employees inner join departments
on employees.department_id = departments.department_id
where first_name = 'Susan';

-- OUTER JOIN
select e.first_name, d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

select e.first_name, d.department_id, d.department_name
from departments d left outer join employees e
on e.department_id = d.department_id;

--2007�� ��ݱ⿡ �Է��� �����ȣ, �����, �Ի���, �μ����� ���
select employee_id, first_name, hire_date, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
where hire_date between '2007/01/01' and '2007/06/30';








































