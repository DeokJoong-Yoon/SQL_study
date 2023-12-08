-- [문제 1] EMPLOYEES 테이블에서 급여가 3000이상인 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력하라.
SELECT
    employee_id,
    first_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary >= 3000;
    
-- [문제2] EMPLOYEES 테이블에서 담당 업무가 ST_MAN인 사원의 정보를 사원번호, 이름, 담당업무, 급여, 부서번호를 출력.
SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    department_id
FROM
    employees
WHERE
    job_id = 'ST_MAN';
    
--[문제3] EMPLOYEES 테이블에서 입사일자가 2006년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 이름, 담당업무, 급여, 입사일자, 부서번호를 출력
SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    hire_date,
    department_id
FROM
    employees
WHERE
    hire_date >= '06/01/01';
    
--[문제4] EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 이름, 담당업무, 급여, 부서번호를 출력
SELECT
    first_name,
    job_id,
    salary,
    department_id
FROM
    employees
WHERE
    salary BETWEEN 3000 AND 5000;
    
--[문제5] EMPLOYEES 테이블에서 입사일자가 05년도에 입사한 사원의 정보를 사원번호, 이름, 담당업무, 급여, 입사일자, 부서번호를 출력
SELECT
    employee_id,
    first_name,
    job_id,
    salary,
    hire_date,
    department_id
FROM
    employees
WHERE
--    hire_date LIKE '05%';
    hire_date LIKE '05/__/__';    

--[문제 6] 사원정보(EMPLOYEES) 테이블에서 사원번호, 이름, 급여, 업무번호, 입사일, 상사의 사원번호를 출력. 
--           이때 이름은 성과 이름을 연결하여 Name이라는 별칭으로 출력하시오
SELECT
    employee_id,
    first_name
    || ' '
    || last_name "Name",
    salary,
    job_id,
    hire_date,
    manager_id
FROM
    employees;

--[문제 7] 사원정보(EMPLOYEES) 테이블에서 사원의 성과 이름은 Name, 업무번호는 Job, 급여는 Salary, 
--연봉에 $100 보너스를 추가하여 계산한 값은 Increased Ann_Salary, 
--급여에 $100 보너스를 추가하여 계산한 연봉은 Increased Salary라는 별칭으로 출력하시오.
SELECT
    first_name
    || ' '
    || last_name          "Name",
    job_id                "Job",
    salary                "Salary",
    ( salary * 12 + 100 ) "Increased Ann_Salary",
    ( salary + 100 ) * 12 "Increased Salary"
FROM
    employees;
 

 

--[문제 8] 사원정보(EMPLOYEES) 테이블에서 모든 사원의 이름(FIRST_NAME)과 
--연봉을 “이름: 1 Year Salary = $연봉” 형식으로 출력하고, 1 Year Salary라는 별칭을 붙여 출력하시오.
--(예시) King: 1 Year Salary = $288000
SELECT
    first_name
    || ' : 1 Year Salary = $'
    || salary * 12 "1 Year Salary"
FROM
    employees;

--[문제 9] 부서별로 담당하는 업무ID를 한 번씩만 출력하시오
SELECT DISTINCT
    department_id,
    job_id
FROM
    employees;

--[문제 10] 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 
--사원정보(EMPLOYEES) 테이블에서 급여가 $7,000~$10,000 범위 이외인 사람의 성과 이름(Name으로 별칭) 및 급여를 급여가 작은 순서로 출력하시오.
SELECT
    first_name
    || ' '
    || last_name "Name",
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 7000 AND 10000
ORDER BY
    salary ASC;

--[문제 11] 2006년 05월 20일부터 2007년 05월 20일 사이에 고용된 사원들의 성과 이름(Name으로 별칭), 사원번호, 입사일자를 출력.  
--단, 입사일이 빠른 순으로 정렬하시오.
SELECT
    first_name
    || ' '
    || last_name "Name",
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2006/05/20' AND '2007/05/20'
ORDER BY
    hire_date ASC;

--[문제 12] 부서에서는 급여(salary)와 수당율(commission_pct)에 대한 지출 보고서를 작성하려고 한다. 
--이에 수당을 받는 모든 사원의 성과 이름(Name으로 별칭), 급여, 업무, 수당율을 출력하시오.
--이때 급여가 큰 순서대로 정렬하되, 급여가 같으면수당율이 큰 순서대로 정렬하시오.
SELECT
    first_name
    || ' '
    || last_name "Name",
    salary,
    job_id,
    commission_pct
FROM
    employees
ORDER BY
    salary DESC, commission_pct DESC;