drop table member cascade constraints purge;

create table member(
	id			varchar2(50) primary key,					-- 아이디
	password	varchar2(60),								-- 비밀번호 암호화 60자
	username	varchar2(30),								-- 이름	
	join_date	date,		 								-- 가입 일자
	join_type	number(1) check (join_type in (0,1,2)),		-- 0일반, 1네이버, 2카카오
	belong		number(1) check (belong in (0,1,2)),		-- 0승인대기, 1소속, 2거절
	company_id	number(10) references company(company_id) on delete cascade,	-- 참조 회사 
	dept		varchar2(30),								-- 부서이름
	position	varchar2(20),								-- 직책
	phone		varchar2(20),								-- 핸드폰 번호
	profile_img	varchar2(50),								-- 프로필 이미지
	auth		varchar2(50) not null, -- 권한 지정 관리자는 ADMIN, 회사 대표 회원은 MANAGER, 일반회원 MEMBER
	auth_status		number(1)	-- 이메일 인증 여부
	status	varchar2(30) DEFAULT 'online'  -- 채팅 접속 상태 
);

insert into member values('testid1@naver.com','1234','username1','2000-01-01',1,1,1,1,1,1,UTL_RAW.CAST_TO_RAW('orange.png'),0,1);
insert into member values('testid2','1234','username2','2000-01-01',1,1,1,1,1,1,UTL_RAW.CAST_TO_RAW('lemon.png'),0,1);
insert into member values('testid3','1234','username3','2000-01-01',1,1,1,1,1,1,UTL_RAW.CAST_TO_RAW('graph.png'),0,1);
insert into member values('testid4','1234','username4','2000-01-01',1,1,1,1,1,1,UTL_RAW.CAST_TO_RAW('melon.png'),0,1);


drop table emailAuth cascade constraints purge;

create table mailAuth(
	id 			varchar2(50) primary key,
	authNum	 	varchar2(10),
	sendTime	 date
);

insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member1@naver.com','1234','member1',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member2@naver.com','1234','member2',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member3@naver.com','1234','member3',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member4@naver.com','1234','member4',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member5@naver.com','1234','member5',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member6@naver.com','1234','member6',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member7@naver.com','1234','member7',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member8@naver.com','1234','member8',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member9@naver.com','1234','member9',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member10@naver.com','1234','member10',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member11@naver.com','1234','member11',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member12@naver.com','1234','member12',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member13@naver.com','1234','member13',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member14@naver.com','1234','member14',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member15@naver.com','1234','member15',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member16@naver.com','1234','member16',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member17@naver.com','1234','member17',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member18@naver.com','1234','member18',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member19@naver.com','1234','member19',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member20@naver.com','1234','member20',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member21@naver.com','1234','member21',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member22@naver.com','1234','member22',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member23@naver.com','1234','member23',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member24@naver.com','1234','member24',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member25@naver.com','1234','member25',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member26@naver.com','1234','member26',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member27@naver.com','1234','member27',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member28@naver.com','1234','member28',sysdate,0,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member29@naver.com','1234','member29',sysdate,1,1,'ROLE_MEMBER',1);
insert into member 
(id,password,username,join_date,belong,company_id,auth,auth_status)
values('member30@naver.com','1234','member30',sysdate,0,1,'ROLE_MEMBER',1);