-- 게시판 테이블
create table board(
	idx int not null auto_increment,
	title varchar(1000) not null,
	contents varchar(3000) not null,
	count int not null default 0,
	writer varchar(100) not null,
	indate datetime not null default now(),
	primary key(idx)
)

insert into board(title,contents,writer)
values('오늘 아침에..','해도쌤 봄','김재강');
insert into board(title,contents,writer)
values('잠온다','자고싶어요','김재강');
insert into board(title,contents,writer)
values('배고프다','밥 먹고 싶어요','김재강');
insert into board(title,contents,writer)
values('안녕하세요','안녕하세요','황해도');

select * from board;

