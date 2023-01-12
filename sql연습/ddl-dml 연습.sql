
create table member(
	no int not null auto_increment,
    email varchar(100) not null,
    password varchar(64) not null,
    name varchar(100) not null,
    department varchar(100),
    primary key(no)
);

desc member;

alter table member add column juminbunho char(13) not null;
desc member;

alter table member drop juminbunho;
desc member;

alter table member add column juminbunho char(13) not null after email;
desc member;

alter table member change column department dept varchar(200) not null;
desc member;

alter table member add self_intro text;
desc member;

alter table member drop juminbunho;
desc member;


-- insert
insert 
  into member(no, email, name, dept, password)
values (null, 'jsw57295@naver.com', '정성웅5', '개발팀5', password('1234'));

select * from member;

-- update
update member 
   set email = 'jsw5729@naver.com', password=password('5678')
 where no = 2;
 
-- delete
delete
from member
where no = 2;
select * from member;

-- transaction
select @@autocommit;
set autocommit = 0;



