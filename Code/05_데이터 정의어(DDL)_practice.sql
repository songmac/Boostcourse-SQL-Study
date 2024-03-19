-- Practice DB 생성
CREATE DATABASE Practice;
-- DB 사용
USE Practice;


-- Table 생성
CREATE TABLE 회원테이블 (
회원번호 INT PRIMARY KEY,
이름 VARCHAR(20),
가입일자 DATE NOT NULL,
수신동의 BIT
);
SELECT * FROM 회원테이블;


-- Table 열 추가
ALTER TABLE 회원테이블 ADD 성별 VARCHAR(2);
SELECT * FROM 회원테이블;


-- Table 열 데이터 타입 변경
ALTER TABLE 회원테이블 MODIFY VARCHAR(2O);


-- Table 열 이름 변경
ALTER TABLE 회원테이블 CHANGE 성별 성 VARCHAR(2);


-- Table명 변경
ALTER TABLE 회원테이블 RENAME 회원정보;
SELECT * FROM 회원테이블; # 이름 변경되어서 조회x
SELECT * FROM 회원정보;


-- Table 삭제
DROP TABLE 회원정보;
SELECT * FROM 회원정보;


