-- https://school.programmers.co.kr/learn/courses/30/lessons/59045

-- 보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 
-- 보호소에 들어올 당시에는 중성화1되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요.

SELECT      outs.ANIMAL_ID,
            outs.ANIMAL_TYPE,
            outs.NAME
from        ANIMAL_OUTS as outs
join        (select     ANIMAL_ID,
                        SEX_UPON_INTAKE
            from        ANIMAL_INS
            where       SEX_UPON_INTAKE like 'Intact %'
            ) as ins
on          outs.ANIMAL_ID = ins.ANIMAL_ID
where       outs.SEX_UPON_OUTCOME not like 'Intact %'
order by    outs.ANIMAL_ID

-- 문제는 풀었지만, 코드가 조금 더러워 보인다.
-- 먼저, 두 테이블이 존재하고, 각각의 테이블에서 원하는 조건이 다를 경우 select를 한 번 더 사용하여 where를 이용해 하나의 조건을 만족시키고
-- join을 통해 연결한 다음, 다른 하나의 조건을 join 밖에서 where으로 작성한다.

SELECT      ins.ANIMAL_ID,
            ins.ANIMAL_TYPE,
            ins.NAME
from        ANIMAL_INS ins
join        ANIMAL_OUTS outs
on          ins.ANIMAL_ID = outs.ANIMAL_ID
where       ins.SEX_UPON_INTAKE != outs.SEX_UPON_OUTCOME
order by    ins.ANIMAL_ID

-- 위 방식으로 작성하면 더 간단하게 적을 수 있다.
-- (처음에 했던 방식이지만, 오류가 발생했었는데 그 이유는 ins의 SEX_UPON_INTAKE와 outs의 SEX_UPON_OUTCOME 컬럼명이 다르다는 사실을 모르고 있었다)