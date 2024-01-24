
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

desc tb_user;

CREATE TABLE MEMBER(

USER_NO NUMBER PRIMARY KEY,

USER_ID VARCHAR2(20) NOT NULL unique,

USER_PW VARCHAR2(20) NOT NULL,

USER_NAME VARCHAR2(20) NOT NULL,

USER_ADDR VARCHAR(50) NOT NULL,

REG_DATE DATE DEFAULT SYSDATE

);

drop table MEMBER;
commit;


CREATE SEQUENCE SEQ_MEMBER;

select * from member;

create table product(
	product_number NUMBER PRIMARY KEY,
	product_name VARCHAR(21) NOT NULL,
	product_price NUMBER NOT NULL,
	product_regist_date CHAR(10) NOT NULL,
	total_sell_count NUMBER NOT NULL
);

create table seller(
	seller_id NUMBER PRIMARY KEY,
	seller_name VARCHAR2(60) NOT NULL,
	seller_homepage_url VARCHAR2(60) NOT NULL
);
