-- part2_DDL_DROP_TRUNC.sql
-- DROP 테이블 등의 삭제
-- DROP 명령어는 주로 테이블과 같은
-- DBMS 객체를 삭제할 때 사용하는 명령어다.
-- DROP TABLE [테이블명]
DROP TABLE TBL_TEST_NEW;
-- DROP 명령어로 삭제한 테이블은 롤백 기능을 통해 복구할 가능성은 있다.
-- 하지만 데이터를 하나하나 지우면서 로그를 남기기 때문에
-- 삭제하는 속도 자체는 느린 편이다.
-- 실무적으로 DROP TABLE을 쓸 일은 거의 없다고 보면 된다.
SELECT *
FROM TBL_TEST_NEW;