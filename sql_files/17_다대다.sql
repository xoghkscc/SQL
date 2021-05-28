CREATE TABLE menu ( namdid NUMBER(2), name VARCHAR2(10), price NUMBER(6),  menu_order CHAR);

ALTER TABLE menu RENAME COLUMN namdid to nameid;

DROP TABLE menu;
INSERT INTO menu VALUES (1, '짜장면', 5000, 'A'); 
INSERT INTO menu VALUES (2, '짬뽕', 6000); 
INSERT INTO menu VALUES (3, '탕수육', 20000); 
INSERT INTO menu VALUES (4, '짬뽕밥', 8000); 


ALTER TABLE menu  ADD CONSTRAINT MENU_NAMEID_PK PRIMARY KEY (nameid);

ALTER TABLE menu DROP COLUMN menu_order;



CREATE TABLE menuorder (customer_name VARCHAR2(10), namdid NUMBER(2));

ALTER TABLE menu RENAME COLUMN name to name_product;

ALTER TABLE menuorder MODIFY (nameid NUMBER(2) CONSTRAINT MENUORDER_NAMEID_FK
REFERENCES menu(nameid));

INSERT INTO menuorder VALUES ('A', 2, to_char(SYSDATE + 6/24, 'yymmdd:hh')); 
INSERT INTO menuorder VALUES ('A', 1, to_char(SYSDATE + 6/24, 'yymmdd:hh')); 
INSERT INTO menuorder VALUES ('A', 4, to_char(SYSDATE + 6/24, 'yymmdd:hh')); 
INSERT INTO menuorder VALUES ('B', 4); 
INSERT INTO menuorder VALUES ('C', 2); 
INSERT INTO menuorder VALUES ('C', 2); 

CREATE TABLE customer (customer_name VARCHAR2(10), limit_price NUMBER(8));
INSERT INTO customer VALUES ('A', 1000000); 
INSERT INTO customer VALUES ('B', 2000000); 
INSERT INTO customer VALUES ('C', 800000); 

ALTER TABLE customer ADD CONSTRAINT CUSTOMER_CUSTOMERNAME_PK PRIMARY KEY (customer_name);

ALTER TABLE menuorder MODIFY (customer_name VARCHAR2(10) CONSTRAINT MENUORDER_CUSTOMERNAME_FK
REFERENCES customer(customer_name));

ALTER TABLE menuorder ADD (order_time VARCHAR2(10));

UPDATE menuorder SET order_time = to_char(SYSDATE, 'yymmdd:hh:mm:ss') WHERE customer_name = 'A';
UPDATE menuorder SET order_time = to_char(SYSDATE+1, 'yymmdd:hh') WHERE customer_name = 'B';
UPDATE menuorder SET order_time = to_char(SYSDATE-1, 'yymmdd:hh') WHERE customer_name = 'C';


--A가 시킨 메뉴 출력, 가격 총합 출력

--a가 시킨 메뉴 출력
SELECT 
    name_product,
    price
FROM
    menu
    INNER JOIN menuorder USING (nameid)
WHERE
    customer_name = 'A';

--a가 시킨 메뉴의 총합 출력(시간대 별로)

SELECT 
    sum(price),
    order_time
FROM
    menu
    INNER JOIN menuorder USING (nameid)
GROUP BY
    order_time,
    customer_name
HAVING
    customer_name = 'A';


--한도가 넘는 손님들의 정보 조회
SELECT DISTINCT
    customer_name,
    limit_price
    FROM
    menu
    INNER JOIN menuorder USING (nameid)
    INNER JOIN customer USING (customer_name)
WHERE
    limit_price IN (
        SELECT
            limit_price
        FROM
             menu
          INNER JOIN menuorder USING (nameid)
         INNER JOIN customer USING (customer_name)
         GROUP BY limit_price
         HAVING 
            limit_price < sum(price)
    );

--한도가 넘는 손님들의 정보 조회

SELECT 
    customer_name,
    sum(price),
    limit_price,
    order_time
FROM
    menu
    INNER JOIN menuorder USING (nameid)
    INNER JOIN customer USING (customer_name)
GROUP BY   
    customer_name,
    limit_price,
    order_time
HAVING
    limit_price < sum(price);


