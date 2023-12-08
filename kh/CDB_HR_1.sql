-- [���� 1] EMPLOYEES ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ, �̸�, ������, �޿��� ����϶�.
SELECT
    employee_id,
    first_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary >= 3000;
    
-- [����2] EMPLOYEES ���̺��� ��� ������ ST_MAN�� ����� ������ �����ȣ, �̸�, ������, �޿�, �μ���ȣ�� ���.
SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    department_id
FROM
    employees
WHERE
    job_id = 'ST_MAN';
    
--[����3] EMPLOYEES ���̺��� �Ի����ڰ� 2006�� 1�� 1�� ���Ŀ� �Ի��� ����� ������ �����ȣ, �̸�, ������, �޿�, �Ի�����, �μ���ȣ�� ���
SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    hire_date,
    department_id
FROM
    employees
WHERE
    hire_date >= '06/01/01';
    
--[����4] EMPLOYEES ���̺��� �޿��� 3000���� 5000������ ������ �̸�, ������, �޿�, �μ���ȣ�� ���
SELECT
    first_name,
    job_id,
    salary,
    department_id
FROM
    employees
WHERE
    salary BETWEEN 3000 AND 5000;
    
--[����5] EMPLOYEES ���̺��� �Ի����ڰ� 05�⵵�� �Ի��� ����� ������ �����ȣ, �̸�, ������, �޿�, �Ի�����, �μ���ȣ�� ���
SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    hire_date,
    department_id
FROM
    employees
WHERE
--    hire_date LIKE '05%';
    hire_date LIKE '05/__/__';    

--[���� 6] �������(EMPLOYEES) ���̺��� �����ȣ, �̸�, �޿�, ������ȣ, �Ի���, ����� �����ȣ�� ���. 
--           �̶� �̸��� ���� �̸��� �����Ͽ� Name�̶�� ��Ī���� ����Ͻÿ�
SELECT
    employee_id,
    first_name
    || ' '
    || last_name "Name",
    salary,
    job_id,
    hire_date,
    manager_id
FROM
    employees;

--[���� 7] �������(EMPLOYEES) ���̺��� ����� ���� �̸��� Name, ������ȣ�� Job, �޿��� Salary, 
--������ $100 ���ʽ��� �߰��Ͽ� ����� ���� Increased Ann_Salary, 
--�޿��� $100 ���ʽ��� �߰��Ͽ� ����� ������ Increased Salary��� ��Ī���� ����Ͻÿ�.
SELECT
    first_name
    || ' '
    || last_name          "Name",
    job_id                "Job",
    salary                "Salary",
    ( salary * 12 + 100 ) "Increased Ann_Salary",
    ( salary + 100 ) * 12 "Increased Salary"
FROM
    employees;
 

 

--[���� 8] �������(EMPLOYEES) ���̺��� ��� ����� �̸�(FIRST_NAME)�� 
--������ ���̸�: 1 Year Salary = $������ �������� ����ϰ�, 1 Year Salary��� ��Ī�� �ٿ� ����Ͻÿ�.
--(����) King: 1 Year Salary = $288000
SELECT
    first_name
    || ' : 1 Year Salary = $'
    || salary * 12 "1 Year Salary"
FROM
    employees;

--[���� 9] �μ����� ����ϴ� ����ID�� �� ������ ����Ͻÿ�
SELECT DISTINCT
    department_id,
    job_id
FROM
    employees;

--[���� 10] �μ����� ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
--�������(EMPLOYEES) ���̺��� �޿��� $7,000~$10,000 ���� �̿��� ����� ���� �̸�(Name���� ��Ī) �� �޿��� �޿��� ���� ������ ����Ͻÿ�.
SELECT
    first_name
    || ' '
    || last_name "Name",
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 7000 AND 10000
ORDER BY
    salary ASC;

--[���� 11] 2006�� 05�� 20�Ϻ��� 2007�� 05�� 20�� ���̿� ���� ������� ���� �̸�(Name���� ��Ī), �����ȣ, �Ի����ڸ� ���.  
--��, �Ի����� ���� ������ �����Ͻÿ�.
SELECT
    first_name
    || ' '
    || last_name "Name",
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2006/05/20' AND '2007/05/20'
ORDER BY
    hire_date ASC;

--[���� 12] �μ������� �޿�(salary)�� ������(commission_pct)�� ���� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
--�̿� ������ �޴� ��� ����� ���� �̸�(Name���� ��Ī), �޿�, ����, �������� ����Ͻÿ�.
--�̶� �޿��� ū ������� �����ϵ�, �޿��� ������������� ū ������� �����Ͻÿ�.
SELECT
    first_name
    || ' '
    || last_name "Name",
    salary,
    job_id,
    commission_pct
FROM
    employees
ORDER BY
    salary DESC, commission_pct DESC;