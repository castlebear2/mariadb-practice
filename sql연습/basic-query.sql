select version(), current_date(), now();

-- 수학 함수, 사칙 연산 가능.
select sin(pi() / 4), 1+2+3+4 from dual;
select sin(pi() / 4), 1+2+3+4 from dual;
-- 대소문자 구분x
Select version(), cuRrent_date(), noW() from dual;

select version(),
now()
from dual;

-- table 생성 : DML
create table pet (
   name varchar(100),
   owner varchar(20),
   species varchar(20),
   gender char(1),
   birth date,
   death date
);

-- schema 확인
describe pet;
desc pet;

-- table 삭제a
drop table pet;
show tables;

-- insert : DML(C)
insert into pet values(
'성탄이', '윤한영', 'dog', 'm', '2007-12-25', null
);
select * from pet;