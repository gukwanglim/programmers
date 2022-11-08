-- https://school.programmers.co.kr/learn/courses/30/lessons/59414

-- ANIMAL_INS 테이블에 등록된 모든 레코드에 대해, 각 동물의 아이디와 이름, 들어온 날짜1를 조회하는 SQL문을 작성해주세요. 이때 결과는 아이디 순으로 조회해야 합니다.

SELECT      ANIMAL_ID, 
            NAME,
            DATE_FORMAT(DATETIME,'%Y-%m-%d') as '날짜'
from        ANIMAL_INS
order by    ANIMAL_ID

-- 날짜 데이터를 가져오기 위해서는 DATE_FORMAT을 사용하여 DATE_FORMAT(컬럼명, '가져올 방식')으로 작성해야 한다.