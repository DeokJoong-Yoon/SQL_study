create table subject (
    no number(1) primary key not null,
    s_num char(2) unique not null,
    s_name varchar2(30) not null
);
Insert into subject(no, s_num, s_name) values (1, '01', '��ǻ���а�');
Insert into subject(no, s_num, s_name) values (2, '02', '�����а�');
Insert into subject(no, s_num, s_name) values (3, '03', '�Ź�����а�');
Insert into subject(no, s_num, s_name) values (4, '04', '���ͳݺ���Ͻ���');
Insert into subject(no, s_num, s_name) values (5, '05', '����濵��');


create table student (
    no number(1) primary key,
    sd_num char(8 char) unique not null,
    sd_name char(3 char)not null,
    sd_id varchar2(30) not null,
    sd_passwd varchar2(30) not null,
    s_num char(2) not null,
    sd_birth char(6 char) not null, 
    sd_phone char(11 char )not null,
    sd_address varchar2(100) not null,
    sd_email varchar2(50) not null,
    sd_date date default sysdate not null,
    constraint student_s_num_fk foreign key(s_num) references subject(s_num)
);
insert into student values(1, '06010001', '������', 'javajsp', 'pw1', '01', '061201','01012340001','����� ���빮�� â����','email_1', sysdate);
insert into student values(2, '95010002', '�����', 'jdbcmania', 'pw2', '01', '951201','01012340002','����� ���ʱ� ���絿','email_2', sysdate);
insert into student values(3, '98040001', '������', 'gonji', 'pw3', '04', '981201','01012340003','�λ걤���� �ؿ�뱸 �ݼ۵�','email_3', sysdate);
insert into student values(4, '02050001', '������', 'water', 'pw4', '05', '921201','01012340004','���������� �߱� ���ൿ','email_4', sysdate);
insert into student values(5, '94040002', '�ְ��', 'novel', 'pw5', '04', '941201','01012340005','��⵵ ������ ��ȱ� �̸�','email_5', sysdate);
insert into student values(6, '08020001', '������', 'korea', 'pw6', '02', '081201','01012340006','������ �ּ�','email_6', sysdate);

create table lesson (
    no number(1) primary key,
--    l_abbre char(2) check (l_abbre in ('K', 'M', 'E', 'H', 'P', 'D', 'ED')) not null,
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

create table trainee (
    no number(1) primary key,
    sd_num char(8 char) not null,
    l_abbre char(2),
    t_section varchar2(10) check (t_section in ('culture', 'major', 'minor')) not null,
    t_date date default sysdate,
    constraint trainee_student_sd_num_fk foreign key(sd_num) references student(sd_num),
    constraint trainee_subject_abbre_fk foreign key(l_abbre) references lesson(l_abbre)
);
insert into trainee values (1, '06010001', 'K', 'culture', sysdate);
insert into trainee values (2, '95010002', 'P', 'major', sysdate);




