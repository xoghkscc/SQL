SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;
SELECT * FROM locations;


--ANSI CROSS JOIN
SELECT
    *
FROM
         employees
    CROSS JOIN departments;

--ANSI INNER JOIN
SELECT
    *
FROM
         employees e
    INNER JOIN departments d ON e.department_id = d.department_id;

SELECT
    *
FROM
         employees e
    INNER JOIN departments USING ( department_id );

--ANSI OUTER JOIN
SELECT
    e1.employee_id,
    e1.first_name,
    e2.employee_id AS manager_id,
    e2.first_name
FROM
    employees  e1
    LEFT OUTER JOIN employees  e2 ON e1.manager_id = e2.employee_id;
    --e1.manager_id = e2.employee_id(+)

SELECT
    e1.employee_id,
    e1.first_name,
    e2.employee_id AS manager_id,
    e2.first_name
FROM
    employees  e1
    RIGHT OUTER JOIN employees  e2 ON e1.manager_id = e2.employee_id;
    --e1.manager_id(+) = e2.employee_id


SELECT
    first_name,
    department_id,--즉 앞에 누구꺼의 열인지 안밝혀도 됨
    department_name,
    job_title,
    city
FROM
         employees
    INNER JOIN departments USING ( department_id )
    INNER JOIN jobs USING ( job_id )
    RIGHT OUTER JOIN locations USING ( location_id );
    
    
--연습1 :  first_name이 Valli인 사람의 사원번호/풀네임/부서명 조회
SELECT
    employee_id,
    first_name,
    last_name,
    department_name
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    first_name = 'Valli';

-- 연습2 : job_id가 IT_PROG인 사원들의 이름/부서번호/부서명을 조회해보세요

SELECT
    first_name,
    job_id,
    department_id,
    department_name
FROM
         employees
    INNER JOIN departments USING ( department_id )
WHERE
    job_id = 'IT_PROG';

-- 연습3 : 시애틀에서 근무하는 모든 사원의 이름과 직책과 급여를 출력해보세요
SELECT
    first_name,
    job_id,
    salary,
    city
FROM
         employees
    INNER JOIN departments USING ( department_id )
    INNER JOIN locations USING ( location_id )
WHERE
    city = 'Seattle';
-- 연습4 : 사원명/부서번호/부서이름을 출력하되 사원이 한명도 속하지 않은 부서도 조회해보세요

SELECT
    first_name,
    department_id,
    department_name
FROM
         employees
    RIGHT OUTER JOIN departments USING ( department_id );


-- 연습5 : 부서명/주소/도시명을 출력하되 소속된 부서가 없는 도시도 함께 조회해보세요

SELECT
    department_name,
    street_address,
    city
FROM
         departments
    RIGHT OUTER JOIN locations USING ( location_id );
    











    