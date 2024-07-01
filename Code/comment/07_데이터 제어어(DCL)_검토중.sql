/*************** 사용자 확인 ***************/
/* MYSQL 데이터베이스 사용 */
USE MYSQL;

/* 사용자 확인 */
SELECT  *
  FROM  USER;
  
/*************** 사용자 추가 ***************/
/* 사용자 아이디 및 비밀번호 생성 */
CREATE USER 'TEST'@LOCALHOST IDENTIFIED BY 'TEST';

/* 사용자 확인 */
SELECT  *
  FROM  USER;
  
/* 사용자 비밀번호 변경 */
SET PASSWORD FOR 'TEST'@LOCALHOST = '1234';

  
/*************** 권한 부여 및 제거 ***************/ 
/** 권한: CREATE, ALTER, DROP, INSERT, DELETE, UPDATE, SELECT 등  **/

/* 특정 권한 부여 */
GRANT SELECT, DELETE ON PRACTICE.회원테이블 TO 'TEST'@LOCALHOST;

/* 특정 권한 제거 */
REVOKE DELETE ON PRACTICE.회원테이블 FROM 'TEST'@LOCALHOST;

/* 모든 권한 부여 */
GRANT ALL ON Practice.회원테이블 TO 'TEST'@LOCALHOST;

/* 모든 권한 제거 */
REVOKE ALL ON Practice.회원테이블 FROM 'TEST'@LOCALHOST;


/*************** 사용자 삭제 ***************/ 
/* 사용자 삭제 */
DROP USER 'TEST'@LOCALHOST;

/* 사용자 확인 */
SELECT  *
  FROM  USER;
