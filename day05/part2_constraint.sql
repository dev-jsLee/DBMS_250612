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

-- 4. NOT NULL
-- NULL이란 값을 입력하지 않은 상태를 의미한다.
-- 기본적으로 모든 컬럼(열)은 NULL 값으로 둘 수 있다(NULLABLE)
-- NOT NULL이라는 제약조건을 설정함으로써 해당 컬럼의 값은
-- 비워둘 수 없는 제약을 가지게 된다.
-- 이는 반드시 값을 입력해야 하는 강제성을 부여한다.
CREATE TABLE TBL_NULL_TEST (
	ID INTEGER PRIMARY KEY,
	NAME VARCHAR2(20) NOT NULL,
	BIRTH_YEAR INTEGER
);

-- INSERT문을 실행할 때 값을 넣지 않길 원하는 컬럼은 적지 않았을 경우
-- 자동으로 NULL값이 INSERT 된다.
-- 그런데 해당 컬럼이 NOT NULL 제약조건을 가진 경우
-- 오류 메시지와 함께 INSERT문이 실패한다.
INSERT INTO TBL_NULL_TEST (ID, BIRTH_YEAR)
VALUES (1, 1993); -- NAME 컬럼은 NOT NULL이므로
-- 반드시 값을 NULL이 아닌 값으로 넣어주어야 한다.
INSERT INTO TBL_NULL_TEST(ID, NAME)
VALUES(1, '홍길동');

SELECT * FROM TBL_NULL_TEST;

-- 5. CHECK(조건식)
-- CHECK 제약조건은 뒤따라오는 조건식을 만족하는 값인 경우에만
-- INSERT 혹은 UPDATE를 했을 때만 입력이 가능하게 하는 제약 조건이다.
-- 즉, 조건식을 만족하지 못하면 값이 삽입, 변경되지 않는다.
-- 조건과 무관하게 NULL값이 허용된다.(NOT NULL을 주지 않았다면)
CREATE TABLE TBL_CHECK_TEST(
	ID INTEGER PRIMARY KEY,
	NAME VARCHAR2(20),
	-- GENDER 컬럼의 값은 'F' 혹은 'M' 중 하나여야 입력이 가능하다.
	GENDER CHAR(1) CHECK (GENDER IN ('F', 'M'))
);
INSERT INTO TBL_CHECK_TEST(ID, GENDER)
VALUES (3, 'A');
SELECT * FROM TBL_CHECK_TEST;

CREATE TABLE TBL_CHECK_SCORE(
	ID INTEGER PRIMARY KEY,
	NAME VARCHAR2(20),
	SCORE NUMBER(4, 1) CHECK(SCORE BETWEEN 0 AND 100)
);

INSERT INTO TBL_CHECK_SCORE(ID, NAME, SCORE)
VALUES (2, '홍길동', 99.9);

SELECT * FROM TBL_CHECK_SCORE;

-- 6. DEFAULT
-- 열에 값이 명시되지 않았을 때, 자동으로 입력될 값을 지정한다.
-- NOT NULL과 함께 사용할 필요가 없다.
-- 자동으로 값이 입력되기 때문에 NULL인 경우가 없게 된다.
-- 일반적으로 PK의 값을 자동으로 증가하는 값을 설정하거나
-- 나이와 같은 값을 입력하지 않았을 때 자동으로 0으로 설정되는 식으로
-- 주로 사용된다.
-- INSERT 되는 시스템 시간을 입력할 때에는
-- SYSDATE를 자동으로 입력되게 할 수 있다.
CREATE TABLE TBL_BOARD (
	ID INTEGER PRIMARY KEY,
	INSERT_DATE DATE DEFAULT SYSDATE
);

INSERT INTO TBL_BOARD(ID)
VALUES(3);
SELECT * FROM TBL_BOARD;

-- 실습)제약조건 모두 사용해보기
/* TBL_STUDENT
 * ID 정수 PK
 * NAME 가변문자열 20 NULL 불가
 * AGE 정수 CHECK 0 초과면서 100살 미만
 * SUB_CODE 정수 -- 과목코드
 * EMAIL 가변문자열 100 중복불가(NULL 허용)
 * ADMISSION_DATE 날짜 기본값 SYSDATE 설정
 * GENDER 고정길이문자열 1 '남' 또는 '여'만 가능하게 설정(NULL 불허)
 * */
-- TBL_STUDENT 
CREATE TABLE TBL_STUDENT(
-- ID 정수 PK
	ID INTEGER PRIMARY KEY,
-- NAME 가변문자열 20 NULL 불가
	NAME VARCHAR2(20) NOT NULL,
-- AGE 정수 CHECK 0 초과면서 100살 미만
	AGE INTEGER CHECK(AGE > 0 AND AGE < 100),
-- SUB_CODE 정수 -- 과목코드
	SUB_CODE INTEGER,
-- EMAIL 가변문자열 100 중복불가(NULL 허용)
	EMAIL VARCHAR2(100) UNIQUE,
-- ADMISSION_DATE 날짜 기본값 SYSDATE 설정
	ADMISSION_DATE DATE DEFAULT SYSDATE,
-- GENDER 고정길이문자열 3 '남' 또는 '여'만 가능하게 설정(NULL 불허)
--	NOT NULL 제약조건과 컬럼에 대한 IS NOT NULL 조건식은
--	내부적으로 다르게 처리되기 때문에
--	NULL 여부를 제약조건으로 거는 경우에는 조건식 대신에
--	NOT NULL을 사용하는 것이 관리에 용이하다.
--	GENDER CHAR(3) CHECK(GENDER IN ('남', '여')) NOT NULL
	GENDER CHAR(3) CHECK(GENDER IN ('남', '여') AND GENDER IS NOT NULL) 
);
DROP TABLE TBL_STUDENT;
INSERT INTO TBL_STUDENT(ID, NAME, GENDER)
VALUES (1, '홍길동', '남');
INSERT INTO TBL_STUDENT(ID, NAME, GENDER)
VALUES (2, '홍당무', '여');
INSERT INTO TBL_STUDENT(ID, NAME)
VALUES (3, '홍건적');
SELECT * FROM TBL_STUDENT;