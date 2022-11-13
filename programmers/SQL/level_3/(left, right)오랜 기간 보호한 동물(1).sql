-- https://school.programmers.co.kr/learn/courses/30/lessons/59044

-- 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 시작일 순으로 조회해야 합니다.

SELECT      T1.NAME,
            T1.DATETIME
from        ANIMAL_INS T1
left join   ANIMAL_OUTS T2
on          T1.ANIMAL_ID = T2.ANIMAL_ID
where       T2.ANIMAL_ID is null
order by    T1.DATETIME
limit       3

-- 만약, left join이 아닌 right join을 실행할 경우 오류가 발생한다.
-- left join의 경우에는 기준으로 들어오는(from으로 들어오는) 테이블이 기준이다.
-- 즉, A left join B가 된다면 A 테이블은 모두 남아있게 되고, A 테이블에 존재하지 않는 B 테이블의 내용은 null 처리가 된다.(B 테이블에는 존재하지만, A 테이블에는 존재하지 않는 데이터는 사라진다.)
-- 때문에 A left join B = B right join A가 된다.

-- right join의 경우는 늦게 들어오는(right join으로 들어오는) 테이블이 기준이다.

-- https://futurists.tistory.com/17