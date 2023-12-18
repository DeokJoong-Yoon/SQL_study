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


