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



--20231208
-----------------------------------------------------------------------------------------------------------------------------------
-- 컬럼 레밸 형식 제약조건
create table emp06 (
    empno number(4) constraint emp06_empno_pk primary key,
    ename varchar2(10) constraint emp06_ename_nn not null,
    job varchar2(9) constraint emp06_job_uk unique,
    deptno number(2) constraint emp06_deptno_fk references dept01(deptno)
);
desc emp06;
select constraint_name constraint_type, table_name, r_constraint_name from user_constraints where table_name = 'EMP06';


insert into emp06
values(7499, 'aleen', 'salesman', 30);
select * from emp06;

--ORA-00001: 무결성 제약 조건(HR.EMP06_EMPNO_PK)에 위배됩니다
Insert into emp06 values(7499, 'allen', 'salesman', 30);

--ORA-01400: NULL을 ("HR"."EMP06"."ENAME") 안에 삽입할 수 없습니다
insert into emp06 values(7499, NULL, 'salesman', 50);

--ORA-00001: 무결성 제약 조건(HR.EMP06_EMPNO_PK)에 위배됩니다
insert into emp06 values(7499, 'allen', 'salesman', 50);

--ORA-00001: 무결성 제약 조건(HR.EMP06_JOB_UK)에 위배됩니다
insert into emp06 values(7500, 'allen', 'salesman', 50);

--ORA-02291: 무결성 제약조건(HR.EMP06_DEPTNO_FK)이 위배되었습니다- 부모 키가 없습니다
insert into emp06 values(7500, 'ellen',  ' manager', 50);

create table emp08(
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2),
    constraint emp08_empno_pk primary key(empno),
    constraint emp08_job_uk unique(job),
    constraint emp08_emptno_fk foreign key(deptno) references dept01(depno);
);

create table emp09 (
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    deptno number(2)
);
select constraint_name, constraint_type, table_name, r_constraint_name from user_constraints where table_name='EMP09';

-- 제약조건명을 명시하지 않고 기본키 추가
alter table emp09
add primary key(empno);

-- 제약조건명을 명시하고 외래키 추가
alter table emp09
add constraint emp09_deptno_fk foreign key(deptno) references dept01(deptno);

-- ENAME 컬럼에 NOT NULL 제약 조건 변경(null, check default는 제야조건이 이미 있기 때문에 modify로 변경해야한다.)
alter table emp09
modify (ename varchar2(10)) not null;

alter table emp09
add constraint emp09_empno_pk primary key(empno);

alter table emp09
add constraint emp09_empno_fk foreign key(deptno) references dept01(deptno);

select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints
where table_name = 'dept01';

-- HR 사용자로 생성한 DEPT01 테이블과 참조키(외래키) 설정 테이블 확인
select fk.owner, fk.constraint_name, fk.table_name
from all_constraints fk, all_constraints pk
where fk.r_constraint_name = pk.constraint_name
    and pk.owner = 'HR'
    and fk.constraint_type = 'R'
    and pk.table_name = 'DEPT01'
    order by fk.table_name;

select * from emp06;
select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints
where table_name = 'EMP06';
-- 제약조건 삭제
-- alter table 테이블명
-- drop constraint 제약조건명;
alter table emp06
drop constraint emp06_job_uk;

alter table emp06
drop constraint emp06_deptno_fk;

alter table emp06
drop primary key;

create table dept02(
    deptno number(2),
    dname varchar2(14) not null,
    loc varchar2(13),
    constraint dept02_deptno_pk primary key(deptno)
);

select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints
where table_name = 'DEPT02';

insert into dept02 values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept02 values(20, 'RESEARCH', 'DALLAS');
select * from dept02;

DROP TABLE EMP02;

create table emp02(
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2),
    constraint emp02_empno_pk primary key(empno),
    constraint emp02_empno_fk foreign key(deptno) references dept02(deptno)
);

select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints where table_name = 'EMP02';

insert into emp02 values(7499, 'ALLEN', 'SALESMAN', 10);
insert into emp02 values(7369, 'SMITH', 'CLERK', 20);
select * from emp02;
select * from dept02;
delete from dept02 where deptno = 10;

update emp02
set deptno = 20
where empno = 7499;

-- 사원 테이블에 부서번호가 10인 사원을 먼저 삭제하고
delete from emp02 where deptno =10;

create table treatment(
    t_no number(4) not null,
    t_course_abbr varchar2(3) not null,
    t_course varchar2(30) not null,
    t_tel varchar2(15) not null,
    constraint treatment_no_pk primary key(t_no),
    constraint treatment_course_abbr_uk unique(t_course_abbr)
);

-- 테이블의 컬럼에 주석을 다는 구문
-- 표현식
-- comment on column 테이블명.컬럼명 IS '주석 내용';
comment on column treatment.t_no is '진료번호';
comment on column treatment.t_course_abbr is '진료과목약어';
comment on column treatment.t_course is '진료과목';
comment on column treatment.t_tel is '전화번호';
select table_name, column_name, comments
from all_col_comments
where table_name = 'TREATMENT';

insert into treatment values(1001, 'NS', '신경외과', '02-3252-1009');
insert into treatment values(1002, 'OS', '정형외과', '02-3252-2009');
insert into treatment values(1003, 'C', '순환기내과', '02-3252-3009');
select * From treatment;

create table doctor(
    d_no number(4) not null,
    d_name varchar2(20) not null,
    d_ssn char(14) not null,
    d_email varchar2(80) not null,
    d_major varchar(50) not null,
    t_no number(4) ,
    constraint doctor_d_no_pk primary key(d_no)
);

alter table doctor
add constraint doctor_t_no foreign key(t_no) references treatment(t_no)
on delete cascade;

insert into doctor values(1, '홍길동', '660606-1234561', 'javauser@naver.com', '척추신경외과', 1001);
insert into doctor values(2, '이재환', '690724-1674536' 'asdf@naver.com', '뇌졸증, 뇌혈관외과' 1003);
insert into doctor values(3, '양익환', '761212-1958354', 'qwer@naver.com', '인공관절, 관절염', 1002);
insert into doctor values(4, '김승현', '957381-1285746', 'zxv@naver.com', '종양외과, 외상전문', 1002);

delete from treatment where t_no = 1002;

select * from treatment;
select * from doctor;

rollback;
alter table doctor
drop constraint doctor_t_no;

alter table doctor
add constraint doctor_t_no foreign key(t_no) references treatment(t_no)
on delete set null;

delete from treatment where t_no = 1002;

select * from treatment;
select * from doctor;

-- 만약 T_NO 컬러이 NOT NULL 로 설정되어 있다면 NULL을 허용하는 컬럼으로 변경
alter table doctor
modify (t_no number(4) null);

select * from employees, departments;


-- 조인 ( Join )
-----------------------------------------------------------------------------------------------------------------------------------
select employee_id, first_name, department_id from employees;
select department_id, department_name from departments;

select first_name, department_name from employees, departments
where employees.department_id = departments.department_id;

-- 조인시 공통컬럼을 조회하고 할때는 반드시 테이블명.컬럼 또는 테이블 별칭.컬럼으로 명시
-- ORA-009128 : 열의 정의가 애매합니다. 조인대상의 테이블의 공통 컬럼은 select 시 컬럼을 지정해야한다.
select first_name, department_name, department_id
from employees, departments
where employees.department_id = departments.department_id;

select first_name, department_name, employees.department_id
from employees, departments
where employees.department_id = departments.department_id;

-- 테이블명을 간단한 별칭으로 접근가능
select first_name, department_name, e.department_id
from employees e, departments d
where e.department_id = d.department_id;

select e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.first_name = 'Susan';

select * from jobs;
-- 사원 테이블(EMPLOYEES) 과 직무 (JOBS) => 공통컬럼 : JOB_ID
-- 사원 테이블(EMPLOYEES) 과 부서 (DEPARTMENTS) => 공통컬럼 : DEPARTMENT_ID
-- 사원명, 직무ID, 직무명(JOB_TITLE), 부서번호, 부서명을 출력
select first_name, e.job_id, job_title, e.department_id, department_name
from employees e, jobs j, departments d
where e.job_id = j.job_id and e.department_id = d.department_id;

create table salarygrade  (
    grade number,
    minsalary number,
    maxsalary number
);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(1, 2000, 3000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(2, 3001, 4500);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(3, 4501, 6000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(4, 6001, 8000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(5, 8001, 10000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(6, 10001, 13000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(7, 13001, 20000);
INSERT INTO SALARYGRADE (GRADE, MINSALARY, MAXSALARY) VALUES(8, 20001, 30000);
select * from salarygrade;

commit;

select * from salarygrade;
select e.first_name, e.salary, s.grade
from employees e, salarygrade s
where e.salary between s.minsalary and s.maxsalary;
--order by grade desc;

select e.first_name, e.salary, s.grade
from employees e, salarygrade s
where e.salary >= s.minsalary and e.salary <= s.maxsalary;

select e.first_name, d.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id
order by d.department_id desc;



select * from departments;

-- Outer Join
-- 부서테이블으 ㅣ부서번호는 전부 출력하고 사원테이블에 테이터는 조건에 일치하는 데이터만 출력할 때
-- Outer Join을 사용
select e.first_name, d.department_id, department_name
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.first_name, d.department_id, department_name
from employees e, departments d
where d.department_id = e.department_id(+) order by department_id desc;

-- 2007년도 상반기에 입사한 사원의 사원번호, 이름, 입사일, 부서번호를 구해보자.
-- (결과 행의 수 : 12)
select employee_id, first_name, hire_date, department_id
from employees
--where hire_date >= '2007/01/01' and hire_date <= '2007/06/30';
where hire_date between '2007/01/01' and '2007/06/30';

-- 2007년도 상반기에 입사한 사원의 사원번호, 이름, 입사일, 부서명을 출력.
-- (결과 행의 수 : 11)
select employee_id, first_name, hire_date, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+) and hire_date between '2007/0101' and '2007/06/30';

-- SELFT JOIN

-- 사원명과 사원의 매니저(상사) 이름을 출력하기 위한 쿼리만
select  work.first_name 사원명, manager.first_name 매니저명
from employees work, employees manager
where work.manager_id = manager.employee_id;

-- 사원 테이블 (사원번호, 사원명, 관리자번호)
select employee_id, first_name, manager_id
from employees;

-- 관리자 테이블(관리자번호가 사원번호이므로 관리자사원번호, 관리자명)
select employee_id, first_name
from employees order by employee_id;


select rpad(work.first_name, 11, ' ') || '의 매니저는 ' || manager.first_name || '이다.' AS "그 사원의 매니저"
from employees work, employees manager
where work.manager_id = manager.employee_id;

select concat (concat(concat(rpad(work.first_name, 11, ' '), '의 매니저는 '), manager.first_name), '이다.')
as "그 사원의 매니저"
from employees work, employees manager
where work.manager_id = manager.employee_id;


-- INNER JOIN
select first_name, department_name
from employees inner join departments
on employees.department_id = departments.department_id;

-- JOIN만 작성 시 기본값은 INNER JOIN
select first_name, department_name
from employees join departments
on employees.department_id = departments.department_id;

-- 사원 테이블(EMPLOYEES) 과 직무 테이블 (JOBS) => 공통컬럼 : JOB_ID
-- 사원 테이블(EMPLOYEES) 과 부서 테이블 (DEPARTMENTS) => 공통컬럼 : DEPARTMENT_ID
-- 사원명, 직무ID, 직무명(JOB_TITLE), 부서번호, 부서명을 출력
select first_name, e.job_id, job_title, d.department_id, department_name
from employees e inner join jobs j on e.job_id = j.job_id
                          inner join departments d on e.department_id = d.department_id;

-- 연결에 사용하려는 컬럼 명이 같은 경우 USING() 사용, 다른 경우 ON() 사용
select employees.first_name, departments.department_name
from employees inner join departments
using (department_id);

-- 조인의 조건과 데이터 검색을 위한 조건 부여
select first_name, department_name
from employees inner join departments
on employees.department_id = departments.department_id
where first_name = 'Susan';

-- OUTER JOIN
select e.first_name, d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

select e.first_name, d.department_id, d.department_name
from departments d left outer join employees e
on e.department_id = d.department_id;

--2007년 상반기에 입력한 사원번호, 사원명, 입사일, 부서명을 출력
select employee_id, first_name, hire_date, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
where hire_date between '2007/01/01' and '2007/06/30';








































