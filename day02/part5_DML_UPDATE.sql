-- part5_DML_UPDATE.sql
-- UPDATE문 데이터 수정
-- UPDATE문은 기존에 삽입된 데이터를 수정할 때 사용된다.
-- 특정 조건에 맞는 데이터를 업데이트할 수 있다.
-- 조건에 맞는 여러 행을 일괄적으로 수정할 수 있다.
-- SELECT문처럼 WHERE절을 작성하지 않으면
-- 모든 행, 데이터에 대해서 수정이 일어나기 때문에
-- 데이터 손실 가능성에 대해 경고문이 출력된다.
-- UPDATE [테이블명]
-- SET [컬럼명]=[값1], [컬럼명2]=[값2],...
-- WHERE [조건식]; -- 옵션
SELECT NAME, AGE, SEAT_NUM
FROM TBL_INSERT;

-- TBL_INSERT의 SEAT_NUM을 모두 0으로 설정하려고 한다.
UPDATE TBL_INSERT
SET SEAT_NUM=0;

-- NAME의 값이 '홍길동'일 경우 SEAT_NUM을 1로 바꿔보자.
UPDATE TBL_INSERT
SET SEAT_NUM=2
WHERE NAME='홍';