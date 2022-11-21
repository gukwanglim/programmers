-- https://school.programmers.co.kr/learn/courses/30/lessons/62284

-- 데이터 분석 팀에서는 우유(Milk)와 요거트(Yogurt)를 동시에 구입한 장바구니가 있는지 알아보려 합니다.
-- 우유와 요거트를 동시에 구입한 장바구니의 아이디를 조회하는 SQL 문을 작성해주세요. 이때 결과는 장바구니의 아이디 순으로 나와야 합니다.

SELECT      T1.CART_ID
from        CART_PRODUCTS T1
join        (select     CART_ID
            from        CART_PRODUCTS
            where       NAME = 'Milk'
            ) T2
on          T1.CART_ID = T2.CART_ID
where       T1.NAME = 'Yogurt'
group by    T1.CART_ID
order by    T1.CART_ID

-- 하나의 테이블에서 두 가지의 조건에 맞는 정보를 출력하기 위해서는 join이 필요하다.

SELECT      cart_id
FROM        cart_products
WHERE       name = 'yogurt' AND 
            cart_id IN (SELECT cart_id
                        FROM   cart_products
                        WHERE name = 'milk')
GROUP BY     cart_id
ORDER BY     cart_id

-- 위와 같이 where 구문 안에서 다른 조건에 맞는 정보를 가져올 수 있도록 코드를 작성할 수도 있다.

SELECT      CART_ID
FROM        CART_PRODUCTS
GROUP BY    CART_ID
HAVING      GROUP_CONCAT(NAME) LIKE '%Yogurt%' AND GROUP_CONCAT(NAME) LIKE '%Milk%'

-- 또는 having으로 조건을 몰아서 적는데 이때, GROUP_CONCAT라는 함수를 사용하는 방법도 존재한다.
-- GROUP_CONCAT은 만약, type 컬럼이 fruit이고, name 컬럼이 수박, 사과, 복숭아, 수박 으로 각각의 값이 존재한다면
-- GROUP_CONCAT를 사용하게 된다면 type = fruit, name = 수박, 사과, 복숭아, 수박으로 하나의 type 안에 4개의 name이 들어가게 된다.
-- https://fruitdev.tistory.com/16

SELECT cart_id
from cart_products
where name in ("Milk","Yogurt")
group by cart_id
having count(distinct name) = 2
order by cart_id asc;

-- 추가로 위 코드와 같이 distinct를 사용하여 해결한 경우가 많은데 distinct 함수를 중복을 제거하는 함수이다.
-- 즉, 이 문제에서 milk가 여러 개 중복된다면 하나만 사용하겠다는 뜻이 된다.