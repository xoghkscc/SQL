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
    locations;


--연습1 : first_name이 Valli인 사람의 사원번호/풀네임/부서명 조회
SELECT
    employees.employee_id,
    employees.first_name,
    employees.last_name,
    departments.department_name
FROM
    employees,
    departments
WHERE
        departments.department_id = employees.department_id
    AND first_name = 'Valli';

--연습2 : job_id가  IT_PROG인 사원들의 이름/부서번호/부서명 조회
SELECT
    employees.first_name,
    employees.department_id,
    departments.department_name,
    employees.job_id
FROM
    employees,
    departments
WHERE
        departments.department_id = employees.department_id
    AND job_id = 'IT_PROG';

--연습3 : 시애틀에 근무하는 모든 사원의 이름, 직책, 급여

SELECT
    e.first_name,
    d.department_name,
    e.salary,
    l.city AS "근무하는 지역"
FROM
    employees    e,
    departments  d,
    locations    l
WHERE
        d.department_id = e.department_id
    AND d.location_id = l.location_id
    AND l.city = 'Seattle';
    
--연습 : 각 지역 사원들의 평균 급여

SELECT
    locations.city,
    trunc(AVG(employees.salary), 2) AS "평균 급여"
FROM
    employees,
    departments,
    locations
WHERE
        departments.department_id = employees.department_id
    AND departments.location_id = locations.location_id
GROUP BY
    locations.city;

SELECT
    e1.employee_id,
    e1.first_name,
    e1.job_id,
    e1.manager_id,
    e2.first_name AS "매니저 이름"
FROM
    employees  e1,
    employees  e2
WHERE
    e1.manager_id = e2.employee_id
ORDER BY
    e1.employee_id;

--연습1: 매니저 이름이 Nancy인 사원들의 사번, 이름, job_title를 조회(job_title은 jobs 테이블에 있음)
SELECT
    *
FROM
    jobs;

SELECT
    e1.employee_id,
    e1.first_name,
    e2.first_name AS "매니저 이름",
    j.job_title
FROM
    employees  e1,
    employees  e2,
    jobs       j
WHERE
        e1.manager_id = e2.employee_id
    AND e2.first_name = 'Nancy'
    AND e1.job_id = j.job_id;

--연습2: Curtis와 동일한 직책을 가진 사원들의 모든 정보를 조회

SELECT
    e1.*
FROM
    employees  e1,
    employees  e2
WHERE
        e2.first_name = 'Curtis'
    AND e2.job_id = e1.job_id;
    

--연습 : Curtis 같은 매니저를 가진 사원들의 월급은 10% 인상
--사번/이름/증감 반영된 월급/매니저 이름 출력

SELECT
    e1.employee_id,
    e1.first_name,
    e1.salary            AS "원래 월급",
    e1.salary * 1.1        AS "증가된 월급",
    e2.first_name
FROM
    employees  e1,
    employees  e2
WHERE
        e1.manager_id = e2.employee_id
    AND e2.first_name = 'Nancy';

--연습 : Nancy 같은 매니저를 가진 사원들의 월급은 10% 인상
--Steven 매니저를 가진 사원의 월급은 10% 삭감
--사번/이름/증감 반영된 월급/매니저 이름 출력(월급이 그대로인 사원은 출력 X)

SELECT
    e1.employee_id,
    e1.first_name,
    e2.first_name AS "매니저",
    e1.salary  AS "반영 전 월급",
    CASE
        WHEN e2.first_name = 'Nancy'     THEN
            e1.salary * 1.1
        WHEN e2.first_name = 'Steven'    THEN
            e1.salary * 0.9
    END     AS "반영 후 월급"
FROM
    employees  e1,
    employees  e2
WHERE
    e1.manager_id = e2.employee_id
    AND   CASE
        WHEN e2.first_name = 'Nancy'     THEN
            e1.salary * 1.1
        WHEN e2.first_name = 'Steven'    THEN
            e1.salary * 0.9
    END  -  e1.salary != 0;
    

