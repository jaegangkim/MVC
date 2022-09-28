-- 게시판 테이블
create table board(
	idx int not null auto_increment,
	memId varchar(1000) not null,
	title varchar(1000) not null,
	contents varchar(3000) not null,
	count int not null default 0,
	writer varchar(100) not null,
	indate datetime not null default now(),
	primary key(idx)
)



drop table board;

insert into board(title,contents,writer)
values('오늘 아침에..','해도쌤 봄','김재강');
insert into board(title,contents,writer)
values('잠온다','자고싶어요','김재강');
insert into board(title,contents,writer)
values('배고프다','밥 먹고 싶어요','김재강');
insert into board(title,contents,writer)
values('안녕하세요','안녕하세요','황해도');

select * from board;

create table member(
	memId varchar(50) not null,
	memPwd varchar(50) not null,
	memName varchar(50) not null,
	primary key(memId)
);

insert into member values('smhrd01','smhrd01','관리자');
insert into member values('smhrd02','smhrd02','김재강');
insert into member values('smhrd03','smhrd03','강재김');

select * from member;

-- 답변 게시판 --
create table reboard(
	idx int not null,
	memId varchar(1000) not null,
	title varchar(1000) not null,
	contents varchar(3000) not null,
	count int not null default 0,
	writer varchar(100) not null,
	indate datetime not null default now(),
	boardGroup int not null,
	boardSequence int not null,
	boardLevel int not null,
	boardAvailable int not null,
	primary key(idx)
)
select * from reboard;
drop table reboard;

delete from reboard;

select * from reboard order by boardGroup desc, boardSequence asc
limit 0,10;
