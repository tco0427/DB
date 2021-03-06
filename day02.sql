--꽃과 화분 구현

CREATE TABLE FLOWER(
	NAME VARCHAR2(20),
	COLOR VARCHAR2(10),
	PRICE NUMBER(6)
);
ALTER TABLE FLOWER ADD CONSTRAINT FLOWER_PK PRIMARY KEY(NAME);

SELECT * FROM FLOWER;

CREATE TABLE POT(
	ID VARCHAR2(10),
	COLOR VARCHAR2(20),
	SHAPE VARCHAR2(20),
	NAME VARCHAR2(20),
	CONSTRAINT POT_PK PRIMARY KEY(ID),
	CONSTRAINT POT_FK FOREIGN KEY(NAME) REFERENCES FLOWER(NAME)
);

SELECT * FROM POT;

INSERT INTO HR.FLOWER
(NAME, COLOR, PRICE)
VALUES('장미', '빨간색', 5000);

INSERT INTO HR.FLOWER
(NAME, COLOR, PRICE)
VALUES('해바라기', '노란색', 7000);

INSERT INTO HR.FLOWER
(NAME, COLOR, PRICE)
VALUES('할미꽃', '하얀색', 9000);

SELECT * FROM FLOWER;

INSERT INTO HR.POT
(ID, COLOR, SHAPE, NAME)
VALUES('2019123001', '검은색', '나의 집', '할미꽃');

INSERT INTO HR.POT
(ID, COLOR, SHAPE, NAME)
VALUES('2019123002', '검은색', '나의 집', '장미');

INSERT INTO HR.POT
(ID, COLOR, SHAPE, NAME)
VALUES('2019123003', '검은색', '나의 집', '해바라기');

INSERT INTO HR.POT
(ID, COLOR, SHAPE, NAME)
VALUES('2019123004', '하얀색', '음악세상', '장미');

SELECT * FROM POT;

DELETE FROM HR.POT
WHERE ID='2019123002';

DELETE FROM HR.POT
WHERE ID='2019123004';

DELETE FROM HR.FLOWER
WHERE NAME='장미';

SELECT * FROM FLOWER;

DROP TABLE POT;
DROP TABLE FLOWER;
---------------------------------------------------------------------------------
--내가한거

CREATE TABLE OWNER(
	NAME VARCHAR2(10),
	AGE NUMBER(2),
	GENDER CHAR(1)
);

ALTER TABLE OWNER ADD CONSTRAINT OWNER_PK PRIMARY KEY(NAME);

SELECT * FROM OWNER;

CREATE TABLE PET(
	NAME VARCHAR2(10),
	"TYPE" VARCHAR2(10),
	GENDER CHAR(1) DEFAULT 'M',
	ONAME VARCHAR2(10),
	CONSTRAINT PET_PK PRIMARY KEY(NAME),
	CONSTRAINT PET_FK FOREIGN KEY(ONAME) REFERENCES OWNER(NAME)
);

ALTER TABLE PET ADD CONSTRAINT BAN_CAHR CHECK(GENDER IN('M','W'));

DROP TABLE PET;
DROP TABLE OWNER;
---------------------------------------------------------------------------------
CREATE TABLE OWNER(
	ID VARCHAR2(20),
	NAME VARCHAR2(20),
	AGE NUMBER(3),
	ADDRESS VARCHAR2(40),
	CONSTRAINT OWNER_PK PRIMARY KEY(ID)
);
CREATE TABLE PET(
	PIN VARCHAR2(20),
	NAME VARCHAR2(20),
	ID VARCHAR2(20),
	AGE NUMBER(3),
	GENDER CHAR(1) DEFAULT 'M' NOT NULL CONSTRAINT CHECK_CHAR CHECK(GENDER IN('W','M')),
	"TYPE" VARCHAR2(20),
	CONSTRAINT PET_PK PRIMARY KEY(PIN),
	CONSTRAINT PET_FK FOREIGN KEY(ID) REFERENCES OWNER(ID)
);

INSERT INTO HR.OWNER
(ID, NAME, AGE, ADDRESS)
VALUES('2019000001', '한동석', 20, '강남구 역삼동');
INSERT INTO HR.OWNER
(ID, NAME, AGE, ADDRESS)
VALUES('2019000002', '홍길동', 30, '관악구 봉천동');

INSERT INTO HR.PET
(PIN, NAME, ID, AGE, GENDER, "TYPE")
VALUES('1912300001', '뽀삐', '2019000001', 3, 'W' , '진돗개');
INSERT INTO HR.PET
(PIN, NAME, ID, AGE, GENDER, "TYPE")
VALUES('1912300002', '멍멍이', '2019000001', 5, 'M' , '말티즈');
INSERT INTO HR.PET
(PIN, NAME, ID, AGE, GENDER, "TYPE")
VALUES('1912300003', '바둑이', '2019000002', 10, 'M' , '시바견');

SELECT * FROM PET;


DROP TABLE PET;
DROP TABLE OWNER;
DROP TABLE STUDENT;
---------------------------------------------------------------------------------
--DML

--PLAYER 테이블에서 TEAM_ID가 'K01'인 선수 검색
SELECT * FROM PLAYER
WHERE TEAM_ID='K01';

--PLAYER 테이블에서 TEAM-ID가 'K01'이 아닌 선수 검색
SELECT * FROM PLAYER
WHERE TEAM_ID!='K01';

--PLAYER 테이블에서 WEIGHT가 70이상이고 80이하인 선수 검색
SELECT * FROM PLAYER
WHERE WEIGHT >=70 AND WEIGHT <= 80;

--<=,>=일 때
SELECT * FROM PLAYER
WHERE WEIGHT BETWEEN 70 AND 80;

--PLAYER 테이블에서 TEAM_ID가 'K03이고 HEIGHT가 180미만인 선수
SELECT * FROM PLAYER
WHERE TEAM_ID='K03' AND HEIGHT< 180;

--실습
--PLAYER 테이블에서 TEAM_ID가 'K06'이고 NICKNAME이 '제리'인 선수 검색
--PLAYER 테이블에서 HEIGHT가 170이상이고 WEIGHT가 80이상인 선수 이름 검색
--STADIUM 테이블에서 SEAT_COUNT가 30000초과이고 41000이하인 경기장 검색
--PLAYER 테이블에서 TEAM_ID가 'K02'이거나 'K07이고 포지션은 'MF'인 선수 검색

SELECT * FROM PLAYER
WHERE TEAM_ID='K06' AND NICKNAME='제리';

SELECT * FROM PLAYER
WHERE HEIGHT>=170 AND WEIGHT>=80;

SELECT * FROM STADIUM
WHERE SEAT_COUNT>30000 AND SEAT_COUNT<=41000;

--AND와OR의 우선순위
--OR보다 AND가 우선순위가 높음
--IN이 AND보다 우선순위가 높음
SELECT * FROM PLAYER
WHERE (TEAM_ID='K02' OR TEAM_ID='K07')AND "POSITION"='MF';

SELECT * FROM PLAYER
WHERE TEAM_ID IN('K02','K07') AND "POSITION"='MF';

--PLAYER테이블에서 TEAM_ID가 'K01'인 선수 이름을 내 이름으로 바꾸기
UPDATE PLAYER
SET PLAYER_NAME ='한동석'
WHERE TEAM_ID='K01';

SELECT * FROM PLAYER
WHERE TEAM_ID='K01';

--PLAYER 테이블에서 포지션이 'MF'인 선수 삭제하기
DELETE FROM PLAYER
WHERE "POSITION" ='MF';

SELECT * FROM PLAYER
WHERE "POSITION"='MF';

--PLAYER 테이블에서 HEIGHT가 180 이상인 선수 삭제하기
DELETE FROM PLAYER
WHERE HEIGHT>=180;

SELECT * FROM PLAYER
WHERE HEIGHT>=180;