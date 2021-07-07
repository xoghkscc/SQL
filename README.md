# OracleSQL
### 1_SQL 계정 만들기 및 권한 주기
```C
grant create session to 계정이름;
grant connect to 계정이름;
grant resource to 계정이름;
```
### 2_존재하는 컬럼을 보기
```C
DESC (테이블 명);
```
### 3_SELECT 컬럼명 FROM 테이블명;
*	데이터를 조회하는 쿼리문
*	컬럼명에 *를 쓰는 것은 모든 컬럼을 뜻한다.
*	쿼리문도 대소문자를 구분하지 않는다.
*	컬럼명/테이블명은 대소문자를 구분하지 않는다.
*	데이터는 대소문자를 구분한다
*	컬럼명 as 바꿀 컬럼명이름을 하면 출력될 때 바뀐 컬럼명 이름으로 출력 가능
```C
SELECT * FROM tab(or tabs) : 어떤 테이블들이 있는지 확인할 수 있다.
```
#### 산술 연산할 때 null값이 있는 경우 
*	NULL 값이 있는 경우 nvl을 사용하여 대체값을 사용
```C
SELECT last_name, salary * (1 + nvl(commission_pct, 0)) FROM employees;//
```
### 4_SELECT 컬럼명 FROM 테이블명 WHERE 조건절;
*	SELECT문에 WHERE절을 추가하여 해당 조건을 만족하는 데이터만 조회할 수 있다
```C
SELECT * FROM employees WHERE salary >= 15000;//급여가 15000달러 이상인 직원의 정보만을 출력
```
### 5_LIke
*	데이터의 일부분으로 원하는 내용을 검색할 수 있다.
*	문자 타입과 날짜 타입에 사용할 수 있다
*	% : 길이 제한 없이 아무 문자열이나 와도 되는 와일드카드(심지어 없는 것도 가능)
*	_ : 하나의 아무 문자가 반드시 와야하는 와일드카드
```C
--이름이 J로 시작하는 모든 사원을 조회
SELECT first_name FROM employees WHERE first LIKE 'J%'
--이름의 두번째 글자가 u인 모든 사원을 조회
SELECT first_name FROM employees WHERE first LIKE '_u%'
--이름이 두번째 글자가 e인 모든 사원을 조회
SELECT first_name FROM employees WHERE first LIKE '__e%'
--이름에 x가 포함되어 있는 모든 사원을 조회
SELECT first_name FROM employees WHERE first LIKE '%x%'
```
### 6_집합
*	UNION :합집합(중복은 알아서 제거됨)단 같은 테이블끼리 해야함(단 같은 열을 지니고 있으면 다른 테이블도 가능)
```C
SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
UNION
SELECT * FROM departments WHERE employees BETWEEN 30 and 50;
```
*	UNION ALL : 합집합(중복 제거 안함)
```C
SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
UNION ALL
SELECT * FROM departments WHERE department_id BETWEEN 30 and 50;
```
*	INTERSECT : 교집합
```C
SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
INTERSECT
SELECT * FROM departments WHERE department_id BETWEEN 30 and 50;
```
*	MINUM : 차집합
```C
SELECT * FROM departments WHERE department_id BETWEEN 10 and 40
MINUS
SELECT * FROM departments WHERE department_id BETWEEN 30 and 50;
```
### 7_함수
*	ABC(n) : n의 절대값
*	FLOOR(d) : 내림
*	ROUND(n) : 반올림
*	CEIL(n) : 올림
*	MOD(n, m) : 나머지 연산
*	TRUNC(d, m) : 지정한 자리 값 이하를 잘라낸다
*	sysdate : 오늘 날짜
*	TO_CHAR : 숫자를 문자로 바꾸거나, 날짜를 문자로 바꾼다, 바꿀 때 형식을 이용할 수 있어서 편리하다.
```C
SELECT TO_CHAR(TRUNC(sysdate, 'year'), 'YYYY/MM/DD HH24:MI:SS') FROM dual;--2021/01/01 00:00:00
```
*	TO_NUMBER : 문자를 숫자로 변환. 포맷을 이용해 다시 숫자로 변환할 수 있다
```C
SELECT TO_NUMBER('15,000,000￦', '999,999,999L') FROM dual;--15000000(즉 숫자로 다시 돌아옴)
```
### 8_DECODE(컬럼명, 조건1, 결과1, 조건2, 결과2, ……)
*	특정 컬럼의 값을 통해 표시할 데이터를 선택한다
*	Switch case 같은 역할을 한다(단 LIKE 구문 쓰지 못함)
![1](https://user-images.githubusercontent.com/82793713/124763468-f5502900-df6e-11eb-9115-29aef841c07d.png)



