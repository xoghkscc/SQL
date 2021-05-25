SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM jobs;
SELECT * FROM job_history;
--Sigal과 같은 부서에 근무하는 모든 사원 조회해보기
SELECT
    *
FROM
    employees
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            employees
        WHERE
            first_name = 'Sigal'
    );


--연습1: email이 DRAPHEAL인 사원보다 급여를 많이 받는 사원들의 이름/직책/급여를 조회

SELECT
    first_name,
    job_id,
    salary
FROM
    employees
WHERE
    salary > (
    SELECT
            salary
        FROM
            employees
        WHERE
            email = 'DRAPHEAL'
    );


--연습2 : Purchasing 부서에서 근무하는 사원들의 이름과 직책과 부서번호를 조회

SELECT
    first_name,
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = (
    SELECT
            department_id
        FROM
            departments
        WHERE
            department_name = 'Purchasing'
    );
--다중 행 서브 쿼리

SELECT * FROM employees ORDER BY salary desc;

SELECT DISTINCT department_id FROM employees WHERE salary >= 13000;

-- 급여가 13000 이상인 사원이 소속된 부서에서 근무하는 모든 사원을 조회
SELECT
    *
FROM
    employees
WHERE
    department_id IN (
        SELECT DISTINCT
            department_id
        FROM
            employees
        WHERE
            salary >= 13000
    )
ORDER BY department_id;

SELECT 
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING (job_id)
WHERE
    salary > ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG');
    --IT_PROG을 가진 사람들의 모든 월급보다 더 큰 월급을 받는 사람을 출력

SELECT 
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING (job_id)
WHERE
    salary < ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG');
    --IT_PROG을 가진 사람들의 모든 월급보다 더 작은 월급을 받는 사람을 출력

SELECT 
    first_name,
    job_title,
    salary
FROM
    employees INNER JOIN jobs USING (job_id)
WHERE
    salary < SOME(SELECT salary FROM employees WHERE job_id = 'IT_PROG');
    --IT_PROG을 가진 사람들의 모든 월급보다 더 작은 월급을 받는 사람을 출력


SELECT
    *
FROM
    employees e1
WHERE
   NOT EXISTS (
        SELECT
            *
        FROM
            employees e2
        WHERE
            e1.salary < e2.salary
    );

