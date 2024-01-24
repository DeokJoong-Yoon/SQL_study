-- 테이블 구조

-- board 게시판 테이블
create table board(
    num number(4)            not null,
    author varchar2(20)       not null,
    title varchar2(500)         not null,
    content varchar2(4000)  not null,
    writeday date default sysdate,
    readcnt number(4) default 0,
    reproot number(4),
    repstep number(4),
    repindent number(4),
    passwd varchar2(12)     not null,
    constraint board_pk primary key(num)
);

-- 답변 게시판을 위한 컬럼  
-- reproot, repstep,  repindent 

-- drop table board;
comment on table  board is '게시판 테이블';
comment on column board.num is '게시판 번호';
comment on column board.author is '게시판 작성자';
comment on column board.title is '게시판 제목';    
comment on column board.content is '게시판 내용';
comment on column board.writeday is '게시판 등록일';     
comment on column board.readcnt is '게시판 조회수';     
comment on column board.reproot is '게시판 답변글(원래글의 번호 참조 - 그룹번호)';
comment on column board.repstep is '게시판 답변글(답변글의 위치번호 지정)';
comment on column board.repindent is '게시판 답변글(답변글의 계층번호 지정)';
comment on column board.passwd is '게시판 비밀번호';

-- board 게시판 테이블에 저장할 글번호 시퀀스 (증가값: 시퀀스명.nextval / 현재값: 시퀀스명.currval)
create sequence board_seq start with 1
increment by 1
minvalue 1
nocycle
cache 2;

-- drop sequence board_seq; 
desc board;
-- 일반 게시글 입력 시 reproot: num의 값. repstep/repindent : 0으로 입력하면 됩니다
-- insert into board( num, author, title, content, reproot, repstep, repindent, passwd )
-- values (board_seq.nextval, ?, ?, ?, board_seq.currval, 0, 0, ?)
select * from board;

insert into board( num, author, title, content, reproot, repstep, repindent, passwd )
values ( board_seq.nextval , '홍길동', '노력에 관련된 명언' , 
'중요한 것은 목표를 이루는 것이 아니라 그 과정에서 무엇을 배우며 얼마나 성장했느냐이다 - 앤드류 매튜스' ,
board_seq.currval, 0,0, '1234' );


-- 전체글 조회
SELECT num, title, passwd FROM board;

-- 비밀번호 확인 (1 : 비밀번호 일치 / 0 : 비밀번호 불일치)
SELECT NVL((SELECT 1 FROM board WHERE num = 3 AND passwd = '1234'), 0) as result FROM dual;

--SELECT NVL((SELECT 1 FROM board WHERE num = #{num} AND passwd = #{passwd} ), 0) as result FROM dual

-- 게시판 수정

UPDATE board SET title = '수정확인', content = '수정합니다.', passwd = '4321' WHERE num = 1;

-- UPDATE board SET title = ?, content = ?, passwd = ?  WHERE num = ?;

-- 게시판 삭제
DELETE FROM board WHERE num = 1;
-- DELETE FROM board WHERE num = ?;

-- 회원가입 테이블
create table member(
	num number,
	m_id varchar2(12)      not null,
	m_passwd varchar2(15)  not null,
	m_name varchar(15)     not null,
	m_email varchar2(80)   not null,
	m_tel varchar2(15)     not null,
	reg_date date default sysdate,
	constraint member_pk primary key(num),
	constraint member_uk unique(m_id)
);

comment on table member is '회원 정보';
comment on column member.num is '회원 번호';
comment on column member.m_id is '회원 아이디';
comment on column member.m_passwd is '회원 비밀번호';
comment on column member.m_name is '회원명';
comment on column member.m_email is '회원 이메일';   
comment on column member.m_tel is '회원 전화번호';   
comment on column member.reg_date is '회원 등록일'; 

-- 댓글 시퀀스 생성
create sequence member_seq start with 1
increment by 1
nocycle;

select * from member;