-- 쿼리문 주석

-- 현재 계정이 소유하고 있는 모든 테이블 조회
SELECT
    *
FROM
    tab;

-- 부서테이블의 모든 데이터 조회
SELECT
    *
FROM
    departments;

-- 사원테이블 모든 데이터 조회
SELECT
    *
FROM
    employees;

-- employees 테이블 구조 확인
DESC EMPLOYEES;

-- DEPARTMENTS 테이블에서 부서번호와 부서명만 출력
SELECT
    department_id,
    department_name
FROM
    departments;

-- <문제>사원의 이름과 급여와 입사일자 만을 출력하는 SQL문 작성
-- 사원 정보가 저장된 테이블은 EMPLOYEES, 사원이름 컬럼은 FIRST_NAME, LAST_NAME과, 급여컬럼은 SALARY, 입사일자 컬럼은 HIRE_DATE
SELECT
    first_name,
    last_name,
    salary,
    hire_date
FROM
    employees;

-- 컬럼에 이름에 AS로 별칭 지정
-- DEPARTMENT_ID 컬럼을 DepartmentNo로  DEPARTMENT_NAME 컬럼을 DepartmentName으로 별칭
SELECT
    department_id   AS departmentno,
    department_name AS departmentname
FROM
    departments;

-- AS 없이 컬럼에 별칭 부여
SELECT
    department_id   "Department No",
    department_name "Department Name"
FROM
    departments;

-- 별칭으로 한글 사용이 가능
SELECT
    department_id   부서번호,
    department_name 부서명
FROM
    departments;    
    
-- Concatenation 연산자의 정의와 사용(연결 연산자)
SELECT
    first_name
    || '의 직급은 '
    || job_id
    || '입니다' AS 직급
FROM
    employees;

SELECT
    first_name
    || ' '
    || last_name 이름,
    salary       급여,
    hire_date    입사일
FROM
    employees;
    
-- EMPLOYEES 테이블에서 칼럼 JOB_ID를 표시하되 중복된 값은 한번만 표시
SELECT DISTINCT
    job_id
FROM
    employees;
    
-- <문제>직원들이 어떤 부서에 소속되어 있는지 소속 부서번호(DEPARTMENT_ID) 출력하되 중복되지 않고 한번식 출력하는 쿼리
SELECT DISTINCT
    department_id
FROM
    employees;

-- 급여를 10000 이상 받는 지원을 대상
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary >= 10000;
    
-- 급여를 3000미만 받는 직원을 대상
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary < 3000;
    
-- EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력
SELECT
    *
FROM
    employees
WHERE
    department_id = 110;

-- EMPLOYEES 테이블에서 급여가 5000미만이 되는 직원의 정보 중에서 사번, 이름, 급여 출력
SELECT
    department_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary < 5000;
    
-- 사원에 급여를 1000인상하여 사원번호, 사원명, 급여, 인상급여, 입사일을 출력
SELECT
    department_id 사원번호,
    first_name    사원명,
    salary        급여,
    salary + 1000 AS 인상급여,
    hire_date
FROM
    employees;
    
-- 문자 데이터 조회
-- 이름 (FISRT_NAME)이 'Lex'인 직원
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    first_name = 'Lex';
    
-- 이름이 John인 사람의 사원번호와 사원명과 업무ID를 출력하라
SELECT
    department_id 사원번호,
    job_id        업무id
FROM
    employees
WHERE
    first_name = 'John'; -- 값은 대소문자 구분한다 'john' 으로 select 할 경우 데이터 없음
    
-- 날짜 데이터 조회
-- 2008년 이후에 입사한 직원
SELECT
    first_name,
    hire_date
FROM
    employees
WHERE
--    hire_date >= '2008'; -- 에러 발생
--    hire_date >= '2008-01-01';
    hire_date >= '2008/01/01';

-- 논리연산자
-- 급여가 5000에서 10000이하 직원 정보 출력
SELECT
    employee_id,
    first_name,
    phone_number,
    department_id,
    job_id
FROM
    employees
WHERE
        salary >= 5000
    AND salary <= 10000;
    
-- 부서번호가 100번이거나 직급이 FI_MGR인 직원
SELECT
    employee_id,
    first_name,
    phone_number,
    department_id,
    job_id
FROM
    employees
WHERE
    department_id = 100
    OR job_id = 'FI_MGR';
    
-- <문제> 업무 ID가 FI_MGR가 아닌 직원
SELECT
    employee_id,
    first_name,
    department_id,
    job_id
FROM
    employees
WHERE
    NOT job_id = 'FI_MGR';

SELECT
    employee_id,
    first_name,
    department_id,
    job_id
FROM
    employees
WHERE
    job_id <> 'FI_MGR';

-- 사원번호가 134 이거나 201이거나 107인 직원 정보 출력
SELECT
    employee_id,
    first_name,
    department_id,
    job_id
FROM
    employees
WHERE
    employee_id = 134
    OR employee_id = 201
    OR employee_id = 107;
    
-- 부서번호가 100번이 아닌 직원
SELECT
    employee_id,
    first_name,
    phone_number,
    department_id,
    job_id
FROM
    employees
WHERE
    NOT department_id = 100;
    
-- 급여가 1000에서부터 3000까지의 범위 속한 직원
SELECT
    employee_id,
    first_name,
    email,
    salary
FROM
    employees
WHERE
    salary BETWEEN 1000 AND 3000; 
    
-- <문제> 급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력
-- ( AND 연산자와 BETWEEN AND 연산자 사용 )
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    salary BETWEEN 2500 AND 4500;

SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
        salary >= 2500
    AND salary <= 4500;

-- IN 연산자
-- 직원번호가 177이거나 101이거나 184인 사원
SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    employee_id = 177
    OR employee_id = 101
    OR employee_id = 184;

SELECT
    employee_id,
    first_name,
    salary
FROM
    employees
WHERE
    employee_id IN ( 177, 101, 184 );
    
-- <문제> 부서번호가 10, 20, 30 중 하나에 소속된 직원의 직원번호, 이름, 급여를 출력
-- (OR 연산자, IN 연산자 사용
SELECT
    employee_id 직원번호,
    first_name  이름,
    salary      급여
FROM
    employees
WHERE
    department_id = 10
    OR department_id = 20
    OR department_id = 30;

SELECT
    employee_id 직원번호,
    first_name  이름,
    salary      급여
--    ,department_id -- 검증용
FROM
    employees
WHERE
    department_id IN ( 10, 20, 30 );
    
-- <문제> 사원테이블에서 JOB_ID가 'SA_MAN', 'ST_MAN', 'PU_MAN', 'AC_MGR'인
-- 사원번호, 사원명, 직무번호를 출력하라
SELECT
    employee_id 직원번호,
    first_name  이름,
    job_id      급여
FROM
    employees
WHERE
    job_id IN ( 'SA_MAN', 'ST_MAN', 'PU_MAN' );

-- K로 시작하는 사원
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    first_name LIKE 'K%';
    
-- 이름 중에 k를 포함하는 사원
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    lower(first_name) LIKE '%k%';

-- 이름이 k로 끝나는 사원
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    first_name LIKE '%k';

-- 이름의 두 번째 글자가 d인 사원
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    first_name LIKE '_d%';

-- 핸드폰번호에서 5번째 1인 레코드 조회
SELECT
    phone_number
FROM
    employees
WHERE
    phone_number LIKE '____1%';
    
-- ESCAPE(' \ ', '@')
-- LIKE 연산으로 '%' 나 '_' 가 포함된 문자를 검색하고자 할때 사용된다.
--  '%' 나 '_' 앞에 ESCAPE로 특수문자를 지정하면 검색할 수 있다.
-- 특수문자는 아무거나 상관없이 사용 가능하다.
-- 구문 마지막 EXCAPE에 사용할 문자열만 지정해주면 '_' 나 '%' 를 검색에 사용할 수 있게 도와준다.

-- 사원테이블(EMPLOYEES)에서 직무ID에 3번째 _를 포함하고 4번째 자리의 값이 P인 레코드를 조회
SELECT
    *
FROM
    employees
WHERE
    job_id LIKE '__\_P%' ESCAPE '\';

SELECT
    *
FROM
    employees
WHERE
    job_id LIKE '__@_P%' ESCAPE '@';
    
-- 이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력
SELECT
    employee_id,
    first_name
FROM
    employees
WHERE
    lower(first_name) NOT LIKE '%a%';
    
-- 커미션을 받지 않는 사원
SELECT
    employee_id,
    first_name,
    commission_pct,
    job_id
FROM
    employees
WHERE
--    comission_pct = NULL; -- 데이터 못찾음
    commission_pct IS NULL;

-- 커미션을 받는 사원
SELECT
    employee_id,
    first_name,
    commission_pct,
    job_id
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
    
-- <문제> 자신의 직속상관이 없는 직원의 전체 이름과 직원번호, 업무ID를 출려가하라
-- SELECT * FROM EMPLOYEES;
SELECT
    first_name
    || ' '
    || last_name 전체이름,
    employee_id  직원번호,
    job_id       업무id
FROM
    employees
WHERE
    manager_id IS NULL;
    
-- <문제> 커미션을 받는 사원만 출력하되 사원번호, 이름, 급여, 수당율, 수당금액(계산식 - 급여 * 수당율)을 출력하라.
SELECT
    employee_id,
    first_name,
    salary,
    commission_pct,
    salary * commission_pct commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- <예>사번을 기준으로 오름차순으로 정렬
SELECT
    employee_id,
    first_name
FROM
    employees
ORDER BY
--    employee_id -- ORDER BY 의 default 값은 ASC
    employee_id ASC;

SELECT
    employee_id,
    first_name
FROM
    employees
ORDER BY
    employee_id DESC;
    
-- 자바 인덱스 : 0 ~
-- 오라클의 인뎃스 번호 : 1 ~ 

SELECT
    employee_id,
    first_name
FROM
    employees
ORDER BY
-- ORDER BY 컬럼명 ( 또는 순번)
    1 DESC;

-- NULL를 포함한 컬럼처리
-- ASC : NULL 레코드를 제일 마지막 출력
-- DESC : NULL 레코드를 제일 먼저 출력 
SELECT
    employee_id,
    first_name,
    department_id
FROM
    employees
ORDER BY
    department_id DESC;
    
-- <문제> 직원번호, 이름, 급여, 부서번호를 급여가 높은 순으로 출력하라.
-- 같은 급여일 경우 직원번호 내림차순으로 출력
SELECT
    employee_id,
    first_name,
    salary,
    department_id
FROM
    employees
ORDER BY
--    salary DESC, employee_id DESC;
    3 DESC,
    1 DESC;
    
-- <문제> 입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라
SELECT
    employee_id,
    first_name,
    hire_date
FROM
    employees
ORDER BY
    hire_date DESC;
    
--<문제> 부서번호가 20, 50번 부서에서 근무하는 모든 사원들의 이름(FIRST_NAME), 부서 번호, 급여를
--사원의 이름순(알파벳순)으로 출력하라.
SELECT
    first_name,
    department_id,
    salary
FROM
    employees
WHERE
--    department_id = 20 OR
--    department_id = 50
    department_id IN ( 20, 50 )
ORDER BY
    first_name;
    
--사원번호, 사원명, 급여 3개의 칼럼으로 구성된 emp01 테이블
CREATE TABLE emp01 (
    empno NUMBER(4),
    ename VARCHAR(20),
    sal   NUMBER(7, 2)
);

DESC emp01;
-- 널필드는 널 허용 여부를 저장한다.

SELECT
    *
FROM
    tab;

-- employee 테이블과 employee테이블의 모든 칼럼을 복사하여 employees02 테이블을 생성한다.
CREATE TABLE employees02
    AS
        SELECT
            *
        FROM
            employees;

DESC employees02;

-- EMP01 테이블에 문자 타입의 직금(JOB) 칼럼을 추가
ALTER TABLE emp01 ADD (
    job VARCHAR2(9)
);

DESC emp01;

--<문제>이미 존재하는 EMP01 테이블에 입사일 칼럼(CREDATE)을 날짜형으로 추가
ALTER TABLE emp01 ADD (
    credate DATE
);

DESC emp01;

--직급을 최대 30자까지 입력할 수 있도록 크기 수정
ALTER TABLE emp01 MODIFY (
    job VARCHAR2(30)
);

DESC emp01;

--입사일 컬럼의 이름을 CREDATE에서 REGDATE로 컬럼명 변경
ALTER TABLE emp01 RENAME COLUMN credate TO regdate;

DESC emp01;

-- 직급(JOB) 칼럼을 삭제
ALTER TABLE emp01 DROP COLUMN job;

DESC emp01;

--emp01 테이블 삭제
DROP TABLE emp01;

desc emp01;

--drop한 emp01 테이블을 emp02 이름으로 복원한다.
FLASHBACK TABLE emp01 TO BEFORE DROP RENAME TO emp02;

SELECT
    *
FROM
    tab;

-- EMPLOYEES02 테이블의 이름을 EMPLOYEES01으로 변경
RENAME employees02 TO employees01;

SELECT
    *
FROM
    tab;
    
-- EMPLOYEES01 테이블의 모든 로우를 제어
SELECT
    *
FROM
    employees01;

TRUNCATE TABLE employees01; -- 자동커밋된다. ( = 복원 불가 )

CREATE TABLE tb_customer (
    customer_cd  CHAR(7 BYTE) NOT NULL PRIMARY KEY,
    customer_nm  VARCHAR2(15 CHAR) NOT NULL,
    mw_flg       CHAR(1) NOT NULL,
    birth_day    CHAR(8) NOT NULL,
    phone_number VARCHAR2(16),
    email        VARCHAR2(50),
    total_point  NUMBER(10),
    reg_dttm     CHAR(14)
);

CREATE TABLE member (
    id      NUMBER(20) NOT NULL PRIMARY KEY,
    name    VARCHAR2(20) NOT NULL,
    regno   CHAR(8) NOT NULL,
    hp      VARCHAR2(13) NOT NULL,
    address VARCHAR(100) NOT NULL
);

-- memeber 테이블에서 회원ID를 가변길이 문자형식으로 변경
ALTER TABLE member MODIFY (
    id VARCHAR2(20)
);

DESC member;

CREATE TABLE book (
    code    NUMBER(4) NOT NULL PRIMARY KEY,
    title   VARCHAR2(100) NOT NULL,
    count   NUMBER(6) NOT NULL,
    price   NUMBER(10) NOT NULL,
    publish VARCHAR2(50) NOT NULL
);

DESC book;

CREATE TABLE book_order (
    no      VARCHAR2(10) NOT NULL PRIMARY KEY,
    id      VARCHAR(20) NOT NULL,
    code    NUMBER(4) NOT NULL,
    count   NUMBER(6) NOT NULL,
    or_date DATE NOT NULL
);

CREATE TABLE dept (
    deptno NUMBER(2),
    dname  VARCHAR2(14),
    loc    VARCHAR2(13)
);

INSERT INTO dept (
    deptno,
    dname,
    loc
) VALUES (
    10,
    'ACCOUNTING',
    'NEW YORK'
);

INSERT INTO dept VALUES (
    20,
    'RESEARCH',
    'DALLAS'
);

ALTER TABLE dept MODIFY (
    deptno NOT NULL
);

ALTER TABLE dept MODIFY (
    dname NOT NULL
);

DESC dept;

SELECT
    *
FROM
    dept;

INSERT INTO dept (
    deptno,
    dname
) VALUES (
    30,
    'SALES'
);

INSERT INTO dept VALUES (
    40,
    'OPERATIONS',
    NULL
);

INSERT INTO dept VALUES (
    50,
    ' ',
    NULL
);

ALTER TABLE dept MODIFY (
    deptno NUMBER(4),
    dname VARCHAR2(30)
);

INSERT INTO dept
    SELECT
        department_id,
        department_name,
        location_id
    FROM
        departments;

SELECT
    *
FROM
    dept;

desc tb_customer;

-- <문제> TB_CUSTOMER 테이블에 아래 데이터를 추가하라
INSERT INTO tb_customer (
    customer_cd,
    customer_nm,
    mw_flg,
    birth_day,
    phone_number,
    email,
    total_point,
    reg_dttm
) VALUES (
    '2017042',
    '강원진',
    'M',
    '19810603',
    '010-8202-8790',
    'wjgang@navi.com',
    280300,
    '20170123132432'
);

INSERT INTO tb_customer (
    customer_cd,
    customer_nm,
    mw_flg,
    birth_day,
    phone_number,
    email,
    total_point,
    reg_dttm
) VALUES (
    '2017053',
    '나경숙',
    'W',
    '19891225',
    '010-4509-0043',
    'ksna@boram.co.kr',
    4500,
    ' 20170210180930 '
);

INSERT INTO tb_customer (
    customer_cd,
    customer_nm,
    mw_flg,
    birth_day,
    phone_number,
    email,
    total_point,
    reg_dttm
) VALUES (
    '2017108',
    '박승태',
    'm',
    '19711430',
    NULL,
    'sdpark@haso.com',
    280300,
    '20170123132432'
);

DELETE FROM tb_customer;

SELECT
    *
FROM
    tb_customer;

INSERT ALL INTO tb_customer (
    customer_cd,
    customer_nm,
    mw_flg,
    birth_day,
    phone_number,
    email,
    total_point,
    reg_dttm
) VALUES (
    '2017042',
    '강원진',
    'M',
    '19810603',
    '010-8202-8790',
    'wjgang@navi.com',
    280300,
    '20170123132'
) INTO tb_customer VALUES (
    '2017053',
    '나경숙',
    'W',
    '19891225',
    '010-4509-0043',
    'ksna@boram.co.kr',
    4500,
    ' 20170210130 '
) INTO tb_customer VALUES (
    '2017108',
    '박승태',
    'm',
    '19711430',
    NULL,
    'sdpark@haso.com',
    280300,
    '20170123132'
) SELECT
      *
  FROM
      dual;

desc dual;

SELECT
    100 + 4
FROM
    dual;

SELECT
    sysdate
FROM
    dual;

SELECT
    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') AS now
FROM
    dual;

SELECT
    *
FROM
    tb_customer;

CREATE TABLE emp01
    AS
        SELECT
            employee_id,
            first_name,
            department_id,
            hire_date
        FROM
            employees
        WHERE
            1 = 0;

DESC emp01;

CREATE TABLE emp_manager
    AS
        SELECT
            employee_id,
            first_name,
            manager_id
        FROM
            employees
        WHERE
            1 = 0;

DESC emp_manager;

-- EMP01 테이블에 EMPLOYEES 테이블에서 부서코드가 30인 직원의 사번, 이름, 소속부서, 입사일을 삽입하고
-- EMP_MANAGER 테이블에 EMPLOYEES 테이블의 부서코드가 30인 직원의 사번, 이름, 관리자 사번을 조회하여 삽입
INSERT ALL INTO emp01 VALUES (
    employee_id,
    first_name,
    department_id,
    hire_date
) INTO emp_manager VALUES (
    employee_id,
    first_name,
    manager_id
) SELECT
        employee_id,
        first_name,
        department_id,
        hire_date,
        manager_id
    FROM
        employees
  WHERE
      department_id = 30;

SELECT
    *
FROM
    emp01;

SELECT
    *
FROM
    emp_manager;

-- EMPLOYEES 테이블의 구조를 복사하여 사번, 입사일, 급여를 저장할 수 있는 테이블 EMP_OLD와 EMP_NEW 생성
CREATE TABLE emp_old
    AS
        SELECT
            employee_id,
            first_name,
            hire_date,
            salary
        FROM
            employees
        WHERE
            1 = 0;

DESC emp_old;

SELECT
    *
FROM
    emp_old;

CREATE TABLE emp_new
    AS
        SELECT
            employee_id,
            first_name,
            hire_date,
            salary
        FROM
            employees
        WHERE
            1 = 0;

DESC emp_new;

SELECT
    *
FROM
    emp_new;
-- EMPLOYEES 테이블의 입사일 기준으로
-- 2006년 1월 1일 전에 입사한 사원의 사번, 이름, 입사일, 급여를 조회해서 EMP_OLD 테이블에 삽입
--                       후에 입사한 사원의 정보는 EMP_NEW 테이블에 삽입

INSERT
    ALL WHEN hire_date < '2006/01/01' THEN
        INTO emp_old
        VALUES (
            employee_id,
            first_name,
            hire_date,
            salary
        )
        WHEN hire_date >= '2006/01/01' THEN
            INTO emp_new
            VALUES (
                employee_id,
                first_name,
                hire_date,
                salary
            )
SELECT
    employee_id,
    first_name,
    hire_date,
    salary
FROM
    employees;

SELECT
    *
FROM
    emp_old;

SELECT
    *
FROM
    emp_new;

CREATE TABLE emp
    AS
        SELECT
            *
        FROM
            employees;

UPDATE emp
SET
    department_id = 30;

UPDATE emp
SET
    salary = salary * 1.1;

UPDATE emp
SET
    hire_date = sysdate;

UPDATE emp
SET
    department_id = 30
WHERE
    department_id = 10;

-- 급여가 3000이상인 사원만 급여를 10% 인상
UPDATE emp
SET
    salary = salary * 1.3
WHERE
    salary >= 3000;
    
-- 2007년에 입사한 사원의 입사일이 오늘로 수정한다.
UPDATE emp
SET
    hire_date = sysdate
WHERE
--    substr(hire_date, 1, 2) = '07';
    hire_date BETWEEN '2007/01/01' AND '2007/12/31';

SELECT
    hire_date,
    first_name
FROM
    emp
WHERE
--    substr(hire_date, 1, 2) = '07';
    hire_date BETWEEN '2007/01/01' AND '2007/12/31';

SELECT
    hire_date,
    first_name
FROM
    emp
WHERE
    hire_date >= '2023/12/07';

SELECT
    *
FROM
    emp
WHERE
    first_name = 'Susan';

UPDATE emp
SET
    department_id = 29,
    job_id = 'FI_MGR'
WHERE
    first_name = 'Susan';

SELECT
    *
FROM
    emp
WHERE
    last_name = 'Russell';

UPDATE emp
SET
    salary = 17000,
    commission_pct = 0.45
WHERE
    last_name = 'Russell';

DELETE FROM dept;

desc dept;

DELETE FROM emp
WHERE
    last_name = 'Russell';

SELECT
    *
FROM
    emp
WHERE
    last_name = 'Russell';

-- 구조가 같은 두 개의 테이블을 하나의 테이블로 합치는 기능 제공
-- 두 테이블에서 지정하는 조건의 값이 존재하면 UPDATE되고 조건의 값이 없으면 INSERT 함
MERGE INTO tb_customer cu
USING tb_add_customer nc ON ( cu.customer_cd = nc.customer_cd )
WHEN MATCHED THEN UPDATE
SET cu.customer_nm = nc.custmer_nm,
    cu.mw_flg = nc.mw_flg,
    cu.birth_day = nc.birth_day,
    cu.phone_number = nc.phone_number
WHEN NOT MATCHED THEN
INSERT (
    cu.customer_cd,
    cu.customer_nm,
    cu.mw_flg,
    cu.birth_day,
    cu.phone_number,
    cu.email,
    cu.total_point,
    cu.reg_dttm )
VALUES
    ( nc.custmer_cd,
      nc.customer_nm,
      nc.mw_flg,
      nc.birgh_day,
      nc.phone_number,
    '',
    0,
    to_char(sysdate, 'YYYYMMDDHHMISS') );

SELECT
    *
FROM
    tb_customer;
    
select * from book;
select * from book_order;

DROP table emp01 purge;

create table emp01(
empno number(4) not null,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)        
);

create table emp02 (
    empno number(4) unique,
    ename varchar2(10) not null,
    job varchar(9),
    deptno number(4)
);
insert into emp02(empno, ename, job, deptno)
values (7499, 'allen', 'salesman', 30);

select TABLE_NAME from user_tables
order by table_name desc;

select constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'EMP02';

select owner, constraint_name, table_name, column_name from user_cons_columns where table_name = 'EMP02';

create table emp03(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(4)
);
select * from emp03;
insert into emp03 values(7499, 'allen', 'salesman', 30);
insert into emp03 values(null, 'allen', 'salesman', 30);
select constraint_name, constraint_type, table_name from user_constraints where table_name = 'EMP03';

create table dept01(
    deptno number(2) primary key,
    dname varchar2(14) not null,
    loc varchar2(13)
);
insert into dept01 (deptno, dname, loc) values (10, 'ACCOUNTING', 'NEW YORK');
insert into dept01 (deptno, dname, loc) values (20, 'RESEARCH', 'DALLAS');
insert into dept01 (deptno, dname, loc) values (30, 'SALES', 'CHICAGO');
insert into dept01 (deptno, dname, loc) values (40, 'OPERATIONS', 'BOSTON');
select * from dept01 order by deptno;
insert into emp03 values(7566, 'JONES', 'MANAGER', 50);
select * from emp03;

create table emp04(
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2) references dept01(deptno)
);

insert into emp04 values(1234, 'asfd', 'qwer', 40);

select constraint_name, constraint_type, table_name, r_constraint_name from user_constraints where table_name = 'EMP04';

create table emp05(
    empno number(4) primary key,
    ename varchar2(10) not null,
    gender char(1) check (gender in ('M', 'F')),
    regdate date default sysdate
);
insert into emp05(empno, ename, gender) values(1234, 'asdf', 'M');

select * from emp05;

select constraint_name constraint_type, table_name, search_condition from user_constraints where table_name = 'EMP05';