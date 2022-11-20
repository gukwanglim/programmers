-- https://school.programmers.co.kr/learn/courses/30/lessons/131113

-- FOOD_ORDER 테이블에서 5월 1일을 기준으로 주문 ID, 제품 ID, 출고일자, 출고여부를 조회하는 SQL문을 작성해주세요. 
-- 출고여부는 5월 1일까지 출고완료로 이 후 날짜는 출고 대기로 미정이면 출고미정으로 출력해주시고, 결과는 주문 ID를 기준으로 오름차순 정렬해주세요.

SELECT      ORDER_ID,
            PRODUCT_ID,
            DATE_FORMAT(OUT_DATE,'%Y-%m-%d') as OUT_DATE,
            case
                when OUT_DATE <= '2022-05-01' then '출고완료'
                when OUT_DATE > '2022-05-01' then '출고대기'
                else '출고미정'
            end as '출고여부'
from        FOOD_ORDER 

-- select 과정에서 if 구문이 필요하게 된다면(null을 감지하는 것이 아닌 조건을 사용하여 출력할 경우) case를 사용한다.
-- case 구문은 when을 사용하여 조건을 정해주고 then을 사용하여 출력할 내용을 작성할 수 있게 된다.
-- case 구문에는 if 구문과 같이 else를 사용할 수 있다.
-- case 구문이 끝날 때는 end를 사용하여 끝일라는 사실을 알려준다. 