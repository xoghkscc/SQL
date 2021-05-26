COMMIT;

SELECT * FROM coffees;

TRUNCATE TABLE coffees; --테이블의 모든 내용을 자른다. DROP TABLE과 다르게 구조는 남긴다.

ROLLBACK;

-- 연습 1: coffees 테이블에 원하는 새로운 컬럼을 추가해 보세요.

ALTER TABLE coffees ADD (product_type_id NUMBER(4));
CREATE TABLE product_types(product_type_id NUMBER(4), product_type_name VARCHAR2(4), manager_id NUMBER(2));
desc product_types;
-- 연습 2: 컬럼의 이름도 몇 개 변경해 보세요
ALTER TABLE coffees RENAME COLUMN coffee_id TO product_number;

--연습 3 INSER문을 사용해 제대로 된 메뉴를 5개 이상 넣어보세요.
INSERT
    INTO coffees (
        coffee_number,
        cname,
        price,
        product_type_id
    )
VALUES (1,
    '아메리카노',
    2000,
    1001
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '딸기케잌',
    6000,
    1002
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '이쁜 텀블러',
    10000,
    1003
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES (( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '카페라떼',
    4000,
    1001
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '몬생긴 텀블러',
    8000,
    1003
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '바나나케잌',
    7500,
    1002
);

INSERT
    INTO coffees (
        product_number,
        cname,
        price,
        product_type_id
    )
VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees),
    '바나나케잌',
    7500,
    1002
);

ALTER TABLE product_types MODIFY (product_type_name VARCHAR2(20));

INSERT INTO product_types (
    product_type_id,
    product_type_name,
    manager_id
) VALUES (
    1001,
    '커피 관리자',
    10
);

INSERT INTO product_types (
    product_type_id,
    product_type_name,
    manager_id
) VALUES (
    1002,
    '케잌 관리자',
    20
);

INSERT INTO product_types (
    product_type_id,
    product_type_name,
    manager_id
) VALUES (
    1003,
    '물건 관리자',
    30
);

INSERT INTO coffees VALUES ( ( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '감자탕', 8000, null, null);              
SAVEPOINT save01;

DELETE FROM coffees WHERE product_number BETWEEN 3 AND 10;
SAVEPOINT save02;

UPDATE coffees SET cname = replace(cname, '아메리', '이탈리');
SAVEPOINT save03;

ROLLBACK TO save02;

ROLLBACK;




INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '아인슈페너', 8000, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '카푸치노', 6500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '카페 비엔나', 7000, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '에스프레소', 1500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '콜드 브루', 5000, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '에스프레소 콘파나', 5000, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '카페오레', 4500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '카푸치노', 4500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '비너 멜랑쉬', 7500, 1001);

INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '크랜베리아몬드 쿠기', 3500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '모카초코칩 쿠키', 3500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '더블초코칩 쿠키', 3500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '치즈 케이크', 4500, 1001);
INSERT INTO coffees(product_number, cname, price,product_type_id) VALUES(( SELECT
             MAX(product_number) + 1
            FROM
                coffees), '초코무스 케이크', 4500, 1001);

ALTER TABLE coffees ADD(bitter CHAR(15));
UPDATE coffees SET bitter = '★★★☆☆';

commit;


-- employees의 직원들이 자신이 받을 수 있는 월급 범위 내에서 
-- 몇 퍼센트 수준의 월급을 받고 있는지 보기 좋은 형태로 조회(커미션도 포함
-- (즉 jobs에 가서 max_salary를 참고





