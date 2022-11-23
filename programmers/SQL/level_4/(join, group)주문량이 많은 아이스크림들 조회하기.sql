-- https://school.programmers.co.kr/learn/courses/30/lessons/133027

-- 7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성해주세요.

SELECT      HALF.FLAVOR
from        FIRST_HALF as HALF
join        (select     sum(TOTAL_ORDER) as J_TOTAL,
                        FLAVOR
            from        JULY
            where       FLAVOR = FLAVOR
            group by    FLAVOR
            ) as J
on          HALF.FLAVOR = J.FLAVOR
order by    HALF.TOTAL_ORDER + J_TOTAL desc
limit       3

-- 조금 난잡하지만 문제를 풀었다.
-- 상반기 아이스크림 주문량에는 한 종류가 하나의 코드로 구성되어 있으며, 7월 아이스크림 주문량은 한 종류가 두 개의 코드로 구성되어있다.
-- 때문에 상반기 아이스크림의 FLAVOR를 가져온 상태에서 join을 이용하여 7월 아이스크림 주문량의 합(두 개의 코드가 존재하기 때문에 FLAVOR = FLAVOR 이라는 조건과 group by 필요)을 가져온다.

-- 이떄, on 구문에서 HALF.FLAVOR = J.FLAVOR으로 선언을 하기 위해서는 join 안의 select 구문에서 FLAVOR를 가져와야 한다. 
-- (가끔 이런 방식으로 가져오지 않으면 사용되지 않을 때가 있다. 하지만, 천천히 고민해보면 하나의 데이터로 통합하여 group by로 묶어진 상태로 가져오기 위해서는 이렇게 사용해야하는 것이 맞다고 판단된다.)

-- 마지막 부분의 order by에서 HALF.TOTAL_ORDER + J_TOTAL이 아닌 sum(HALF.TOTAL_ORDER, J_TOTAL)을 사용하게 되면 오류가 발생한다.
-- sql에서 sum() 함수는 () 안에 작성된 두 가지 이상의 데이터를 합쳐주는 것이 아닌 하나의 데이터에 담긴 값만을 합쳐준다.(sum(TOTAL_ORDER)과 같은 방법으로만 사용 가능) 


SELECT      f.FLAVOR
from        FIRST_HALF f

join        JULY j
on          f.FLAVOR = j.FLAVOR
group by    flavor

order by    sum(f.total_order)+sum(j.total_order) desc
limit       3

-- 처음 작성한 코드를 간단하게 만든다면 이와 같이 작성할 수 있다.