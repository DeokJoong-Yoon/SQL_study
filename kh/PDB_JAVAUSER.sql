create table subject (
    no number not null,
    s_num char(2) not null,
    s_name varchar2(30) not null
    constraint subject_no_pk primary key(no),
    constraint subejct_s_num unique(s_num)
);

Insert into subject(no, s_num, s_name) values (1, '01', '컴퓨터학과');
Insert into subject(no, s_num, s_name) values (2, '02', '교육학과');
Insert into subject(no, s_num, s_name) values (3, '03', '신문방송학과');
Insert into subject(no, s_num, s_name) values (4, '04', '인터넷비즈니스과');
Insert into subject(no, s_num, s_name) values (5, '05', '기술경영과');
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
insert into student values(1, '06010001', '김정수', 'javajsp', 'pw1', '01', '061201','01012340001','서울시 서대문구 창전동','email_1', sysdate);
insert into student values(2, '95010002', '김수현', 'jdbcmania', 'pw2', '01', '951201','01012340002','서울시 서초구 양재동','email_2', sysdate);
insert into student values(3, '98040001', '공지영', 'gonji', 'pw3', '04', '981201','01012340003','부산광역시 해운대구 반송동','email_3', sysdate);
insert into student values(4, '02050001', '조수영', 'water', 'pw4', '05', '921201','01012340004','대전광역시 중구 은행동','email_4', sysdate);
insert into student values(5, '94040002', '최경란', 'novel', 'pw5', '04', '941201','01012340005','경기도 수원시 장안구 이목동','email_5', sysdate);
insert into student values(6, '08020001', '안익태', 'korea', 'pw6', '02', '081201','01012340006','본인의 주소','email_6', sysdate);

create table lesson (
    no number primary key,
    l_abbre char(2) unique not null,
    l_name varchar2(20) not null
);
insert into lesson values(1, 'K', '국어');
insert into lesson values(2, 'M', '수학');
insert into lesson values(3, 'E', '영어');
insert into lesson values(4, 'H', '역사');
insert into lesson values(5, 'P', '프로그래밍');
insert into lesson values(6, 'D', '데이터베이스');
insert into lesson values(7, 'ED', '교육학이론');

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


--20231211
-----------------------------------------------------------------------------------------------------------------------------------
-- [추가예제]

-- 1. 학번, 학생명과 학과번호, 학과명을 출력하시오.
select
    sd_num, sd_name, sd.s_num, s_name
from
    student sd inner join subject s
on
    sd.s_num = s.s_num;
    
-- 2. 우리 학교 전체 학과명과 그 학과에 소속된 학생명, 아이디를 출력하시오.
select
    s.s_name, sd_name, sd_id
from
    subject s left outer join student sd
on s.s_num = sd.s_num;

-- 3.수강 테이블(trainee)에서 수강 신청한 학생명, 과목명, 등록일(2018.12.28 형태)을 출력하도록 쿼리문 작성해 주세요.
select
    sd.sd_name, sd.sd_name, to_char(t_date, 'YYYY.MM.DD') t_date
from
    student sd inner join trainee t
on
    sd.sd_num = t.sd_num
;
