-- https://school.programmers.co.kr/learn/courses/30/lessons/131533

-- PRODUCT 테이블과 OFFLINE_SALE 테이블에서 상품코드 별 매출액(판매가 * 판매량) 합계를 출력하는 SQL문을 작성해주세요. 
-- 결과는 매출액을 기준으로 내림차순 정렬해주시고 매출액이 같다면 상품코드를 기준으로 오름차순 정렬해주세요.

SELECT      T1.PRODUCT_CODE, sum(T1.PRICE * T2.SALES_AMOUNT) as SALES
from        PRODUCT T1
join        OFFLINE_SALE  T2
on          T1.PRODUCT_ID = T2.PRODUCT_ID
group by    T1.PRODUCT_CODE
order by    SALES desc, PRODUCT_CODE

-- join이 사용되는 매커니즘을 간단하게 설명하자면
    -- 먼저, select로 가져와야하는 데이터를 선언한다. 이때, T1.의 경우는 첫 번째 테이블, T2.의 경우는 두 번째 테이블이라고 정의했다.(무엇으로 정의하는지는 자유)
    -- from으로 가져오는 테이블(첫 번째) 명을 작성하고 무슨 변수로 가져올 것인지를 선언한다.(T1)
    -- join으로 from에서 가져온 테이블과 FK를 공유하는 테이블(두 번째) 명을 작성하고 무슨 변수로 가져올 것인지 선언한다.(T2)
    -- on으로 T1과 T2에서 어떤 컬럼이 FK로 연동되고 있는지를 선언한다.
    -- group by를 사용할 때는 테이블 선언 후, 묶어 놓을 값을 선언한다.