-- https://school.programmers.co.kr/learn/courses/30/lessons/59041

-- image 파일 3번 사진

-- 이 문제는 where을 사용하는 것이 아닌 group by의 haveing을 사용하여 조건에 맞게 출력하는 문제이다.
SELECT      NAME, count(NAME) as count
from        ANIMAL_INS 
group by    NAME
having      count(NAME) > 1
order by    NAME

-- GROUP BY 절은 특정 칼럼을 기준으로 집계 함수를 사용하여 건수(COUNT), 합계(SUM), 평균(AVG) 등 집 계성 데이터를 추출할 때 사용한다. 
-- GROUP BY 절에서 기준 칼럼을 여러 개 지정할 수 있으며, HAVING 절을 함께 사용하면 집계 함수를 사용하여 WHERE 절의 조건절처럼 조건을 부여할 수 있다. 


-- 코드에서 where name is not null을 사용하지 않아도 문제가 없는 이유는 count()를 사용해서 null 값이 모두 제외된 상태이기 때문이다. 