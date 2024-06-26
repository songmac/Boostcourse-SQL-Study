/* Practice 데이터베이스 사용 */
USE Practice;

/*************** 테이블 생성(Create) ***************/
/* (회원테이블 존재할 시, 회원테이블 삭제) */
DROP TABLE 회원테이블;

/* 회원테이블 생성 */
CREATE TABLE 회원테이블 (
    회원번호 INT PRIMARY KEY,  /* 기본 키 설정: 중복 불가, NULL 불가 */
    이름 VARCHAR(20),          /* 회원의 이름을 저장 */
    가입일자 DATE NOT NULL,    /* 회원의 가입 일자를 저장 (NULL 허용 안됨) */
    수신동의 BIT               /* 수신 동의 여부를 저장 (1 또는 0) */
);

/* 회원테이블 조회 */
SELECT * FROM 회원테이블;


/*************** BEGIN + 취소(ROLLBACK) ***************/  
/* 트랜잭션 시작 */
BEGIN;

/* 데이터 삽입 */
INSERT INTO 회원테이블 VALUES (1001, '홍길동', '2020-01-02', 1);

/* 회원테이블 조회 */
SELECT * FROM 회원테이블;

/* 트랜잭션 취소 */
ROLLBACK;

/* 회원테이블 조회 */
SELECT * FROM 회원테이블;


/*************** BEGIN + 실행(COMMIT) ***************/  
/* 트랜잭션 시작 */
BEGIN;

/* 데이터 삽입 */
INSERT INTO 회원테이블 VALUES (1005, '장보고', '2020-01-06', 1);

/* 트랜잭션 실행 */
COMMIT;

/* 회원테이블 조회 */
SELECT * FROM 회원테이블;


/*************** 임시 저장(SAVEPOINT) ***************/ 
/* (회원테이블에 데이터 존재할 시, 데이터 모두 삭제) */
DELETE FROM 회원테이블;

/* 회원테이블 조회 */
SELECT * FROM 회원테이블;

/* 트랜잭션 시작 */
BEGIN;

/* 데이터 삽입 */
INSERT INTO 회원테이블 VALUES (1005, '장보고', '2020-01-06', 1);

/* SAVEPOINT 지정 */
SAVEPOINT S1;

/* 1005 회원 이름 수정 */
UPDATE 회원테이블
   SET 이름 = '이순신';
 
/* SAVEPOINT 지정 */
SAVEPOINT S2;

/* 1005 회원 데이터 삭제 */
DELETE FROM 회원테이블;
 
/* SAVEPOINT 지정 */
SAVEPOINT S3;

/* 회원테이블 조회 */
SELECT * FROM 회원테이블;

/* SAVEPOINT S2 저장점으로 ROLLBACK */
ROLLBACK TO S2;
 
/* 회원테이블 조회 */
SELECT * FROM 회원테이블;

/* 트랜잭션 실행 */
COMMIT;

/* 회원테이블 조회 */
SELECT * FROM 회원테이블;
