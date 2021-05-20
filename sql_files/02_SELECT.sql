select first_name from employees;
select first_name, salary from employees;

select * from tabs;
select * from tab;
select table_name form tabs;

select * from employees;

/*
    #연습용 테이블 설명
    EMPLOYEES : 사원 정보를 저장한 테이블
    DEPARTMENTS : 부서 정보를 저장한 테이블
    JOBS : 직급 정보를 저장한 테이블
    LOCATIONS : 지역 정보를 저장한 테이블
    COUNTRIES : 국가 정보를 저장한 테이블
    REGIONS : 대륙 정보를 저장한 테이블
    
    
*/

select * from departments;
select * from locations;
select * from jobs;

desc employees;
desc departments;
desc jobs;
dESc countries;

select * from countries;





--연습1 : 모든 사원의 사원번호/이름/월급/부서번호만 조회해보세요

desc employees;
select EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID from employees;

select EMPLOYEE_ID as 사원번호, FIRST_NAME as 이름, SALARY as 월급, DEPARTMENT_ID as 부서번호 from employees;

select last_name, salary+500 from employees;
select last_name, salary*2 from employees;

select * from employees;

select last_name, salary, commission_pct from employees;
select last_name, salary * (1 + nvl(commission_pct, 0)) as 보너스적용후 from employees;

--연습2: 모든 사원들의 사번/가족이름/연봉을 출력해보세요.
desc employees;
select employee_id, last_name, SALARY * (1 + nvl(commission_pct, 0)) *12 as 연봉 from employees;

--*select distinct : 중복되는 내용이 여러 개 있어도 한번만 출력된다.
select distinct job_id from employees;


