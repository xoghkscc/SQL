CREATE TABLE coffees(
    coffee_id NUMBER(5),
    cname VARCHAR2(50),
    price NUMBER(5)
);
--휴지통 보기
show recyclebin;

--삭제한 테이블 되돌리기
flashback table coffees to before drop;

--휴지통 비우기
purge recyclebin;

SELECT * FROM user_tables;

SELECT * FROM all_tables 
