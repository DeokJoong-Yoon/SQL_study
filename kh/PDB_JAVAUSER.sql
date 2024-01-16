create table subject (
    no number not null,
    s_num char(2) not null,
    s_name varchar2(30) not null,
    constraint subject_no_pk primary key(no),
    constraint subejct_s_num unique(s_num)
);

Insert into subject(no, s_num, s_name) values (1, '01', '컴퓨터학과');
Insert into subject(no, s_num, s_name) values (2, '02', '교육학과');
Insert into subject(no, s_num, s_name) values (3, '03', '신문방송학과');
Insert into subject(no, s_num, s_name) values (4, '04', '인터넷비즈니스과');
Insert into subject(no, s_num, s_name) values (5, '05', '기술경영과');

-- 일련번호를 쿼리문으로 구해 학과 데이터를 입력
insert into subject(no, s_num, s_name) values ((select max(no) + 1 from subject), '06', '통계학과');

select nvl (lpad(max(to_number(ltrim(s_num, '0'))) + 1, 2, '0'), '01')
as subjectNum from subject;
select * from subject;
select nvl(lpad(max(s_num) + 1, 2, '0'), '01') as subjectNum from subject;

-- 학과테이블에 일련번호(no)를 시퀀스에 의해 저장되도록 시퀀스 생성
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
insert into subject(no, s_num, s_name) values(subject_seq.nextval, '07', '역사학과');
insert into subject(no, s_num, s_name) values(subject_seq.nextval, '08', '인문학과');
delete from subject where no =18;

SELECT s_num as 학과코드 FROM subject where rownum = 1 order by s_num desc;

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
insert into student values(1, '06010001', '김정수', 'javajsp', 'pw1', '01', '061201','01012340001','서울시 서대문구 창전동','email_1', sysdate);
insert into student values(2, '95010002', '김수현', 'jdbcmania', 'pw2', '01', '951201','01012340002','서울시 서초구 양재동','email_2', sysdate);
insert into student values(3, '98040001', '공지영', 'gonji', 'pw3', '04', '981201','01012340003','부산광역시 해운대구 반송동','email_3', sysdate);
insert into student values(4, '02050001', '조수영', 'water', 'pw4', '05', '921201','01012340004','대전광역시 중구 은행동','email_4', sysdate);
insert into student values(5, '94040002', '최경란', 'novel', 'pw5', '04', '941201','01012340005','경기도 수원시 장안구 이목동','email_5', sysdate);
insert into student values(6, '08020001', '안익태', 'korea', 'pw6', '02', '081201','01012340006','본인의 주소','email_6', sysdate);
-- 학생테이블에 일련번호(no)를 시퀀스에 의해 저장되도록 시퀀스 생성
create sequence student_seq
start with 7
increment by 1
minvalue 1
maxvalue 999999
nocycle
cache 2;
insert into student values(student_seq.nextval, '08020301', '안익태', 'korea', 'pw6', '02', '081201','01012340006','본인의 주소','email_6', sysdate);
insert into student values(student_seq.nextval, '58020001', '안익태', 'kor2ea', 'pw6', '02', '081201','01012340006','본인의 주소','email_6', sysdate);
select * from student;


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
create sequence lesson_seq
start with 8
increment by 1
minvalue 1
maxvalue 999999
nocycle
cache 2;
insert into lesson values(lesson_seq.nextval, 'J', '자바');
insert into lesson values(lesson_seq.nextval, 'C', 'C언어');
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
-- [추가예제]

-- 1. 학번, 학생명과 학과번호, 학과명을 출력하시오.
select sd_num, sd_name, sd.s_num, s_name
from student sd inner join subject s
on sd.s_num = s.s_num;

--강사님 답
select sd_num 학번, sd_name 학생명, st.s_num 학과번호, s_name 학과명
from subject sb inner join student st
on sb.s_num = st.s_num;
    
-- 2. 우리 학교 전체 학과명과 그 학과에 소속된 학생명, 아이디를 출력하시오.
select s.s_name, sd_name, sd_id
from subject s left outer join student sd
on s.s_num = sd.s_num;

--강사님 답
select sb.s_num, s_name 학과명, sd_name 학생명, sd_id 아이디
from subject sb left outer join student st
on sb.s_num = st.s_num
order by sb.s_num;

-- 3.수강 테이블(trainee)에서 수강 신청한 학생명, 과목명, 등록일(2018.12.28 형태)을 출력하도록 쿼리문 작성해 주세요.
--오라클 문법
select sd_name 학생명, l_name 과목명, to_char(t_date, 'YYYY.MM.DD') 수강신청일
from trainee tr, student st, lesson le
where tr.sd_num = st.sd_num and tr.l_abbre = le.l_abbre;

--일반 답
select sd_name 학생명, l_name 과목명, to_char(t_date, 'YYYY.MM.DD') 수강신청일
from trainee tr inner join student st on tr.sd_num = st.sd_num
                     inner join lesson le on tr.l_abbre = le.l_abbre;
                     
-- 추가 : 학과정보도 출력
select s_name 학과명, sd_name 학생명, l_name 과목명, to_char(t_date, 'YYYY.MM.DD') 수강신청일
from subject su inner join student st on su.s_num = st.s_num
                       inner join trainee tr on tr.sd_num = st.sd_num
                       inner join lesson le on tr.l_abbre = le.l_abbre;

-- 4. 학과에 소속된 학생 수를 출력하도록 쿼리문 작성
select s_name 학과명, count(sd_num) 학생수
from subject sb inner join student st
on sb.s_num = st.s_num
group by s_name, sb.s_num
order by sb.s_num;

-- 5. 전체 학과명을 출력하고 그 학과에 소속된 학생 수를 출력하도록 쿼리문 작성
select s.s_name, count(sd.sd_name)
from subject s left outer join student sd
on s.s_num = sd.s_num
group by s.s_name;

--강사님 답
select s_name 학과명, count(sd_num) 학생수
from subject sb left outer join student st
on sb.s_num = st.s_num
group by s_name, sb.s_num
order by sb.s_num;

-- 각 사원과 직속 상사와의 관계를 이용하여 다음과 같은 형식의 보고서를 작


-- Java 연동하여 사용할 테이블 생성
-- books 테이블 생성
create table books (
    book_id number,
    title varchar2(80) not null,
    publisher varchar2(60) not null,
    year varchar2(4) not null,
    price number not null,
    constraint books_pk primary key(book_id)
);
-- book_seq 시퀀스 생성
create sequence books_seq
start with 1
increment by 1
maxvalue 9999999
minvalue 1
nocycle
nocache;

--books 테이블에 5개의 책정보를 입력해 주세요.
insert into books values(books_seq.nextval, '존재의 기술', '뿌리출판', '2000', '50000');
insert into books values(books_seq.nextval, '존재의 의미', '뿌리출판', '2001', '51000');
insert into books values(books_seq.nextval, '존재의 평가', '뿌리출판', '2002', '52000');
insert into books values(books_seq.nextval, '존재의 혜안', '뿌리출판', '2003', '53000');
insert into books values(books_seq.nextval, '존재의 존재', '뿌리출판', '2004', '54000');

select * from books;

SELECT FK.owner, FK.constraint_name , FK.table_name
FROM all_constraints FK, all_constraints PK
WHERE FK.R_CONSTRAINT_NAME = PK.CONSTRAINT_NAME 
AND PK.owner = 'JAVAUSER' AND FK.CONSTRAINT_TYPE = 'R' AND PK.TABLE_NAME = 'STUDENT' ORDER BY FK.TABLE_NAME;

desc student;
desc subject;



-- 부서 테이블
CREATE TABLE DEPARTMENT(
    DEPT_ID CHAR(2) NOT NULL,
    DEPT_TITLE  NVARCHAR2(20) NOT NULL,
    LOCATION_ID VARCHAR2(2),
    CONSTRAINT DEPARTMENT_PK PRIMARY KEY(DEPT_ID)
);

INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D1','인사관리부','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D2','회계관리부','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D3','마케팅부','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D4','국내영업부','L1');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D5','해외영업1부','L2');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D6','해외영업2부','L3');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D7','해외영업3부','L4');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D8','기술지원부','L5');
INSERT INTO DEPARTMENT(DEPT_ID, DEPT_TITLE, LOCATION_ID)
VALUES('D9','총무부','L1');
select * from department;


-- 사원 테이블
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
VALUES(200,'선동일','621212-1985634','sun_hi@kh.or.kr','01099546325', 'D9', 'J1', 'S1', 8000000, 0.3, NULL, TO_DATE('1990/02/06', 'YYYY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(201,'송중기','631126-1548654','song_jk@kh.or.kr','01045686656', 'D9', 'J2', 'S1', 6000000, NULL, 200, TO_DATE('2001/09/01', 'YYYY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(202,'노웅철','861015-1356452','no_hc@kh.or.kr','01066656263', 'D9', 'J2', 'S4', 3700000, NULL, 201, TO_DATE('2001/01/01', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(203,'송은희','631010-2653546','song_eh@kh.or.kr','01077607879', 'D6', 'J4', 'S5', 2800000, NULL, 204, TO_DATE('1996/05/31', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(204,'유재석','660508-1342154','yoo_js@kh.or.kr','01099999129', 'D6', 'J3', 'S4', 3400000, 0.2, 200, TO_DATE('2000/12/29', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(205,'정중화','770102-1357951','jung_jh@kh.or.kr','01036654875', 'D6', 'J3', 'S4', 3900000, NULL, 204, TO_DATE('1999/09/09', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(206,'박나라','660709-2054321','pack_nr@kh.or.kr','01096935222', 'D5', 'J7', 'S6', 1800000, NULL, 207, TO_DATE('2008/04/02', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(207,'하이유','690402-2040612','ha_iy@kh.or.kr','01036654488', 'D5', 'J5', 'S5', 2200000, 0.1, 200, TO_DATE('1994/07/07', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(208,'김해술','870927-1313564','kim_hs@kh.or.kr','01078634444', 'D5', 'J5', 'S5', 2500000, NULL, 207, TO_DATE('2004/04/30', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(209,'심봉선','750206-1325546','sim_bs@kh.or.kr','01013654485', 'D5', 'J3', 'S4', 3500000, 0.15, 207, TO_DATE('2011/11/11', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(210,'윤은혜','650505-2356985','youn_eh@kh.or.kr','01079964233', 'D5', 'J7', 'S5', 2000000, NULL, 207, TO_DATE('2001/02/03', 'YY/MM/DD'));

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(211,'전형돈','830807-1121321','jun_hd@kh.or.kr','01044432222', 'D6', 'J6', 'S5', 2000000, NULL, 200, TO_DATE('2012/12/12', 'YY/MM/DD'));
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SAL_LEVEL, SALARY, BONUS, MANAGER_ID, HIRE_DATE)
VALUES(212,'김철수','780923-2234542','kim_cs@kh.or.kr','01066682224', 'D8', 'J6', 'S5', 2550000, 0.25, 211, TO_DATE('2015/06/17', 'YY/MM/DD'));
    
    
SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE='D9' OR DEPT_CODE='D6') AND SALARY >= 3000000 AND BONUS IS NOT NULL
AND EMP_NO LIKE '_______1%' AND EMAIL LIKE '___\_%' escape '\';

SELECT * FROM EMPLOYEE WHERE BONUS IS NULL AND MANAGER_ID IS NOT NULL;

--EMPLOYEE 테이블에서 부서코드, 그룹별 급여의 합계, 그룹 별 급여의 평균(정수처리),
-- 인원 수를 조회하고 부서 코드 순으로 정렬
SELECT dept_code, SUM(salary), TRUNC(AVG(salary)), count(*)
FROM employee
GROUP BY dept_code
ORDER BY dept_code;

select * from employee;
-- EMPLOYEE 테이블에서 부서코드와 보너스 받는 사원 수 조회하고 부서코드 순으로 정렬
SELECT dept_code, COUNT(bonus)
FROM employee
GROUP BY dept_code
ORDER BY dept_code;

-- EMPLOYEE테이블에서 성별과 성별 별(성별을 기준으로) 급여 평균(정수처리), 급여 합계, 인원수 조회
-- 인원수로 내림차순
SELECT DECODE(SUBSTR(emp_no, 8, 1), 1, '남', 2, '여') AS 성별
            , TRUNC(AVG(salary)) AS 급여평균
            , SUM(salary) AS 급여합계
            , COUNT(*) AS 인원수
FROM employee 
GROUP BY DECODE(SUBSTR(emp_no, 8, 1), 1, '남', 2, '여')
ORDER BY 인원수;

select * from employee;
-- EMPLOYEE테이블에서 부서 코드 별로 같은 직급인 사원의 급여 합계를 조회
-- 부서 코드 순으로 정렬
SELECT dept_code, job_code, SUM(salary)
FROM employee
GROUP BY dept_code, job_code
ORDER BY dept_code;

-- 부서코드와 급여 3000000 이상인 직원의 그룹별 평균 조희
SELECT dept_code, AVG(salary)
FROM employee
WHERE salary >= 3000000
GROUP BY dept_code;

-- 부서 코드와 급여 평균이 3000000 이상인 그룹 조회
SELECT dept_code, FLOOR(AVG(salary))
FROM employee
GROUP BY dept_code
HAVING FLOOR(AVG(salary)) >= 3000000;

select * from department;
-- 사원번호, 사원명, 부서번호, 부서명 조회하고 부서번호 순으로 정렬
SELECT emp_no, emp_name, dept_code, dept_title
FROM employee INNER JOIN department
ON dept_code = dept_id
ORDER BY dept_code;

-- 전체 부서별로 사원수 조회, 부서번호, 부서명, 인원수를 조회하고 부서번호 순으로 정렬
SELECT COUNT(emp_no) 사원수, dept_title, dept_id
FROM employee RIGHT OUTER JOIN department
ON dept_code = dept_id
group by dept_title, dept_id
ORDER BY dept_id;

-- 사원테이블에서 급여 가장 많이 받는 사원 3명만 출력. 사원번호, 사원명, 급여, 입사일을 조회
SELECT emp_no, emp_name, salary, hire_date
FROM (SELECT emp_no, emp_name, salary, hire_date
           FROM  employee
          ORDER BY salary DESC)
WHERE ROWNUM <= 3;

-- 보너스 포함한 연봉이 높은 5명의 사원번호, 사원명, 부서명, 입사일, 순위를 조회
SELECT emp_id, emp_name, dept_title, hire_date, 연봉, 순위
FROM (SELECT emp_id, emp_name, dept_title, hire_date, (salary + (salary * nvl(bonus, 0))) * 12 AS 연봉,
           RANK() OVER(ORDER BY ((salary + (salary * nvl(bonus, 0))) * 12) DESC) AS 순위
          FROM employee inner join department ON dept_code = dept_id)
WHERE 순위 <= 5;


select * from books;
-- 책번호(P_BOOK_ID)를 입력 받아 책제목을 반환(R_TITLE)하는 프로시저 생성
-- (이름 : BOOKS_INPROC)
desc books;
CREATE OR REPLACE PROCEDURE books_inproc
(p_book_id IN books.book_id%TYPE, r_title OUT books.title%TYPE)
IS
BEGIN
    SELECT title INTO r_title FROM books WHERE book_id = p_book_id;
EXCEPTION
    WHEN OTHERS THEN
        r_title := '해당하는 책이 존재하지 않습니다.';
END books_inproc;
/
SHOW ERROR;

DECLARE
    rtitle VARCHAR2(50);
BEGIN
    books_inproc(3, rtitle);
    DBMS_OUTPUT.PUT_LINE('책제목 : ' || rtitle);
END;
/
desc books;
-- 책테이블에 데이터 전부 외부로 반환하는 프로시저 생성 (BOOKS_SELECT)
CREATE OR REPLACE PROCEDURE books_select
(vbooks OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN VBOOKS FOR SELECT book_id, title, publisher, year, price FROM books;
END books_select;
/
SHOW ERROR;

-- 프로시저 확인
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
decode((select count(sd_num) from student where s_num = sb.s_num), 0, '삭제가능', '삭제불가능')
as deletetable from subject sb;

-- 뷰의 장점 : 보안성과 편의성
create or replace view subjectselect(no, s_num, s_name, deleteable)
as
SELECT no, s_num, s_name
        , decode((select count(sd_num) from student where s_num = sb.s_num), 0, '삭제가능', '삭제불가능')
FROM subject sb
order by no;

select * from subjectselect;

select * from subject;

-- 회원가입 테이블
create table t_member (
    m_id varchar2(15)   not null,
    m_passwd varchar2(15)   not null,
    m_name varchar2(18)     not null,
    m_email varchar2(100)  not null,
    m_tel   varchar2(15)    not null,
    reg_date    date    default sysdate,
    constraint t_member_pk primary key(m_id)
);

comment on table t_member is '회원 정보';
comment on column t_member.m_id is '회원 아이디 ';
comment on column t_member.m_passwd is '회원 비밀번호';
comment on column t_member.m_name is '회원명 ';
comment on column t_member.m_email is '회원 이메일';
comment on column t_member.m_tel is '회원 전화번호';
comment on column t_member.reg_date is '회원 등록일';

insert into t_member values('id1', 'pw1', '이름1', '1@naver.com', '111-1111-1111', sysdate);
insert into t_member values('id2', 'pw2', '이름2', '2@naver.com', '222-2222-2222', sysdate);
insert into t_member values('id3', 'pw3', '이름3', '3@naver.com', '333-3333-3333', sysdate);
insert into t_member values('id4', 'pw4', '이름4', '4@naver.com', '444-4444-4444', sysdate);
insert into t_member values('id5', 'pw5', '이름5', '5@naver.com', '555-5555-5555', sysdate);
insert into t_member values('id6', 'pw6', '이름6', '6@naver.com', '666-6666-6666', sysdate);

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

-- 답변 게시판을 위한 컬럼  
-- reproot, repstep,  repindent 

-- drop table board;
comment on table  board is '게시판 테이블';
comment on column board.num is '게시판 번호';
comment on column board.author is '게시판 작성자';
comment on column board.title is '게시판 제목';    
comment on column board.content is '게시판 내용';
comment on column board.writeday is '게시판 등록일';     
comment on column board.readcnt is '게시판 조회수';     
comment on column board.reproot is '게시판 답변글(원래글의 번호 참조 - 그룹번호)';
comment on column board.repstep is '게시판 답변글(답변글의 위치번호 지정)';
comment on column board.repindent is '게시판 답변글(답변글의 계층번호 지정)';
comment on column board.passwd is '게시판 비밀번호';



