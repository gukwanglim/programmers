-- https://school.programmers.co.kr/learn/courses/30/lessons/59043

-- 관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 
-- 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.

SELECT      T1.ANIMAL_ID,
            T1.NAME
from        ANIMAL_INS T1, 
            ANIMAL_OUTS T2
where       T1.ANIMAL_ID = T2.ANIMAL_ID and T1.DATETIME > T2.DATETIME
order by    T1.DATETIME

-- 오랜 기간 보호한 동물(2) 문제와 마찬가지로 테이블 두 개를 가지고 비교하면 된다.

SELECT O.ANIMAL_ID, O.NAME
FROM ANIMAL_OUTS O
JOIN ANIMAL_INS I
ON I.ANIMAL_ID = O.ANIMAL_ID
WHERE I.DATETIME > O.DATETIME
ORDER BY I.DATETIME ASC

-- 물론, join을 이용하여 풀 수도 있다.