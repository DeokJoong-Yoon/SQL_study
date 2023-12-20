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


CREATE OR REPLACE PROCEDURE EMPPOC
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


