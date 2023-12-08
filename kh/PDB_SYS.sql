-- ����� ���� ����
-- ����ڸ� �����ϱ� ���ؼ��� DBA�� ����ڸ� ������ �� �ִ�. �׷��� �ְ������(SYSDBA)�� SYS�� ����
-- create user ����ڸ� identified by ��й�ȣ; (��й�ȣ�� ��ҹ��� ������)
CREATE USER javauser IDENTIFIED BY java1234;

-- ��й�ȣ ���� ��
ALTER USER javauser IDENTIFIED BY java1234; -- ������ �ʿ� ����

-- ����� ���� �ο�
-- ����Ŭ�� ����� ������ ��� ���ѵ� ������ ���� �ʱ⿡ ���� �ο��� ���־�� �Ѵ�.
-- grant ���� to ����ڸ�;
GRANT CREATE SESSION TO javauser; -- ������ �ʿ� ����

-- grant �� to ����ڸ�;
GRANT CONNECT, RESOURCE TO javauser;

--RESOURCE : ����� �������� TABLE�� ���� �̿��� �� �ִ� ����
-- CONNECT : ����ڰ� DB�� ������ �� �ִ� ����
ALTER USER javauser
DEFAULT TABLESPACE users QUOTA UNLIMITED ON users;

-- CONNECT �ѿ� ���Ե� ���� - CREATE SESSION ������ ������ �ش� ������ ������ ���� ����
SELECT * FROM role_sys_privs
WHERE role = 'CONNECT';

-- RESOURCE �ѿ� ���Ե� ����
SELECT * FROM role_sys_privs
WHERE role = 'RESOURCE';

-- CREATE Ʈ����, ������, Ÿ��, ���ν���, ���̺� �� 8���� ������ �ο��Ǿ�����

-- ���� JAVAUSER���� �ο��� �� Ȯ��
select * from dba_role_privs
where GRANTEE = 'JAVAUSER';
show user;