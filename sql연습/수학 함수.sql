-- 수학 함수

-- abs(절대값)
select abs(1), abs(-1) from dual;

-- ceil(올림), ceiling
select ceil(3.14), ceiling(3.14) from dual;
-- floor
select fllor(3.14) from dual;

-- mod(나머지 연산) 
select mod(10, 3), 10 % 3 from dual;

-- round(x): 반올림 함수 : x에 가장 근접한 정수
-- round(x, d): x값 중에 소수점 d자리 가장 근접한 실수
select round(1.498), round(1.511), round(1.498, 1), round(1.498, 0);

-- power(x, y), pow(x, y): x의 y제곱
select power(2,3), pow(3,4) from dual;

-- sign(x): 양수일 경우, 1 음수이면 -1
select sign(2), sign(-100), sign(0) from dual;

-- greatest(x, y, ...), least(x, y, ....)  >> ㅇ이건 뭐지...???
select greatest(10, 40, 20, 50), least(10, 40, 20, 50) from dual;
select greatest('b', 'A', 'C', 'D'), least('hello', 'hela', 'hel') from dual;