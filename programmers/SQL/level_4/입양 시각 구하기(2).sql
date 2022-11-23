-- https://school.programmers.co.kr/learn/courses/30/lessons/59413

-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다.
-- 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.

SELECT      hour(DATETIME) as HOUR,
            count(hour(DATETIME)) as COUNT
from        ANIMAL_OUTS
group by    hour(DATETIME)
order by    hour(DATETIME)

-- 위 코드로 실행햐게 되면 정답으로 인정되지 않는다.
-- 문제에서는 입양 테이블에 존재하지 않는 시간인 경우에는 count 값을 0으로 출력하게 만들어야 한다고 되어있다.
-- 하지만 위 코드에서는 테이블에 존재하지 않는 값을 0으로 나타내는 것이 아닌 출력 자체를 하지 않게 된다.

-- 때문에 비어있는 시간 테이블을 생성하여 코드를 작성해야한다.