--EMPLOYEES의 직원들이 자신이 받을 수 있는 월급 범위 내에서 몇 퍼센트 수준의 월급을 받고 있는지
--조회(커미션도 포함)

SELECT
    first_name,
    job_title,
    nvl(commission_pct, 0)                       AS "커미션",
    salary * ( 1 + nvl(commission_pct, 0) )            AS "커미션 적용 월급",
    max_salary,
    trunc(salary * ( 1 + nvl(commission_pct, 0) ) / max_salary, 2) *100 ||'%'  AS "비율"
FROM
    employees
    INNER JOIN jobs USING(job_id);
    
    
--매니저 이름이 Nancy(108)를 가지는 사원들에 대해서 commission_pct를 0.12로 바꾸자
UPDATE employees
SET
    commission_pct = 0.12
WHERE 
   manager_id = (
    SELECT
        e1.manager_id
    FROM
        employees e1,
        employees e2
    WHERE
        e1.manager_id = e2.employee_id
        AND e2.first_name = 'Nancy'
     GROUP BY e1.manager_id
    );


--확인
SELECT 
    * 
FROM
    employees
    manager_id = 108;

ROLLBACK;



--근무지가(city)  Seattle(시애틀의 department_id 는 10, 30, 90, 100, 110)인 사원들은 월급 1원 더하기(변경되었는지 확인 하기 위해)

UPDATE employees
SET
    salary = salary + 1
WHERE 
   department_id IN (
    SELECT
        department_id
    FROM
        employees
        INNER JOIN  departments USING (department_id)
        INNER JOIN  locations USING (location_id)
    WHERE
        city = 'Seattle'
    GROUP BY department_id
    );

--확인
SELECT
    *
FROM
    employees
WHERE
    department_id IN (10, 30, 90, 100, 110);
    
ROLLBACK;

--