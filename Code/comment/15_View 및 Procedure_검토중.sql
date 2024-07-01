USE PRACTICE;

/****************************************************************************/
/************************************VIEW************************************/
/****************************************************************************/

/***************테이블 결합***************/
/* 주문(Sales) 테이블을 기준으로 상품(Product) 테이블과 LEFT JOIN을 통해 결합함 */
/* 주문 테이블의 모든 행을 유지하면서, 상품 테이블의 일치하는 데이터를 결합함 */

SELECT  A.*
        ,A.SALES_QTY * B.PRICE AS 결제금액
  FROM  SALES AS A
  LEFT
  JOIN  PRODUCT AS B
    ON  A.PRODUCT_CODE = B.PRODUCT_CODE;


/***************VIEW 생성***************/
/* 위의 쿼리를 뷰로 생성하여, 재사용이 가능하도록 함 */

CREATE VIEW SALES_PRODUCT AS
SELECT  A.*
        ,A.SALES_QTY * B.PRICE AS 결제금액
  FROM  SALES AS A
  LEFT
  JOIN  PRODUCT AS B
    ON  A.PRODUCT_CODE = B.PRODUCT_CODE;


/***************VIEW 실행***************/
/* 생성한 뷰를 실행하여 데이터를 조회함 */

SELECT  *
  FROM  SALES_PRODUCT;


/***************VIEW 수정***************/
/* 기존 뷰를 수정하여, 결제금액에 수수료(10%)를 포함하도록 변경함 */

ALTER VIEW SALES_PRODUCT AS
SELECT  A.*
        ,A.SALES_QTY * B.PRICE * 1.1 AS 결제금액_수수료포함
  FROM  SALES AS A
  LEFT
  JOIN  PRODUCT AS B
    ON  A.PRODUCT_CODE = B.PRODUCT_CODE;  
    
/* 수정된 뷰를 확인하기 위한 조회 */
SELECT  *
  FROM  SALES_PRODUCT;   
  

/***************VIEW 삭제***************/
/* 더 이상 필요하지 않은 뷰를 삭제함 */

DROP VIEW SALES_PRODUCT;
    

/***************VIEW 특징(중복되는 열 저장 안됨)***************/
/* 뷰는 중복된 열을 저장하지 않으며, 테이블과 같은 방식으로 생성할 수 있음 */
       
CREATE VIEW SALES_PRODUCT AS
SELECT  *
  FROM  SALES AS A
  LEFT
  JOIN  PRODUCT AS B
    ON  A.PRODUCT_CODE = B.PRODUCT_CODE;
    
    
    
/****************************************************************************/
/********************************PROCEDURE***********************************/
/****************************************************************************/

/***************IN 매개변수***************/    
/* 프로시저는 특정 작업을 수행하는 데 사용되며, 입력 매개변수를 받을 수 있음 */

/* DELIMITER: 여러 명령어들을 하나의 블록으로 묶을 때 사용됨 */
DELIMITER //
CREATE PROCEDURE CST_GEN_ADDR_IN( IN INPUT_A VARCHAR(20), INPUT_B VARCHAR(20) )
BEGIN
	SELECT  *
	  FROM  CUSTOMER
	 WHERE  GENDER = INPUT_A
	   AND  ADDR = INPUT_B;
END //
DELIMITER ;

/* 특정 성별과 주소를 가진 고객을 조회하는 프로시저 생성 */

/***************PROCEDURE 실행***************/
/* 프로시저를 실행하여, 매개변수로 'MAN'과 'SEOUL'을 전달함 */
CALL CST_GEN_ADDR_IN('MAN', 'SEOUL');

/* 프로시저를 실행하여, 매개변수로 'WOMEN'과 'INCHEON'을 전달함 */
CALL CST_GEN_ADDR_IN('WOMEN', 'INCHEON');


/***************PROCEDURE 삭제***************/
/* 더 이상 필요하지 않은 프로시저를 삭제함 */
    
DROP PROCEDURE CST_GEN_ADDR_IN;


/**************OUT 매개변수***************/    
/* OUT 매개변수는 프로시저 실행 후 결과 값을 반환 받을 때 사용됨 */

DELIMITER //
CREATE PROCEDURE CST_GEN_ADDR_IN_CNT_MEM_OUT( IN INPUT_A VARCHAR(20), INPUT_B VARCHAR(20), OUT CNT_MEM INT )
BEGIN
	SELECT  COUNT(MEM_NO)
	  INTO  CNT_MEM
	  FROM  CUSTOMER
	 WHERE  GENDER = INPUT_A
	   AND  ADDR = INPUT_B;
END //
DELIMITER ;

/* 특정 성별과 주소를 가진 고객 수를 반환하는 프로시저 생성 */

/***************PROCEDURE 실행***************/
/* 프로시저를 실행하고, 결과를 @CNT_MEM 변수에 저장함 */
CALL CST_GEN_ADDR_IN_CNT_MEM_OUT('WOMEN', 'INCHEON', @CNT_MEM);
SELECT  @CNT_MEM;


/**************IN/OUT 매개변수***************/    
/* INOUT 매개변수는 프로시저 실행 전에 입력값을 받고, 실행 후 값을 반환함 */

DELIMITER //
CREATE PROCEDURE IN_OUT_PARAMETER( INOUT COUNT INT)
BEGIN
	SET COUNT = COUNT + 10;
END //
DELIMITER ;

/* 입력값을 10 증가시키는 프로시저 생성 */

/***************PROCEDURE 실행***************/
/* 초기값을 설정하고, 프로시저를 실행하여 결과를 확인함 */
SET @counter = 1;
CALL IN_OUT_PARAMETER(@counter);
SELECT  @counter;
