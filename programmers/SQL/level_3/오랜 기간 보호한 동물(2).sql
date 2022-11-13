-- https://school.programmers.co.kr/learn/courses/30/lessons/59411

-- 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.

SELECT      T1.ANIMAL_ID,
            T1.NAME
from        ANIMAL_INS T1, 
            ANIMAL_OUTS T2
where       T1.ANIMAL_ID = T2.ANIMAL_ID
order by    T2.DATETIME - T1.DATETIME desc
limit       2

-- 오랜 기간 보호한 동물(1) 문제와 흡사하지만, 생각해보면 입양을 간 동물의 리스트에서 정보를 추출하면 되는 문제이다.
-- 때문에 굳이 join을 사용하지 않고도 두 테이블을 한 번에 불러 들이고, 그 안에서 조건을 찾게 된다면 쉽게 풀리는 문제이다.