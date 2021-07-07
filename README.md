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
```C
--IP_PROG : 15% 인상, FI_ACCOUNT : 10% 인상
SELECT
    last_name,
     job_id,
    salary as before_slary,
     DECODE(job_id, 'IT_PROG', SALARY * 1.15, 'FI_ACCOUNT', SALARY * 1.10 ) as after_salary
    FROM employees WHERE JOB_ID NOT LIKE '%CLERK%'
```
*	Switch case 같은 역할을 한다(단 LIKE 구문 쓰지 못함)<br/>
![1](https://user-images.githubusercontent.com/82793713/124763468-f5502900-df6e-11eb-9115-29aef841c07d.png)
*	DECODE는 해당 컬럼의 값과 정확하게 일치하는 값만 이용할 수 있지만 CASE문은 조건을 사용할 수 있다
```C
--IP_PROG : 15% 인상, FI_ACCOUNT : 10% 인상, 모든 종류의 CLERK : 5% 인상
SELECT last_name, job_id, salary as before_salary , 
CASE WHEN job_id = 'IT_PROG' THEN salary * 1.15
WHEN job_id = 'FI_ACCOUNT' THEN salary * 1.1
WHEN job_id LIKE '%CLERK%' THEN salary * 1.05
ELSE salary
END AS after_salary
FROM employees;
```
### 9_그룹 함수(GROUP BY)
*	여러 행의 값을 특정 컬럼을 기준으로 그룹화 하는 함수들
*	특정 집단의 총합, 개수, 평균 등을 구할 수 있다
*	GROUP BY에 여러 컬럼을 설정할 수도 있다
*	그룹의 기준이 되는 컬럼은 GROUP BY절을 통해 선택(안해도 됨)
*	그룹 함수의 결과는 일반 컬럼과 함께 출력될 수 없다
*	GROUP BY로 나눠진 그룹에 조건을 주고 싶을 때는 HAVING절을 이용한다
*	GROUP BY는 2개 이상도 가능함
```C
부서별 평균 급여를 출력하되 해당 부서에 소속된 사원이 10명 이상인 부서만 불력
SELECT DEPARTMENT_ID, TRUNC(AVG(salary), 2) as "평균 급여",  COUNT(*) AS "사원 수" FROM employees GROUP BY DEPARTMENT_ID HAVING COUNT(*) >=10;
```
### 10_정렬
*	원하는 컬럼 기준으로 정렬하여 조회할 수 있다
*	ORDER BY 컬럼명 [ASC or DESC]
*	ASC : ASCENDING, 오름차순(생략 가능)
*	DESC : DESCENDING, 내림차순
*	해당 컬럼에 null이 포함되어 있는 경우=>오름차수(ASC)로 조회하면 가장 나중에 등장하고 내림차순(DESC)로 조회하면 가장 먼저 등장한다.
*	여러 개의 정렬 기준을 적용할 수 있다.
### 11_기본키와 외래키
#### 기본키
*	테이블에서 하나의 행을 유일하게 구분할 수 있는 컬럼(전화번호, 주민번호와 같은 것들임)
*	한 테이블 당 하나 밖에 설정할 수 없다
*	기본키가 될 수 있는 컬럼이지만 기본키로 설정되지 않은 컬럼은 ‘후보키(Candidate Key)’라고 한다.
*	기본키 컬럼에는 중복된 값이 없어야 하며 Null도 없어야 한다.
#### 외래키
*	다른 테이블에서는 기본키 또는 후보키이지만 해당 테이블에서는 중복되는 값인 컬럼
*	한 테이블 당 하나 밖에 설정할 수 없다
*	외래키가 설정된 테이블 간에는 관계가 형성된다
*	외래키로 설정된 컬럼에는 반드시 참조하는 테이블의 기본키로 이미 존재하는 값만 추가할 수 있다.
### 12_테이블 JOIN
*	기본키와 외래키로 관계가 형성되어 있는 테이블들의 정보를 종합하여 조회하는 것
#### CROSS JOIN
*	조인에 사용되는 테이블들의 데이터를 조합하여 나올 수 있는 모든 경우를 출력하는 JOIN
*	모든 경우를 출력하는 쓸모없는 정보
#### EQUI JOIN
*	두 테이블 간의 서로 동일한 값을 지닌 컬럼(기본키와 외래키)를 이용하여 CROSS JOIN의 결과에서 결과에서 의미있는 데이터만 걸러내는 JOIN
*	이때 양쪽 테이블 모두에 같은 이름을 지닌 컬럼이 있는 경우 어느쪽의 것인지 명확하게 명시해야함
#### SELF JOIN
*	하나의 테이블 내에서 자기 자신과 JOIN하여 원하는 데이터를 얻어내는 조인 방식
*	이때 SELF JOIN을 할 때에느 테이블 별칭을 사용할 수 밖에 없다
#### OUTER  JOIN
*	JOIN 조건을 만족하지 못해서 등장하지 못했던 행들을 확인할 때 사용하는 JOIN
*	(+)를 붙인쪽의 컬럼에 null을 추가해서라도 등장하지 못했던 행들을 확인할 수 있다.
#### ANSI INNER JOIN
*	조건에 맞는 행만 등장하는 JOIN  
*	JOIN에 이용되는 컬럼명이 같은 경우 USING을 이용해 쿼리문을 간소화 할 수 있다.
```C
시애틀에서 근무하는 모든 사원의 이름과 직책과 급여를 출력해보세요
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
```
#### ANSI OUTER JOIN
*	조건에 맞는 않는 행도 등장하는 JOIN
*	JLEFT/RIGHT/FULL을 선택해야 한다
*	LEFT OUTER JOIN : 왼쪽에 나오는 아우터 조인, 즉 오른쪽에 (+)을 붙인 것과 같다
*	RIGHT OUTER JOIN : 오른쪽에 나오는 아우터 조인, 즉 왼쪽에 (+)을 붙인 것과 같다
*	FULL OUTER JOIN : 양쪽에 나오는 아우터 조인, 즉 양쪽에 (+)을 붙인 것과 같다

#### ANSI JOIN을 사용하면 조인 조건과 WHERE 조건절을 구분하여 사용할 수 있고 USING에 사용된 컬럼을 어느 테이블의 컬럼인지 명시할 필요가 없어진다

### 11_서브쿼리
*	하나의 SELECT문 내부에 포함된 또 하나의 SELECT문
*	서브쿼리를 포함하고 있는 쿼리를 메인 쿼리라고 한다.
*	서브쿼리는 메인 쿼리가 실행되기 전에 한번만 실행된다
```C
--Sigal과 같은 부서에 근무하는 모든 사원 조회해보기
SELECT
    *
FROM
    employees
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            employees
        WHERE
            first_name = 'Sigal'
    );
```
### 12_DML (Data Manipulation Language, 데이터 조작어)
*	SELECT : 테이블의 데이터 조회
*	INSERT : 테이블의 데이터 생성
*	DELETE : 테이블의 데이터 삭제
*	UPDATE : 테이블의 데이터 수정
### 13_DDL (Data Definitaion Language, 데이터 정의어)
*	테이블, 시퀀드, 뷰.. 등 DB에서 사용하는 오브젝트 구조를 생성할 때 사용하는 명령어
*	CREATE : DB오브젝트 생성
*	DROP : DB 오브젝트 삭제
*	ALTER : DB 오브젝트 수정
*	TRUNCATE : DB 오브젝트 완전 삭제
### 14_DCL (Data Control Language, 데이터 조작어)
*	DB의 사용자들이 관리하는 명령어
*	GRANT : 사용자에게 권한을 부여
*	REVOKE : 사용자의 권한을 회수
### 15_테이블 다루기
#### 테이블 데이터 추가하기
*	INSERT INTO 테이블명(컬럼명1, 컬럼명2, …) VALUES(값1, 값2, …)
```C
INSERT INTO coffees(coffee_id, cname, price) VALUES (1, '아메리카노', 2000);
```
*	일부 컬럼에만 데이터 추가하기
```C
INSERT INTO coffees(cname, price) VALUES ('팥빙수', 5500);
```
*	컬럼명을 생략하고 데이터 추가하기
```C
INSERT INTO coffees VALUES (6, '눈꽃빙수', 6500);
```
*	INSERT INTO 테이블명 (서브쿼리) : 서브쿼리를 테이블에 INSERT 할 수 있다.
```C
INSERT INTO coffees (SELECT * FROM coffees);
```
#### 테이블 데이터 수정하기
*	UPDATE 테이블명 SET 컬럼=값, 컬럼=값, … WHERE 조건;
*	UPDATE 조건을 설정하지 않으면 모든 행을 수정한다
*	조건이 있다면 조건을 만족하는 모든 행을 수정한다
*	하나의 행을 구분할 수 있는 기본키와 함께 사용되는 경우가 많다
```C
UPDATE coffees SET price = 1000 WHERE price is null;
UPDATE coffees SET price = 2000 WHERE cname LIKE '%아메리카노%';
UPDATE coffees SET price = price + 500 WHERE cname LIKE '%아이스%';
UPDATE coffees SET price = 5000, coffee_id = 100 WHERE cname LIKE '%빙수';
```
*   여러 컬럼을 수정할 때는 쉼표를 사용한다
*   Raplace(컬럼 이름, 바꾸고 싶은 데이터, 바꿀려는 데이터)
#### 테이블 데이터 삭제하기
*	DELETE FROM 테이블명 WHRER 조건
*	조건에 맞는 행 전체를 삭제한다 (특정 컬럼 값만 삭제하는 것은 UPDATE에 해당한다)
*	삭제 조건을 설정하지 않으면 모든 행을 삭제한다
*	조건이 있다면 조건을 만족하는 모든 행을 삭제한다
*	하나의 행을 구분할 수 있는 기본키와 함께 사용되는 경우가 많다

#### 기타
*	CRATE TABLE 테이블명 AS(서브쿼리)로 테이블을 생성할 수 있다
*	테이블에 새 컬럼 추가하기
```C
ALTER TABLE 테이블명 ADD (컬럼명 컬렴타입, …)
```
*	테이블의 컬럼 이름 변경하기
```C
ALTER TABLE 테이블명 RENAME COLUMN 현재이름 TO 바꿀이름
```
*	테이블 이름 변경하기
```C
RENAME 현재테이블명 TO 바꿀테이블명
```
*	컬럼 타입 변경하기
```C
ALTER TABLE 테이블명 MODIFY (컬럼명 컬럼타입, …);
```
*	컬럼 삭제하기
```C
ALTER TABLE 테이블명 DROP COLUMN 컬럼명
```
### 16_트랜잭션
*	데이터 처리의 한 단위
*	하나의 논리적인 작업이 완전하게 마무리 될 때 까지의 절차
*	하나의 트랜잭션은 여러 명령어의 집합이다
*	트랜잭션의 모든 과정이 정상적으로 완료되는 경우에만 변경 사항을 확정짓는다 (all or nothing)
*	트랜잭션을 관리하기 위해 사용되는 TCL로는 COMMIT, ROLLBACK, SAVEPOINT가 있다.
*	트랜잭션은 마지막으로 실행된 커밋(또는 롤백)이후부터 새로운 커밋을 시랭하는 시점까지 수행하는 모든 DML을 의미한다
*	첫번째 COMMIT부터 쭈욱 진행하다가 ROLLBACK을 시전하면 첫번째 COMMIT으로 돌아가게 되는데 이때 CREATE TABLE은 DDL이므로
다시 돌아간 COMMIT에는 CREATE TABLE까지 반영된다.(나머지는 반영 X)
*	INSERT. UPDATE, DELETE는 DML이기 때문에 ROLLBACK으로 다시 되둘릴 수 있다.
*	CREATE TABLE, DROP TABLE, TRUNCATE TABLE 등의 DDL은 트랜잭션으로 관리할 수 없다
*	SAVAPOINT로 잡아놓고  ROLLBACK TO로 세이브 포인트로 해놨던 곳으로 이동 가능(단 ROLLBACK을 하면 마지막 COMMIT으로 이동!)
### 17_제약 조건
#### 데이터 무결성
*	데이터에는 결점이 없어야 한다는 뜻
*	개체 무결성, 참조 무결성, 도메인 무결성 ……
#### 개체 무결성
*	테이블의 데이터는 반드시 한 행을 구분할 수 있어야 한다.
*	체 무결성을 지키기 위한 제약 조건으로 PK(기본키)를 사용한다
#### 참조 무결성
*	참조 관계에 있는 데이터는 항상 일관된 값을 가져야 한다
*	참조 무결성을 지키기 위한 제약 조건으로 FK(외래키)를 사용한다
#### 도메인 무결성
*	해당 컬럼을 구성하는 도메인들은 항상 타입이 일정해야 한다
*	테이블의 컬럼 타입 설정 및 CHECK를 통해서 도메인 무결성을 지킬 수 있다
#### 데이터 무결성약 조건
*	NOT NULL : 해당 컬럼에 null을 허용하지 않는 규칙
*	UNIQUE : 해당 컬럼에 중복되는 값을 허용하지 않는 규칙. 항상 유일한 값을 갖도록 한다
*	PRIMARY KEY : 해당 컬럼을 기본키로 설정한다. NOU NULL + UNIQUE. 테이블 당 하나
*	FOREIGN KEY : 해당 컬럼을 외래키로 설정한다.
*	CHECK : 원하는 데이터의 조건을 직접 지정하여 도메인 무결성을 유지할 수 있다
#### 제약조건을 추가하는 방법
1.	테이블 생성과 동시에 제약조건 추가하기
```C
컬럼명 컬럼타임 CONSTRAINT 제약조건명 제약조건타입
```
2.	테이블 생성 후 제약조건 추가하기
```C
ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건타입(컬럼명)
```
#### 컬럼을 참조하는 방법
*	컬럼을 만듦과 동시에 참조하게 하는 쿼리문
```C
ALTER TABLE (테이블명) ADD ((참조할새컬럼) (유형) CONSTRAINT (CONSTRAINT이름) REFERENCES (참조연결할 테이블 이름(컬럼));
ALTER TABLE fruits3 ADD (lid NUMBER(2) CONSTRAINT FRUITS3_LID_FK REFERENCES fruit_locations(lid));
```
*	존재하는 컬럼을 참조하는 쿼리문
```C
ALTER TABLE (테이블명) MODIFY ((참조할컬럼) (유형) CONSTRAINT (CONSTRAINT이름) REFERENCES (참조연결할 테이블 이름(컬럼));
ALTER TABLE fruits3 MODIFY (lid NUMBER(2) CONSTRAINT FRUITS3_LID_FK REFERENCES fruit_locations(lid));
```
### 18_시퀀스
*	기본키로 사용하기 편하도록 설계된 자동 번호 생성기
*	User_sequences 데이터 딕셔너리로 확인할 수 있다.
```C
CREATE SEQUENCE 시퀀스명
    [START WITH n] – 시퀸스의 시작 번호 설정
	[INCREMENT BY n] – 시퀀스의 증가값 설정
	[MAXVALUE n | NOMAXVALUE] – 최대값 설정
	[MINVALUE n | NOMINVALUE] – 최소값 설정
	[CYCLE | NOCYCLE] -최대값에 도달했을 때 순환 여부 설정
	[CACHE n | NOCACHE] – 메모리상에 미리 만들어 놓을 시퀀스의 개수 설정
CREATE SEQUENCE sodas_seq START WITH 4 INCREMENT BY 1;
```
#### 시퀀스 쓰는 법
```C
INSERT INTO 테이블명 VALUES (시퀸스명.nextval, 데이터1, 데이터2, …) --순차적으로 데이터를 넣는 방법
SELECT sodas_seq.currval FROM dual;--현재 몇 번째 번호까지 사용증인지 알고 싶을 때
DROP SEQUENCE 시퀀스명-시퀀스 삭제
ALTER SEQUENCE 시퀀스명 (이후 CREATE SEQUENCE와 같음)-시퀀스 수정
```
### 19_뷰
*	물리적인 기본 테이블들을 이용해 생성한 논리적인 가상의 테이블
*	기본 테이블에서 파생된 DB 객체
*	사용자는 주어진 뷰를 통해 기본 테이블을 제한적으로 사용하게끔 할 수 있다.
#### 뷰 만들기
*	CREATE OR REPLACE VIEW [스키마.][뷰 이름] AS SELECT문
```C
CREATE OR REPLACE VIEW dept30_view AS 
    SELECT * 
    FROM employees 
    WHERE department_id = 50
    WITH CHECK OPTION;
```


