SELECT * FROM employees ORDER BY salary ASC;
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY salary;


SELECT * FROM employees ORDER BY commission_pct DESC;
SELECT * FROM employees ORDER BY commission_pct ASC;


SELECT * FROM employees ORDER BY job_id;
SELECT * FROM employees ORDER BY job_id, first_name;

-- 연습1 : 모든 사원들을 부서번호 기준 오름차순으로 조회
SELECT * FROM employees ORDER BY department_id;

-- 연습2 : 모든 사원들을 최근 입사한 순서대로 조회
SELECT * FROM employees ORDER BY hire_date DESC;

--연습3 : 이름에 i가 포함된 사원들을 돈을 가장 많이 받는 순서대로
SELECT * FROM employees WHERE first_name LIKE '%i%' ORDER BY salary DESC ;

--연습4 : 80번 부서와 50번 부서의 사원들을 부서번호 기준 오름차순 조회하고 
-- 부서번호가 같다면 last_name 기준으로 알파벳 순으로 조회
SELECT * FROM employees WHERE department_id = 50 or department_id = 80 ORDER BY department_id, last_name;

