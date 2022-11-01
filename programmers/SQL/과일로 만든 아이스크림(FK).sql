-- https://school.programmers.co.kr/learn/courses/30/lessons/133025

-- image 파일 사진 1번

-- FK가 존재할 경우에는 아래 코드와 같이 작성한다.
SELECT      f.FLAVOR 
from        FIRST_HALF f, ICECREAM_INFO i
where       f.FLAVOR = i.FLAVOR and TOTAL_ORDER >= 3000 and INGREDIENT_TYPE = 'fruit_based'
order by    TOTAL_ORDER desc

-- 먼저, 필요한 컬럼(여기서는 FLAVOR)를 select 할 수 있게 작성하는데 앞에 f.와 같은 변수를 이용한다.
-- 다른 테이블에 FK로 묶인 FLAVOR는 이전에 정의한 변수(f)가 아닌 다른 변수(i)에 받아온다.
-- 이외 나머지 where, order by의 부분은 다른 쿼리문과 같이 사용한다.


-- FK로 묶인 컬럼을 단순하게 ,을 통해 가져오는 것이 아닌, 'LEFT JOIN .. ON'을 통해 가져오는 방법도 존재한다.(이 방식을 사용하면 where 구문에 들어있어야 할 내용을 from 구문에서 사용한다.)
SELECT      a.FLAVOR 
FROM        FIRST_HALF  a LEFT JOIN ICECREAM_INFO b ON a.FLAVOR = b.FLAVOR
WHERE       a.TOTAL_ORDER > 3000 AND b.INGREDIENT_TYPE LIKE "fruit_based" 
ORDER BY    a.TOTAL_ORDER DESC