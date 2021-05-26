desc coffees;

SELECT * FROM coffees ORDER BY coffee_id;

INSERT INTO coffees(coffee_id, cname, price) VALUES (1, '아메리카노', 2000);
INSERT INTO coffees(coffee_id, cname, price) VALUES (2, '아이스 아메리카노', 2500);
INSERT INTO coffees(coffee_id, cname, price) VALUES (3, '카페라떼', 3000);


-- 일부 컬럼에만 데이터 추가(데이터를 넣지 않은 컬럼은 null이 됨
INSERT INTO coffees(cname, price) VALUES ('팥빙수', 5500);
INSERT INTO coffees(cname) VALUES ('망고빙수');

--컬럼명을 생략하고 데이터 추가
INSERT INTO coffees VALUES (6, '눈꽃빙수', 6500);
INSERT INTO coffees VALUES (6, '딸기빙수');

INSERT INTO coffees(price, cname, coffee_id) VALUES (4000, '카페모카', 8);
INSERT INTO coffees(price, coffee_id, cname) VALUES (4000, 9, '카라멜 마끼야또');

INSERT INTO coffees (SELECT * FROM coffees);

UPDATE coffees SET price = 1000 WHERE price is null;
UPDATE coffees SET price = 2000 WHERE cname LIKE '%아메리카노%';
UPDATE coffees SET price = price + 500 WHERE cname LIKE '%아이스%';
UPDATE coffees SET price = 5000, coffee_id = 100 WHERE cname LIKE '%빙수';

--연습1 : 빙수도 아니고 아메리카노도 아닌 모든 제품들의 가격을 3천원으로 수정

UPDATE coffees SET price = 3000 WHERE cname NOT LIKE '%빙수' AND cname NOT LIKE '%아메리카노%' ;

COMMIT;

SELECT * FROM coffees;

DELETE FROM coffees WHERE cname LIKE '%빙수';

ROLLBACK;













