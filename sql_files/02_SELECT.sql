select first_name from employees;
select first_name, salary from employees;

select * from tabs;
select * from tab;
select table_name form tabs;

select * from employees;

/*
    #������ ���̺� ����
    EMPLOYEES : ��� ������ ������ ���̺�
    DEPARTMENTS : �μ� ������ ������ ���̺�
    JOBS : ���� ������ ������ ���̺�
    LOCATIONS : ���� ������ ������ ���̺�
    COUNTRIES : ���� ������ ������ ���̺�
    REGIONS : ��� ������ ������ ���̺�
    
    
*/

select * from departments;
select * from locations;
select * from jobs;

desc employees;
desc departments;
desc jobs;
dESc countries;

select * from countries;





--����1 : ��� ����� �����ȣ/�̸�/����/�μ���ȣ�� ��ȸ�غ�����

desc employees;
select EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID from employees;

select EMPLOYEE_ID as �����ȣ, FIRST_NAME as �̸�, SALARY as ����, DEPARTMENT_ID as �μ���ȣ from employees;

select last_name, salary+500 from employees;
select last_name, salary*2 from employees;

select * from employees;

select last_name, salary, commission_pct from employees;
select last_name, salary * (1 + nvl(commission_pct, 0)) as ���ʽ������� from employees;

--����2: ��� ������� ���/�����̸�/������ ����غ�����.
desc employees;
select employee_id, last_name, SALARY * (1 + nvl(commission_pct, 0)) *12 as ���� from employees;

--*select distinct : �ߺ��Ǵ� ������ ���� �� �־ �ѹ��� ��µȴ�.
select distinct job_id from employees;


