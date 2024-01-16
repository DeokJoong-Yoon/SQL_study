create table student(
    num number primary key,
    student_number number not null,
    first_name varchar2(4) not null,
    last_name varchar2(10) not null,
    korean_score number not null,
    english_score number not null,
    math_score number not null
);

create table manager1(
    num number primary key,
    manager_number number not null,
    first_name varchar2(4) not null,
    last_name varchar2(10) not null,
    manager_hire_date char(8) not null
);



CREATE TABLE TB_USER(

USER_NO NUMBER PRIMARY KEY,

USER_ID VARCHAR2(50) UNIQUE NOT NULL,

USER_NAME VARCHAR2(50) NOT NULL,

USER_AGE NUMBER NOT NULL

);

CREATE SEQUENCE SEQ_UNO

START WITH 1

INCREMENT BY 1

NOCACHE;


INSERT INTO TB_USER VALUES(SEQ_UNO.NEXTVAL, 'gd_hong', 'È«±æµ¿', 20);

INSERT INTO TB_USER VALUES(SEQ_UNO.NEXTVAL, 'sh_han', 'ÇÑ¼ÒÈñ', 28);

INSERT INTO TB_USER VALUES(SEQ_UNO.NEXTVAL, 'jm_park', 'Áö¹Î', 27);

COMMIT;

select * from TB_USER;

CREATE TABLE MEMBER(

USER_NO NUMBER PRIMARY KEY,

USER_ID VARCHAR2(20) NOT NULL,

USER_PW VARCHAR2(20) NOT NULL,

USER_NAME VARCHAR2(20) NOT NULL,

USER_ADDR VARCHAR(50) NOT NULL,

REG_DATE DATE DEFAULT SYSDATE

);

CREATE SEQUENCE SEQ_MEMBER;


