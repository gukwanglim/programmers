-- https://school.programmers.co.kr/learn/courses/30/lessons/133026

-- 상반기 동안 각 아이스크림 성분 타입과 성분 타입에 대한 아이스크림의 총주문량을 총주문량이 작은 순서대로 조회하는 SQL 문을 작성해주세요. 
-- 이때 총주문량을 나타내는 컬럼명은 TOTAL_ORDER로 지정해주세요.

SELECT      T2.INGREDIENT_TYPE as INGREDIENT_TYPE,
            sum(T1.TOTAL_ORDER) as TOTAL_ORDER
from        FIRST_HALF T1
join        ICECREAM_INFO T2
on          T1.FLAVOR = T2.FLAVOR	
group by    INGREDIENT_TYPE
order by    INGREDIENT_TYPE desc

-- 이전부터 사용하던 join on으로도 출력이 가능하지만 아래와 같이 using을 사용하면 조금 더 간단하게 작성할 수 있다.

SELECT      T2.INGREDIENT_TYPE as INGREDIENT_TYPE,
            sum(T1.TOTAL_ORDER) as TOTAL_ORDER
from        FIRST_HALF T1
join        ICECREAM_INFO T2
USING       (FLAVOR)	
group by    INGREDIENT_TYPE
order by    INGREDIENT_TYPE desc