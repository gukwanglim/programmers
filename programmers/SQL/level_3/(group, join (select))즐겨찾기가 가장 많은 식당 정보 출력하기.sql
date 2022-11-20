-- https://school.programmers.co.kr/learn/courses/30/lessons/131123

-- REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.

SELECT      T1.FOOD_TYPE,
            T1.REST_ID,
            T1.REST_NAME,
            T1.FAVORITES
from        REST_INFO as T1
join        (select     FOOD_TYPE,
                        max(FAVORITES) as 'maxFAVORITES'
            from        REST_INFO
            group by    FOOD_TYPE
            ) as T2
on          T1.FOOD_TYPE = T2.FOOD_TYPE and T1.FAVORITES = T2.maxFAVORITES
order by    T1.FOOD_TYPE desc


-- 먼저 아래의 코드로 설명하겠다.

SELECT      FOOD_TYPE, REST_ID, REST_NAME, MAX(FAVORITES)
FROM        REST_INFO
GROUP BY    FOOD_TYPE
ORDER BY    FOOD_TYPE DESC;

-- 간단하게 생각하면 두 번째 코드와 같이 group by를 사용하여 FAVORITES의 max 값을 찾으면 된다고 판단된다.
-- 하지만, 실제 코드를 돌려보면 문제가 해결되지 않는다.
-- 그 이유는 group by를 사용하게 된다면 가장 상단에 존재하는 데이터를 임의로 가져오게 된다.
-- 쉽게 말해, max 값이 아닌, 제일 상단에 위치하는 값을 가져오게 된다.(문제에서 다른 식당들은 상단의 정보가 제일 큰 값을 가지지만, 일식의 경우에는 두 번째 정보가 제일 큰 값을 가진다.)

-- 이를 해결하기 위해서 첫 번째 코드와 같이 join을 사용해야 한다.

-- 먼저, 가져와야 하는 값들을 select로 가져온다. (join을 사용해야하므로 T1이라는 이름을 주고 가져온다.)
-- join을 실행할 부분은 기존 테이블에서 일부 조건을 만족하는 값이다.
-- 때문에 T1과 같은 테이블에서 내용을 가져와야 하기 때문에 join 안에 select를 실행한다.
-- join 내부의 select도 지금까지 사용했던 select 문과 똑같이 작성하면 된다.

-- T2의 경우는 필수적인 조건인  FOOD_TYPE, max(FAVORITES) 만을 가져와 T2로 정의한 후, join을 한다.
-- 이때, T2가 가능한데 왜 join까지 사용해야 하는가? 하는 의문이 들었다.
-- 실제 T2 구문만을 돌리면 max 값이 나오게 된다.
-- 하지만, max 상태의 FAVORITES 값을 뽑아내기만 할 뿐, FAVORITES이 아닌 다른 값들은 group by로 가져오는(제일 위에 존재하는) 내용들을 가져오기 때문에 전혀 다른 값을 출력하게 된다.

-- on 조건에는 FOOD_TYPE과 FAVORITES이 같은 내용을 가져와야 한다.