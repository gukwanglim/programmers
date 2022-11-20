-- https://school.programmers.co.kr/learn/courses/30/lessons/77487

-- 이 서비스에서는 공간을 둘 이상 등록한 사람을 "헤비 유저"라고 부릅니다. 헤비 유저가 등록한 공간의 정보를 아이디 순으로 조회하는 SQL문을 작성해주세요.

SELECT      T1.ID,
            T1.NAME,
            T1.HOST_ID
from        PLACES T1
join        (select     ID,
                        HOST_ID,
                        count(HOST_ID) as countHOST_ID
            from        PLACES 
            group by    HOST_ID
            having      count(HOST_ID) >= 2
            ) as T2
on          T1.HOST_ID = T2.HOST_ID
order by    ID

-- 즐겨찾기가 가장 많은 식당 정보 출력하기 문제와 동일하다.

-- 단순하게 selcet HOST_ID와 where count(HOST_ID) >= 2를 사용한다면 에러가 발생한다.


select * from places a where (select count(*) from places where host_id = a.host_id) >=2

-- join을 사용하지 않고도 위와 같이 where만을 활용해서 코드를 작성할 수 있다.
-- 위 코드가 실행되는 이유는 하나의 테이블이 자신을 비교하여 2개 이상이 나올 경우에만 출력하면 되기 때문이다.