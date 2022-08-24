drop table member
create table member(
	memId varchar2(20) not null,
	memName varchar2(30),
	memPwd varchar2(30),
	primary key (memId)
);
delete from member;
insert into member values('smhrd01','관리자','smhrd01');
insert into member values('smhrd02','박혜민','smhrd02');
insert into member values('smhrd03','김유리','smhrd03');
insert into member values('1','김유리','1');
select * from member;

create table board1(
	num number not null,
	memId varchar2(20) not null,
	title varchar2(50) not null,
	content varchar2(2000) not null,
	writer varchar2(50) not null,
	indate date default sysdate,
	count number default 0,
	primary key (num)
	);
	
	SELECT title,writer FROM (SELECT * FROM board ORDER BY count DESC) WHERE ROWNUM < 6;
select * from member;
select * from board;