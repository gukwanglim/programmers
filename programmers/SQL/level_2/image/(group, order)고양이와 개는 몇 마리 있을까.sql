-- https://school.programmers.co.kr/learn/courses/30/lessons/59040

-- 동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요. 이때 고양이를 개보다 먼저 조회해주세요.

SELECT      ANIMAL_TYPE,
            count(ANIMAL_TYPE) as count
from        ANIMAL_INS 
group by    ANIMAL_TYPE
order by    ANIMAL_TYPE

-- group by를 사용하여 그룹을 지정하고, order by를 사용하여 오름차순으로 정렬하면 된다.