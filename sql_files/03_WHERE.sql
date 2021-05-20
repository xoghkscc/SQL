--월급이 15000달러 이하인 사원들만 조회하기

SELECT
    *
FROM
    employees
WHERE
    salary >= 15000;

SELECT
    *
FROM
    employees
WHERE
    salary != 17000;

SELECT
    *
FROM
    employees
WHERE
    first_name = 'Steven';

SELECT
    *
FROM
    employees
WHERE
    hire_date < '2004/01/01';

SELECT
    *
FROM
    employees
WHERE
        hire_date < '2007/01/01'
    AND hire_date >= '2006/01/01';

SELECT
    *
FROM
    employees
WHERE
    job_id = 'IT_PROG'
    OR job_id = 'ST_CLERK';

-- 연습1 : 2000~ 3000사이의 월급을 받는 모든 사원들의 모든 정보 조회

SELECT
    *
FROM
    employees
WHERE
        salary >= 2000
    AND salary <= 3000;

-- 연습2 : 부서번호가 30 or 60 or 90인 모든 사원들의 이름, 직책, 전화번호 조회

SELECT
    first_name,
    phone_number,
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = 30
    OR department_id = 60
    OR department_id = 90;

-- 사번이 짝수인 사원만 조회해보기

SELECT
    *
FROM
    employees
WHERE
    mod(employee_id, 2) = 0;

SELECT
    *
FROM
    employees
WHERE
    salary BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    employees
WHERE
    department_id IN ( 30, 60, 90 );

SELECT
    *
FROM
    employees
WHERE
    commission_pct IS NULL;
    
SELECT * FROM employees WHERE not department_id in (30, 60, 90);

SELECT * FROM employees WHERE salary not BETWEEN 2000 and 3000;

SELECT * FROM employees WHERE commission_pct is not null;--됨
SELECT * FROM employees WHERE not commission_pct is null;--됨

--이름이 J로 시작하는 모든 사원을 조회
SELECT first_name FROM employees WHERE first_name LIKE 'J%';

--이름의 두번째 글자가 u인 모든 사원을 조회
SELECT first_name FROM employees WHERE first_name LIKE '_u%';

--이름의 세번째 글자가 e인 모든 사원을 조회
SELECT first_name FROM employees WHERE first_name LIKE '__e%';

--이름에 x가 포함되어 있는 모든 사원을 조회
SELECT first_name FROM employees WHERE first_name LIKE '%x%';


--연습1 : 이름의 뒤에서 세 번째 글자가 a인 모든 사원을 조회

SELECT first_name FROM employees WHERE first_name LIKE '%a__';

--연습2 : 이름에 e가 두개 이상 포함된 모든 사원을 조회

SELECT first_name FROM employees WHERE first_name LIKE '%e%e%';

--연습3 : 이름이 다섯 글자이면서 a로 끝나는 모든 사원을 조회

SELECT first_name FROM employees WHERE first_name LIKE '____a';


