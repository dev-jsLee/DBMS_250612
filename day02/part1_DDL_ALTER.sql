-- part1_DDL_ALTER.sql
-- ALTER 명령어
-- 기존 테이블의 구조나 이름을 변경할 때 사용하는 DDL 명령어 중 하나다
-- 기본적으로 테이블의 일부 정보를 변경할 때에는
-- ALTER TABLE을 시작으로 내용을 입력한다.

-- 1. 새로운 열 추가
-- ALTER TABLE [테이블명] ADD (추가할 열 정보);
ALTER TABLE TBL_TEST ADD (
--	ADDRESS VARCHAR2(50),
	HOBBY VARCHAR2(20)
);

-- 2. 기존 열 삭제
-- ALTER TABLE [테이블명]
-- DROP COLUMN [삭제할 컬럼명];
ALTER TABLE TBL_TEST
DROP COLUMN HOBBY;

-- 3. 열의 데이터타입 변경
-- ALTER TABLE [테이블명]
-- MODIFY NAME VARCHAR2(100);
ALTER TABLE TBL_TEST
MODIFY NAME VARCHAR2(100);

-- 4. 열 이름 변경
-- ALTER TABLE [테이블명]
-- RENAME COLUMN [기존컬럼명] TO [새로운 컬럼명];
ALTER TABLE TBL_TEST
RENAME COLUMN NAME TO FULL_NAME;

-- 5. 테이블 이름 변경
-- ALTER TABLE [테이블명]
-- RENAME TO [새로운 테이블명];
ALTER TABLE TBL_TEST
RENAME TO TBL_TEST_NEW;

SELECT *
FROM TBL_TEST_NEW;