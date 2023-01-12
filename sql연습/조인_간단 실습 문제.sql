-- inner join

-- 예제1) 현재, 근무하고 있는 직원의 이름과 직책을 모두 출력하세요.
select first_name, title
from employees, titles
where employees.emp_no = titles.emp_no 
      and titles.to_date = '9999-01-01';
      
-- 예제2) 현재 근무하고 있는 직원의 이름과 직책을 출력하되 여성 엔지니어(Enginner)만 출력하세요.
select gender, first_name, title
from employees, titles
where employees.emp_no = titles.emp_no 
      and titles.to_date ='9999-01-01'
      and gender = 'f' 
	  and title like '%Engineer';
      
--
-- ANSI/ISO SQL1999 JOIN 표준 문법 
--

-- 1) Natural Join
-- : 조인 대상이 되는 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 
--   명시하지 않고 암묵적으로 조인이 된다.
select first_name, title
  from employees a natural join titles b
 where b.to_date = '9999-01-01';
-- 2) join ~ using
-- 	  natural join의 문제점
select count(*)
  from salaries a natural join titles b
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';

select count(*)
  from salaries a join titles b using(emp_no)
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';



-- ***3) join ~ on >> equal join
-- 예제) 현재, 직책별 평균 연봉을 큰 순서대로 출력 하세요alter
  select b.title, avg(a.salary) as avg_salary
    from salaries a 
    join titles b on a.emp_no = b.emp_no
   where a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by b.title
order by avg_salary desc;

-- 실습문제1
-- 현재, 직원별 근무 부서를 사번, 직원 이름, 부서명을 출력하시오. 
select e.emp_no, dept_name, concat(first_name, ' ',last_name)
from departments d, dept_emp de, employees e
where d.dept_no = de.dept_no 
  and de.emp_no = e.emp_no
  and de.to_date = '9999-01-01';

-- 실습문제2
-- 현재 지급되고 있는 급여를 사번, 이름, 급여 순으로 출력
select e.emp_no, first_name, salary
from salaries s, employees e
where s.emp_no = e.emp_no
  and to_date = '9999-01-01';

-- 실습문제3
-- 횬재, 직책별 평균 연봉, 직원 수를 구하되 직책별 직원 수가 100명 이상인 직책만 출력.
-- 직책, 평균 연봉, 직원 수 순으로 출력
select title, avg(salary), count(t.emp_no)
from salaries s, titles t
where s.emp_no = t.emp_no
  and s.to_date = '9999-01-01'
  and t.to_date = '9999-01-01'
group by title
having count(t.emp_no) >= 100;


-- 실습문제4
-- 현재, 부서별로 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하라.
-- 부서 이름, 평균 급여 순으로 출력하세요.
select dept_name as '부서이름', avg(salary) as '평균연봉'
from departments d, dept_emp de, salaries s, titles t
where d.dept_no = de.dept_no
  and de.emp_no = s.emp_no
  and t.emp_no = s.emp_no
  and title like 'Engineer'
  and t.to_date = '9999-01-01'
  and de.to_date = '9999-01-01'
  and s.to_date = '9999-01-01'
group by dept_name
order by 평균연봉 desc;







