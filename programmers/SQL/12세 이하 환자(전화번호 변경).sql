-- https://school.programmers.co.kr/learn/courses/30/lessons/132201

-- PATIENT 테이블에서 12세 이하인 여자환자의 환자이름, 환자번호, 성별코드, 나이, 전화번호를 조회하는 SQL문을 작성해주세요. 
-- 이때 전화번호가 없는 경우, 'NONE'으로 출력시켜 주시고 결과는 나이를 기준으로 내림차순 정렬하고, 나이 같다면 환자이름을 기준으로 오름차순 정렬해주세요.

-- 전화번호는 select 문에서 정의하면 된다. 
SELECT      PT_NAME,
            PT_NO,
            GEND_CD,
            AGE,
            IFNULL(TLNO, 'NONE') as TLNO
from        PATIENT 
where       AGE <= '12' and GEND_CD = 'W'
order by    AGE desc, PT_NAME asc

-- IFNULL이 아닌 IF만을 사용하기 위해서는 아래와 같이 사용해야 한다.
SELECT      PT_NAME,
            PT_NO,
            GEND_CD,
            AGE,
            IF(TLNO is null, 'NONE', TLNO) as TLNO
from        PATIENT 
where       AGE <= '12' and GEND_CD = 'W'
order by    AGE desc, PT_NAME asc


-- case()를 사용하여 작성할 수도 있다.
SELECT PT_NAME, 
       PT_NO, 
       GEND_CD, 
       AGE, 
       CASE WHEN TLNO IS NULL THEN 'NONE'
       ELSE TLNO
       END TLNO
FROM PATIENT
WHERE GEND_CD = 'W' AND AGE <= 12
ORDER BY AGE DESC, PT_NO ASC

-- case의 자세한 설명은 경기도 위치.sql 파일에 존재