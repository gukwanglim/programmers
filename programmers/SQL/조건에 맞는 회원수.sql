-- https://school.programmers.co.kr/learn/courses/30/lessons/131535

-- USER_INFO 테이블에서 2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원이 몇 명인지 출력하는 SQL문을 작성해주세요.

-- 조건을 and로 연결하여 작성하면 된다.
SELECT  count(USER_ID) as USERS
from    USER_INFO 
where   JOINED like '2021%' and AGE >= '20' and AGE <='29'


-- 나이의 경우 20 이상 29 이하를 뽑는 것으로 and를 사용하지 않고 between A and B를 사용해도 된다.
SELECT Count(*) AS USERS FROM USER_INFO WHERE AGE BETWEEN 20 AND 29 AND YEAR(JOINED) = 2021

-- 다른 코드를 살펴보면 YEAR(JOINED) = 2021와 같이 연도만을 선택하여 가져오는 것으로 한다.
SELECT COUNT(*) AS USERS FROM USER_INFO WHERE AGE >= 20 AND AGE <= 29 AND YEAR(JOINED) = 2021;