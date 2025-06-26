-- part1_ALTER_CONSTRAINT.sql
CREATE TABLE TBL_CONST(
	ID INTEGER,
	NAME VARCHAR2(20)
);

-- ALTER문을 통한 제약조건의 추가와 삭제
-- 특정 테이블에 제약조건을 추가하거나 존재하는 제약조건을 삭제하려면
-- ALTER TABLE 테이블명
-- 을 먼저 작성하고 제약조건을 ADD할지 DROP할지를 결정해주면 된다.
-- 때문에 제약조건을 수정하는 경우에는 
-- 첫줄에 반드시 ALTER TABLE 테이블명을 먼저 작성해주어야 한다.
ALTER TABLE TBL_CONST
-- 제약조건의 추가
ADD CONSTRAINT
-- ADD CONSTRAINT 명령문을 이용하여 제약조건을 추가할 수 있다.
-- 이때 이 뒤에는 제약조건명을 작성하고
PK_CONST_ID
-- 해당 제약조건에 대한 조건식(CONDITION)을 그 뒤에 작성해주어야 한다.
-- PK를 추가하는 경우에는 PRIMARY KEY (컬럼명)을 사용
PRIMARY KEY (ID);

-- NAME 컬럼에 대해서 UNIQUE 제약조건 추가
ALTER TABLE TBL_CONST -- 이 테이블에 대해서 변경하겠다.
ADD CONSTRAINT UNI_CONST_NAME -- 제약조건을 추가하겠다.
UNIQUE(NAME); -- 그 제약조건은 UNIQUE이며, 컬럼 NAME에 추가하겠다.

-- 제약조건 삭제
ALTER TABLE TBL_CONST
DROP CONSTRAINT UNI_CONST_NAME;

-- 제약조건 중 PK의 삭제
-- PK는 하나만 존재할 수 있기 때문에
-- 제약조건의 이름을 명시할 필요가 없다.
ALTER TABLE TBL_CONST
DROP PRIMARY KEY; -- CONSTRAINT라는 말도 필요없다.