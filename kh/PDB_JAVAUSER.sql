create table subject (
    no number not null,
    s_num char(2) not null,
    s_name varchar2(30) not null,
    constraint subject_no_pk primary key(no),
    constraint subejct_s_num unique(s_num)
);

Insert into subject(no, s_num, s_name) values (1, '01', '��ǻ���а�');
Insert into subject(no, s_num, s_name) values (2, '02', '�����а�');
Insert into subject(no, s_num, s_name) values (3, '03', '�Ź�����а�');
Insert into subject(no, s_num, s_name) values (4, '04', '���ͳݺ���Ͻ���');
Insert into subject(no, s_num, s_name) values (5, '05', '����濵��');

-- �Ϸù�ȣ�� ���������� ���� �а� �����͸� �Է�
insert into subject(no, s_num, s_name) values ((select max(no) + 1 from subject), '06', '����а�');

select nvl (lpad(max(to_number(ltrim(s_num, '0'))) + 1, 2, '0'), '01')
as subjectNum from subject;
select * from subject;
select nvl(lpad(max(s_num) + 1, 2, '0'), '01') as subjectNum from subject;

-- �а����̺� �Ϸù�ȣ(no)�� �������� ���� ����ǵ��� ������ ����
CREATE SEQUENCE subject_seq
START WITH 7
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE
CACHE 2;
-- DROP SEQUNCE subject_seq;
-- SELECT subject_seq.nextval FROM dual;
SELECT subject_seq.currval as s_num FROM dual;
insert into subject(no, s_num, s_name) values(subject_seq.nextval, '07', '�����а�');
insert into subject(no, s_num, s_name) values(subject_seq.nextval, '08', '�ι��а�');
delete from subject where no =18;

SELECT s_num as �а��ڵ� FROM subject where rownum = 1 order by s_num desc;

select * from subject order by no;
create table student (
    no number not null,
    sd_num char(8 char) not null,
    sd_name char(3 char)not null,
    sd_id varchar2(30) not null,
    sd_passwd varchar2(30) not null,
    s_num char(2) not null,
    sd_birth char(8) not null, 
    sd_phone char(11 char )not null,
    sd_address varchar2(100) not null,
    sd_email varchar2(50) not null,
    sd_date date default sysdate,
    constraint student_no_pk primary key (no),
    constraint student_sd_num_uk unique (sd_num),
    constraint student_id_uk unique (sd_id),
    constraint student_s_num_fk foreign key(s_num) references subject(s_num)
);
select * from student;
insert into student values(1, '06010001', '������', 'javajsp', 'pw1', '01', '061201','01012340001','����� ���빮�� â����','email_1', sysdate);
insert into student values(2, '95010002', '�����', 'jdbcmania', 'pw2', '01', '951201','01012340002','����� ���ʱ� ���絿','email_2', sysdate);
insert into student values(3, '98040001', '������', 'gonji', 'pw3', '04', '981201','01012340003','�λ걤���� �ؿ�뱸 �ݼ۵�','email_3', sysdate);
insert into student values(4, '02050001', '������', 'water', 'pw4', '05', '921201','01012340004','���������� �߱� ���ൿ','email_4', sysdate);
insert into student values(5, '94040002', '�ְ��', 'novel', 'pw5', '04', '941201','01012340005','��⵵ ������ ��ȱ� �̸�','email_5', sysdate);
insert into student values(6, '08020001', '������', 'korea', 'pw6', '02', '081201','01012340006','������ �ּ�','email_6', sysdate);
-- �л����̺� �Ϸù�ȣ(no)�� �������� ���� ����ǵ��� ������ ����
create sequence student_seq
start with 7
increment by 1
minvalue 1
maxvalue 999999
nocycle
cache 2;
insert into student values(student_seq.nextval, '08020301', '������', 'korea', 'pw6', '02', '081201','01012340006','������ �ּ�','email_6', sysdate);
insert into student values(student_seq.nextval, '58020001', '������', 'kor2ea', 'pw6', '02', '081201','01012340006','������ �ּ�','email_6', sysdate);
select * from student;


create table lesson (
    no number primary key,
    l_abbre char(2) unique not null,
    l_name varchar2(20) not null
);
insert into lesson values(1, 'K', '����');
insert into lesson values(2, 'M', '����');
insert into lesson values(3, 'E', '����');
insert into lesson values(4, 'H', '����');
insert into lesson values(5, 'P', '���α׷���');
insert into lesson values(6, 'D', '�����ͺ��̽�');
insert into lesson values(7, 'ED', '�������̷�');
create sequence lesson_seq
start with 8
increment by 1
minvalue 1
maxvalue 999999
nocycle
cache 2;
insert into lesson values(lesson_seq.nextval, 'J', '�ڹ�');
insert into lesson values(lesson_seq.nextval, 'C', 'C���');
select * from lesson;

create table trainee (
    no number primary key,
    sd_num char(8 char) not null,
    l_abbre char(2) not null,
    t_section varchar2(10) check (t_section in ('culture', 'major', 'minor')) not null,
    t_date date default sysdate,
    constraint trainee_student_sd_num_fk foreign key(sd_num) references student(sd_num),
    constraint trainee_subject_abbre_fk foreign key(l_abbre) references lesson(l_abbre)
);
insert into trainee values (1, '06010001', 'K', 'culture', sysdate);
insert into trainee values (2, '95010002', 'P', 'major', sysdate);
create sequence trainee_seq
start with 3
increment by 1
minvalue 1
maxvalue 999999
nocycle
cache 2;

insert into trainee values (trainee_seq.nextval, '95010002', 'P', 'major', sysdate);
insert into trainee values (trainee_seq.nextval, '95010002', 'P', 'major', sysdate);
select * from trainee;

--20231211
-----------------------------------------------------------------------------------------------------------------------------------
-- [�߰�����]

-- 1. �й�, �л���� �а���ȣ, �а����� ����Ͻÿ�.
select sd_num, sd_name, sd.s_num, s_name
from student sd inner join subject s
on sd.s_num = s.s_num;

--����� ��
select sd_num �й�, sd_name �л���, st.s_num �а���ȣ, s_name �а���
from subject sb inner join student st
on sb.s_num = st.s_num;
    
-- 2. �츮 �б� ��ü �а���� �� �а��� �Ҽӵ� �л���, ���̵� ����Ͻÿ�.
select s.s_name, sd_name, sd_id
from subject s left outer join student sd
on s.s_num = sd.s_num;

--����� ��
select sb.s_num, s_name �а���, sd_name �л���, sd_id ���̵�
from subject sb left outer join student st
on sb.s_num = st.s_num
order by sb.s_num;

-- 3.���� ���̺�(trainee)���� ���� ��û�� �л���, �����, �����(2018.12.28 ����)�� ����ϵ��� ������ �ۼ��� �ּ���.
--����Ŭ ����
select sd_name �л���, l_name �����, to_char(t_date, 'YYYY.MM.DD') ������û��
from trainee tr, student st, lesson le
where tr.sd_num = st.sd_num and tr.l_abbre = le.l_abbre;

--�Ϲ� ��
select sd_name �л���, l_name �����, to_char(t_date, 'YYYY.MM.DD') ������û��
from trainee tr inner join student st on tr.sd_num = st.sd_num
                     inner join lesson le on tr.l_abbre = le.l_abbre;
                     
-- �߰� : �а������� ���
select s_name �а���, sd_name �л���, l_name �����, to_char(t_date, 'YYYY.MM.DD') ������û��
from subject su inner join student st on su.s_num = st.s_num
                       inner join trainee tr on tr.sd_num = st.sd_num
                       inner join lesson le on tr.l_abbre = le.l_abbre;

-- 4. �а��� �Ҽӵ� �л� ���� ����ϵ��� ������ �ۼ�
select s_name �а���, count(sd_num) �л���
from subject sb inner join student st
on sb.s_num = st.s_num
group by s_name, sb.s_num
order by sb.s_num;

-- 5. ��ü �а����� ����ϰ� �� �а��� �Ҽӵ� �л� ���� ����ϵ��� ������ �ۼ�
select s.s_name, count(sd.sd_name)
from subject s left outer join student sd
on s.s_num = sd.s_num
group by s.s_name;

--����� ��
select s_name �а���, count(sd_num) �л���
from subject sb left outer join student st
on sb.s_num = st.s_num
group by s_name, sb.s_num
order by sb.s_num;

-- �� ����� ���� ������ ���踦 �̿��Ͽ� ������ ���� ������ ������ ��


-- Java �����Ͽ� ����� ���̺� ����
-- books ���̺� ����
create table books (
    book_id number,
    title varchar2(80) not null,
    publisher varchar2(60) not null,
    year varchar2(4) not null,
    price number not null,
    constraint books_pk primary key(book_id)
);
-- book_seq ������ ����
create sequence books_seq
start with 1
increment by 1
maxvalue 9999999
minvalue 1
nocycle
nocache;

--books ���̺� 5���� å������ �Է��� �ּ���.
insert into books values(books_seq.nextval, '������ ���', '�Ѹ�����', '2000', '50000');
insert into books values(books_seq.nextval, '������ �ǹ�', '�Ѹ�����', '2001', '51000');
insert into books values(books_seq.nextval, '������ ��', '�Ѹ�����', '2002', '52000');
insert into books values(books_seq.nextval, '������ ����', '�Ѹ�����', '2003', '53000');
insert into books values(books_seq.nextval, '������ ����', '�Ѹ�����', '2004', '54000');

select * from books;

SELECT FK.owner, FK.constraint_name , FK.table_name
FROM all_constraints FK, all_constraints PK
WHERE FK.R_CONSTRAINT_NAME = PK.CONSTRAINT_NAME 
AND PK.owner = 'JAVAUSER' AND FK.CONSTRAINT_TYPE = 'R' AND PK.TABLE_NAME = 'STUDENT' ORDER BY FK.TABLE_NAME;

desc student;
desc subject;



-- �μ� ���̺�
CREATE TABLE DEPARTMENT(
    DEPT_ID CHAR(2) NOT NULL,
    DEPT_TITLE  NVARCHAR2(20) NOT NULL,
    LOCATION_ID VARCHAR2(2),
    CONSTRAINT DEPARTMENT_PK PRIMARY KEY(DEPT_ID)
);

INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D1','�λ������','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D2','ȸ�������','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D3','�����ú�','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D4','����������','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D5','�ؿܿ���1��','L2');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D6','�ؿܿ���2��','L3');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D7','�ؿܿ���3��','L4');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D8','���������','L5');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D9','�ѹ���','L1');
select * from department;


-- ��� ���̺�
CREATE TABLE EMPLOYEE(
    EMP_ID NUMBER(3) NOT NULL,
    EMP_NAME NVARCHAR2(5) NOT NULL,
    EMP_NO CHAR(14) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    PHONE CHAR(11),
    HIRE_DATE DATE DEFAULT SYSDATE,
    JOB_CODE CHAR(2),
    SALARY NUMBER NOT NULL,
    SAL_LEVEL CHAR(2) NOT NULL,
    BONUS NUMBER(4,2),
    MANAGER_ID NUMBER(3),
    DEPT_CODE CHAR(2),
    ENT_DATE DATE,
    ENT_YN CHAR(1) DEFAULT 'N',
    CONSTRAINT EMPLOYEE_PK PRIMARY KEY(EMP_ID),
    CONSTRAINT EMPLOYEE_UK UNIQUE(EMP_NO),
    CONSTRAINT EMPLOYEE_FK FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT(DEPT_ID)
);

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(200,'������','621212-1985634','sun_hi@kh.or.kr','01099546325', 'D9', 'J1', 'S1', 8000000, 0.3, NULL, TO_DATE('1990/02/06', 'YYYY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(201,'���߱�','631126-1548654','song_jk@kh.or.kr','01045686656', 'D9', 'J2', 'S1', 6000000, NULL, 200, TO_DATE('2001/09/01', 'YYYY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(202,'���ö','861015-1356452','no_hc@kh.or.kr','01066656263', 'D9', 'J2', 'S4', 3700000, NULL, 201, TO_DATE('2001/01/01', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(203,'������','631010-2653546','song_eh@kh.or.kr','01077607879', 'D6', 'J4', 'S5', 2800000, NULL, 204, TO_DATE('1996/05/31', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(204,'���缮','660508-1342154','yoo_js@kh.or.kr','01099999129', 'D6', 'J3', 'S4', 3400000, 0.2, 200, TO_DATE('2000/12/29', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(205,'����ȭ','770102-1357951','jung_jh@kh.or.kr','01036654875', 'D6', 'J3', 'S4', 3900000, NULL, 204, TO_DATE('1999/09/09', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(206,'�ڳ���','660709-2054321','pack_nr@kh.or.kr','01096935222', 'D5', 'J7', 'S6', 1800000, NULL, 207, TO_DATE('2008/04/02', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(207,'������','690402-2040612','ha_iy@kh.or.kr','01036654488', 'D5', 'J5', 'S5', 2200000, 0.1, 200, TO_DATE('1994/07/07', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(208,'���ؼ�','870927-1313564','kim_hs@kh.or.kr','01078634444', 'D5', 'J5', 'S5', 2500000, NULL, 207, TO_DATE('2004/04/30', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(209,'�ɺ���','750206-1325546','sim_bs@kh.or.kr','01013654485', 'D5', 'J3', 'S4', 3500000, 0.15, 207, TO_DATE('2011/11/11', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(210,'������','650505-2356985','youn_eh@kh.or.kr','01079964233', 'D5', 'J7', 'S5', 2000000, NULL, 207, TO_DATE('2001/02/03', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(211,'������','830807-1121321','jun_hd@kh.or.kr','01044432222', 'D6', 'J6', 'S5', 2000000, NULL, 200, TO_DATE('2012/12/12', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(212,'��ö��','780923-2234542','kim_cs@kh.or.kr','01066682224', 'D8', 'J6', 'S5', 2550000, 0.25, 211, TO_DATE('2015/06/17', 'YY/MM/DD'));
    
    
SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE='D9' OR DEPT_CODE='D6') AND SALARY >= 3000000 AND BONUS IS NOT NULL
AND EMP_NO LIKE '_______1%' AND EMAIL LIKE '___\_%' escape '\';

SELECT * FROM EMPLOYEE WHERE BONUS IS NULL AND MANAGER_ID IS NOT NULL;

--EMPLOYEE ���̺��� �μ��ڵ�, �׷캰 �޿��� �հ�, �׷� �� �޿��� ���(����ó��),
-- �ο� ���� ��ȸ�ϰ� �μ� �ڵ� ������ ����
SELECT dept_code, SUM(salary), TRUNC(AVG(salary)), count(*)
FROM employee
GROUP BY dept_code
ORDER BY dept_code;

select * from employee;
-- EMPLOYEE ���̺��� �μ��ڵ�� ���ʽ� �޴� ��� �� ��ȸ�ϰ� �μ��ڵ� ������ ����
SELECT dept_code, COUNT(bonus)
FROM employee
GROUP BY dept_code
ORDER BY dept_code;

-- EMPLOYEE���̺��� ������ ���� ��(������ ��������) �޿� ���(����ó��), �޿� �հ�, �ο��� ��ȸ
-- �ο����� ��������
SELECT DECODE(SUBSTR(emp_no, 8, 1), 1, '��', 2, '��') AS ����
            , TRUNC(AVG(salary)) AS �޿����
            , SUM(salary) AS �޿��հ�
            , COUNT(*) AS �ο���
FROM employee 
GROUP BY DECODE(SUBSTR(emp_no, 8, 1), 1, '��', 2, '��')
ORDER BY �ο���;

select * from employee;
-- EMPLOYEE���̺��� �μ� �ڵ� ���� ���� ������ ����� �޿� �հ踦 ��ȸ
-- �μ� �ڵ� ������ ����
SELECT dept_code, job_code, SUM(salary)
FROM employee
GROUP BY dept_code, job_code
ORDER BY dept_code;

-- �μ��ڵ�� �޿� 3000000 �̻��� ������ �׷캰 ��� ����
SELECT dept_code, AVG(salary)
FROM employee
WHERE salary >= 3000000
GROUP BY dept_code;

-- �μ� �ڵ�� �޿� ����� 3000000 �̻��� �׷� ��ȸ
SELECT dept_code, FLOOR(AVG(salary))
FROM employee
GROUP BY dept_code
HAVING FLOOR(AVG(salary)) >= 3000000;

select * from department;
-- �����ȣ, �����, �μ���ȣ, �μ��� ��ȸ�ϰ� �μ���ȣ ������ ����
SELECT emp_no, emp_name, dept_code, dept_title
FROM employee INNER JOIN department
ON dept_code = dept_id
ORDER BY dept_code;

-- ��ü �μ����� ����� ��ȸ, �μ���ȣ, �μ���, �ο����� ��ȸ�ϰ� �μ���ȣ ������ ����
SELECT COUNT(emp_no) �����, dept_title, dept_id
FROM employee RIGHT OUTER JOIN department
ON dept_code = dept_id
group by dept_title, dept_id
ORDER BY dept_id;

-- ������̺��� �޿� ���� ���� �޴� ��� 3�� ���. �����ȣ, �����, �޿�, �Ի����� ��ȸ
SELECT emp_no, emp_name, salary, hire_date
FROM (SELECT emp_no, emp_name, salary, hire_date
           FROM  employee
          ORDER BY salary DESC)
WHERE ROWNUM <= 3;

-- ���ʽ� ������ ������ ���� 5���� �����ȣ, �����, �μ���, �Ի���, ������ ��ȸ
SELECT emp_id, emp_name, dept_title, hire_date, ����, ����
FROM (SELECT emp_id, emp_name, dept_title, hire_date, (salary + (salary * nvl(bonus, 0))) * 12 AS ����,
           RANK() OVER(ORDER BY ((salary + (salary * nvl(bonus, 0))) * 12) DESC) AS ����
          FROM employee inner join department ON dept_code = dept_id)
WHERE ���� <= 5;


select * from books;
-- å��ȣ(P_BOOK_ID)�� �Է� �޾� å������ ��ȯ(R_TITLE)�ϴ� ���ν��� ����
-- (�̸� : BOOKS_INPROC)
desc books;
CREATE OR REPLACE PROCEDURE books_inproc
(p_book_id IN books.book_id%TYPE, r_title OUT books.title%TYPE)
IS
BEGIN
    SELECT title INTO r_title FROM books WHERE book_id = p_book_id;
EXCEPTION
    WHEN OTHERS THEN
        r_title := '�ش��ϴ� å�� �������� �ʽ��ϴ�.';
END books_inproc;
/
SHOW ERROR;

DECLARE
    rtitle VARCHAR2(50);
BEGIN
    books_inproc(3, rtitle);
    DBMS_OUTPUT.PUT_LINE('å���� : ' || rtitle);
END;
/
desc books;
-- å���̺� ������ ���� �ܺη� ��ȯ�ϴ� ���ν��� ���� (BOOKS_SELECT)
CREATE OR REPLACE PROCEDURE books_select
(vbooks OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN VBOOKS FOR SELECT book_id, title, publisher, year, price FROM books;
END books_select;
/
SHOW ERROR;

-- ���ν��� Ȯ��
DECLARE
    rbooks SYS_REFCURSOR;
    recordbooks books%ROWTYPE;
BEGIN
    books_select (rbooks);
    LOOP
        FETCH rbooks INTO recordbooks.book_id, recordbooks.title, recordbooks.publisher, recordbooks.year, recordbooks.price;
        EXIT WHEN rbooks%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(recordbooks.title || ' ' || recordbooks.price);
    END LOOP;
END;
/

select no, s_num, s_name, 
decode((select count(sd_num) from student where s_num = sb.s_num), 0, '��������', '�����Ұ���')
as deletetable from subject sb;

-- ���� ���� : ���ȼ��� ���Ǽ�
create or replace view subjectselect(no, s_num, s_name, deleteable)
as
SELECT no, s_num, s_name
        , decode((select count(sd_num) from student where s_num = sb.s_num), 0, '��������', '�����Ұ���')
FROM subject sb
order by no;

select * from subjectselect;

select * from subject;

-- ȸ������ ���̺�
create table t_member (
    m_id varchar2(15)   not null,
    m_passwd varchar2(15)   not null,
    m_name varchar2(18)     not null,
    m_email varchar2(100)  not null,
    m_tel   varchar2(15)    not null,
    reg_date    date    default sysdate,
    constraint t_member_pk primary key(m_id)
);

comment on table t_member is 'ȸ�� ����';
comment on column t_member.m_id is 'ȸ�� ���̵� ';
comment on column t_member.m_passwd is 'ȸ�� ��й�ȣ';
comment on column t_member.m_name is 'ȸ���� ';
comment on column t_member.m_email is 'ȸ�� �̸���';
comment on column t_member.m_tel is 'ȸ�� ��ȭ��ȣ';
comment on column t_member.reg_date is 'ȸ�� �����';

insert into t_member values('id1', 'pw1', '�̸�1', '1@naver.com', '111-1111-1111', sysdate);
insert into t_member values('id2', 'pw2', '�̸�2', '2@naver.com', '222-2222-2222', sysdate);
insert into t_member values('id3', 'pw3', '�̸�3', '3@naver.com', '333-3333-3333', sysdate);
insert into t_member values('id4', 'pw4', '�̸�4', '4@naver.com', '444-4444-4444', sysdate);
insert into t_member values('id5', 'pw5', '�̸�5', '5@naver.com', '555-5555-5555', sysdate);
insert into t_member values('id6', 'pw6', '�̸�6', '6@naver.com', '666-6666-6666', sysdate);

create table board(
    num number(4)            not null,
    author varchar2(20)       not null,
    title varchar2(500)         not null,
    content varchar2(4000)  not null,
    writeday date default sysdate,
    readcnt number(4) default 0,
    reproot number(4),
    repstep number(4),
    repindent number(4),
    passwd varchar2(12)     not null,
    constraint board_pk primary key(num)
);

-- �亯 �Խ����� ���� �÷�  
-- reproot, repstep,  repindent 

-- drop table board;
comment on table  board is '�Խ��� ���̺�';
comment on column board.num is '�Խ��� ��ȣ';
comment on column board.author is '�Խ��� �ۼ���';
comment on column board.title is '�Խ��� ����';    
comment on column board.content is '�Խ��� ����';
comment on column board.writeday is '�Խ��� �����';     
comment on column board.readcnt is '�Խ��� ��ȸ��';     
comment on column board.reproot is '�Խ��� �亯��(�������� ��ȣ ���� - �׷��ȣ)';
comment on column board.repstep is '�Խ��� �亯��(�亯���� ��ġ��ȣ ����)';
comment on column board.repindent is '�Խ��� �亯��(�亯���� ������ȣ ����)';
comment on column board.passwd is '�Խ��� ��й�ȣ';



