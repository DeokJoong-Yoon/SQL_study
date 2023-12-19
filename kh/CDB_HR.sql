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


--20231211
-----------------------------------------------------------------------------------------------------------------------------------
-- Cafe - DB ���� �Խ��� [����Ŭ] ���� ���� ����
-- [���� ����]
-- 1. Sales �μ� �Ҽ� ����� �̸��� �Ի����� ����϶�.
select first_name, hire_date
from employees e inner join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where d.department_name = 'Sales';

-- 2. Ŀ�̼��� �޴� ����� �̸�, Ŀ�̼� ������ �װ� ���� �μ����� ����϶�.
select  first_name, commission_pct, department_name
from employees e inner join departments d
on e.department_id = d.department_id
where commission_pct IS NOT NULL;

-- 3. IT�μ����� �ٹ��ϰ� �ִ� �����ȣ, �̸�, ����, �μ����� ����϶�
select
employee_id, first_name, job_id, department_name
from
employees e inner join departments d
on
e.department_id = d.department_id
where
department_name = 'IT';

-- 4. Guy�� ������ �μ����� �ٹ��ϴ� ������� �̸��� �μ���ȣ�� ����϶�.
select first_name, department_id
from employees
where department_id = (select department_id from employees where first_name = 'Guy');

select e2.first_name, e2.department_id
from employees e1 inner join employees e2
on e1.department_id = e2.department_id
where e1.first_name = 'Guy';
select * from locations;
--5. EMPLOYEES, DEPARTMENTS, LOCATIONS ���̺���  ������ �ľ��� �� 
--Oxford�� �ٹ��ϴ� ����� ���� �̸�(Name���� ��Ī), ����, �μ���, ���ø��� ����Ͻÿ�.
select first_name || ' ' || last_name as Name, e.job_id, d.department_name, city from employees e 
inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id = l.location_id
where city = 'Oxford';

--6. �� ����� ���� ������ ���踦 �̿��Ͽ� ������ ���� ������ ������ �ۼ��ϰ��� �Ѵ�. 
--ȫ�浿�� ��տ��� �����Ѵ� �� Eleni Zlotkey report to Steven King
--� ����� � ������� �����ϴ����� �� ���� �����Ͽ� ����Ͻÿ�. 
--��, ������ ��簡 ���� ����� �ִٸ� �� ������ �����Ͽ� ����ϰ�, ����� �̸��� �빮�ڷ� ����Ͻÿ�

?

--7. EMPLOYEES, DEPARTMENTS ���̺��� ������ �ľ��� �� ������� 5�� �̻��� �μ��� �μ���� ������� ����Ͻÿ�. 
--   �̶� ������� ���� ������ �����Ͻÿ�.


-- ���������� ��ȯ�ϴ� TO_CHAR �Լ�(������ ��¥ ��ȯ)
select
    sysdate, to_char(sysdate, 'YYYY-MM-DD'), to_char(sysdate, 'DL')
from dual;

select to_char(hire_date, 'YYYY/MM/DD DAY')
from employees
where department_id = 30;

select to_char(hire_date, 'YYYY"��" MM"��" DD"��" DAY') hire_date
from employees
where department_id = 30;

select to_char(hire_date, 'YYYY/MON/DD DY')
from employees
where department_id = 30;

select to_char(sysdate, 'DDD')
        , to_char(sysdate, 'WW')
        , to_char(sysdate, 'Q')
from dual;

select to_char(sysdate, 'PM')
        , to_char(sysdate, 'PM HH:MI:SS')
        , to_char(sysdate, 'HH24"��" MI"��" SS"��"')
from dual;

-- ���� ��¥�� �ð� ���
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') from dual;

-- �������� ���������� ��ȯ�ϱ�
select to_char(1234, '999,999')                        -- 1,234
        , to_char(123467, 'FM999,999')                -- 123,567
        , to_char(123467890, 'FM999,999,999')      -- 123,467,890
        , to_char(123467, 'FML999,999')               -- \123,467
from dual;

select to_char(1, '00') from dual;           -- ' 01' �� �������� ������ �տ� �ϳ� ���ִ�.  ��ȣ�ڸ��̴�.
select to_char(1, 'FM00') from dual;       -- '01' �� ����(��ȣ�ڸ�)�� �������.

-- FM : ���ڿ��� ��������
-- ������ �ִ� ���̸�ŭ 9999.... ������ �����Ѵ�. ( 9 : ���� ������ ǥ�����, 0 : ���� ������ "0" ���� ó��)
-- ������ ������ ���ĺ��� ���� ���̰� ��� ��Ȯ�ϰ� ǥ�� �Ұ�, �Ҽ� ������ ���̺��� ��� �ݿø�
select first_name, salary, to_char(salary, '$999,999') as salaryformat
from employees
where department_id = 30;

-- ��¥������ ��ȯ�ϴ� TO_DATE �Լ�
-- 2005�� 12�� 24�Ͽ� �Ի��� ������ �˻�
select first_name, hire_date
from employees
where hire_date = '05/12/24';

select first_name, hire_date
from employees
where hire_date = to_date('20051224', 'YYYYMMDD');

-- ���ڿ� ������ '210505'�� 2021�� 05�� 05��'�� ǥ��
-- ORA-01481: ���� ���� ���� �������մϴ�
select to_char('210505', 'YYYY"��" MM"��" DD"��"') from dual;    --����
-- �ذ�
select to_char(to_date('210505', 'YYMMDD'), 'YYYY"��" MM"��" DD"��"') as ��¥ from dual;

-- ���ڿ� ������ '210505'�� '2021�� 5�� 5��'�� ǥ��(��¥�� "0" ���ֱ�)
select to_char(to_date('210505', 'YYMMDD'), 'YYYY"��" fmMM"��" DD"��"') as ��¥ from dual;

-- ���� ��ĥ�� �������� ��¥ ��� <= dhfbqkftod
-- ORA-01722: ��ġ�� �������մϴ�
select sysdate -'2023/10/13' from dual;

-- ���� ��ĥ�� �������� ��¥ ���
select trunc(sysdate-to_date('2023/10/13', 'YYYY/MM/DD')) as �Ⱓ from dual;


-- ���������� ��ȯ�ϴ� TO_NUMBER �Լ�
-- ��ġ ������ ���� ���� �� ���ϱ� <= �����߻�
-- ORA-01722: ��ġ�� �������մϴ�
select '10,000' + '20,000' from dual;

-- ��ġ ������ ���� ���� �� ���ϱ� <= �����ذ�
select to_number('10,000', '999,999') + to_number('20,000', '999,999') as �հ�
from dual;

select to_char(to_number('10,000', '999,999') + to_number('20,000', '999,999'), '999,999') as �հ�
from dual;

-- NULL�� �ٸ� ������ ��ȯ�ϴ� NVL �Լ�
-- NVL(�÷�, �÷��� ���� NULL�� �� ��ü��);
select first_name, salary, commission_pct, job_id
from employees
order by job_id;

select first_name, salary, nvl(commission_pct, 0), job_id
from employees
order by job_id;

select first_name, salary, commission_pct,
         salary * commission_pct as COMMISSION,
         salary + (salary * commission_pct) as total, job_id
from employees
order by job_id;

select first_name, salary, commission_pct,
         salary * nvl(commission_pct, 0) as commission,
         salary + (salary * nvl(commission_pct, 0)) as total, job_id
from employees
order by job_id;


-- NVL2 �Լ�
-- NVL2(�÷�, �÷��� ���� NULL�� �ƴϸ� ó���� ����, �÷��� ���� NULL�̸� ó���� ����)
select first_name, salary, commission_pct,
nvl2(commission_pct, salary + (salary*commission_pct), salary) total_sal
from employees;


--<����> ��� ������ �ڽ��� ���(MANAGER_ID)�� �ִ�. 
-- ������ MEPLOYEES ���̺� �����ϰ� ����� ���� �ο찡 �ִµ� �� ����� MANAGER_ID Į�� ���� NULL�̴�.
-- ����� ���� ��ǥ�̻縸 ����ϵ� MANAGER_ID Į�� �� NULL ��� CEO�� ����Ѵ�.
select employee_id, first_name, nvl(manager_id, 0) from employees
where manager_id is null;

-- ORA-01722: ��ġ�� �������մϴ�
select employee_id, first_name, nvl(manager_id, 'CEO') from employees
where manager_id is null;

select employee_id, first_name, nvl(to_char(manager_id), 'CEO') from employees
where manager_id is null;
desc employees;


--<����>Ŀ�̼� ������ ���� �����鵵 �ִµ� Ŀ�̼��� ���� ���� �׷��� '<Ŀ�̼� ����>'�� ��µǰ� �Ѵ�.
select employee_id, first_name,
nvl(to_char(commission_pct), '<Ŀ�̼� ����>')  as commssion
from employees
where commission_pct is null;

-- ������ ���� DECODE �Լ�
select department_id,
decode(department_id, 10, 'Administration',
                                20, 'Martketing',
                                30, 'Purchasing',
                                40, 'Human Resources',
                                50, 'Shipping',
                                60, 'IT') as departments
from employees
order by department_id;

-- ���ǿ� ���� ���� �ٸ� ó���� ������ CASE �Լ�(���� ���� ����)
select employee_id, first_name, department_id,
        case when department_id = 10 then 'Administration'
               when department_id = 20 then 'Marketing'
               when department_id = 30 then 'Purchasing'
               when department_id = 40 then 'Human Resources'
               when department_id = 50 then 'Shipping'
               when department_id = 60 then 'IT'
               -- else 'Public Relations'
        end department_name
from employees
where department_id between 10 and 60
order by department_id;

select employee_id, first_name, department_id,
        case department_id when 10 then 'Administration'
                                    when 20 then 'Marketing'
                                    when 30 then 'Purchasing'
                                    when 40 then 'Human Resources'
                                    when 50 then 'Shipping'
                                    when 60 then 'IT'
                                    -- else 'Public Relations'
        end department_name
from employees
where department_id between 10 and 60
order by department_id;

--<����> �μ��� ���� �޿��� �λ��ϵ��� ����. (������ȣ, ������, ����, �޿�)
-- �μ����� 'Marketing'�� ���� 5%, 'Purchasing'�� ����� 10%, 'Human Resources'�� ����� 15%,
-- 'IT'�� ������ 20% �λ��Ѵ�.

-- �μ������� ���� �ο�
select employee_id, first_name, e.department_id, job_id, salary,
        case when department_name = 'Marketing' then salary * 1.05
               when department_name = 'Purchasing' then salary * 1.10
               when department_name = 'Human Resources' then salary * 1.15
               when department_name = 'IT' then salary * 1.20
        else salary
        end upsalary
from employees e inner join departments d
on e.department_id = d.department_id
order by employee_id;

select employee_id, first_name, e.department_id, job_id, salary,
        case department_name when 'Marketing' then salary * 1.05
                                         when 'Purchasing' then salary * 1.10
                                         when 'Human Resources' then salary * 1.15
                                         when 'IT' then salary * 1.20
        else salary
        end upsalary
from employees e inner join departments d
on e.department_id = d.department_id
order by employee_id;


-- Cafe DB �����Խ��� - [����Ŭ] �⺻ SELECT�� ���� ����
-- [�߰� ����] 
-- ����1) EMPLOYEES Table���� �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ�(�޿� + Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ����϶�. 
-- ��, Ŀ�̼��� NULL�� ����� �����Ѵ�.
select first_name, salary, commission_pct, salary * commission_pct as commission, salary + (salary * commission_pct) as total
from employees
where commission_pct IS NOT NULL
order by total desc;


-- ����3) �޿��� $1,500���� $3,000 ������ ����� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���. 
-- �̸� �̸�, �޿�, ȸ��(�Ҽ������� �ݿø�)�� ����϶�.
select first_name, salary, round(salary * 0.15) as ȸ��
from employees
where salary BETWEEN 1500 AND 3000;


-- �׷��Լ�
-- <��> ������ �� �޿� ���ϱ�(SUM�Լ�)
select to_char(sum(salary) , '$999999') as total
from employees;

-- <��> ������ ��� �޿� ���ϱ� (AVG �Լ�)
select avg(salary)
from employees;
-- ROUND : �ݿø� �Լ� ROUND(����, �ڸ���), ROUND(����) = ROUND(����, 0)
select round(avg(salary), 1)
from employees;
-- FLOOR : ���� (�Ҽ������� ����)
select floor(avg(salary))
from employees;

-- <��> �ֱٿ� �Ի��� ����� ���� �������� �Ի��� �������� �Ի��� ����ϱ� (MAX/MIN �Լ�)
select to_char(max(hire_date), 'YYYY-MM-DD'), to_char(min(hire_date), 'YYYY-MM-DD')
from employees;

-- <��> ����� ���ϱ�(COUNT �Լ�) null ���� ���� �ʴ´�.
select count(*), count(employee_id), count(commission_pct) from employees;

select job_id from employees;

select distinct job_id from employees;

--<����> JOB_ID�� ������ �� ������ ��, �ߺ����� ���� ������ ������ ���غ���.
select count(distinct job_id) from employees;




-- �÷��� �׷� �Լ��� ���� ����� �� ������ ��
-- ��� :
select first_name, min(salary) from employees;
--ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�

select department_id
from employees
group by department_id
order by department_id;

--<��> �μ��� �ִ� �޿��� �ּ� �޿� ���ϱ�
select department_id, count(*), max(salary) "�ִ� �޿�", min(salary) "�ּ� �޿�"
from employees
group by department_id
order by department_id;

-- <��> �μ��� ����� �޿� ��, ��� ���ϱ�
select department_id, sum(salary) "�޿��� ��", round(avg(salary), 2) "�޿��� ���(�ݿø�)", floor(avg(salary)) "�޿��� ���(����)"
from employees
group by department_id
order by department_id;

--<����> �μ����� ������ ���� Ŀ�̼��� �޴� ������ ���� ī��Ʈ �� ����.
select department_id, count(employee_id) as "������ ��", count(commission_pct) as "Ŀ�̼� �޴� ������ ��"
from employees
group by department_id
order by department_id;

--<�߰� ����> �޿��� 8000�̻��� ����鸸 �μ����� ������� Ŀ�̼��� �޴� ����� ���� ���.
select department_id, count(employee_id) as "�����", count(commission_pct) as "Ŀ�̼� �޴� ��"
from employees
where salary >= 8000
group by department_id
order by department_id;

--<����> �μ��� ���� ������ ����ϴ� ����� ���� ī��Ʈ�غ���.
select department_id,  job_id, count(employee_id) as "�μ��� ��� ��"
from employees
group by department_id, job_id
order by department_id, job_id;

-- <����> 30�� �μ��� �Ҽӵ� ��� �߿� ���� �ٹ��� ����� �Ի����� ���
select department_id, min(hire_date)
from employees
where department_id = 30
group by department_id;

-- �޿��� 3000 �̻��� ����鿡 ���� �μ��� �޿��� ���
select department_id, floor(avg(salary))
from employees
where salary >= 3000
group by department_id
order by department_id;

-- �޿��� ����� 5000 �̻��� �μ��� ���� ���
select department_id, floor(avg(salary))
from employees
where salary >= 3000
group by department_id
having floor(avg(salary)) >= 5000
order by department_id;

-- �μ��� �ִ�޿��� �ּұ޿��� ����ϵ� �ִ� �޿��� 5000 �ʰ��� �μ��� ���.
select department_id, max(salary), min(salary)
from employees
group by department_id
having max(salary) >= 5000
order by department_id;

-- �μ��� �ο����� ���Ͽ� �� �ο����� 4�� �ʰ��ϴ� �μ��� ��ȸ�ϴ� �������� �ۼ��Ͻÿ�.
select department_id, count(employee_id)
from employees
group by department_id
having count(employee_id) > 4
order by department_id;



-- �μ������� ���� ������ ����ϴ�(�μ��� ������) ����� �޿��� �հ� �����
select department_id, job_id, count(*), sum(salary)
from employees
group by department_id, job_id
order by department_id;

-- �μ��� �޿��� �հ� �����
select department_id, null job_id, count(*), sum(salary)
from employees
group by department_id;

-- ��ü ����� �޿��� �հ� �����
select null department_id, null job_id, sum(salary), count(*)
from employees;


SELECT DEPARTMENT_ID, JOB_ID, COUNT(*), SUM(SALARY)

FROM EMPLOYEES GROUP BY DEPARTMENT_ID, JOB_ID


UNION ALL

SELECT DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) -- 

FROM EMPLOYEES 

GROUP BY DEPARTMENT_ID

UNION ALL

SELECT NULL DEPARTMENT_ID, NULL JOB_ID, COUNT(*), SUM(SALARY) -- 

FROM EMPLOYEES 

ORDER BY DEPARTMENT_ID, JOB_ID;

select department_id, job_id, count(*), sum(salary)
from employees
group by rollup(department_id, job_id)
order by department_id;

select department_id, job_id, count(*), sum(salary)
from employees
--group by rollup(department_id, job_id)
group by cube(department_id, job_id)
order by department_id;

select department_id, job_id, sum(salary)
from employees
group by rollup(department_id, job_id)
order by 1;
-- GROUPING
-- ROLLUP�̳� CUBE�� ���� ���� ���⹰��
-- ���ڷ� ���޹��� �÷� ������ ���⹰�̸� 0 ��ȯ �ƴϸ� 1 ��ȯ
select department_id, job_id, sum(salary),
        case when grouping (department_id) = 0 and grouping(job_id) = 1 then '�μ��� �հ�'
               when grouping (department_id) = 1 and grouping(job_id) = 0 then '���޺� �հ�'
               when grouping (department_id) = 1 and grouping(job_id) = 1 then '�� �հ�'
               else '�׷캰 �հ�'
        end as ����
from employees
group by cube(department_id, job_id)
order by 1;

-- 6. GROUPING SETS ��
-- GROUPING SETS�� ROLLUP�̳� CUBE ó�� GROUP BY ���� ����ؼ� �׷� ������ ���Ǵ� ���̴�.
-- GROUPING SETS�� �׷� �����̱� �ϳ� UNION ALL ������ ���� �ֱ� �����̴�.

select department_id, job_id, count(*), sum(salary)
from employees
group by department_id, job_id
order by department_id;

select department_id, job_id, count(*), sum(salary)
from employees
group by grouping sets(department_id, job_id)
order by department_id;

-- RANK()  : �ߺ� ���� ������ŭ ���� ���� ���� ���� ��Ŵ
-- ���� : RANK() OVER(ORDER BY �÷��� (ASC|DESC)) (AS ��Ī)
-- DENSE_RANK() : �ߺ� ������ �����ص� ���������� ���� ���� ���� ǥ���� 
-- ROW_NUMBER() : �ߺ����� ������� SEQUENCE(�������� ���� ��) ���� ��ȯ

-- ������̺��� 80�� �μ��� �Ҽӵ� ��� �߿��� �޿��� ���� ���� �޴� ������
-- �����ȣ, �����, �޿�, ������ �ο��Ͽ� ����� �ּ���.

select employee_id as �����ȣ, first_name as �����, hire_date as �Ի�����,
         rank() over(order by hire_date desc) as ����
from employees
where department_id = 80;

select employee_id as �����ȣ, first_name as �����, salary as �޿�,
         dense_rank() over(order by salary desc) as ����
from employees
where department_id = 80;

select employee_id as �����ȣ, first_name as �����, salary as �޿�,
        row_number() over(order by salary desc) as ����
from employees
where department_id = 80;

create table exp_goods_asia (   -- �ѱ��� �Ϻ��� 10�� ����ǰ ���̺�
    country VARCHAR2(10),       -- �����
    seq       NUMBER,               -- ��ȣ
    goods   VARCHAR2(80)       -- ��ǰ��
);

INSERT INTO exp_goods_asia VALUES ('�ѱ�', 1, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 2, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 5,  'LCD');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 6,  '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 7,  '�޴���ȭ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 8,  'ȯ��źȭ����');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 9,  '�����۽ű� ���÷��� �μ�ǰ');
INSERT INTO exp_goods_asia VALUES ('�ѱ�', 10,  'ö �Ǵ� ���ձݰ�');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods_asia VALUES ('�Ϻ�', 10, '����');
    
select goods from exp_goods_asia
where country = '�ѱ�'
union
select goods from exp_goods_asia
where country = '�Ϻ�';

select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history
order by 1;

select employee_id, job_id, null as "Start Date", null as "End Date"
from employees
where employee_id = 176
union
select employee_id, job_id, start_date, end_date
from job_history
where employee_id = 176;

-- 2. union all
-- union all �� �ߺ��� �׸� ��� ��ȸ�ȴٴ� ��

-- 3. INTERSECT
-- INTERSECT�� �������� �ƴ� �������� �ǹ�. ��, ������ ���տ��� ����� �׸� ����
select goods
from exp_goods_asia
where country = '�ѱ�'
intersect
select goods
from exp_goods_asia
where country = '�Ϻ�';

--
select goods
from exp_goods_asia
where country = '�ѱ�'
minus
select goods
from exp_goods_asia
where country = '�Ϻ�';

-- 5. ���� �������� ���ѻ���
-- ���� �����ڷ� ����Ǵ� �� select ���� welect ����Ʈ�� ������ ������ Ÿ���� ��ġ�ؾ� �Ѵ�.
-- ORA-01789: ���� ����� ����Ȯ�� ���� ��� ���� ������ �ֽ��ϴ�.
select goods
from exp_goods_asia
where country = '�ѱ�'
union
select seq, goods
from exp_goods_asia
where country = '�Ϻ�';

-- ORA-01790: �����ϴ� �İ� ���� ������ �����̾�� �մϴ�
select seq
from exp_goods_asia
where country = '�ѱ�'
union
select goods
from exp_goods_asia
where country = '�Ϻ�';

-- ���� �����ڷ� select���� ������ �� order by ���� �� ������ ���忡���� ����� �� �ִ�.
-- ORA-00933: SQL ��ɾ �ùٸ��� ������� �ʾҽ��ϴ�
select goods
from exp_goods_asia
where country = '�ѱ�'
order by goods
union
select goods
from exp_goods_asia
where country = '�Ϻ�';

--  ���� ������
select goods
from exp_goods_asia
where country = '�ѱ�'
union
select goods
from exp_goods_asia
where country = '�Ϻ�'
order by goods;



-- Susan ����� �Ҽӵ� �μ���
select e.employee_id, d.department_name, first_name
from employees e inner join departments d
on e.department_id = d.department_id
where first_name = 'Susan';

-- �������� �ۼ� �� �ڵ�
-- ������ ������� �ʴ´ٴ� �����Ͽ� Susan ����� �Ҽӵ� �μ����� ���
-- [����]
-- 1. Susan ����� �Ҽӵ� �μ���ȣ Ȯ�� => ������̺�(EMPLOYEES)
-- 2. �μ���ȣ�� ������ �μ��� Ȯ��       => �μ����̺�(DEPARTMENTS)
select department_id from employees
where first_name ='Susan';

select department_name from departments
where department_id = 40;

-- ��������
select department_name from departments
where department_id = (select department_id from employees
where first_name = 'Susan');


-- Lex�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի�����(2003-01-13 ����) ���
-- Lex ����� �Ҽӵ� �μ���ȣ ���
select department_id
from employees
where first_name ='Lex';
-- �� �μ��� �Ҽӵ� ����
select first_name, to_char(hire_date, 'YYYY-MM-DD')
from employees
where department_id = 90;

select first_name, to_char(hire_date, 'YYYY-MM-DD') from employees
where department_id 
= (select department_id from employees where first_name ='Lex');

-- <����> EMPLOYEES ���̺��� CEO���� �����ϴ� ������ ��� ������ ���.
select * from employees where manager_id
= (select employee_id from employees
    where manager_id IS NULL);

-- Guy�� ���� �μ����� �ٹ��ϴ� �����ȣ, �̸�, �޿�, Ŀ�̼�(NULL�̸� 0���� ��ü),
-- �Ի���(2002.12.07)�� ����ϵ� Guy ����� ����.
select employee_id, first_name, salary, nvl(commission_pct, 0) commission_pct, to_char(hire_date, 'YYYY.MM.DD') from employees
where department_id = (
select department_id from employees where first_name = 'Guy') 
and first_name <> 'Guy';

-- ���� ������ ����Ͽ� ��� �޿����� �� ���� �޿��� �޴� ����� �˻�
select first_name, salary from employees
where salary > (select avg(salary) from employees);

-- ���� �� �������� ����
-- ����1) EMPLOYEES ���̺��� LAST_NAME �÷����� Kochhar�� �޿����� ����
-- ����� ������ �����ȣ, �̸�, ������, �޿��� ���
select employee_id, first_name, job_id, salary from employees
where salary > (select salary from employees where last_name = 'Kochhar');

-- ����2) ���� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ���
select employee_id, first_name, salary from employees
where salary = (select min(salary) from employees);

-- (�߰�����) ���� ���� �޿��� �޴� ��� �̸��� ����� �ڵ��� ��ȣ ���
select first_name, phone_number from employees
where salary = (select max(salary) from employees);

-- ����3) ���� ���� �Ⱓ �ٹ��� ����� �̸��� �̸���, ������, �Ի��� ���
select first_name, email, job_id, hire_date from employees
where hire_date =
(select min(hire_date) from employees);

--[�׷� �ռ� ����]
-- 1. EMPLOYEES ���̺��� �μ� �ο��� 5���� ���� �μ��� �μ���ȣ, �ο���, �޿��� �� ���
select department_id �μ���ȣ, count(*) �ο���, sum(salary) �޿�
from employees
group by department_id
having count(department_id) > 5
order by department_id;

-- 2. EMPLOYEES ���̺��� ����Ͽ� ��� �߿��� �޿�(SALARY)�� ���ʽ��� ��ģ �ݾ��� ���� ���� ���� ���� ���� ���, ��� �ݾ��� ���
-- ���ʽ��� ���� ��� ���ʽ��� 0����, ��� �ݾ��� ��� �Ҽ��� ù�� ¥��������.
select
    round ( max (salary + (salary * nvl(commission_pct, 0))) , 1) max,
    round ( min (salary + (salary * nvl(commission_pct, 0))) , 1) min,
    round ( avg (salary + (salary * nvl(commission_pct, 0))) , 1) avg
from employees;

-- 3. EMPLOYEES ���̺��� �μ���ȣ�� 10�� ��������� �μ���ȣ�� 50�� ����������� ���� ����϶�.

select
 count(decode(department_id, 10, 1)) "10���μ��ο���",
 count(decode(department_id, 20, 1)) "20���μ��ο���",
 count(decode(department_id, 30, 1)) "30���μ��ο���", 
 count(decode(department_id, 40, 1)) "40���μ��ο���",
 count(decode(department_id, 50, 1)) "50���μ��ο���"
from employees;

--4. ������� ������ ��ü �޿� ����� $10,000���� ū ��츦 ��ȸ�Ͽ� ����, �޿� ����� ����Ͻÿ�. 
--������ CLERK�� ���Ե� ���� �����ϰ� ��ü �޿� ����� ���� ������� ����Ͻÿ�.
select job_id, avg(salary) �޿���� from employees
group by job_id
having job_id NOT LIKE '%CLERK%'
order by �޿���� desc;

-- 5. EMPLOYEES ���̺��� �Ʒ��� ����� ���
select to_char(hire_date, 'YYYY') as "H_YEAR", count(*) as �����, min(salary) as �ּұ޿�, max(salary) as �ִ�޿�, round(avg(salary), 2) as �޿����, sum(salary) as "�޿��� ��"
from employees
group by to_char(hire_date, 'YYYY')
order by 1;

-- 6. �� �μ� �� ��� �޿��� 10000 �̻��̸� �ʰ�, �׷��� ������ �̸��� ����϶�. �� �μ���ȣ�� ���� ����� ����
select department_id, floor(avg(salary)) �μ�����ձ޿�,
    case when avg(salary) >= 10000 then '�ʰ�'
           else '�̸�'
    end ��ձ޿�
from employees
group by department_id
having department_id IS NOT NULL
order by 1;

-- 7. EMPLOYEES ���̺��� �Ʒ��� ����� ���.
select
    count(*) as total,
    count(decode(to_number(to_char(hire_date,'YYYY'), '9999'), 2001, 1)) as "2001�⵵",
    count(decode(to_number(to_char(hire_date,'YYYY'), '9999'), 2002, 1)) as "2002�⵵",
    count(decode(to_number(to_char(hire_date,'YYYY'), '9999'), 2003, 1)) as "2003�⵵",
    count(decode(to_number(to_char(hire_date,'YYYY'), '9999'), 2004, 1)) as "2004�⵵",
    count(decode(to_number(to_char(hire_date,'YYYY'), '9999'), 2005, 1)) as "2005�⵵",
    count(decode(to_number(to_char(hire_date,'YYYY'), '9999'), 2006, 1)) as "2006�⵵",
    count(decode(to_number(to_char(hire_date,'YYYY'), '9999'), 2007, 1)) as "2007�⵵",
    count(decode(to_number(to_char(hire_date,'YYYY'), '9999'), 2008, 1)) as "2008�⵵"
from employees;

select count(*) "total",
       count(case when to_char(hire_date, 'YYYY')='2001' then 1 end) as "2001 �⵵",
       count(case when to_char(hire_date, 'YYYY')='2002' then 1 end) as "2002 �⵵",
       count(case when to_char(hire_date, 'YYYY')='2003' then 1 end) as "2003 �⵵",
       count(case when to_char(hire_date, 'YYYY')='2004' then 1 end) as "2004 �⵵",
       count(case when to_char(hire_date, 'YYYY')='2005' then 1 end) as "2005 �⵵",
       count(case when to_char(hire_date, 'YYYY')='2006' then 1 end) as "2006 �⵵",
       count(case when to_char(hire_date, 'YYYY')='2007' then 1 end) as "2007 �⵵",
       count(case when to_char(hire_date, 'YYYY')='2008' then 1 end) as "2008 �⵵"
from employees;

-- 8. EMPLOYEES ���̺��� �Ʒ��� ����� ���.
--    sum(decode(department_id, 10,  salary)) as "DEPTNO 10",
SELECT
  job_id,
  nvl(MAX(CASE WHEN department_id = 10 THEN salary END), 0) AS "DEPTNO 10",
  nvl(MAX(CASE WHEN department_id = 20 THEN salary END), 0) AS "DEPTNO 20",
  nvl(MAX(CASE WHEN department_id = 30 THEN salary END), 0) AS "DEPTNO 30",
  nvl(MAX(CASE WHEN department_id = 40 THEN salary END), 0) AS "DEPTNO 40",
  nvl(MAX(CASE WHEN department_id = 50 THEN salary END), 0) AS "DEPTNO 50",
  nvl(MAX(CASE WHEN department_id = 60 THEN salary END), 0) AS "DEPTNO 60",
  nvl(MAX(CASE WHEN department_id = 70 THEN salary END), 0) AS "DEPTNO 70",
  nvl(MAX(CASE WHEN department_id = 80 THEN salary END), 0) AS "DEPTNO 80",
  nvl(MAX(CASE WHEN department_id = 90 THEN salary END), 0) AS "DEPTNO 90",
  nvl(MAX(CASE WHEN department_id = 100 THEN salary END), 0) AS "DEPTNO 100",
  nvl(MAX(CASE WHEN department_id = 110 THEN salary END), 0) AS "DEPTNO 110",
  sum(salary) "TOTAL"
FROM employees e
GROUP BY job_id;

select job_id,
        sum(decode(department_id, 10, salary,0)) "DEPTNO 10",
        sum(decode(department_id, 20, salary,0)) "DEPTNO 20",
        sum(decode(department_id, 30, salary,0)) "DEPTNO 30",
        sum(decode(department_id, 40, salary,0)) "DEPTNO 40",
        sum(decode(department_id, 50, salary,0)) "DEPTNO 50",
        sum(decode(department_id, 60, salary,0)) "DEPTNO 60",
        sum(decode(department_id, 70, salary,0)) "DEPTNO 70",
        sum(decode(department_id, 80, salary,0)) "DEPTNO 80",
        sum(decode(department_id, 90, salary,0)) "DEPTNO 90",
        sum(decode(department_id, 100, salary,0)) "DEPTNO 100",
        sum(decode(department_id, 110, salary,0)) "DEPTNO 110",
        sum(salary) "TOTAL"
from employees
group by job_id;

-- ���� �� �������� ����
-- �޿��� 15000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ���
-- ���������� ��� �߿��� �ϳ��� ��ġ�ϸ� ���� ����� ���ϴ� IN�����ڿ� �Բ� ���
select first_name, salary, department_id from employees
where department_id in (select distinct department_id from employees where salary >= 5000)
order by department_id;

-- EMPLOYEES ���̺��� �̸��� "z"�� �ִ� ������ �ٹ��ϴ� �μ�����
-- �ٹ��ϴ� ��� ����� ���� ��� ��ȣ, �̸�, �޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
-- ��, �μ���ȣ������ ���
select employee_id, first_name, salary from employees
where department_id in (select distinct department_id from employees where lower(first_name) LIKE '%z%')
order by department_id;

-- EMPLOYEES ���̺��� Susan �Ǵ� Lex�� ������ ���� ������ �̸�, ����, �޿��� ���. (Susan, Lex�� ����)
select first_name, job_id, salary
from employees
where salary in (select distinct salary from employees where first_name = 'Susan' or first_name = 'Lex')
and (first_name <> 'Susan' and first_name <> 'Lex');

-- EMPLOYEES ���̺��� ��� �� �� �̻����κ��� ���� �޴�
-- ����� �����ȣ, �̸�, ����, �μ���ȣ�� ����ϴ� SELECT���� �ۼ� (�ٸ� ������ �����ϴ� ����)
select employee_id, first_name, job_id, department_id from employees
where employee_id in (select manager_id from employees where manager_id IS NOT NULL);

-- [����] EMPLOYEES ���̺��� Accounting �μ����� �ٹ��ϴ� ������ ���� ������ �ϴ�
-- ������ �̸�, �������� ���.
select e.first_name, e.job_id, department_id
from employees e join jobs j
on e.job_id = j.job_id
where e.department_id
in (select distinct department_id from departments where department_name = 'Accounting');

--����� ��
select first_name, job_id, department_id from employees
where job_id
in (select job_id from employees where department_id 
= (select department_id from departments where department_name = 'Accounting'));

-- 30�� �Ҽ� ������ �߿��� �޿��� ���� ���� ���� ��� ���� �� ���� �޿���
-- �޴� ����� �̸�, �޿� �� ���.( 30�� �μ� ���� �޿��� ��ο� ���ؼ� Ŀ�� �ϹǷ� �ִ밪���� ū �޿���)
select first_name, salary from employees
where salary > all (select salary from employees where department_id = 30);

-- �μ���ȣ�� 110���� ������� �޿� �� ���� ���� ��(8300)���� ���� �޿��� �޴� ����� �̸�, �޿� ���
select first_name, salary from employees
where salary > any (select salary from employees where department_id = 110);

--[����] ������ 'ST_MAN'�� ������ �޴� �޿����� �ּ� �޿����� ���� �޴� ��������
--�̸��� �޿��� ����ϵ� �μ���ȣ�� 20���� ������ ����
 select first_name, salary, job_id from employees
 where salary > any (select salary from employees where job_id = 'ST_MAN')
 and department_id <> 20;
 

-- EXISTS ������
-- EXISTS �����ڴ� ���� ���������� �ַ� ����ϸ� ���� ������ ��� ���� ���� �����⸸ �ϸ�
-- �ٷ� ���� ������ ��� ���� ����

-- JOB ���� �̷��� �ִ� ��� ����� �����ȣ, FIST_NAME, ���� JOB_ID, ���� JOB_TITLE�� ����Ͻÿ� (exists
-- ���̺� Ȯ��
select * from jobs;
select * from job_history;

select employee_id, first_name, e.job_id, job_title
from employees e inner join jobs j on e.job_id = j.job_id
where exists (select * from job_history where e.employee_id = employee_id)
order by e.employee_id;

-- ������ �� ����� �Ҽӵ� �μ����� ��ȸ. - JOIN ������� ���
select first_name, department_name
from employees e inner join departments d
on d.department_id = e.department_id;

-- ��Į�� ��������
-- : ��Į�� ���� ������ SELECT ���� ���� ���� ������ �ѹ��� ����� 1�྿ ��ȯ�Ѵ�.
-- (����)
-- SELECT �÷�,  (SELECT �÷� FROM ���̺�1 WHERE ���̺�1.�÷� = ���̺�2.�÷�)
-- FROM ���̺�2;

-- ������ �� ����� �Ҽӵ� �μ����� ��ȸ. - ��Į�� ���� ���� ������� ���
select first_name, (select department_name from departments d where d.department_id = e.department_id) deparment_name
from employees e;

-- ��� ����� �����ȣ, �̸�, �����ڹ�ȣ, �����ڸ��� ��ȸ�� ���ô�.
select employee_id, first_name,
nvl((select m.first_name from employees m where m.employee_id = e.manager_id), '����') as �����ڸ�
from employees e
order by 1;

-- EMPLOYEES ���̺��� �޿��� �ڽ��� ���� �μ��� ��� �޿����� ���� ���� ����� �μ���ȣ, �̸�, �޿��� ���
select e.department_id, first_name, e.salary
from employees e
where e.salary > (select avg(salary) from employees d where d.department_id = e.department_id)
order by e.department_id, e.salary desc;

--[����] EMPLOYEES ���̺��� Valli ��� �̸��� ���� ������ ������  �� ������
--���� ����� ��� ������ ��� (Valli�� ����)
select * from employees e
where
    (e.job_id = (select d.job_id from employees d where first_name = 'Valli'))
and
    (e.salary = (select d.salary from employees d where first_name = 'Valli'))
and first_name <> 'Valli';

select * from employees
where (job_id, salary) in (select job_id, salary from employees where first_name = 'Valli')
and NOT first_name = 'Valli';


--[����]
-- 1. EMPLOYEES ���̺��� ���� ���� ����� �����ִ� �μ���ȣ�� ������� ����϶�.
select department_id �μ���ȣ, count(*) as �����
from employees
group by department_id
order by ����� desc
FETCH FIRST 1 row Only;

select department_id �μ���ȣ, count(*) as �����
from employees
group by department_id
having count(*) = 
(select max(count(*)) from employees group by department_id);

-- 2. EMPLOYEES ���̺��� �μ��� �ְ� �޿��� �޴� ������ �̸�, ����, �μ�, �޿��� ���
select first_name, job_id, department_id, salary
from employees
where (department_id, salary) in (select department_id, max(salary) 
                                          from employees
                                          group by department_id)
order by 3;


--[����Ŭ] �������� ����
--1. EMPLOYEES ���̺��� ���� ���� ����� �����ִ� �μ���ȣ�� ����� ���
select department_id, count(*) as ���
from employees
group by department_id
having count(*) = 
(select max(count(*)) from employees group by department_id);

-- 2. EMPLOYEES ���̺��� �μ��� �ְ� �޿��� �޴� / ������ �̸�, ����, �μ�, �޿��� ���

-- 3. EMPLOYEES ���̺��� �� �μ��� �Ի����� ���� ������ ����� �����ȣ, �����, �μ���ȣ, �Ի����� ���
SELECT employee_id, first_name, department_id, hire_date
FROM (SELECT row_number() over(partition by department_id order by hire_date asc) as rnum,
employee_id, first_name, department_id, hire_date FROM employees) data
where data.rnum = 1;


--









-- sequence
create table test (
    no number not null
);

create sequence test_seq
start with 1
increment by 1
minvalue 1
maxvalue 100000
nocycle
cache 2;
select * from employees;
insert into test values(test_seq.nextval);
select * from test;
select test_seq.currval from dual;


-----view-----------------------------------------------
----------------------------------------------------
-- �ζ��� ��

select rownum, employee_id, first_name ,hire_date
from employees
order by hire_date desc;


create or replace view view_hire
as
select employee_id, first_name, hire_date
from employees
order by hire_date desc;

select rownum, employee_id, first_name, hire_date
from view_hire;
select * from view_hire;

select rownum, employee_id, first_name, hire_date
from view_hire
where rownum <= 5;

select rownum, employee_id, first_name, hire_date
from 
(select employee_id, first_name, hire_date
from employees
order by hire_date desc)
where rownum <= 5;

-- ���������� �̸��� �ٿ��ְ� �ζ��� ��� ���� ���������� �̸����� FROM ���� ��� ����
-- ���� ���������� ���� �� ���� ��� �ߺ� �ۼ��� ���� �� �ְ� ����ӵ��� �������ٴ� ������ ����
WITH TOPN_HIRE
AS
(SELECT employee_id, first_name, hire_date
FROM employees
ORDER BY hire_date desc)

SELECT rownum, employee_id, first_name, TO_CHAR(hire_date, 'YYYY.MM.DD')
FROM topn_hire
WHERE rownum <= 5;

-- emploees ���̺�� departments ���̺��� ��ȸ�Ͽ� �μ� ��ȣ�� �μ��� �ִ� �޿� �� �μ����� ���
select e.department_id, d.department_name, e.salary
from ( select department_id, max(salary) salary
          from employees group by department_id ) e inner join departments d
          on e.department_id = d.department_id;
          
--[����] employees ���̺��� �޿��� �ڽ��� ���� �μ��� ��� �޿����� ���� �޴�
--����� �μ���ȣ, �̸�, �޿��� ����ϴ� select ���� �ۼ��Ͻÿ�
select e.department_id, e.first_name, e.salary
from employees e inner join (select department_id, avg(salary) d_salary
                                          from employees
                                          group by department_id) d
on e.department_id = d.department_id
where e.salary > d.d_salary
order by e.department_id;

with dept_sal
as
(select department_id, avg(salary) d_salary
from employees
group by department_id)

select employee_id, first_name, hire_date, rank() over(order by hire_date desc) as ����
from employees
where department_id = 30;

-- ������̺��� 30�� �μ��� �Ҽӵ� ��� �߿��� �Ի�⵵�� ���� �ֱٿ� �Ի��� ������
-- �����ȣ, �����, �Ի�����, ������ �ο��Ͽ� ���
select employee_id as �����ȣ, first_name as �����, hire_date as �Ի�����, 
rank() over(order by hire_date desc) as ����
from employees
where department_id = 30;

--������̺��� 30�� �μ��� �Ҽӵ� ��� �߿��� �޿��� ���� ���� �޴� ������
-- �����ȣ, �����, �޿�, ������ �ο��Ͽ� ���
select employee_id as �����ȣ, first_name as �����, salary as �޿�,  rank() over(order by salary desc) as ����
from employees
where department_id = 30;

-- ������̺��� �޿��� ����޴� ������ ������ �ο��ϰ� ���� 3�� ���
select first_name, salary
from (select first_name, salary,
         rank() over(order by salary desc) as salary_rank
         from employees
         order by salary desc)
where rownum <= 3;
--where salary_rank<=3;

select first_name, salary,
         rank() over(order by salary desc) as salary_rank
from employees
where salary_rank <= 3
order by salary desc;


-- DENSE_RANK() OVER
-- ��� ���̺��� 30�� �μ��� �Ҽӵ� ��� �߿��� �޿��� ���� ���� �޴� ������
-- �����ȣ, �����, �޿�, ������ �ο��Ͽ� ���
select employee_id as �����ȣ, first_name as �����, salary as �Ի�����,
         dense_rank() over(order by salary desc) as ����
from employees
where department_id=30;

-- ROW NUMBER()
-- ������̺��� 30�� �μ��� �Ҽӵ� ��� �߿��� �޿��� ���� �޴� ������
-- �����ȣ, �����, �޿�, ��ȣ�� �ο��Ͽ� ���

select employee_id as �����ȣ, first_name as �����, salary as �Ի�����,
         row_number() over(order by salary desc) as ����
from employees
where department_id = 30;


-- ����Ŭ���� �׷��Լ��� ����� �� PARTITION BY�� ����Ͽ� �׷����� ��� ������ �� �� �ִ�.
-- GROUP BY ���� ������� �ʰ�, ��ȸ�� �� �࿡ �׷����� ����� ���� ǥ���� ��
-- OVER ���� �Բ� PARTITION BY ���� ����ϸ� �ȴ�.

-- �μ��� �޿��� �� ���
select department_id, sum(salary)
from employees
where department_id between 10 and 30
group by department_id
order by department_id;

-- �μ���ȣ�� �����, �μ��� �޿��� ���� �Բ� ���
select department_id, first_name,
            sum(salary) over(partition by department_id) as salary_total
from employees
where department_id between 10 and 30
order by department_id;

-- ���� ������ ���� �����͸� ��ȸ�� �� �࿡ �׷��Լ��� ������ ���� �߰��� �� �࿡ ǥ���ϸ�,
-- ��ȸ�� �����ʹ� GROUP BY ���� ������� �ʾұ� ������ �����Ͱ� �������� �ʴ´�.

--[����]
-- �׷��Լ�([�÷�]) OVER(PARTITION BY �÷�1, �÷�2, ... [ORDER BY ��]...)

-- �׷��Լ��� ����� ���� OVER ���� �Բ� ����ؾ� �ϸ�,
-- OVER �� ���ο� PARTITION BY ���� ������� ������ ���� ��� ��ü�� �����ϸ�
-- PARTITION BY ���� ����ϸ� ���� ������� �ش� �÷��� �׷����� ��� ����� ǥ��

SELECT department_id, first_name, salary,
            sum(salary) over(partition by department_id) as department_total,
            sum(salary) over() as salary_total
from employees
where department_id between 10 and 30
order by department_id;

-- �� �μ��� �Ҽӵ� ��� ��ü�� �ƴ϶� �� �μ��� �Ѹ��� ������� ����ϰ��� �Ѵ�. 
--�����, ������ȣ, �޿�, �μ���ȣ�� ��ȸ
--����, �� �μ����� ��ȣ�� �ο�
select employee_id, first_name, job_id, salary, department_id
         , row_number() over(partition by department_id order by employee_id) as rnum
from employees
order by department_id;

select employee_id, first_name, salary, department_id, hire_date
from (select employee_id, first_name, salary, department_id, hire_date, 
                  row_number() over(partition by department_id order by employee_id) as rnum
from employees) data
where data.rnum = 1
order by department_id;


select employee_id, first_name, salary from emp01;

create materialized view m_emp
build immediate
refresh
on demand
complete
enable query rewrite
as
select employee_id, first_name, salary from emp01;

select count(*) from m_emp;
select count(*) from emp01;

delete from emp01 where employee_id = 250;

BEGIN
    DBMS_MVIEW.REFRESH('M_EMP');
END;
/

select mview_name, query from user_mviews
where mview_name = 'M_EMP';

-- JAVA �����Ͽ� ������ ��
-- �����ȣ, �����, �޿�, �Ի���(2001.12.02���·�), �μ������� ��ȸ�� �� �ִ� �� view_emp_dept02 ����
create or replace view view_emp_dept02
as
select employee_id , first_name , salary , to_char(hire_date, 'YYYY.MM.DD') hire_date, department_name
from employees e inner join departments d
on e.department_id = d.department_id
order by e.department_id;

select employee_id, first_name, salary, hire_date, department_name from view_emp_dept02;


DECLARE
	-- %ROWTYPE �Ӽ����� �ο츦 ������ �� �ִ� ���۷��� ���� ����
	vemployees employees%ROWTYPE;
	vaslary NUMBER(8, 2);
BEGIN
	DBMS_OUTPUT.PUT_LINE('��� / �̸� / �޿�');
	DBMS_OUTPUT.PUT_LINE('-------------------');
	-- Pat ����� ����ü ������ �ο� ������ ���� vemployees�� �����Ѵ�.
	SELECT * INTO employees
	FROM employees
	WHERE first_name = 'Pat';
	-- Ŀ�̼��� NULL�� ��� �̸� 0���� �����ؾ� �ùٸ� �޿� ����� �����ϴ�.
	IF (vemployees.commission_pct IS NULL) THEN
		vemployees.commission_pct := 0;
	END IF;

	--��Į�� ������ �޿��� ����� ����� �����Ѵ�.
	vaslary := vemployees.salary + (vemployees.salary * vemployees.commission_pct);
	--���۷��� ������ ��Į�� ������ ����� ���� ����Ѵ�.
	DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || vemployees.employee_id ||
												'/����� : ' ||vemployees.first_name ||
												'/�޿� : ' || to_char(vsalary, '$999,999');
END;
/