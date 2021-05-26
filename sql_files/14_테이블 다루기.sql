CREATE TABLE coffees2 AS (SELECT * FROM coffees);--커피 테이블 복사

CREATE TABLE bingsu AS (SELECT * FROM coffees WHERE cname LIKE '%빙수');--커피 테이블 중 cname이 빙수인 데이터만 복사

RENAME bingsu TO bingsoo;

INSERT INTO bingsoo(cname) VALUES('민트초코카페라떼파인애플고수나물빙수');
--데이터 추가 불가능(애초에 cname을 var50으로 설정했기 때문)
ALTER TABLE bingsoo MODIFY (cname VARCHAR2(60));
--이젠 들어가짐

UPDATE bingsoo SET coffee_id = 101, price = 7500 WHERE cname = '민트초코카페라떼파인애플고수나물빙수';

ALTER TABLE bingsoo DROP COLUMN syrup;

INSERT INTO bingsoo (coffee_id,cname,price) VALUES ((SELECT max(coffee_id)+1 FROM bingsoo ),'오늘의 커피',2500);
        



        
       
    

    

