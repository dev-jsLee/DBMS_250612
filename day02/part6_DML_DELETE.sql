-- part6_DML_DELETE.sql
-- DELETE문
-- 기존 데이터 행을 삭제할 때 사용된다.
-- WHERE절을 이용하여 조건에 맞는 행만 골라서 삭제할 수도 있다.
-- DELETE FROM [테이블명]
-- WHERE [조건식];
DELETE FROM TBL_INSERT 
WHERE NAME = '이준상2';
-- WHERE절을 생략하면 모든 행에 대해서 삭제가 진행되므로
-- 신중히 사용할 필요가 있다.
-- 이때 TRUNCATE처럼 테이블의 구조는 남지만 데이터는 모두 삭제된다.

-- DELETE와 TRUNCATE의 차이
-- DELETE문은 TRUNCATE와 달리 로그를 남기기 때문에 속도가 느린 편이며
-- 대신 롤백이 가능하다.

-- 로그를 남기지 않기 때문에 속도는 빠르지만 로그를 통해 복구할 수가 없다.


SELECT *
FROM TBL_INSERT;