-- DB 사용 선언
USE PRACTICE;

-- 데이터 조회를 위한 명령어 순서
--(계속) SELECT -> WHERE -> WHERE -> GROUP BY -> HAVING -> ORDER BY




-- FROM
-- Customer 테이블 모든 열 조회
SELECT  *
  FROM  CUSTOMER;



-- WHERE
-- 성별이 남성인 조건으로 필터링
SELECT  *
  FROM  CUSTOMER
 WHERE  GENDER = 'MAN';
 
 

-- GROUP BY : GROUP BY 컬럼명과 SELECT 컬럼명이 같아야 함
-- COUNT : 행들의 개수를 구하는 집계함수
-- 지역별로 회원수 집계
SELECT  ADDR
		  ,COUNT(MEM_NO) AS 회원수
  FROM  CUSTOMER
 WHERE  GENDER = 'MAN'
 GROUP BY  ADDR;
    

-- HAVING
-- 집계 회원수 100명 미만 조건으로 필터링
SELECT  ADDR
		  ,COUNT(MEM_NO) AS 회원수
  FROM  CUSTOMER
 WHERE  GENDER = 'MAN'
 GROUP BY  ADDR
HAVING  COUNT(MEM_NO) < 100;
    


-- ORDER BY(DESC : 내림차순, ASC(기본) : 오름차순)
-- 집계 회원수가 높은 순으로 정렬
SELECT  ADDR
		  ,COUNT(MEM_NO) AS 회원수
  FROM  CUSTOMER
 WHERE  GENDER = 'MAN'
 GROUP BY  ADDR
HAVING  COUNT(MEM_NO) < 100
 ORDER BY  COUNT(MEM_NO) DESC;
    



-- FROM -> (WHERE) -> GROUP BY
-- FROM -> GROUP BY 순으로 작성해도 됨
SELECT  ADDR
		,COUNT(MEM_NO) AS 회원수
  FROM  CUSTOMER
/* WHERE  GENDER = 'MAN' */
 GROUP BY  ADDR;



-- GROUP BY + 집계함수
-- IN : 특수 연산자로 IN (List) 안에 리스트 값만 사용
-- 거주지역을 서울, 인천 조건으로 필터링
-- 거주지역 및 성별로 회원수 집계
SELECT  ADDR
		  ,GENDER
		  ,COUNT(MEM_NO) AS 회원수
  FROM  CUSTOMER
 WHERE  ADDR IN ('SEOUL', 'INCHEON')
 GROUP BY  ADDR
		     ,GENDER;



-- SQL 명령어 작성법 정리
-- (계속) 회원테이블(Customer)을
-- (계속) 성별이 남성 조건으로 필터링하여
-- (계속) 거주지역별로 회원수 집계
-- (계속) 집계 회원수 100명 미만 조건으로 필터링
-- (계속) 모든 열 조회
-- (계속) 집계 회원수가 높은 순으로 정렬

SELECT  ADDR
		,COUNT(MEM_NO) AS 회원수
  FROM  CUSTOMER
 WHERE  GENDER = 'MAN'
 GROUP BY  ADDR
HAVING  COUNT(MEM_NO) < 100
 ORDER BY  COUNT(MEM_NO) DESC;














