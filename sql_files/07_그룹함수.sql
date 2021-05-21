SELECT SUM(salary) FROM employees;

--직책별 총 월급
SELECT job_id, SUM(salary) FROM employees GROUP BY job_id;
--직책별 평균 월군
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id;

SELECT department_id, sum(salary) FROM employees GROUP BY department_id;

SELECT department_id, max(salary) FROM employees GROUP BY department_id;


SELECT department_id, count(*) FROM employees GROUP BY department_id;

select distinct JOB_ID from employees;

--연습1 : 부서별로 가장 최근에 입사한 사원과 가장 오래전에 입사한 사원을 출력해주는 쿼리문 작성
SELECT DEPARTMENT_ID, min(hire_date) as 오래, max(hire_date) as 최근 FROM employees GROUP BY DEPARTMENT_ID;


--연습2 : 보너스를 받는 사원이 각 부서에 몇 명 있는지 출력해주는 쿼리문
SELECT DEPARTMENT_ID, count(COMMISSION_PCT) as 보너스 FROM employees GROUP BY DEPARTMENT_ID;

--연습3 : 각 직급별 평균 연봉을 구해보세요 (월급 아님, 커미션 적용, 소수점 둘째 자리까지 적용)
SELECT JOB_ID, trunc(AVG(SALARY*nvl(1+COMMISSION_PCT, 1))*12, 3) as "평균 연봉" FROM employees GROUP BY JOB_ID;

SELECT job_id, count(*) FROM employees WHERE salary <= 5000 GROUP BY job_id;

--회사에 5명 이하밖에 없는 직책을 모두 출력
SELECT job_id, count(*) FROM employees GROUP BY job_id HAVING count(*) <= 5;

--연습1 : 부서별 최대 급여와 최소 급여를 출력하되 최대 급여가 5000이상인 부서만 출력
SELECT DEPARTMENT_ID, MIN(salary) as "최소 급여", MAX(salary) as "최대 급여" FROM employees GROUP BY DEPARTMENT_ID HAVING max(salary) >=5000;

--연습2 :  부서별 평균 급여를 출력하되 해당 부서에 소속된 사원이 10명 이상인 부서만 불력
SELECT DEPARTMENT_ID, TRUNC(AVG(salary), 2) as "평균 급여",  COUNT(*) AS "사원 수" FROM employees GROUP BY DEPARTMENT_ID HAVING COUNT(*) >=10;




