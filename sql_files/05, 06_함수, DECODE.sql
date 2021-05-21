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

SELECT sysdate FROM dual;--21/05/21(���� ��¥)
SELECT TRUNC(sysdate, 'year') FROM dual;--21/01/01(���� �⵵)
SELECT TRUNC(sysdate, 'month') FROM dual;--21/05/01(���� ��,��)
SELECT TRUNC(sysdate, 'day') FROM dual;--21/01/06(���� ��,��,��)

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/05/21 09:42:55(���� �ð�)
SELECT TO_CHAR(TRUNC(sysdate, 'year'), 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/01/01 00:00:00
SELECT TO_CHAR(TRUNC(sysdate, 'month'), 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/05/01 00:00:00
SELECT TO_CHAR(TRUNC(sysdate, 'day'), 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/05/16 00:00:00

SELECT LOWER('ABC') FROM dual;--abc
SELECT UPPER('abc') FROM dual;--ABC

SELECT SUBSTR('Hello world!!',1,5) FROM dual; -- 1base~5���� (����� �ε����� 1���� ����)-Hello
SELECT SUBSTR('Hello world!!',5) FROM dual; -- ���ڸ� �ϳ��� ������ �� �ڱ��� �ڸ���-o world!!

SELECT LENGTH('of the people, by the people, for the people.') FROM dual;--45

SELECT LPAD('title', 10, '#') FROM dual;--####title
SELECT RPAD('title', 10, '#') FROM dual;--title####

SELECT LTRIM('#####TITLE#', '#') FROM dual;--TITLE#
SELECT RTRIM('#####TITLE#', '#') FROM dual;--#####TITLE(�� �����ʸ� ����)
SELECT LTRIM('     TITLE#') FROM dual;--TITLE#(�� ������ ���ڰ� ������ ��� ���� ����)

SELECT TRIM('     title    ') FROM dual; --title
SELECT TRIM('#' FROM '#####title###') FROM dual; --title

SELECT sysdate -1 as ����, sysdate  as ����,sysdate +1 as ����, sysdate +2 as "���� ��"--as �ڿ��� ���� �ַ��� ""�� �ؾ���
FROM dual;

SELECT last_name, FLOOR(sysdate - hire_date) as �ٹ���, hire_date  FROM employees;--���� ��¥���� �ٹ��� ��ŭ �� date�� ������

SELECT to_char(sysdate, 'MON MM MI DAY DY DD') FROM dual;--5�� 05 25 �ݿ��� �� 21
SELECT to_char(sysdate, 'HH12:MI:SS PM') FROM dual; -- 10:25:51 ����(AM���� �ϳ� PM���� �ϳ� ���縦 �������� ��

SELECT last_name, FLOOR(months_between(sysdate, hire_date)) as �ٹ����� FROM employees;

SELECT ADD_MONTHS(sysdate, 5) FROM dual;--21/10/21(���� ��¥21/05/21)

SELECT NEXT_DAY(sysdate, 'ȭ����') FROM dual;--21/05/25(���� 21.05.21 �ݿ����̹Ƿ� ���� ȭ������ 21/05/25)
SELECT NEXT_DAY(sysdate, '��') FROM dual;--21.05.27

SELECT LAST_DAY(sysdate) FROM dual;--21/05/31(21.5���� ������ ��)

SELECT TO_CHAR(sysdate, 'HH12:MI:SS:PM') FROM dual; --10:43:34:����
SELECT TO_CHAR(15000000, '999,999,999,999,999L') FROM dual;--15,000,000��
SELECT TO_CHAR(15000000, '000,000,000,000,000') FROM dual;--000,000,015,000,000

SELECT TO_NUMBER('15,000,000��', '999,999,999L') FROM dual;--15000000(�� ���ڷ� �ٽ� ���ƿ�)

SELECT * FROM employees;

SELECT
    last_name,
    department_id,
    DECODE(department_id, 90, 'Executive', 60, 'SOSO') as department_name FROM employees;

--����1 : ���޿� ���� �޿��� �ٸ��� �λ��Ͽ� ����غ�����
--IP_PROG : 15% �λ�, FI_ACCOUNT : 10% �λ�, ��� ������ CLERK : 5% �λ�
--���� �޿��� before_slary, �λ�� �޿��� after_salary
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
 









