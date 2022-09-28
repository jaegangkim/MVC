create table smember(
	id varchar(100) not null,
	pw varchar(100) not null,
	nick varchar(100) not null,
	phone varchar(100) not null,
	addr varchar(100) not null,
	primary key(id)
)

select * from smember;

insert into smember values('admin','1234','관리자','010-1234-5678','광주인공지능사관학교')
insert into smember values('admin2','1234','관리자2','010-1234-5678','광주인공지능사관학교');
insert into smember values('admin3','1234','관리자3','010-1234-5678','광주인공지능사관학교');
insert into smember values('admin4','1234','관리자4','010-1234-5678','광주인공지능사관학교');











