CREATE TABLE fruits (fid NUMBER(2) PRIMARY KEY, fname VARCHAR2(20) NOT NULL);
--UNIQUE
ALTER TABLE fruits MODIFY (fname VARCHAR2(20) UNIQUE);
--CHECK() 내부에 원하는 조건을 추가
ALTER TABLE fruits ADD (fcolor VARCHAR2(5) CHECK(fcolor IN ('RED', 'GREEN', 'BLUE')));
SELECT * FROM user_constraints;

INSERT INTO fruits VALUES (2, 'Apple', 'RED');
INSERT INTO fruits VALUES (3, 'Banana', 'BLUE');

ALTER TABLE fruits DROP CONSTRAINT sys_c007042;
ALTER TABLE fruits DROP CONSTRAINT SYS_C007040;
ALTER TABLE fruits MODIFY (fcolor VARCHAR(10));

UPDATE fruits SET fcolor = 'Yellow' WHERE fname = 'Banana';

ALTER TABLE fruits ADD CONSTRAINT FRUITS_FID_PK PRIMARY KEY(fid);

ALTER TABLE fruits3 ADD (fprice NUMBER(7) DEFAULT 0);
ALTER TABLE fruits3 MODIFY (fprice NUMBER(7) DEFAULT 10);

ALTER TABLE fruits3 DROP CONSTRAINT FRUITS3_FSIZE_NN;

SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';
fruit_locations(lid);
CREATE TABLE fruit_locations (
    lid NUMBER(2),
    addr VARCHAR2(200),
    city VARCHAR2(40)
);
INSERT INTO fruit_locations VALUES (10, '충청북도 청주시', '청주');
INSERT INTO fruit_locations VALUES (20, '경상북도 안동시', '안동');
INSERT INTO fruit_locations VALUES (30, '전라남도 고흥군', '고흥');
INSERT INTO fruit_locations VALUES (40, '충청남도 논산', '논산');
--ALTER TABLE fruits3 ADD CONSTRAINT FRUITS2_LID_FK FOREIGN KEY (lid);
ALTER TABLE fruit_locations ADD CONSTRAINT FLO_LID_UK UNIQUE(lid);
--fruit_locations에 lid 컬럼에 UNIQUE 제약조건 달기
ALTER TABLE fruits3 ADD (lid NUMBER(2) CONSTRAINT FRUITS3_LID_FK REFERENCES fruit_locations(lid));
--fruits3에 lid라는 컬럼을 만들고 FRUITS3_LID_FK이라는 제약조건 이름에 fruit_locations에 lid라는 컬럼을 참조한다는 뜻
--fruit_locations에 lid 컬럼에 UNIQUE 제약조건이 없으면 오류가 생김

INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(1, 'Apple', 'Red', 'L', 10);
INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) VALUES(2, 'Banana', 'Red', 'N', 20);

ALTER TABLE fruits3 MODIFY (lid NUMBER(2) CONSTRAINT FRUITS3_LID_FK REFERENCES fruit_locations(lid));

SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';




CREATE TABLE fruits4 (
    fid NUMBER(4),
    fname VARCHAR2(20) CONSTRAINT F4_FNAME_NN NOT NULL,
    fcolor VARCHAR2(10) CONSTRAINT F4_FCOLOR_NN NOT NULL,
    fsize CHAR(1),
    fprice NUMBER(7) DEFAULT 0,
    lid NUMBER(2),
    CONSTRAINT F4_FID_PK PRIMARY KEY (fid),
    CONSTRAINT F4_FNAME_UK UNIQUE (fname),
    CONSTRAINT F4_FISZE_CHK CHECK(fsize IN ('L', 'N', 'S')),
    CONSTRAINT F4_LID_FK FOREIGN KEY (lid) REFERENCES fruit_locations (lid) 
);
desc fruits4;

-- 연습 1 : N 관계를 가지는 두 테이블을 생성한 후 연결해보세요
--모든 제약 조건을 최소 한번 이상 사용할 것, 각 테이블에 데이터 3개씩 넣어볼 것

CREATE TABLE customer_Info (
    cid NUMBER(4),--OK
    cname VARCHAR2(20) CONSTRAINT CI_CNAME_NN NOT NULL,
    cnum VARCHAR2(20) CONSTRAINT CI_CNUM_UK UNIQUE,
    cadrr VARCHAR2(20),--OK
    crank NUMBER(2),--ok
    CONSTRAINT CI_CID_PK PRIMARY KEY (cid)
);

ALTER TABLE customerInfo MODIFY (cadrr VARCHAR2(20) DEFAULT 0);

ALTER TABLE customerInfo ADD CONSTRAINT CI_CRANK_CHK CHECK ( crank IN (10, 20, 30));

INSERT INTO customerinfo VALUES (1, '김태환', '010-5625-7327', '서울', '10');
INSERT INTO customerinfo VALUES (2, '권혁준', '010-7777-7777', '제주도', '20');
INSERT INTO customerinfo VALUES (3, '이고객', '010-7777-7778', '미국', '30');


CREATE TABLE customer_rank (
    crank NUMBER(4) CONSTRAINT CR_CRANK_UK UNIQUE,
    caccumulate NUMBER(2,2) CONSTRAINT CR_CACCUMULATE_NN NOT NULL,
    csale NUMBER(2,2) CONSTRAINT CR_CSALE_NN NOT NULL
    CONSTRAINT CR_CACCUMULATE_UK UNIQUE
);

ALTER TABLE customer_rank MODIFY (crank NUMBER(2));

INSERT INTO customer_rank VALUES (10, 0.2, 0.3);
INSERT INTO customer_rank VALUES (20, 0.3, 0.4);
INSERT INTO customer_rank VALUES (30, 0.4, 0.5);

ALTER TABLE customer_info MODIFY (crank NUMBER(2) CONSTRAINT CI_CRANK_FK REFERENCES customer_rank(crank));

SELECT * FROM customer_rank;

INSERT INTO fruits3(fid, fname, fcolor, fsize, lid) 
VALUES(3, 'Kiwi', 'Olive', 'S', 10);
DELETE FROM fruit_locations WHERE lid = 40;--얘는 삭제가 가능하나
DELETE FROM fruit_locations WHERE lid = 10;--얘는 삭제 불가능

SELECT * FROM user_constraints WHERE table_name = 'FRUITS3';

ALTER TABLE fruits3 DROP CONSTRAINT FRUITS3_LID_FK;
commit;
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_LID_FK FOREIGN KEY (lid) REFERENCES
    fruit_locations(lid) ON DELETE CASCADE;
ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_LID_FK FOREIGN KEY (lid) REFERENCES
    fruit_locations(lid) ON DELETE SET NULL;

ALTER TABLE fruits3 ADD CONSTRAINT FRUITS3_LID_FK FOREIGN KEY (lid) REFERENCES
    fruit_locations(lid) ON DELETE SET NULL;

DELETE FROM fruit_locations WHERE lid = 10;

ROLLBACK;
