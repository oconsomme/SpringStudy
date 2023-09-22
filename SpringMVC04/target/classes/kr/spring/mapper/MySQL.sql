-- SQL 문장 작성 --

CREATE TABLE BOARD (
	IDX INT NOT NULL AUTO_INCREMENT,
	MEMID VARCHAR(20) NOT NULL,
	TITLE VARCHAR(100) NOT NULL,
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(30) NOT NULL,
	INDATE DATETIME DEFAULT NOW(),
	COUNT INT DEFAULT 0,
	PRIMARY KEY(IDX)
);

SELECT * FROM BOARD;

--DROP TABLE BOARD;

INSERT INTO BOARD(TITLE, CONTENT, WRITER)
VALUES('가','가가','가가가');

INSERT INTO BOARD(TITLE, CONTENT, WRITER)
VALUES('나','나나','나나나');

INSERT INTO BOARD(TITLE, CONTENT, WRITER)
VALUES('다','다다','다다다');

INSERT INTO BOARD(TITLE, CONTENT, WRITER)
VALUES('라','라라','라라라');

INSERT INTO BOARD(TITLE, CONTENT, WRITER)
VALUES('마','마마','마마마');

SELECT * FROM BOARD;

-- 회원 테이블 --
CREATE TABLE MEMBER(
	MEMIDX INT AUTO_INCREMENT,
	MEMID VARCHAR(20) NOT NULL,
	MEMPASSWORD VARCHAR(20) NOT NULL,
	MEMNAME VARCHAR(20) NOT NULL,
	MEMAGE INT,
	MEMGENDER VARCHAR(20),
	MEMEMAIL VARCHAR(50),
	MEMPROFILE VARCHAR(50),
	PRIMARY KEY (MEMIDX)
);

INSERT INTO MEMBER (MEMID, MEMPASSWORD,	MEMNAME, MEMAGE, MEMGENDER, MEMEMAIL, MEMPROFILE)
VALUES('admin','1234','관리자',20,'남자','admin@gmail.com','');

SELECT * FROM MEMBER;

