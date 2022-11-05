-- https://school.programmers.co.kr/learn/courses/30/lessons/59415

-- 단순하게 정렬을 통해 제일 위의 데이터만 반환하면 문제를 풀 수 있다.
SELECT      DATETIME as 시간
from        ANIMAL_INS 
order by    DATETIME desc limit 1

-- 하지만 문제의 의도대로 푼다면 max를 사용하여 출력할 수 있다.(max도 사용이 가능하다)
SELECT MAX(DATETIME) FROM ANIMAL_INS


-- https://school.programmers.co.kr/learn/courses/30/lessons/59038

-- 위 문제가 최댓값을 구하는 것이라면 아래 문제는 최솟값을 구하는 문제이다.
SELECT  min(DATETIME)
from    ANIMAL_INS 

-- 여기서 중요한 점은 max, min의 경우는 where 구문이 아닌 select 구문에서 사용된다는 것이다.