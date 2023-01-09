-- 문자열 함수 

-- upper, ucase
select upper('busan'), ucase('BusaN'), upper('Busan');
select upper(first_name) from employees;

-- lower, lcase
select lower('busan'), lcase('BusaN'), lower('Busan');
select lower(first_name) from employees; -- 아니 여기에 order by 하면 왜 오류나지? >> 강의 영상 참조 및 공부!!!

-- substring(문자열, index, length)
select substring('Hello World', 3, 2);

-- 예제) 1989년에 입사한 사원들의 이름, 입사일을 출력하라
select first_name, hire_date
from employees
where substring(hire_date, 1, 4) = '1989';

-- lpad(왼쪽 채우기 = 오른쪽 정렬), rpad(오른쪽 채우기 = 왼쪽 정렬)
select lpad('1234', 10, '-'), rpad('1234', 10, '-');

-- 예제) 직원들의 월급을 오른쪽 정렬(빈공간 *)
select lpad(salary, 10, '*')
from salaries;

-- trim, ltrim, rtrim
-- ltrim, rtrim은 공간 여백 없애는 거로 정해져있는데, trim은 특정 문자열을 없애는 개념.
-- >> trim은 사용방법이 좀 다르다. both, leading, trailing 옵션이 있다.
select concat('---', ltrim('     hello     '), '---'),
       concat('---', rtrim('     hello     '), '---'),
       concat('---',  trim(leading 'x' from 'xxxxxhelloxxxxx'), '---'),
       concat('---',  trim(trailing 'x' from 'xxxxxhelloxxxxx'), '---'),
       concat('---',  trim(both 'x' from 'xxxxxhelloxxxxx'), '---')
       from dual;
-- length
select length('Hello World') from dual;
