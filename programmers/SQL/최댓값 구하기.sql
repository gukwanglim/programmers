-- https://school.programmers.co.kr/learn/courses/30/lessons/59415

-- 단순하게 정렬을 통해 제일 위의 데이터만 반환하면 문제를 풀 수 있다.
SELECT      DATETIME as 시간
from        ANIMAL_INS 
order by    DATETIME desc limit 1

-- 하지만 문제의 의도대로 푼다면 max를 사용하여 출력할 수 있다.(max도 사용이 가능하다)
SELECT MAX(DATETIME) FROM ANIMAL_INS