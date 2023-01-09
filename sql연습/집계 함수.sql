-- 집계 쿼리: select 절에 통계 함수(avg, max, min, count, sum, stddev, varance, ...)

select avg(salary), sum(salary)
from salaries;

-- select 절에 그룹함수(통계함수) 있는 경우, 어떤 컬럼도 select절에 올 수 없다!!!!!
-- emp_no는 아무 의미가 없다.
-- 오류!!!!!
select emp_no, avg(salary)
from salaries;

-- query 순서
-- 1) from: 접근 테이블 확인
-- 2) where: 조건에 맞는 row를 선택 >> 임시 테이블 생성
-- 3) 집계 (결과 테이블)
-- 4) projection
-- 예제: 사번이 10060인 사원이 받은 평균 월급은?
select avg(salary)
from salaries
where emp_no = '10060';

-- 5) group by 에 참여하고 있는 컬럼은 projection이 가능하다: select절에 올 수 있다.
-- 예제: 사원별 평균 월급은?
select emp_no, avg(salary)
from salaries
group by emp_no;

-- 6) having
-- 	집계 결과(결과 테이블)에서 row를 선택해야 하는 경우!!!
-- 	이미 where절은 실행이 되었기 때문에, having절 에서 조건을 주어야 한다.
-- 예제: 사원별 평균 월급이 60,000만 달러 이상인 사원의 사번과 평균 월급을 출력하세요.
select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary) > 60000;
-- !!! where 절에 있어야 될 거 같은데, where 절은 이미 지나왔고, 결과 창이 만들어져버린 후엔,
-- having을 써야한다. 그래서 having은 반드시 group by 다음에 와야 한다...alter

-- 7) order by
--    order by는 항상 맨 마지막 출력전에 한다.
select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary) > 60000
order by avg(salary) asc;

-- 주의)
-- 예) 사번이 10060인 사원의 사번, 급여 평균, 급여총합을 출력하세요.

-- 문법적으로 오류
-- 의미적으론 맞다(where/ mySQL이 이상해서 가능한 거. 오라클에서는 에러 뜬다)
select emp_no, avg(salary), sum(salary)
from salaries
where emp_no = '10060';

-- >> 문법적으로 옳다. 이렇게 풀어야 한다. 위에 것처럼 풀면 에러다. 
select emp_no, avg(salary), sum(salary)
from salaries
group  by emp_no
having emp_no = '10060';