
CREATE TABLE TBLBOARD(
	IDX INT NOT NULL,
	MEMID VARCHAR(20) NOT NULL,
	TITLE VARCHAR(100) NOT NULL,
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(30) NOT NULL,
	INDATE DATETIME DEFAULT NOW(),
	COUNT INT DEFAULT 0,
	-- 댓글 기능 추가 --
	BOARDGROUP INT, -- 부모 댓글 하나의 그룹 --
	BOARDSEQUENCE INT, -- 같은 그룹 안에서 댓글의 순서 --
	BOARDLEVEL INT, -- 1단계 댓글인지 2단계 댓글인지에 대한 정보 --
	BOARDAVAILABLE INT, -- 삭제된 글인지 여부 --
	PRIMARY KEY(IDX)
);

SELECT * FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1), 
'aischool', '공지사항입니다.', '다음 주 월요일 정상 등원하겠습니다', '교육운영부',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1), 
'KK', '호올스', '레몬민트맛', 'KK',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;


INSERT INTO TBLBOARD
SELECT IFNULL(MAX(IDX + 1), 1), 
'BERRY', '호올스', '후르츠믹스맛', 'BERRY',
NOW(), 0, IFNULL(MAX(BOARDGROUP + 1), 1), 0, 0, 1
FROM TBLBOARD;

CREATE TABLE TBLMEMBER(
	MEMID VARCHAR(50) NOT NULL,
	MEMPWD VARCHAR(50) NOT NULL,
	MEMNAME VARCHAR(50) NOT NULL,
	MEMPHONE VARCHAR(50) NOT NULL,
	MEMADDR VARCHAR(100), 
	LATITUDE DECIMAL(13, 10), -- 현재위치위도 --
	LONGITUDE DECIMAL(13, 10), -- 현재위치경도 --
	PRIMARY KEY(MEMID)
);

SELECT * FROM TBLMEMBER;

INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES('aischool', '1234', '교육운영부', '010-1111-2222');

INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES('KK', '1234', 'KK', '010-3333-4444');

INSERT INTO TBLMEMBER(MEMID, MEMPWD, MEMNAME, MEMPHONE)
VALUES('BERRY', '1234', 'BERRY', '010-5555-6666');