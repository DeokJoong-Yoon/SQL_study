

SELECT * FROM TAB;

SELECT * FROM EMP01;

DESC EMP01;

DELETE FROM EMP01;

DROP TABLE EMP01;

SELECT * FROM TAB;

-- 고객 테이블 생성
CREATE TABLE TB_CUSTOMER(
    CUSTOMER_CD     CHAR (7)        NOT NULL PRIMARY KEY,       -- 고객코드(컬럼 레벨 형식)
    CUSTOMER_NM     VARCHAR2 (15)   NOT NULL,                   -- 고객명 (컬럼 레벨 형식)
    MW_FLG          CHAR (1)        NOT NULL, -- M(남성)W(여성)  -- 성별구분(컬럼 레벨 형식)
    BIRTH_DAY       CHAR (8)        NOT NULL,                   -- 생일(컬럼 레벨 형식)
    PHONE_NUMBER    VARCHAR2 (16),                              -- 전화번호
    EMAIL           VARCHAR2 (50),                              -- EMAIL
    TOTAL_POINT     NUMBER (10),                                -- 누적포인트
    REG_DTTM        CHAR (14)                                   -- 등록일
);

DESC TB_CUSTOMER; -- DESC는 구조 확인 명령문

SELECT * FROM TB_CUSTOMER;

INSERT INTO TB_CUSTOMER (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES(2017042, '강원진', 'M', '19810603', '010-8202-8790', 'wjgang@navi.com', 280300, '20170123132432');
INSERT INTO TB_CUSTOMER (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES(2017053, '나경숙', 'W', '19891225', '010-4509-0043', 'ksna@boram.co.kr', 4500, '20170210180930');
INSERT INTO TB_CUSTOMER (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES(2017103, '박승대', 'M', '19711430', '', 'sdpark@haso.com', 23450, '20170508203450');

SELECT * FROM TB_CUSTOMER;

--임시테이블
INSERT ALL
INTO TB_CUSTOMER (CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, REG_DTTM)
VALUES(2017042, '강원진', 'M', '19810603', '010-8202-8790', 'wjgang@navi.com', 280300, '20170123132432');
INTO TB_CUSTOMER
VALUES(2017053, '나경숙', 'W', '19891225', '010-4509-0043', 'ksna@boram.co.kr', 4500, '20170210180930');
INTO TB_CUSTOMER
VALUES(2017103, '박승대', 'M', '19711430', '', 'sdpark@haso.com', 23450, '20170508203450');
SELECT * FROM DUAL;


DESC DUAL;

SELECT 100+4 FROM DUAL;
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR (SYSDATE, 'YYYY-MM-DD HH24:MI:SS') AS NOWDATE FROM DUAL;
--SYSDATE는 오늘 날짜와 시간을 가지고 있는 날짜 함수, 문자변환함수 TO_CHAR와 같이 사용

SELECT * FROM TB_CUSTOMER;
--DELETE FROM TB_CUSTOMER;
-------------------------------------------------------
-- 데이터 입력, 수정, 삭제
CREATE TABLE DEPT(
    DEPTNO NUMBER (2),
    DNAME VARCHAR2 (14),
    LOC VARCHAR2 (13)
);

DESC DEPT;

SELECT * FROM TAB;

--DEPTNO에 10번 부서, DNAME에는 'ACCOUNTING'을, LOC에는 'NEW YORK'을 추가하자.
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK');

SELECT * FROM DEPT;
--커밋(F11) , 롤백(F12)  완료 및 취소 (이미 커밋하면 롤백하지 못 함)

--SQL 오류: ORA-00947: 값의 수가 충분하지 않습니다
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES (10, 'ACCOUNTING');

INSERT INTO DEPT
VALUES(20, 'RESEARCH', 'DALLAS');

SELECT * FROM DEPT;

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK');

SELECT * FROM DEPT;

INSERT INTO DEPT
VALUES(20, 'RESEARCH', 'DALLAS');

SELECT * FROM DEPT;

DELETE FROM DEPT; 

INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK');

INSERT INTO DEPT
VALUES(20, 'RESEARCH', 'DALLAS');

SELECT * FROM DEPT;

--NOT NULL로 변경--
ALTER TABLE DEPT
MODIFY(DEPTNO NUMBER(2) NOT NULL);

ALTER TABLE DEPT
MODIFY(DNAME VARCHAR2(14) NOT NULL);

SELECT * FROM DEPT;

INSERT INTO DEPT(DEPTNO, DNAME)-- 컬럼명을 2개 입력해서 값도 2개 입력.
VALUES (30, 'SALES');
------------------

-- SQL 오류: ORA-00947: 값의 수가 충분하지 않습니다
INSERT INTO DEPT --컬럼명을 입력하지 않아서 값이 3개 필요하기에 오류 발생.
VALUES (40, 'OPERATIONS');

INSERT INTO DEPT
VALUES (40, 'OPERATIONS', NULL);

SELECT * FROM DEPT;

--SQL 오류: ORA-01400: NULL을 ("HR"."DEPT"."DNAME") 안에 삽입할 수 없습니다
INSERT INTO DEPT
VALUES (50, '', 'CHICAGO');

SELECT * FROM DEPT;

DELETE FROM DEPT;

ALTER TABLE DEPT MODIFY(DEPTNO NUMBER(4), DNAME VARCHAR2(30));

INSERT INTO DEPT
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID FROM DEPARTMENTS;

SELECT * FROM DEPT;
------------------------------
--INSERT ALL
--두 개 이상의 테이블에INSERT ALL을 이용하여 한 번에 삽입 가능
--단, 각 서브쿼리의 조건절이 같아야 함

CREATE TABLE EMP01
AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE 1 = 0;

CREATE TABLE EMP_MANAGER
AS 
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE 1 = 0;

SELECT * FROM EPM01;

--EMP01 테이블에 EMPLOYEES 테이블에서 부서코드가 30인 직원의 사번, 이름, 소속부서, 입사일을 삽입하고
--EMP_MANAGER테이블에 EMPLOYEES 테이블의 부서코드가 30인 직원의 사번, 이름, 관리자 사번을 조회하여 삽입

INSERT ALL

INTO EMP01
VALUES(EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE)

INTO EMP_MANAGER
VALUES(EMPLOYEE_ID, FIRST_NAME, MANAGER_ID)

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID, HIRE_DATE, MANAGER_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

SELECT * FROM EMP01;
SELECT * FROM EMP_MANAGER;

-- EMPLOYEES 테이블의 구조를 복사하여 사번, 이름, 입사일, 급여를 저장할 수 있는 테이블 EMP_OLD와 EMP_NEW 생성
CREATE TABLE EMP_OLD
AS
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE 1 = 0;

CREATE TABLE EMP_NEW
AS
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES
WHERE 1 = 0;

-- EMPLOYEES 테이블의 입사일 기준으로
-- 2006년 1월 1일 전에 입사한 사원의 사번, 이름, 입사일, 급여를 조회해서 EMP_OLD 테이블에 삽입하고
--               후에 입사한 사원의 정보는 EMP_NEW 테이블에 삽입하고자 한다.
INSERT ALL
WHEN HIRE_DATE < '2006/01/01' THEN -- 오라클에서는 WHEN ~ THEN이 조건식임
    INTO EMP_OLD
    VALUES(EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE >= '2006/01/01' THEN
    INTO EMP_NEW
    VALUES(EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY)

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM EMPLOYEES;

SELECT * FROM EMP_OLD; 
SELECT * FROM EMP_NEW;

CREATE TABLE EMP
AS
SELECT * FROM EMPLOYEES;

SELECT * FROM EMP;

UPDATE EMP
SET DEPARTMENT_ID = 30;

SELECT * FROM EMP;

UPDATE EMP
SET SALARY = SALARY * 1.1;

SELECT * FROM EMP;

UPDATE EMP SET HIRE_DATE = SYSDATE;

SELECT * FROM EMP;

SELECT * FROM EMP01;

DROP TABLE EMP;
CREATE TABLE EMP 
AS
SELECT * FROM EMPLOYEES;

SELECT * FROM EMP;

UPDATE EMP
SET DEPARTMENT_ID = 30
WHERE DEPARTMENT_ID = 10;

SELECT * FROM EMP;

UPDATE EMP
SET SALARY = SALARY * 1.1
WHERE SALARY >= 3000;

SELECT * FROM EMP;

-- 2007년에 입사한 사원을 오늘날짜로 변경하는 작업을 진행해 봅시다.
SELECT * FROM EMP WHERE HIRE_DATE BETWEEN '07/01/01' AND '07/12/31';
SELECT * FROM EMP WHERE SUBSTR (HIRE_DATE, 1, 2) = '07';

UPDATE EMP
SET HIRE_DATE = SYSDATE --SYSDATE(현재날짜 및 시간)로 수정
WHERE SUBSTR(HIRE_DATE,1,2) = '07'; 
--SUBSTR 문자 다룰 때 쓰는 함수, 1 첫번 째 자리부터 2 두개를 가지고 와라. (입사 "년도")
-- 년/ 월 / 일을 가지는 함수이므로 "2007" 이렇게 하면 오류남. 따라서 07을 가져오기 위해 사용. (between 써도 됨)
--이건 함수써서 값을 자른것이기 때문에, 범위값으로 변경하는게 더 좋음(속도 향상 등). 
UPDATE EMP
SET HIRE_DATE + SYSDATE
WHERE HIRE_DATE BETWEEN '07/01/01' AND '07/12/31';

SELECT TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS HIRE_DATE FROM EMP;

SELECT * FROM EMP WHERE SUBSTR (HIRE_DATE, 1, 2) = '22';

SELECT * FROM EMP;

SELECT * FROM EMP WHERE FIRST_NAME = 'Susan';

UPDATE EMP
SET DEPARTMENT_ID=20, JOB_ID='FI_MGR'
WHERE FIRST_NAME = 'Susan';

SELECT * FROM EMP;

SELECT * FROM EMP WHERE LAST_NAME = 'Russell';

UPDATE EMP
SET SALARY = 17000, COMMISSION_PCT = 0.45
WHERE LAST_NAME = 'Russell';

SELECT * FROM EMP WHERE LAST_NAME = 'Russell';

--<문제> TB_CUSTOMER 테이블에서 박승대 고객의 생년월일을 
--19711230인데 잘못입력하여 19711430을 입력하였다. 생년월일을 수정해주세요.

SELECT * FROM TB_CUSTOMER WHERE BIRTH_DAY = 19711430;

UPDATE TB_CUSTOMER
SET BIRTH_DAY = 19711230
WHERE BIRTH_DAY = 19711430;

SELECT * FROM TB_CUSTOMER WHERE BIRTH_DAY = 19711230;

-- UPDATE TB_CUSTOMER SET BIRTH_DAY = '19771230'
-- WHERE CUSTOMER_CD = 2017103;
-- SELECT * FROM TB_CUSTOMER WHERE BIRTH_DAY = 19711230;

DELETE FROM DEPT;

SELECT * FROM DEPT;

DELETE FROM DEPT WHERE DEPTNO = 30;

SELECT * FROM DEPT;

--실습을 위해 테이블을 만들어보자.
CREATE TABLE TB_ADD_CUSTOMER (
    CUSTOMER_CD     CHAR(7)         NOT NULL PRIMARY KEY,   --고객코드
    CUSTOMER_NM     VARCHAR2(10)    NOT NULL,               --고객명
    MW_FLG          CHAR(1)         NOT NULL,               --성별 구분
    BIRTH_DAY       CHAR(8)         NOT NULL,               --생일
    PHONE_NUMBER    VARCHAR2(16)                            --전화번호
);

INSERT INTO TB_ADD_CUSTOMER(customer_cd, customer_nm, mw_flg, birth_day, phone_number)
VALUES('2017108', '박승대', 'M', '19711230', '010-2580-9919');

INSERT INTO TB_ADD_CUSTOMER(customer_cd, customer_nm, mw_flg, birth_day, phone_number)
VALUES('2019302', '전미래', 'W', '19740812', '010-8864-0232');

SELECT * FROM TB_ADD_CUSTOMER;

--TB_ADD_CUSTOMER 테이블의 내용을 TB_CUSTOMER 테이블과 비교하여 데이터가 있을 경우 업데이트하고
--데이터가 없을 경우 입력되도록 쿼리문을 작성한다.

MERGE INTO TB_CUSTOMER CU
    USING TB_ADD_CUSTOMER NC
    ON  (CU.CUSTOMER_CD = NC.CUSTOMER_CD)
    WHEN MATCHED THEN
        UPDATE SET CU.CUSTOMER_NM = NC.CUSTOMER_NM,
                  CU.MW_FLG = NC.MW_FLG,
                  CU.BIRTH_DAY = NC.BIRTH_DAY,
                  CU.PHONE_NUMBER = NC.PHONE_NUMBER
    WHEN NOT MATCHED THEN
        INSERT (CU.CUSTOMER_CD, CU.CUSTOMER_NM, CU.MW_FLG, CU.BIRTH_DAY,
                CU.PHONE_NUMBER, CU.EMAIL, CU.TOTAL_POINT, CU.REG_DTTM)
        VALUES (NC.CUSTOMER_CD, NC.CUSTOMER_NM, NC.MW_FLG, NC.BIRTH_DAY,
                NC.PHONE_NUMBER, '', 0, TO_CHAR(SYSDATE, 'YYYYMMDDHHMISS'));
                
SELECT * FROM TB_CUSTOMER;
------------------------------------------------------
-- 카페 테이블 3개 만들기 예제
CREATE TABLE MEMBER(
    ID              NUMBER (20)     NOT NULL PRIMARY KEY,   -- 회원ID
    NAME            VARCHAR2 (20)   NOT NULL,               -- 이름
    REGNO           CHAR (8)        NOT NULL,               -- 생년월일
    HP              VARCHAR2 (13)   NOT NULL,               -- 핸드폰번호
    ADDRESS         VARCHAR2 (100)  NOT NULL                -- 주소
);

DESC MEMBER;

SELECT * FROM MEMBER;
----------------------------------------------------
CREATE TABLE BOOK(
    CODE            NUMBER (4)      NOT NULL PRIMARY KEY,   -- 제품코드
    TITLE           VARCHAR2 (100)  NOT NULL,               -- 도서명
    COUNT           NUMBER (6)      NOT NULL,               -- 수량
    PRICE           NUMBER (10)     NOT NULL,               -- 정가
    PUBLISH         VARCHAR2 (50)   NOT NULL                -- 출판사
);

DESC BOOK;

SELECT * FROM BOOK;
----------------------------------------------------
CREATE TABLE BOOK_ORDER(
    NO              VARCHAR2 (10)   NOT NULL PRIMARY KEY,   -- 주문번호
    ID              VARCHAR2 (20)   NOT NULL,               -- 회원ID
    CODE            NUMBER (4)      NOT NULL,               -- 제품코드
    COUNT           NUMBER (6)      NOT NULL,               -- 주문권수
    OR_DATE         DATE ()         NOT NULL                -- 주문일자
);

DESC BOOK_ORDER;

SELECT * FROM BOOK_ORDER;
--------------------------------------------------

DROP TABLE EMP01 PURGE; -- 복원 필요없이 삭제

CREATE TABLE EMP01 (
    EMPNO NUMBER (4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2 (9),
    DEPTNO NUMBER (4)
);

INSERT INTO EMP01
VALUES (NULL, NULL, 'SALESMAN', 30);

SELECT * FROM EMP01;

CREATE TABLE EMP02 (
    EMPNO NUMBER(4) UNIQUE,--NULL까지 제한하려면 EMPNO NUMBER(4) NOT NULL UNIQUE
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(4)
);

INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES (7499, 'ALLEN', 'SALESMAN', 30);

INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES (NULL, 'JONES', 'MANAGER', 20); 
--NULL은 값(VALUE)에서 제외되므로 유일한 조건인지를 체크하는 값에서 제외된다. 정상실행
INSERT INTO EMP02(EMPNO, ENAME, JOB, DEPTNO)
VALUES (NULL, 'JONES', 'SALESMAN', 10);

SELECT TABLE_NAME FROM USER_TABLES
ORDER BY TABLE_NAME DESC;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP02';

SELECT OWNER, CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'EMP02';

DROP TABLE EMP03;

CREATE TABLE EMP03 (
    EMPNO NUMBER (4)    PRIMARY KEY,--primary key는 무조건 not null이며 테이블 당 1개만 존재.
    ENAME VARCHAR2(10)  NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER (4)
);

INSERT INTO EMP03
VALUES (7499, 'ALLEN', 'SALESMAN', 30);

INSERT INTO EMP03
VALUES (NULL, 'JONES', 'MANAGER', 20);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP03';

CREATE TABLE DEPT01 (
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(14) NOT NULL,
    LOC VARCHAR2 (13)
);

Insert into DEPT01 (DEPTNO, DNAME, LOC) values (10, 'ACCOUNTING', 'NEW YORK');
Insert into DEPT01 (DEPTNO, DNAME, LOC) values (20, 'RESEARCH', 'DALLAS');
Insert into DEPT01 (DEPTNO, DNAME, LOC) values (30, 'SALES', 'CHICAGO');
Insert into DEPT01 (DEPTNO, DNAME, LOC) values (40, 'OPERATIONS', 'BOSTON');

SELECT * FROM DEPT01;

INSERT INTO EMP03
VALUES (7566, 'JONES', 'MANAGER', 50);

SELECT * FROM EMP03;

--사원테이블(참조하는 자식테이블)
CREATE TABLE EMP04 (
    EMPNO NUMBER (4) PRIMARY KEY,                   --사원번호
    ENAME VARCHAR2 (10) NOT NULL,                   --사원명
    JOB VARCHAR2 (9),                               --직무
    DEPTNO NUMBER (2) REFERENCES DEPT01(DEPTNO)     --부서번호
);

INSERT INTO EMP04
VALUES (7499, 'ALLEN', 'SALESMAN', 30);

--ORA-02291: 무결성 제약조건(HR.SYS_C008391)이 위배되었습니다- 부모 키가 없습니다
INSERT INTO EMP04
VALUES (7566, 'JONES', 'MANAGER', 50);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP04';

CREATE TABLE EMP05 (
    EMPNO NUMBER (4) PRIMARY KEY,
    ENAME VARCHAR2 (10) NOT NULL,
    GENDER VARCHAR2 (1) CHECK (GENDER IN('M', 'F')),
    REGDATE DATE DEFAULT SYSDATE
);

--* NOT NULL, CHECK, DEFAULT 변경은
-- ALTER TABLE 테이블 MODIFY(컬럼명 자료형 제약조건)으로

INSERT INTO EMP05 (EMPNO, ENAME, GENDER)
VALUES (7566, 'JONES', 'M');

INSERT INTO EMP05
VALUES (7566, 'JONES', 'M', SYSDATE);

SELECT * FROM EMP05;

INSERT INTO EMP05 (EMPNO, ENAME, GENDER)
VALUES (7566, 'JONES', 'A');

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP05';