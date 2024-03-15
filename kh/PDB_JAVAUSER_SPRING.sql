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
 
 select * from spring_reply;

select * from spring_reply;

update spring_reply set r_name = '러셀' where r_num = 14;
 
 
 
 		SELECT b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as
		b_date, readcnt, 
		(select count(r_num) from spring_reply where b_num = boardList.b_num) as replyCnt
		FROM spring_board boardList
		ORDER BY b_num desc;


alter table spring_board add(b_thumb varchar2(500));

comment on column spring_board.b_thumb is '게시판 썸네일 이미지 경로 및 파일명';
        
alter table spring_board add (b_file varchar2(500));

comment on column spring_board.b_file is '게시판 이미지 겨올 및 파일명';
        




------- 페이징 처리를 위한 데이터 입력 처리
CREATE OR REPLACE PROCEDURE BOARD_PAGING_INSERT
IS
BEGIN
    FOR cnt IN 1 .. 120 LOOP
        INSERT INTO spring_board(b_num, b_name, b_title, b_content, b_pwd)
        VALUES(spring_board_seq.nextval,
        'Cervantes ' || cnt,
        '순례' || cnt,
        '감히 이룰 수 없는 꿈을꾸고,
        감히 이루어질 수 없는 사랑을 하고, 
        감히 견딜 수 없는 고통을 견디며,
        감히 용감한 자도 가지 못한 곳을 가며,
        감히 닿지 못할 저 밤하늘의 별에 이른다는 것.
        
        이것이 나의 순례이며
        저 별을 따라가는 것이 나의 길이라오
        아무리 희망이 없을 지라도,
        또한 아무리 멀리 있을 지라도......',
        '1234');
    END LOOP;
    COMMIT;
END;
/
SHOW ERROR;

EXECUTE BOARD_PAGING_INSERT;

SELECT COUNT(*) FROM SPRING_BOARD;
select * from spring_board;


-- 0.013초
select /*+INDEX_DESC(spring_board spring_board_pk */
        b_num, b_name, b_title, b_date
from spring_board;

-- 0.013초
select b_num, b_name, b_title, b_date
from spring_board;

-- 데이터베이스에 전달된 SQL문은 아래와 같은 과정을 거처서 처리된다.
-- SQL 파싱 : SQL 구문에 오류가 있는지 SQL을 실행해야 하는 대상가 존재하는지를 검사한다.
-- SQL 최적화 : SQL이 실행되는데 필요한 비용(COST)을 계산하게 되며 이 계산된 값을 기초로 
--                     어떤 방식으로 실행하는 것이 가장 좋다는 것을 판단하는 실행계획을 세운다
-- SQL 실행 : 세워진 실행 계획을 통해서 메모리상에 데이터를 읽거나 물리적인 공간에서 데이터를 로딩하는 등의 작업을 하게 된다.
    
-- 인덱스(색인) 
-- CREATE [UNIQUE] INDEX 인덱스명 ON 테이블명( 컬럼1, 컬럼2.... );

-- 힌트(hint)
-- 개발자가 데이터베이스에 어떤 방식으로 실행해 줘야 하는지를 명시하기 때문에 강제성을 부여한다.
-- 구문: /*+로 시작하고 */ 로 종료된다.
-- INDEX_DESC(테이블명 인덱스명): /*+ INDEX_DESC(spring_board spring_board_pk) */

-- rowid: 데이터베이스 내의 주소에 해당하는데 모든 데이터는 자신만의 주소를 가진다.
select rowid, board.* from spring_board board order by b_num desc;

select /*+ INDEX_DESC(spring_board spring_board_pk) */
        b_num, b_name, b_title, b_date
from spring_board where b_num > 0;

-- rownum : SQL이 실행된 결과에 넘버링해준다.
select rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board;

-- 10개의 레코드 얻기 ( 1 ~ 10 까지 )
select /*+ INDEX_DESC(spring_board spring_baord_pk) */
            rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board where rownum <= 10;

-- 10개의 레코드 얻기( 11 ~ 20 까지 ) 결과? => 출력 레코드가 존재하지 않는다.
select /*+ INDEX_DESC(spring_board spring_board_pk) */
            rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board where rownum >10 and rownum <= 20;


select /*+ INDEX_DESC(spring_board spring_board_pk) */
        rownum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from spring_board where rownum <= 20;   -- 븐다시 1이 포함되오록 해야 한다.

-- 인라인 뷰를 이용하여 원하는 레코드 얻기
select
        rnum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from (
            select /*+ INDEX_DESC(spring_board spring_board_pk) */
                    rownum as rnum, b_num, b_name, b_title, b_date
            from spring_board
            where rownum <= 140 -- 페이지번호 * 한페이지에 보여줄 레코드 수
        ) boardList
where rnum >120; -- (페이지번호-1) * 한페이지에 보여줄 레코드수

-- 이 과정을 정리하면 다음과 같은 순서이다.
-- 필요한 순서로 정렬된 데이터에 rownum을 붙인다.
-- 처음부터 해당 페이지의 데이터를 rownum<=20과 같은 조건을 이용해서 구한다.
-- 구해놓은 데이터를 하나의 테이블처럼 간주하고 인라인뷰로 처리한다.
-- 인라인뷰에서 필요한 데이터만을 남긴다.



select
        rnum, b_num, b_name, b_title, to_char(b_date, 'YYYY-MM-DD') as b_date
from (
            select /*+ INDEX_DESC(spring_board spring_board_pk) */
                    rownum as rnum, b_num, b_name, b_title, b_date
            from 
            (select * from spring_board order by B_DATE desc) sortedBoardList
            where rownum <= 140 -- 페이지번호 * 한페이지에 보여줄 레코드 수
        ) boardList
where rnum >120; -- (페이지번호-1) * 한페이지에 보여줄 레코드수


desc spring_board;
select * from spring_board order by B_DATE desc;





        
        
 
 