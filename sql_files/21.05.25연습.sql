--2005년 입사한 직원들 가운데 first_name이 Lisa인 직원보다 빨리 입사한 직원들 출력
--1번 방법
SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    departments;

SELECT
    *
FROM
    jobs;

SELECT
    employee_id,
    first_name,
    last_name AS "name",
    hire_date
FROM
    employees
WHERE
        hire_date < (
            SELECT
                hire_date
            FROM
                employees
            WHERE
                first_name = 'Lisa'
        )
    AND to_char(hire_date, 'yymmdd') BETWEEN 050101 AND 051231;

--2번 방법
SELECT
    *
FROM
    employees;

SELECT
    e1.employee_id,
    e1.first_name,
    e1.last_name AS "name",
    e1.hire_date
FROM
    employees  e1,
    employees  e2
WHERE
        e2.first_name = 'Lisa'
    AND e1.hire_date < e2.hire_date
    AND to_char(e1.hire_date, 'yymmdd') BETWEEN 050101 AND 051231;


--Sales'부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)조회
--단 급여는 100번 부서의 평균보다 적게 받는 직원 정보만 출력

SELECT
    first_name,
    salary,
    department_name
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
        GROUP BY
            department_id
        HAVING
            department_id = 100
    );

--De Haan 사원의 관리자 사원번호, 관리자 이름(last_name), 관리자 입사일 및 관리자 급여를 표시
SELECT
    e1.last_name,
    e2.last_name AS "관리자의 이름",
    e2.employee_id,
    e2.last_name,
    e2.hire_date,
    e2.salary
FROM
    employees  e1,
    employees  e2
WHERE
        e1.manager_id = e2.employee_id
    AND e1.last_name = 'De Haan';
    
--이름에 'T'를 포함하고 있는 사원과 같은 부서에 근무하는 사원의 이름과 사원 번호, 부서이름

SELECT
    first_name,
    employee_id,
    department_id,
    department_name
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    department_id IN (
        SELECT
            department_id
        FROM
            employees
        WHERE
            first_name LIKE '%T%'
    );

--20번 부서의 최고 급여보다 급여가 많은 사원들의 사원명, 부서코드, 급여
--1번 방법
SELECT
    first_name,
    department_id,
    salary
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id = 20
    );
--2번 방법
SELECT
    first_name,
    department_id,
    salary
FROM
    employees
WHERE
    salary > (
        SELECT
            MAX(salary)
        FROM
            employees
        GROUP BY
            department_id
        HAVING
            department_id = 20
    );

--2002년에 입사한 직원의 평균 급여보다 급여가 높은 사원들의 사원명, 입사일, 급여
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary > ALL (
        SELECT
            salary
        FROM
            employees
        WHERE
            to_char(hire_date, 'yyyy') = 2002
    );

--각 직책 별(job_title)로 급여의 총합, 직책이 Representative는 제외
--단, 급여 총합이 30000 초과인 직책만 나타나며 오름차순 정렬 출력은 JOB, 급여

SELECT
    job_title,
    SUM(salary)
FROM
         employees
    INNER JOIN jobs USING ( job_id )
WHERE
    job_title NOT LIKE '%Representative%'
GROUP BY
    job_title
HAVING
    SUM(salary) > 30000
ORDER BY
    SUM(salary);

--각 부서 이름 별로 2005년 이전에 입사한 직원들의 인원수 조회
SELECT
    department_name,
    COUNT(*)
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    to_char(hire_date, 'yyyy') < 2005 
GROUP BY
    department_name
ORDER BY department_name;

--사원수가 3명 이상인 부서의 부서번호, 부서이름, 사원 수, 최고급여, 최저급여, 평균급여, 급여총액
--출력 결과는 사원 수가 많은 순서대로, 평균급여 계산기 소수점 이하는 버리기

SELECT
    department_id,
    department_name,
    max(salary),
    min(salary),
    trunc(avg(salary), 0),
    sum(salary),
    count(*)
FROM
    employees e1
    INNER JOIN departments USING (department_id)
GROUP BY
    department_name,
    department_id
HAVING 
    count(*) >= 3
ORDER BY count(*) desc;

--Seattle에 근무하는 사원 중 급여 9000 이상인 사원의 이름, 급여, 부서, 입사일, 보너스
SELECT
    first_name,
    salary,
    department_name,
    hire_date,
    nvl(commission_pct, 0),
    city
FROM
    employees
    INNER JOIN departments USING (department_id)
    INNER JOIN locations USING (location_id)
WHERE
    city = 'Seattle'
    And salary >= 9000;







   
    