create table subject (
    no number not null,
    s_num char(2) not null,
    s_name varchar2(30) not null
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

insert into subject(no, s_num, s_name) values(subject_seq.nextval, '07', '�����а�');
insert into subject(no, s_num, s_name) values(subject_seq.nextval, '08', '�ι��а�');


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
insert into student values(student_seq.nextval, '58020001', '������', 'korea', 'pw6', '02', '081201','01012340006','������ �ּ�','email_6', sysdate);
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