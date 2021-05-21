SELECT ABS(-123) FROM dual;--123
SELECT FLOOR(123.355) FROM dual;--123
SELECT ROUND(123.355) FROM dual;--123
SELECT CEIL(123.111) FROM dual;--123
SELECT MOD(13, 10) FROM dual;--3
SELECT TRUNC(133.1234, 3) FROM dual;--133.123
SELECT TRUNC(133.1234, 2) FROM dual;--133.12
SELECT TRUNC(133.1234, 1) FROM dual;--133.1
SELECT TRUNC(133.1234, -1) FROM dual;--130
SELECT TRUNC(133.1234, -2) FROM dual;--100

SELECT sysdate FROM dual;--21/05/21(오늘 날짜)
SELECT TRUNC(sysdate, 'year') FROM dual;--21/01/01(오늘 년도)
SELECT TRUNC(sysdate, 'month') FROM dual;--21/05/01(오늘 년,월)
SELECT TRUNC(sysdate, 'day') FROM dual;--21/01/06(오늘 년,월,일)

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/05/21 09:42:55(현재 시각)
SELECT TO_CHAR(TRUNC(sysdate, 'year'), 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/01/01 00:00:00
SELECT TO_CHAR(TRUNC(sysdate, 'month'), 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/05/01 00:00:00
SELECT TO_CHAR(TRUNC(sysdate, 'day'), 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/05/16 00:00:00

SELECT LOWER('ABC') FROM dual;--abc
SELECT UPPER('abc') FROM dual;--ABC

SELECT SUBSTR('Hello world!!',1,5) FROM dual; -- 1base~5까지 (여기는 인덱스를 1부터 센다)-Hello
SELECT SUBSTR('Hello world!!',5) FROM dual; -- 숫자를 하나만 적으면 맨 뒤까지 자른다-o world!!

SELECT LENGTH('of the people, by the people, for the people.') FROM dual;--45

SELECT LPAD('title', 10, '#') FROM dual;--####title
SELECT RPAD('title', 10, '#') FROM dual;--title####

SELECT LTRIM('#####TITLE#', '#') FROM dual;--TITLE#
SELECT RTRIM('#####TITLE#', '#') FROM dual;--#####TITLE(즉 오른쪽만 제거)
SELECT LTRIM('     TITLE#') FROM dual;--TITLE#(즉 제거할 문자가 공백인 경우 생략 가능)

SELECT TRIM('     title    ') FROM dual; --title
SELECT TRIM('#' FROM '#####title###') FROM dual; --title

SELECT sysdate -1 as 어제, sysdate  as 오늘,sysdate +1 as 내일, sysdate +2 as "내일 모레"--as 뒤에는 공백 주려면 ""을 해야함
FROM dual;

SELECT last_name, FLOOR(sysdate - hire_date) as 근무일, hire_date  FROM employees;--오늘 날짜에서 근무일 만큼 뺀 date를 돌려줌

SELECT to_char(sysdate, 'MON MM MI DAY DY DD') FROM dual;--5월 05 25 금요일 금 21
SELECT to_char(sysdate, 'HH12:MI:SS PM') FROM dual; -- 10:25:51 오전(AM으로 하나 PM으로 하나 현재를 기준으로 함

SELECT last_name, FLOOR(months_between(sysdate, hire_date)) as 근무개월 FROM employees;

SELECT ADD_MONTHS(sysdate, 5) FROM dual;--21/10/21(현재 날짜21/05/21)

SELECT NEXT_DAY(sysdate, '화요일') FROM dual;--21/05/25(현재 21.05.21 금요일이므로 다음 화요일은 21/05/25)
SELECT NEXT_DAY(sysdate, '목') FROM dual;--21.05.27

SELECT LAST_DAY(sysdate) FROM dual;--21/05/31(21.5월에 마지막 날)

SELECT TO_CHAR(sysdate, 'HH12:MI:SS:PM') FROM dual; --10:43:34:오전
SELECT TO_CHAR(15000000, '999,999,999,999,999L') FROM dual;--15,000,000￦
SELECT TO_CHAR(15000000, '000,000,000,000,000') FROM dual;--000,000,015,000,000

SELECT TO_NUMBER('15,000,000￦', '999,999,999L') FROM dual;--15000000(즉 숫자로 다시 돌아옴)

SELECT * FROM employees;

SELECT
    last_name,
    department_id,
    DECODE(department_id, 90, 'Executive', 60, 'SOSO') as department_name FROM employees;

--연습1 : 직급에 따라 급여를 다르게 인상하여 출력해보세요
--IP_PROG : 15% 인상, FI_ACCOUNT : 10% 인상, 모든 종류의 CLERK : 5% 인상
--원래 급여는 before_slary, 인상된 급여는 after_salary
SELECT
    last_name,
     job_id,
    salary as before_slary,
     DECODE(job_id, 'IT_PROG', SALARY * 1.15, 'FI_ACCOUNT', SALARY * 1.10 ) as after_salary
    FROM employees WHERE JOB_ID = 'IT_PROG' OR JOB_ID = 'FI_ACCOUNT'
    UNION 
    SELECT
     last_name,
     job_id,
    salary as before_slary,
    salary *1.05  as after_salary
     FROM employees WHERE JOB_ID LIKE '___CLERK';
     
     SELECT
    last_name,
     job_id,
    salary as before_slary,
     DECODE(job_id, 'IT_PROG', SALARY * 1.15, 'FI_ACCOUNT', SALARY * 1.10 ) as after_salary
    FROM employees WHERE JOB_ID NOT LIKE '%CLERK%'
    UNION 
    SELECT
     last_name,
     job_id,
    salary as before_slary,
    salary *1.05  as after_salary
     FROM employees WHERE JOB_ID LIKE '___CLERK';

SELECT last_name, job_id, salary as before_salary , 
CASE WHEN job_id = 'IT_PROG' THEN salary * 1.15
WHEN job_id = 'FI_ACCOUNT' THEN salary * 1.1
WHEN job_id LIKE '%CLERK%' THEN salary * 1.05
ELSE salary
END AS after_salary
FROM employees;
 









