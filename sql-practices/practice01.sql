-- 기본 SQL 문제입니다.

-- 문제1. 사번이 10944인 사원의 이름은(전체 이름)
select concat(first_name, ' ', last_name) as 이름
from employees
where emp_no = '10944';
-- 문제2. 전체직원의 다음 정보를 조회하세요. 가장 선임부터 출력이 되도록 하세요. 
-- 출력은 이름, 성별, 입사일 순서이고 “이름”, “성별”, “입사일로 컬럼 이름을 대체해 보세요.
select first_name as '이름', gender as '성별', hire_date as '입사일'
from employees
order by hire_date;
-- 문제3. 여직원과 남직원은 각 각 몇 명이나 있나요? 
-- (각각 쿼리 만들어서 각각 출력(더 쉬운 거다.), 아니면 서브쿼리라는 걸 써야 됨!!!)
select if(gender = 'M', '남자', '여자') as 성별, count(*) as 인원
from employees
group by gender;

-- 문제4. 현재(to_date = '9999-01-01' 라고 같다는 조건이 현재다.) 근무하고 있는 직원 수는 몇 명입니까? 
-- (salaries 테이블을 사용합니다.) 
select count(*)
from salaries
where to_date = '9999-01-01';

-- 문제5. 부서는 총 몇 개가 있나요?
-- count(distinct())  >> 이게 될 수 있는데 안되면 하지말고.
select distinct count(dept_no)
from departments;

-- 문제6. 현재 부서 매니저는 몇 명이나 있나요?(역임 매너저는 제외)
select distinct count(emp_no)
from dept_manager
where to_date = '9999-01-01';
-- 문제7. 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요. length
select *
from departments
order by length(dept_name) desc;

-- 문제8. 현재 급여가 120,000이상 받는 사원은 몇 명이나 있습니까?
select count(*)
from salaries
where salary >= 120000;
-- 문제9. 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해 보세요.
select distinct title
from titles
order by length(title) desc;
-- 문제10. 현재 Enginner 직책의 사원은 총 몇 명입니까?
select count(*)
from titles
where title like '%Engineer';
-- 문제11. 사번이 13250(Zeydy)인 지원이 직책 변경 상황을 시간순으로 출력해보세요.
select title, from_date, to_date
from titles
where emp_no = '13250'
order by from_date;