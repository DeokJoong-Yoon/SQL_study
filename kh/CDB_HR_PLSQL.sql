BEGIN
        DBMS_OUTPUT.PUT_LINE('Hello World!');
END;
/

DESC employees;

declare
        vemployee_id number(6);
        vfirst_name varchar2(20);
begin
        vemployee_id := 105;
        vfirst_name := 'David';

        dbms_output.put_line('사번 / 이름');
        dbms_output.put_line('-------------------------');
        dbms_output.put_line(vemployee_id || ' / ' || vfirst_name);
end;
/

declare
        -- %TYPE 속성으로 컬럼 단위로 데이터를 저장할 수 있는 레버런스 변수 선어
        vemployee_id employees.employee_id%type;
        vfirst_name employees.first_name%type;
begin
        dbms_output.put_line('사번 / 이름');
        dbms_output.put_line('----------------');
        -- select 문을 수행한 결과 값이 into 뒤에 기술한 변수에 저장
        select employee_id, first_name into vemployee_id, vfirst_name
        from employees
        where first_name = 'Susan';
        
        -- 레퍼런스 변수에 저장된 값을 출력
        dbms_output.put_line(vemployee_id || ' / ' || vfirst_name);
end;
/

declare
        -- 레코드로 변수 선언
        vemployees employees%rowtype;
begin
        -- Lisa 사원의 정보를 레퍼런스 변수에 저장
        select *
        into vemployees
        from employees
        where first_name='Lisa';
        
        -- 레코드 변수에 저장된 사원 정보를 출려
        dbms_output.put_line('사원번호 : ' || to_char(vemployees.employee_id));
        dbms_output.put_line('이      름 : ' || vemployees.first_name);
        dbms_output.put_line('급      여 : ' || vemployees.salary);
        dbms_output.put_line('입사일자 : ' || to_char(vemployees.hire_date, 'YYYY-MM-DD'));
        dbms_output.put_line('부서번호 : ' || vemployees.department_id);
end;
/


--<예제> employees 테이블에 등록된 총사원의 수와 급여의 합, 급여의 평균을 변수에 대입하여 출력
DECLARE
        vcnt number;
        vsum number;
        vavg number;
BEGIN
        SELECT count(*), sum(salary), floor(avg(salary)) INTO vcnt, vsum, vavg FROM employees;

        DBMS_OUTPUT.PUT_LINE('사원 수 : ' || vcnt);
        DBMS_OUTPUT.PUT_LINE('급여의 합 : ' || vsum);
        DBMS_OUTPUT.PUT_LINE('급여의 평균 : ' || vavg);
END;
/

--<예제> Jack 사원의 직무, 급여, 입사일자, 부서명을 변수에 대입하여 출력
DECLARE
        vjob_id employees.job_id%type;
        vsalary employees.salary%type;
        vhire_date employees.hire_date%type;
        vdepartment_name departments.department_name%type;

BEGIN
        select job_id, salary, hire_date, department_name  into vjob_id, vsalary, vhire_date, vdepartment_name
        from employees e inner join departments d
        on e.department_id = d.department_id
        where first_name = 'Jack';
        
        dbms_output.put_line('사원의 직무 : ' || vjob_id);
        dbms_output.put_line('급여 : ' || vsalary);
        dbms_output.put_line('입사일자 : ' || vhire_date);
        dbms_output.put_line('부서명 : ' || vdepartment_name);

end;
/

--<예제> 사원 테이블(employees01)에서 사원번호가 제일 큰 사원을 찾아낸 뒤, 이 번호 +3번으로
-- 아래의 사원을 사원테이블에 신규 입력하는 PL_SQL 작성

declare
        max_employee_id employees01.employee_id%TYPE;
begin
        select max(employee_id) into max_employee_id from employees01;
        
        insert into employees01 ( employee_id, first_name, last_name, email, salary, hire_date, manager_id, job_id, department_id )
        values ( max_employee_id  + 3, 'Olivia', 'Gee', 'Spring', 2800, SYSDATE, 100, 'PR_REP', 20 );
        
        commit;

end;
/

select * from employees01;


DECLARE
	-- %ROWTYPE 속성으로 로우를 저장할 수 있는 레퍼런스 변수 선언
	vemployees employees%ROWTYPE;
	vsalary NUMBER(8, 2);
BEGIN
	DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 급여');
	DBMS_OUTPUT.PUT_LINE('-------------------');
	-- Pat 사원의 전체 정보를 로우 단위로 얻어와 vemployees에 저장한다.
	SELECT * INTO vemployees
	FROM employees
	WHERE first_name = 'Pat';
	-- 커미션이 NULL일 경우 이름 0으로 변경해야 올바른 급여 계산이 가능하다.
	IF (vemployees.commission_pct IS NULL) THEN
		vemployees.commission_pct := 0;
	END IF;

	--스칼라 변수에 급여를 계산할 결과를 저장한다.
	vsalary := vemployees.salary + (vemployees.salary * vemployees.commission_pct);
	--레퍼런스 변수와 스칼라 변수에 저장된 값을 출력한다.
	DBMS_OUTPUT.PUT_LINE('사원번호 : ' || vemployees.employee_id ||
												'/사원명 : ' ||vemployees.first_name ||
												'/급여 : ' || to_char(vsalary, '$999,999'));
END;
/

DECLARE
	-- %ROWTYPE 속성으로 로우를 저장할 수 있는 레퍼런스 변수 선언
	vemployees employees%ROWTYPE;
	vsalary NUMBER(8, 2);
BEGIN
	DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 급여');
	DBMS_OUTPUT.PUT_LINE('----------------------------');
	-- Jack 사원의 전체 정보를 로우 단위로 얻어와 vemployees에 저장
	SELECT * INTO vemployees
	FROM employees
	WHERE first_name = 'Jack';
	-- 커미션이 NULL 일 경우 이름 0으로 변경해야 올바른 급여 계산이 가능하다.
	IF(vemployees.commission_pct IS NULL) THEN
		vsalary := vemployees.salary;
	ELSE                  -- 커미션이 NULL이 아니면
		vsalary := vemployees.salary + (vemployees.salary * vemployees.commission_pct);
	END IF;

	-- 레퍼런스 변수와 스칼라 변수에 저장된 값을 출력
	DBMS_OUTPUT.PUT_LINE('사원번호 : ' || vemployees.employee_id ||
											'/ 사원명 : ' || vemployees.first_name ||
											' / 급여 : ' || to_char(vsalary, '$999,999'));

END;
/

DECLARE
  -- %ROWTYPE 속성으로 로우를 저장할 수 있는 레퍼런스 변수 선언
  vemployees employees%ROWTYPE; 
  vdepartment_name departments.department_name%TYPE;

BEGIN
  DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서번호 / 부서명'); 
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------');
  -- 사원번호가 192 사원의 전체 정보를 로우 단위로 얻어와 vemployees에 저장한다. 
  SELECT * INTO vemployees FROM employees WHERE employee_id=192;

  IF (vemployees.department_id = 10) THEN
    vdepartment_name := 'Administration';
  ELSIF (vemployees.department_id = 20) THEN
    vdepartment_name := 'Marketing';
  ELSIF (vemployees.department_id = 30) THEN
    vdepartment_name := 'Purchasing';
  ELSIF (vemployees.department_id = 40) THEN 
    vdepartment_name := 'Human Resources';
  ELSIF (vemployees.department_id = 50) THEN 
    vdepartment_name := 'Shipping';
  END IF;

  DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || ' /' || vemployees.first_name || ' /' || 
                       RPAD(vemployees.department_id,4) || ' /' || vdepartment_name ); 
END;
/


-- DBMS_RANDOM.VALUE
-- 랜덤한 숫자를 생성한다.
-- 형식 : DBMS_RANDOM.VALUE(최소 범위의 숫자, 최대 범위의 숫자)

-- (예제)
SELECT DBMS_RANDOM.VALUE(1, 5) FROM dual;
SELECT ROUND (DBMS_RANDOM.VALUE(1, 5)) FROM dual;
SELECT TRUNC (DBMS_RANDOM.VALUE(1, 5)) FROM dual;
-- 임의의 부서번호 얻고자 할 때
SELECT ROUND(DBMS_RANDOM.VALUE(10, 270), -1) FROM dual;

--DMBS_RANDOM.STRING
-- 랜덤한 문자열을 생성
-- 형식 : DBMS_RANDOM.STRING(옵션문자, 길이수)
-- 옵션문자는 아래와 같다.
 -- ‘u’ ‘U’ : 대문자
 -- ‘x’, ‘X’ : 영문자와 숫자 혼합
 -- ‘l’, ‘L’  : 소문자
 -- ‘p’, ‘P’ : 문자 혼합
 -- ‘a’, ‘A’ : 대소문자 구분없는 영문자
 
 -- (예제)
 SELECT DBMS_RANDOM.STRING('U', 1) FROM DUAL; -- 1개의 임의의 문자
 SELECT DBMS_RANDOM.STRING('A', 2) FROM DUAL; -- 대소문자 관계없이 2개의 임의의 문자
 SELECT DBMS_RANDOM.STRING('X', 8) FROM DUAL; -- 영문자와 숫자 혼합 8개의 임의의 문자
 
 DECLARE
	vsalary NUMBER := 0;
	vdepartment_id NUMBER := 0;
BEGIN
	SELECT ROUND(DBMS_RANDOM.VALUE(10, 270), -1) INTO vdepartment_id FROM DUAL;

	SELECT salary INTO vsalary
	FROM employees
	WHERE department_id = vdepartment_id AND ROWNUM = 1;
	DBMS_OUTPUT.PUT_LINE('부서번호 : ' || vdepartment_id || '급여 : ' || vsalary);

IF vsalary BETWEEN 1 AND 6000 THEN
	DBMS_OUTPUT.PUT_LINE('낮음');
ELSIF vsalary BETWEEN 6001 AND 10000 THEN
	DBMS_OUTPUT.PUT_LINE('중간');
ELSIF vsalary BETWEEN 10001 AND 20000 THEN
	DBMS_OUTPUT.PUT_LINE('높음');
ELSE
	DBMS_OUTPUT.PUT_LINE('최상위');
END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE(vdepartment_id || '부서에 해당 사원이 없습니다');
END;
/

DECLARE
	vn_base_num NUMBER := 3;
	vn_cnt NUMBER := 1;
BEGIN
	DBMS_OUTPUT.PUT_LINE('*****구구단 3단 *****');
	LOOP
		DBMS_OUTPUT.PUT_LINE(vn_base_num || '*' || vn_cnt || '=' || vn_base_num * vn_cnt);
		vn_cnt := vn_cnt + 1;
--	EXIT WHEN vn_cnt > 9;
		IF vn_cnt > 9 THEN
			EXIT;
		END IF;
	END LOOP;
END;
/

DECLARE
	vdepartments departments%ROWTYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
	DBMS_OUTPUT.PUT_LINE('--------------------------------------');
	-- 변수 cnt는 1부터 1씩 증가하다가 27에 도달하면 반복문을 벗어난다.
	FOR cnt IN 1..27 LOOP
		SELECT * INTO vdepartments FROM departments
		WHERE department_id = 10 * cnt;
		DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' / '||
		vdepartments.department_name || ' / ' || vdepartments.location_id);
	END LOOP;
END;
/

DECLARE
	i NUMBER := 1;
	vdepartments departments%ROWTYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
	DBMS_OUTPUT.PUT_LINE('---------------------------------');
	WHILE i <= 27 LOOP
		IF i MOD 2 = 0 THEN
			SELECT * INTO vdepartments FROM departments WHERE department_id = 10 * i;
			DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' / ' ||
			vdepartments.department_name || ' / ' || vdepartments.location_id);
		END IF;
		i := i + 1;
	END LOOP;
END;
/

DECLARE
	vdepartments departments%ROWTYPE;
	CURSOR C1 -- 커서의 이름
	IS
	SELECT department_id, department_name, location_id FROM departments; -- 부서 테이블의 전체 내용 조회
BEGIN
	DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
	DBMS_OUTPUT.PUT_LINE('------------------------------');

	OPEN C1;
	-- 오픈한 C1커서가 SELECㅆ문에 의해 검색된 한개의 행의정보를 읽어온다.
	LOOP -- 읽어온 정보는 INTO 뒤에 기술한 변수에 저장
		FETCH C1 INTO vdepartments.department_id, vdepartments.department_name,
		vdepartments.location_id;
		EXIT WHEN C1%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' ' ||
	RPAD(vdepartments.department_name, 20) || ' ' || vdepartments.location_id);
	END LOOP;
    DBMS_OUTPUT.PUT_LINE(CONCAT('읽어드린 레코드수 : ', C1%ROWCOUNT));
	CLOSE C1;
END;
/

DECLARE
	vdepartments departments%ROWTYPE;
	CURSOR C1
	IS
	SELECT * FROM departments;
BEGIN
	DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
	DBMS_OUTPUT.PUT_LINE('---------------------------------------');
	FOR vdepartments IN C1 LOOP
		DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' '
												|| RPAD(vdepartments.department_name, 20) || ' '
												|| vdepartments.location_id);
	END LOOP;
END;
/

DECLARE
	vdepartments departments%ROWTYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명');
	DBMS_OUTPUT.PUT_LINE('----------------------------------');
	FOR vdepartments IN (SELECT * FROM departments) LOOP -- 커서정의 부분을 FOR문에서 직접 사용
		DBMS_OUTPUT.PUT_LINE(vdepartments.department_id || ' '
		|| RPAD(vdepartments.department_name, 20) || ' ' || vdepartments.location_id);
	END LOOP;
END;
/

DECLARE
	vrandomid employees.department_id%TYPE; -- 임의의 부서번호
	vsalarystring VARCHAR2(20); -- 급여등급
  -- 커서 선언시 매개변수를 명시할 수 있다. CURSOR 커서명(매개변수) IS 쿼리문.
	CURSOR cur_employees(vdepartment_id employees.department_id%TYPE)
	IS
	SELECT salary, first_name FROM employees WHERE department_id = vdepartment_id;
BEGIN
	-- 임의의 부서번호를 얻어 출력
	SELECT ROUND(DBMS_RANDOM.VALUE(10, 270), -1) INTO vrandomid FROM DUAL;
	DBMS_OUTPUT.PUT_LINE('부서번호 : ' || vrandomid);

	-- 그 부서번호가 120에서 270번까지 소속된 사원이 없기에 제어.
	IF vrandomid between 120 and 270 THEN
		DBMS_OUTPUT.PUT_LINE(vrandomid || '부서에 해당 사원이 없습니다');
		RETURN; -- 블록을 종료
	END IF;

	DBMS_OUTPUT.PUT_LINE('사원명 / 급여 / 급여수준');
	DBMS_OUTPUT.PUT_LINE('---------------------------');

	FOR vemployees IN cur_employees(vrandomid) LOOP
		IF vemployees.salary BETWEEN 1 AND 6000 THEN
			vsalarystring := '낮음';
		ELSIF vemployees.salary BETWEEN 6001 AND 10000 THEN
			vsalarystring := '중간';
		ELSIF vemployees.salary BETWEEN 10001 AND 20000 THEN
			vsalarystring := '높음';
		ELSE
			vsalarystring := '최상위';
		END IF;
		DBMS_OUTPUT.PUT_LINE(RPAD(vemployees.first_name, 6) || '/' || RPAD(vemployees.salary, 5) || '/' ||vsalarystring);
	END LOOP;
END;
/


DECLARE
	vfirst_name employees.first_name%TYPE;
	TYPE employeescursor IS REF CURSOR;     -- 커서 타입 선언
	vemployees employeescursor;             -- 커서 변수 선언
BEGIN
	-- 커서 변수를 사용한 커서 정의 및 오픈
	OPEN vemployees FOR SELECT first_name FROM employees WHERE department_id = 60;

	-- LOOP문
	LOOP
	-- 커서 변수를 사용해 결과 집합을 EMPNAME 변수에 할당
	FETCH vemployees INTO vfirst_name;
	EXIT WHEN vemployees%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE('사원명 : ' || vfirst_name); -- 사원명을 출력
	END LOOP;
END;
/


CREATE OR REPLACE PROCEDURE EMPPROC
IS
	vword VARCHAR2(1);
	vemployees employees%ROWTYPE;
	CURSOR C1 (vword VARCHAR2)
	IS
	SELECT employee_id, first_name, salary
	FROM employees WHERE first_name LIKE '%' || vword ||'%';
BEGIN
	vword := DBMS_RANDOM.STRING('U', 1);
	DBMS_OUTPUT.PUT_LINE('임의의 문자 : ' || vword);
	OPEN C1(vword);
	DBMS_OUTPUT.PUT_LINE('사번 / 사원명 / 급여');
	DBMS_OUTPUT.PUT_LINE('----------------------------');
	LOOP
		FETCH C1 INTO vemployees.employee_id, vemployees.first_name, vemployees.salary;
		IF C1%ROWCOUNT = 0 THEN
			DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다.');
		END IF;
		EXIT WHEN C1%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || '/' || vemployees.first_name || '/' ||
		vemployees.salary);
	END LOOP;
END;
/

execute emppoc;

select * from user_source;

CREATE OR REPLACE PROCEDURE EMPPROC02 ( vdepartment_id IN employees.department_id%TYPE )
IS
	CURSOR C1
	IS
	SELECT * FROM employees WHERE department_id = vdepartment_id;
BEGIN
	DBMS_OUTPUT.PUT_LINE('사원번호 / 사원명 / 급여');
	DBMS_OUTPUT.PUT_LINE('----------------------------');
	FOR vemployees IN C1 LOOP
		DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || ' / '
													|| vemployees.first_name || ' / ' || vemployees.salary);
	END LOOP;
END;
/
SHOW ERROR;

select distinct department_id, first_name from employees;

execute EMPPROC02(40);

CREATE OR REPLACE PROCEDURE EMPPROC_INMODE
(vdepartment_id IN employees01.department_id%TYPE)
IS
BEGIN
	UPDATE employees01 SET salary = DECODE(vdepartment_id, 10, salary * 1.1, 20, salary * 1.2, salary)
	WHERE department_id = vdepartment_id;
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('수정이 완료되었습니다.');
END EMPPROC_INMODE;
/
SHOW ERRORS;

execute empproc_inmode(20);


CREATE TABLE dept01 (
    deptno NUMBER(2),
    dname VARCHAR2(30) NOT NULL,
    LOC VARCHAR2(15) NOT NULL,
    CONSTRAINT DEPT01_DEPTNO_PK PRIMARY KEY(deptno)
);

create sequence dept01_seq
start with 10
increment by 10
minvalue 10
maxvalue 100000
nocycle
cache 2;

ALTER TABLE dept01
ADD(CREDATE DATE DEFAULT SYSDATE);

INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '인사과','서울');
INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '총무과','대전');
INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '교육팀','서울');
INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '기술팀','인천');
INSERT INTO dept01(deptno, dname, loc) VALUES (dept01_seq.nextval, '시설관리팀','광주');

SELECT * FROM dept01;

CREATE OR REPLACE PROCEDURE deptproc_inmode
(deptno IN dept01.deptno%TYPE,
 dname IN dept01.dname%TYPE,
 loc IN dept01.loc%TYPE)
IS
BEGIN
    INSERT INTO dept01 (deptno, dname, loc, credate)
    VALUES(deptno, dname, loc, SYSDATE);
    COMMIT;
END;
/
SHOW ERROR;

EXECUTE DEPTPROC_INMODE(60, '기획부', '부산');
select * from dept01;

BEGIN
    DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명 / 등록일');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    
    FOR vdept IN (SELECT * FROM dept01 ORDER BY deptno) LOOP
        DBMS_OUTPUT.PUT_LINE(vdept.deptno || ' / ' || RPAD(vdept.dname, 10) || ' / '
                                    || vdept.loc || ' / ' ||TO_CHAR(vdept.credate, 'YYYY-MM-DD'));
    END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE deptproc_inup
( pdeptno IN dept01.deptno%TYPE,
  pdname IN dept01.dname%TYPE,
	ploc IN dept01.loc%TYPE )
IS
	cnt NUMBER := 0;
	vdept dept01%ROWTYPE;
BEGIN
	SELECT COUNT(*) INTO cnt FROM dept01 WHERE deptno = pdeptno;
	IF cnt = 0 THEN
		INSERT INTO dept01(deptno, dname, loc, credate)
		VALUES(pdeptno, pdname, ploc, SYSDATE);
	ELSE
		UPDATE dept01
		SET dname = pdname, loc = ploc, credate = sysdate
		WHERE deptno = pdeptno;
	END IF;
	COMMIT;

	DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명 / 등록일');
	DBMS_OUTPUT.PUT_LINE('------------------------------------');
	SELECT deptno, dname, loc, credate INTO vdept
	FROM dept01 WHERE deptno = pdeptno;
	DBMS_OUTPUT.PUT_LINE(vdept.deptno || ' / ' || RPAD(vdept.dname, 10) || ' / '
											|| vdept.loc || ' / ' || TO_CHAR(vdept.CREDATE, 'YYYY-MM-DD'));
END;
/
SHOW ERROR;
EXECUTE deptproc_inup(60, '기획부', '전주');

CREATE OR REPLACE PROCEDURE empproc_outmode(
	vemployee_id IN employees.employee_id%TYPE,
	vfirst_name OUT employees.first_name%TYPE,
	vsalary OUT employees.salary%TYPE,
	vjob_id OUT employees.job_id%TYPE
)
IS
BEGIN
	SELECT first_name, salary, job_id INTO vfirst_name, vsalary, vjob_id
	FROM employees
	WHERE employee_id = vemployee_id;
END;
/
show error;

DECLARE
	vemployee employees%ROWTYPE;
BEGIN
	empproc_outmode(120, vemployee.first_name, vemployee.salary, vemployee.job_id);
	DBMS_OUTPUT.PUT_LINE('사원명 : ' || vemployee.first_name);
	DBMS_OUTPUT.PUT_LINE('급 여 : ' || vemployee.salary);
	DBMS_OUTPUT.PUT_LINE('직 무 : ' || vemployee.job_id);
END;
/


CREATE OR REPLACE PROCEDURE dept_data
(dept_id IN employees.department_id%TYPE,
 dept_count OUT employees.salary%TYPE,
 dept_sal_sum OUT employees.salary%TYPE,
 dept_sal_avg OUT employees.salary%TYPE
)
IS
BEGIN
	SELECT COUNT(*), SUM(salary), AVG(salary) INTO dept_count, dept_sal_sum, dept_sal_avg
	FROM employees
	WHERE department_id = dept_id;
END;
/
show error;

DECLARE
	dept_cnt NUMBER(10);
	dept_sum NUMBER(10);
	dept_avg NUMBER(10);
BEGIN
	dept_data(30, dept_cnt, dept_sum, dept_avg);
	
	DBMS_OUTPUT.PUT_LINE('부서 사원수 : ' || dept_cnt);
	DBMS_OUTPUT.PUT_LINE('급여의 합 : ' || dept_sum);
	DBMS_OUTPUT.PUT_LINE('급여의 평균 : ' || dept_avg);
END;
/


CREATE OR REPLACE PROCEDURE empproc02_outmode
(vemployee_id IN employees.employee_id%TYPE,
 vfirst_name OUT employees.first_name%TYPE,
 vsalary OUT employees.salary%TYPE,
 dept_name OUT departments.department_name%TYPE,
 dept_avg OUT employees.salary%TYPE
)
IS
BEGIN
	SELECT first_name, salary, department_name, avg 
    INTO vfirst_name, vsalary, dept_name, dept_avg
	FROM
	(SELECT employee_id, e.first_name, e.salary, d.department_name,
					TRUNC(AVG(e.salary) OVER(PARTITION BY d.department_id)) AS avg
	FROM employees e INNER JOIN departments d
	ON e.department_id = d.department_id)
	WHERE employee_id = vemployee_id;
END;
/
SHOW ERROR;

DECLARE
	vfirst_name VARCHAR2(20);
	vsalary NUMBER;
	dept_name VARCHAR2(20);
	dept_avg NUMBER;
	
BEGIN
	empproc02_outmode(201, vfirst_name, vsalary, dept_name, dept_avg);

	DBMS_OUTPUT.PUT_LINE('사원번호 : ' || 201);
	DBMS_OUTPUT.PUT_LINE('급여 : ' || vsalary);
	DBMS_OUTPUT.PUT_LINE('부서명 : ' || dept_name);
	DBMS_OUTPUT.PUT_LINE('부서평균 : ' || dept_avg);
END;
/
SHOW error;


CREATE OR REPLACE PROCEDURE emp_sal_data
(vsalary IN employees.salary%TYPE, vemployees OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN vemployees FOR SELECT employee_id, first_name, salary
	FROM employees WHERE salary > vsalary;
END;
/
SHOW ERROR;

DECLARE
	pemployees SYS_REFCURSOR;
	vemployees employees%ROWTYPE;
BEGIN
	EMP_SAL_DATA(12000, pemployees);
	LOOP
		FETCH pemployees INTO vemployees.employee_id, vemployees.first_name, vemployees.salary;
		EXIT WHEN pemployees%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(vemployees.employee_id ||  ' . ' || vemployees.first_name|| ' ' ||
		vemployees.salary);
	END LOOP;
END;
/


--<예제> 각 부서에서 가장 급여를 많이 받는 사원의 사원번호, 이름, 부서번호, 급여, 입사일을 외부로 전달하는 프로시저(DEPT_SAL_DATA)
CREATE OR REPLACE PROCEDURE dept_sal_data
 (vemployees OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN vemployees 
    FOR SELECT employee_id, first_name, salary, hire_date
           FROM
			(SELECT row_number() over(partition by department_id order by salary asc) as rnum,
	        employee_id, first_name, salary, hire_date FROM employees WHERE department_id IS NOT NULL) data
            WHERE data.rnum = 1;
END;
/
SHOW ERROR;

DECLARE
	pemployees SYS_REFCURSOR;
	vemployees employees%ROWTYPE;
BEGIN
  dept_sal_data(pemployees);
     DBMS_OUTPUT.PUT_LINE('사원번호 / 이름 / 급여 / 입사일 ');
	LOOP
		FETCH pemployees
		INTO vemployees.employee_id, vemployees.first_name, vemployees.salary, vemployees.hire_date;
		EXIT WHEN pemployees%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || '/ ' || vemployees.first_name
                                            || '/ '  || vemployees.salary || '/ ' || vemployees.hire_date);
	END LOOP;
END;
/


--부서(department_id)별 급여총합, 급여평균, 최고급여, 최저급여
SELECT department_id, SUM(salary), TRUNC(AVG(salary)), MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id
ORDER BY 1;
--직무(job_id)별 급여 총합, 급여 평균, 최고급여, 최저급여
SELECT job_id, SUM(salary), TRUNC(AVG(salary)), MAX(salary), MIN(salary)
FROM employees
GROUP BY job_id
ORDER BY 1;

-- 프로시저(EMP_DEPT_PROC) 실행 시 사용자에게 부서 또는 직무를 나타내는 문자를 입력받아
-- DEPTID_JOBID 매개변수에 저장
-- 이때 'deptid'라고 입력하면 부서별 급여 총합 등을
-- 'jobid'라고 입력하면 직무별 급여 총합 등을
-- 커서변수에 저장하여 외부로 반환하는 프로시저 작성

CREATE OR REPLACE PROCEDURE emp_dept_proc
 (deptid_jobid IN employees.job_id%TYPE, 
  vemployees OUT SYS_REFCURSOR)
IS
BEGIN
	IF deptid_jobid = 'deptid' THEN
        OPEN vemployees FOR
            SELECT department_name, SUM(e.salary) AS SUM, TRUNC(AVG(e.salary)) AS AVG, MAX(e.salary) AS MAX, MIN(e.salary) AS MIN
            FROM employees e INNER JOIN departments d
            USING(department_id)
            GROUP BY department_name;
    ELSE
        OPEN vemployees FOR
            SELECT job_title, SUM(salary) AS SUM, TRUNC(AVG(salary)) AS AVG, MAX(salary) AS MAX, MIN(salary) AS MIN
            FROM employees e INNER JOIN jobs j
            USING(job_id)
            GROUP BY job_title;
    END IF;
END;
/
SHOW ERROR;

DECLARE
	pemployees SYS_REFCURSOR;
    input VARCHAR2(10) := 'jobid';
    v_id VARCHAR2(50);
    v_sum NUMBER;
    v_avg NUMBER;
    v_max NUMBER;
    v_min NUMBER;
BEGIN
     emp_dept_proc(input, pemployees);
     DBMS_OUTPUT.PUT_LINE('NAME | SUM | AVG | MAX | MIN');
     LOOP
        FETCH pemployees INTO v_id, v_sum, v_avg, v_max, v_min;
        EXIT WHEN pemployees%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(v_id || ' | ' || v_sum || ' | ' || v_avg || ' | ' || v_max || ' | ' || v_min);
    END LOOP;
END;
/


            

-- 사원 테이블에 로우가 추가되면 자동 수행할 트리거를 생성
create table emp03(
    empno number(4) primary key,
    ename varchar2(20),
    job varchar2(50)
);
CREATE OR REPLACE TRIGGER emp_trg01
AFTER INSERT
ON emp03
BEGIN
    DBMS_OUTPUT.PUT_LINE('신입사원이 입사했습니다.');
END;
/

INSERT INTO emp03(empno, ename, job)
VALUES(1, '홍길동', '경영지원직9기획/정략)');


--사원 테이블에 새로운 데이터 즉 신입사원이 들어오면 급여 테이블에 새로운 데이터를 자동으로 생성하고 싶을 경우,
-- 사원 테이블에 트리거를 설정하여 구현할 수 있다.
CREATE TABLE SAL03(
    salno NUMBER(4),
    sal NUMBER,
    empno NUMBER(4),
    CONSTRAINT SAL03_PK PRIMARY KEY(salno),
    CONSTRAINT SAL03_FK FOREIGN KEY(empno) REFERENCES emp03(empno)
);

CREATE SEQUENCE sal03_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 100000
NOCYCLE
CACHE 2;

delete from emp03 where empno = 1;

CREATE OR REPLACE TRIGGER emp_trg02
AFTER INSERT
ON emp03
FOR EACH ROW
BEGIN
    INSERT INTO sal03(salno, sal, empno)
    VALUES(sal03_seq.nextval, 2000000, : NEW.empno);
END;
/
INSERT INTO emp03(empno, ename, job) VALUES(2, '이영희', '경영지원직(인사)');
select * from sal03, emp03;

--사원정보가 제거될 때 그 사원의 급여 정보도 함께 삭제하는 내용을 트리거로 작성한다.
CREATE OR REPLACE TRIGGER emp_trg03
AFTER DELETE ON emp03
FOR EACH ROW
BEGIN  
    DELETE FROM sal03 WHERE empno = : OLD.empno;
END;
/
DELETE FROM emp03 WHERE empno = 2;

-- <실습> 입고 트리거 작성
--입고 테이블에 상품이 입력되면 입고 수량을 상품 테이블의 재고 수량에 추가하는 트리거 작성
--1. 상품 테이블 생성
CREATE TABLE PRODUCT(
    pcode CHAR(6),                              --상품코드
    pname VARCHAR2(12) NOT NULL,   -- 상품명
    pcompany VARCHAR(12),                -- 제조사
    pprice NUMBER(8),                         -- 가격
    stock NUMBER DEFAULT 0,             -- 재고수량
        CONSTRAINT PRODUCT_PK PRIMARY KEY(pcode)
);

--2. 입고 테이블 생성
CREATE TABLE receiving(
    rno NUMBER(6),      --입고번호
    pcode CHAR(6),      -- 상품코드
    pdate DATE DEFAULT SYSDATE,     -- 입고날짜
    rqty NUMBER(6),     -- 입고수량
    rprice NUMBER(8),       -- 입고가격
    ramount NUMBER(8),      --입고단가
        CONSTRAINT RECEIVING_PK PRIMARY KEY(rno),
        CONSTRAINT RECEIVING_FK FOREIGN KEY(pcode) REFERENCES PRODUCT(pcode)
);

--3. 상품테이블의 재고수량 컬럼을 통해서 실질적인 트리거의 적용 예
-- 먼저 상품 테이블에 다음과 같은 샘플 데이터를 입력
INSERT INTO product(pcode, pname, pcompany, pprice)
VALUES('A00001', '세탁기', 'LG', 1500000);
INSERT INTO product(pcode, pname, pcompany, pprice)
VALUES('A00002', '컴퓨터', 'LG', 1000000);
INSERT INTO product(pcode, pname, pcompany, pprice)
VALUES('A00003', '냉장고', '삼성', 4500000);
select * from product;

--4. 입고 테이블에 상품이 입력되면 입고 수량을 상품 테이블의 재고 수량으로 추가하는 트리거 작성
CREATE OR REPLACE TRIGGER trg_in
AFTER INSERT ON receiving
FOR EACH ROW
BEGIN
    UPDATE product
    SET stock = stock + : NEW.rqty
    WHERE pcode = : NEW.pcode;
END;
/

--5. 트리거를 실행시킨 후 입고 테이블에 행을 추가. 입고 테이블에는 물론 상품 테이블의 재고 수량이 변경됨 확인
INSERT INTO receiving(rno, pcode, rqty, rprice, ramount)
VALUES(1, 'A00001', 5, 850000, 950000);
select * from receiving;
select * from product;

--6. 입고 테이블에 상품이 입력되면 자동으로 상품 테이블의 재고 수량이 증가.
-- 입고 테이블에 또 다른 상품 입력
INSERT INTO receiving(rno, pcode, rqty, rprice, ramount)
VALUES(2, 'A00002', 10, 680000, 780000);
select * from receiving;
select * from product;

INSERT INTO receiving(rno, pcode, rqty, rprice, ramount)
VALUES(3, 'A00003', 10, 250000, 300000);
select * from receiving;
select * from product;

--<실습하기> 갱신 트리거 작성
-- 이미 입고된 상품에 대해서 입고 수량이 변경되면 상품 테이블의 재고수량 역시 변경되어야 한다. 이를 위한 갱신 트리거 작성
--1.갱싱 트리거 생성
CREATE OR REPLACE TRIGGER trg_up
AFTER UPDATE ON receiving
FOR EACH ROW
BEGIN
    UPDATE product
    SET stock = stock + (- : OLD.rqty + : NEW.rqty)
    WHERE pcode = : NEW.pcode;
END;
/

--2. 입고 번호 3번은 냉장고가 입고된 정보를 기록한 것으로 번호 3번의 입고 수량을 8로 변경하였더니 냉장고의 재고 수량 역시 8로 변경됨.
UPDATE receiving SET rqty = 8, ramount = 280000 -- 입고 수량과 입고 금액
WHERE rno = 3;
select * from receiving;
select * from product;

--<실습하기>삭제 트리거 작성
--입고 테이블에서 입고되었던 상황이 삭제되면 상품 테이블에 재고수량에서 삭제된 입고수량 만큼을 빼는 삭제 트리거 작성
--1. 삭제 트리거 작성
CREATE OR REPLACE TRIGGER trg_del
AFTER DELETE ON receiving
FOR EACH ROW
BEGIN
    UPDATE PRODUCT
    SET stock = stock - : OLD.rqty
    WHERE pcode = : OLD.pcode;
END;
/

--2. 입고 번호 3번은 냉장고가 입고된 정보를 기록한 것으로서 입고 번호가 3번인 행을 삭제하였더니
-- 냉장고의 재고 수량 역시 0으로 변경되었다.
DELETE receiving WHERE rno = 3;
select * from receiving;
select * from product;


--Function
-- 부서 번호를 매개변수로 부서의 이름을 반환하는 함수를 생성(첫번째 방법)
CREATE OR REPLACE FUNCTION getdname(vdepartment_id IN departments.department_id%TYPE)
RETURN VARCHAR2
IS
    vdepartment_name departments.department_name%TYPE;
    vcount NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO vcount FROM departments
    WHERE department_id = vdepartment_id;
    
    IF vcount = 0 THEN
        vdepartment_name := '해당 부서 없음';
    ELSE
        SELECT department_name INTO vdepartment_name FROM departments
        WHERE department_id = vdepartment_id;
    END iF;
    RETURN vdepartment_name;
END;
/

-- 함수 사용 방법 : select 문 호출
SELECT first_name, job_id, NVL(commission_pct, 0) commission_pct, salary, getdname(department_id)
FROM employees;

SELECT first_name, job_id, NVL(commission_pct, 0) commission_pct, salary, getdname(department_id)
FROM employees WHERE first_name = 'Lisa';

SELECT getdname(500) FROM dual;

-- 부서 번호를 매개변수로 부서의 이름을 반환하는 함수를 생성(두번째 방법)
CREATE OR REPLACE FUNCTION getdname(vdepartment_id IN departments.department_id%TYPE)
RETURN VARCHAR2
IS
    vdepartment_name departments.department_name%TYPE;
BEGIN
    SELECT department_name INTO vdepartment_name FROM departments
    WHERE department_id = vdepartment_id;
    RETURN vdepartment_name;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
            vdepartment_name := '해당 부서 없음';
RETURN vdepartment_name;
END;
/

SELECT employee_id, first_name, TO_CHAR(hire_date, 'YYYY-MM-DD') hiredate,
           getdname(department_id) department_name
FROM employees;
SELECT getdname(400) FROM DUAL;

--<예제>부서번호를 매개변수로 해당 부서의 급여의 합을 반환하는 함수를 생성(GETSUMDEPT)
CREATE OR REPLACE FUNCTION getsumdept(vdepartment_id employees.department_id%TYPE)
RETURN NUMBER
IS
    vsum_salary VARCHAR2(50);
BEGIN
    SELECT NVL2(vdepartment_id, TO_CHAR(SUM(SALARY), '999999'),'해당부서없음') as sum_salary
    INTO vsum_salary
    FROM employees
    WHERE department_id = vdepartment_id;
    RETURN vsum_salary;
TO_CHAR(ROUND(SUM(salary)), '99999999'),
END;
/

--사원명, 급여, 부서번호, 부서명, 부서의 급여합 출력
SELECT first_name, salary, department_id, getdname(department_id) department_name,
            getsumdept(department_id) sumsalary
FROM employees
WHERE employee_id = 100;

SELECT first_name, salary, department_id, getdname(department_id) department_name,
            getsumdept(department_id) sumsalary
FROM employees
WHERE employee_id = 178;

SELECT first_name, salary, department_id
FROM employees
WHERE employee_id = 178;

desc employees;

-------------------EXCEPTION
DECLARE
    vfirst_name employees.first_name%TYPE;
BEGIN
    SELECT first_name INTO vfirst_name
    FROM employees
    WHERE first_name LIKE 'O%';
    DBMS_OUTPUT.PUT_LINE('사원명은 ' || vfirst_name || ' 입니다.');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다');
    WHEN TOO_MANY_ROWS THEN
              DBMS_OUTPUT.PUT_LINE('현재 단어를 포함한 사원이 두명 이상 존재합니다');
END;
/


CREATE TABLE emp04
AS
SELECT employee_id, first_name FROM employees;

CREATE OR REPLACE PROCEDURE noempno_exception
(vemployee_id emp04.employee_id%TYPE)
IS
    exempid EXCEPTION;
BEGIN
    DELETE FROM emp04 WHERE employee_id = vemployee_id;
    IF SQL%NOTFOUND THEN
        RAISE exempid;
    ELSE
        DBMS_OUTPUT.PUT_LINE(CONCAT(vemployee_id, '사원이 삭제되었습니다'));
    END IF;
EXCEPTION
    WHEN exempid THEN
            DBMS_OUTPUT.PUT_LINE('입력하신 번호는 없는 사원번호입니다');
END;
/

EXEC noempno_exception(800);
EXEC noempno_exception(100);
    
    
    
------------------------------ PACKAGE
CREATE OR REPLACE PACKAGE EMPPACK
IS
    PROCEDURE EMPPROC;
    PROCEDURE EMPPROC02 ( vdepartment_id IN employees.department_id%TYPE );
END EMPPACK;
/

CREATE OR REPLACE PACKAGE BODY EMPPACK
IS
    PROCEDURE EMPPROC
    IS
        vword VARCHAR2(1);
        vemployees employees%ROWTYPE;
        CURSOR C1 (vword VARCHAR2)
        IS
        SELECT employee_id, first_name, salary
        FROM employees WHERE first_name LIKE '%' || vword ||'%';
    BEGIN
        vword := DBMS_RANDOM.STRING('U', 1);
        DBMS_OUTPUT.PUT_LINE('임의의 문자 : ' || vword);
        OPEN C1(vword);
        DBMS_OUTPUT.PUT_LINE('사번 / 사원명 / 급여');
        DBMS_OUTPUT.PUT_LINE('----------------------------');
        LOOP
            FETCH C1 INTO vemployees.employee_id, vemployees.first_name, vemployees.salary;
            IF C1%ROWCOUNT = 0 THEN
			DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다.');
            END IF;
		EXIT WHEN C1%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || '/' || vemployees.first_name || '/' ||
		vemployees.salary);
        END LOOP;
    END;
    
    PROCEDURE EMPPROC02 ( vdepartment_id IN employees.department_id%TYPE )
    IS
        CURSOR C1
    	IS
        SELECT * FROM employees WHERE department_id = vdepartment_id;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('사원번호 / 사원명 / 급여');
        DBMS_OUTPUT.PUT_LINE('----------------------------');
        FOR vemployees IN C1 LOOP
    		DBMS_OUTPUT.PUT_LINE(vemployees.employee_id || ' / '
													|| vemployees.first_name || ' / ' || vemployees.salary);
        END LOOP;
    END;
END EMPPACK;
/

