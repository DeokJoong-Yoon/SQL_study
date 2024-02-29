-- 테이블 생성
create table spring_board (
    b_num number not null,
    b_name varchar2(15) not null,
    b_title varchar2(1000) not null,
    b_content clob,
    b_pwd varchar2(18) not null,
    b_date date default sysdate
);


drop table spring_board;

-- drop table spring_board;

select * from spring_board;

alter table spring_board
add constraint spring_board_pk primary key(b_num);

select * from user_constraints where TABLE_NAME='SPRING_BOARD';

desc spring_board;
comment on table spring_board is '게시판 정보';
comment on column spring_board.b_num is '게시판순번';
comment on column spring_board.b_name is '게시판작성자';
comment on column spring_board.b_title is '게시판제목';
comment on column spring_board.b_content is '게시판내용';
comment on column spring_board.b_pwd is '게시판비미런호';
comment on column spring_board.b_date is '게시판등록일';


create sequence spring_board_seq
 start with 1
 increment by 1
 minvalue 1
 nocycle
 cache 2;
 
-- drop sequence spring_board_seq;
 
 
 insert into spring_board(b_num, b_name, b_title, b_content, b_pwd)
 values(spring_board_seq.nextval, '공자', '논어', '끊임없이 힘쓰고 노력하면 마침내 이루리라', '1234');
 
 select * from spring_board order by b_num desc;
 
 
 --게시판 조회 수 추가 (readcnt)
 alter table spring_board
 add(readcnt number default 0);
 
 comment on column spring_board.readcnt is '게시판 조회수';
 
 
 -- 관리자 테이블
 CREATE TABLE spring_admin (
    a_id varchar2(15) not null,
    a_pwd varchar2(20) not null,
    a_name varchar2(21) not null,
    a_phone varchar2(15) not null,
    a_email varchar2(100) not null,
    a_date date default sysdate,
    constraint spring_admin_pk primary key(a_id)
 );
 
 --drop TABLE spring_admin;
 
 comment on table spring_admin is '관리자 테이블 정보';
 comment on column spring_admin.a_id is '관리자 아이디';
 comment on column spring_admin.a_pwd is '관리자 비밀번호';
 comment on column spring_admin.a_name is '관리자 이름';
 comment on column spring_admin.a_phone is '관리자 핸드폰번호';
 comment on column spring_admin.a_email is '관리자 이메일';
 comment on column spring_admin.a_date is '관리자 등록일';
 
 select * from spring_admin;
 desc spring_admin;
 -- spring_admin 테이블에 레코드 1을 입력해주세요.
 insert into spring_admin(a_id, a_pwd, a_name, a_phone, a_email)
 values('javaadmin', 'java1234', '윤진', '010-1234-1234', 'ykdj92@naver.com');
 
 -- 로그인 처리 쿼리문
 select a_id, a_name, a_email
 from spring_admin
 where a_id = 'javaadmin' and a_pwd ='java1234';
 
 
 
 
 
 select * from spring_board;
 
 delete from spring_board;
 
 
 
 
 -- 파일 업로드시 서버에 저장한 파일명
 
 drop table member;
 
 CREATE TABLE MEMBER(

MEMBER_ID VARCHAR2(30) PRIMARY KEY,

MEMBER_PWD VARCHAR2(100) NOT NULL,

MEMBER_NM VARCHAR2(15) NOT NULL,

MEMBER_ENROLL_DT DATE DEFAULT SYSDATE

);

INSERT INTO MEMBER VALUES('user01', 'pass01', '홍길동', DEFAULT);

 
 
 select * from member;
 
 
 create table spring_reply (
    r_num number not null,
    b_num number not null,
    r_name varchar2(15) not null,
    r_content varchar2(2000) not null,
    r_pwd varchar2(18) not null,
    r_date date default sysdate,
    constraint spring_reply_pk primary key(r_num),
    constraint spring_reply_fk foreign key(b_num)
                                        references spring_board(b_num)
 );
 
 select * from spring_board;
 
 -- drop table spring_reply;
 
comment on table spring_reply is '댓글 정보';
comment on column spring_reply.r_num is '댓글번호';
comment on column spring_reply.b_num is '게시판 글번호';
comment on column spring_reply.r_name is '댓글 작성자';
comment on column spring_reply.r_content is '댓글 내용';
comment on column spring_reply.r_pwd is '댓글 비밀번호';
comment on column spring_reply.r_date is '댓글 등록일';

create sequence spring_reply_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

-- drop sequence spring_reply_seq;

 select * from spring_board;
 insert into spring_reply(r_num, b_num, r_name, r_content, r_pwd)
 values(spring_reply_seq.nextval, 1, '맹자', '길은 가까이에 있다.
 그러나 사람들은 헛되이 먼 곳을 찾고 있다. 일은 해보면 쉬운 것이다. 시작을 하지 않고 미리 어렵게만 생각하고 있기 때문에 할 수 있는 일들을 놓쳐 버리는 것이다.', '1234');
 insert into spring_reply(r_num, b_num, r_name, r_content, r_pwd)
 values(spring_reply_seq.nextval, 1, '맹자', '너에게서 나온 것은 너에게로 돌아간다.', '1234');
insert into spring_reply(r_num, b_num, r_name, r_content, r_pwd)
 values(spring_reply_seq.nextval, 2, '윤진', '새벽에 눈을 떠 저하늘에 꿈을 그리며 그 꿈을 품에 안고 다시 잠이든다.', '1234');
insert into spring_reply(r_num, b_num, r_name, r_content, r_pwd)
 values(spring_reply_seq.nextval, 2, '석보상절', '아름답다 라는 말은 나 답다 라는 말로 나다운 것이 내 마음에 들다. 즉, 나 다울 때, 아름답다라고 한다. ', '1234'); 
 
 select * from spring_reply where b_num = 2;

select * from spring_reply;
 
 
 