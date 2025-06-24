-- part2_constraint.sql
-- 제약조건의 종류
-- 제약조건이란, 중복을 허용하지 않거나
-- NULL값의 허용 여부, PK, FK 등
-- 해당 컬럼의 값에 대해서 그 범위나 입력방식에 제약을 거는 것을
-- 제약 조건이라고 부른다.

-- *제약조건의 주요 목적
-- 데이터의 정확성과 일관성을 보장
-- 규칙에 맞지 않는 데이터가 DB에 저장되는 것을 방지
-- DB의 신뢰성을 높임

-- 1. 기본키(Primary Key)
-- PK라고 주로 불리며, 해당 테이블에 하나만 존재할 수 있다.
-- PK로 지정된 컬럼은 중복 불가, NULL값 불가 등의 제약사항이 붙으며
-- 이 컬럼의 값을 이용해 각각의 행을 고유하게 구분할 수 있다.
-- -> 구분자/식별자(identifier)

-- 2. 외래키(Foreign key)
-- 다른 테이블의 PK를 참조하는 컬럼을 지정하는 제약조건으로
-- 다른 테이블의 고유한 행을 참조해오기 때문에
-- 같은 대상에 대해서 FK를 사용하는 서로 다른 테이블간에도
-- 같은 개체/대상을 가리키는 개체 무결성, 참조 무결성을 보장할 수 있다.
-- 테이블간의 관계를 정의하는 핵심적인 역할을 한다.
-- 참조되는 부모 테이블의 해당 행이 삭제되었을 때
-- 참조하는 자식 테이블의 해당 PK를 참조하는 행에 대해서
-- 어떤 동작을 수행할지 지정할 수 있다.
-- 1. CASCADE: 같이 삭제 2. SET NULL: FK 값을 NULL로 설정

-- 3. UNIQUE
-- 열 또는 열의 조합에 중복된 값이 없도록 보장한다.
-- NULL값은 허용한다. 즉, 해당 컬럼의 값 중 여러 개의 NULL이
-- 존재할 수 있다.(OracleDB의 경우)
-- 테이블당 여러 개의 컬럼이 각각 UNIQUE 제약조건을 가질 수 있다.
-- 주로 이메일과 같이 PK는 아닌 후보키 컬럼에 대해서
-- 중복을 방지하는 목적으로 사용된다.

CREATE TABLE TBL_TEAM (
	TEAM_ID INTEGER PRIMARY KEY,
	TEAM_NAME VARCHAR2(20) UNIQUE
);

CREATE TABLE TBL_MEMBER (
	ID INTEGER PRIMARY KEY, -- 각 행을 고유하게 가리킬 값
	NAME VARCHAR2(20), -- 따로 제약사항 없음
	EMAIL VARCHAR2(50) UNIQUE, -- 중복 불가, NULL값 허용
	FK_TEAM_ID INTEGER, -- FK로 설정할 컬럼 정의
	-- 위에서 한 단어로 설정할 수 없는 FK의 경우 아래에서 따로 설정
	CONSTRAINT FK_TEAM_ID -- 제약조건의 이름 설정
	FOREIGN KEY (FK_TEAM_ID) -- 현재 테이블의 FK컬럼명
	REFERENCES TBL_TEAM(TEAM_ID) -- 참조할 부모 테이블명과 PK컬럼명
);







