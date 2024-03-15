
--최종본


select * from tabs;

-- 모든 테이블 삭제 명령어
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'TB_ACADEMY_SOURCE';
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
DROP TABLE "TB_PAYMENT" CASCADE CONSTRAINTS;
DROP TABLE "TB_LIKE" CASCADE CONSTRAINTS;
DROP TABLE "TB_FILE" CASCADE CONSTRAINTS;
DROP TABLE "TB_PERSONAL" CASCADE CONSTRAINTS;
DROP TABLE "TB_ADMIN" CASCADE CONSTRAINTS;
DROP TABLE "TB_ACADEMY" CASCADE CONSTRAINTS;
DROP TABLE "TB_WITHDRAWAL" CASCADE CONSTRAINTS;
DROP TABLE "TB_ACADEMY_SOURCE" CASCADE CONSTRAINTS;
DROP TABLE "TB_COMMON_BOARD" CASCADE CONSTRAINTS;
DROP TABLE "TB_MATCHING_BOARD" CASCADE CONSTRAINTS;
DROP TABLE "TB_COMMON_COMMENT" CASCADE CONSTRAINTS;
DROP TABLE "TB_MATCHING_COMMENT" CASCADE CONSTRAINTS;

select * from tabs;

-- 모든 테이블 삭제 명령어
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;



select * from tb_payment;
-- 전체 테이블 생성
--======================================================================================================================================================
--결제 테이블
CREATE TABLE tb_payment (
	payment_id	 varchar2(10)		NOT NULL,
	pg 	varchar2(30)		NOT NULL,
	pay_method	varchar2(200)		NOT NULL,
	merchant_uid	varchar2(50)		NOT NULL,
	name 	varchar2(100)		NOT NULL,
	amount	varchar2(10)		NOT NULL,
	academy_id	 varchar2(12)		NOT NULL,
	academy_number 	char(10)		NOT NULL,
	academy_name	varchar2(100)		NOT NULL,
	academy_manager_name	varchar2(20)		NOT NULL,
	academy_manager_email	varchar2(50)		NOT NULL,
	academy_manager_phone	char(11)		NOT NULL,
	payment_status	char(1)	DEFAULT '0'	NOT NULL,
	payment_date	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN tb_payment.payment_id IS '결제ID';

COMMENT ON COLUMN tb_payment.pg IS 'pg 사 이름';

COMMENT ON COLUMN tb_payment.pay_method IS '결제방법';

COMMENT ON COLUMN tb_payment.merchant_uid IS '거래UID';

COMMENT ON COLUMN tb_payment.name IS '결제명';

COMMENT ON COLUMN tb_payment.amount IS '결제금액';

COMMENT ON COLUMN tb_payment.academy_id IS '학원회원ID';

COMMENT ON COLUMN tb_payment.academy_number IS '학원지정번호';

COMMENT ON COLUMN tb_payment.academy_name IS '학원명';

COMMENT ON COLUMN tb_payment.academy_manager_name IS '담당자이름';

COMMENT ON COLUMN tb_payment.academy_manager_email IS '담당자이메일';

COMMENT ON COLUMN tb_payment.academy_manager_phone IS '담당자전화번호';

COMMENT ON COLUMN tb_payment.payment_status IS '결제상태 0 : 미결제, 1 : 결제';

COMMENT ON COLUMN tb_payment.payment_date IS '결제일자';



CREATE TABLE tb_like (
    common_no   number(5)      NOT NULL,
   like_member_id   varchar2(12)      NOT NULL
);
COMMENT ON COLUMN tb_like.common_no IS '게시글번호';
COMMENT ON COLUMN tb_like.like_member_id IS '좋아요작성자ID';
CREATE TABLE tb_file (
   common_no   number(5)      NOT NULL,
   file_no   number(1)      NOT NULL,
   file_path   varchar2(200)      NOT NULL,
   file_name   varchar2(200)      NOT NULL
);
COMMENT ON COLUMN tb_file.common_no IS '게시글번호';
COMMENT ON COLUMN tb_file.file_no IS '첨부파일번호';
COMMENT ON COLUMN tb_file.file_path IS '파일경로';
COMMENT ON COLUMN tb_file.file_name IS '첨부파일명';
CREATE TABLE tb_personal (
   personal_id   varchar2(12)      NOT NULL,
   member_type_id   number(1)   DEFAULT 1   NOT NULL,
   personal_name   varchar2(50)      NOT NULL,
   personal_passwd   varchar2(20)      NOT NULL,
   personal_email   varchar2(50)      NOT NULL,
   personal_birth   varchar2(10)      NOT NULL,
   personal_address   varchar2(200)      NOT NULL,
   personal_phone   char(11)      NOT NULL,
   personal_join_date   date   DEFAULT sysdate   NOT NULL,
   personal_login_fail_count   number(1)   DEFAULT 0   NULL,
   personal_account_banned_date   date      NULL,
   personal_passwd_change_date   date   DEFAULT sysdate   NULL
);
COMMENT ON COLUMN tb_personal.personal_id IS '개인회원ID';
COMMENT ON COLUMN tb_personal.member_type_id IS '회원구분ID';
COMMENT ON COLUMN tb_personal.personal_name IS '이름';
COMMENT ON COLUMN tb_personal.personal_passwd IS '비밀번호';
COMMENT ON COLUMN tb_personal.personal_email IS '이메일';
COMMENT ON COLUMN tb_personal.personal_birth IS '생년월일';
COMMENT ON COLUMN tb_personal.personal_address IS '주소';
COMMENT ON COLUMN tb_personal.personal_phone IS '전화번호';
COMMENT ON COLUMN tb_personal.personal_join_date IS '가입일자';
COMMENT ON COLUMN tb_personal.personal_login_fail_count IS '로그인실패횟수';
COMMENT ON COLUMN tb_personal.personal_account_banned_date IS '로그인정지일시';
COMMENT ON COLUMN tb_personal.personal_passwd_change_date IS '비밀번호최종변경일자';
CREATE TABLE tb_admin (
    admin_id   varchar2(12)      NOT NULL,
    member_type_id   number(1)   DEFAULT 3   NOT NULL,
   admin_password   varchar2(20)      NOT NULL,
   admin_team   varchar2(30)      NULL,
   admin_name   varchar2(50)      NOT NULL,
   admin_email   varchar2(50)      NOT NULL,
   admin_phone   char(11)      NOT NULL,
   admin_assigned_date   date      NOT NULL,
   admin_password_change_date   date      NULL
);
COMMENT ON COLUMN tb_admin.admin_id IS '관리자ID';
COMMENT ON COLUMN tb_admin.member_type_id IS '회원구분ID';
COMMENT ON COLUMN tb_admin.admin_password IS '관리자 비밀번호';
COMMENT ON COLUMN tb_admin.admin_team IS '팀소속';
COMMENT ON COLUMN tb_admin.admin_name IS '관리자이름';
COMMENT ON COLUMN tb_admin.admin_email IS '관리자이메일';
COMMENT ON COLUMN tb_admin.admin_phone IS '관리자전화번호';
COMMENT ON COLUMN tb_admin.admin_assigned_date IS '담당날짜';
COMMENT ON COLUMN tb_admin.admin_password_change_date IS '비밀번호 최종 변경 일자';
CREATE TABLE tb_academy (
   academy_id   varchar2(12)      NOT NULL,
    member_type_id   number(1)   DEFAULT 2   NOT NULL,
   academy_number   char(10)      NOT NULL,
   academy_join_date   date   DEFAULT sysdate   NOT NULL,
   academy_passwd   varchar2(20)      NOT NULL,
   academy_name   varchar2(100)      NOT NULL,
   academy_gu_address   varchar2(20)      NOT NULL,
   academy_dong_address   varchar2(20)      NOT NULL,
   academy_road_address   varchar2(200)      NOT NULL,
   academy_phone   char(11)      NOT NULL,
   academy_manager_name   varchar2(20)      NOT NULL,
   academy_manager_email   varchar2(50)      NOT NULL,
   academy_manager_phone   char(11)      NOT NULL,
   academy_target_grade   varchar2(15)      NOT NULL,
   academy_target_subject   varchar2(20)      NOT NULL,
   academy_keyword1   varchar2(40)      NOT NULL,
   academy_keyword2   varchar2(40)      NULL,
   academy_keyword3   varchar2(40)      NULL,
   academy_keyword4   varchar2(40)      NULL,
   academy_keyword5   varchar2(40)      NULL,
   academy_fee   varchar2(40)      NOT NULL,
   academy_passwd_change_date   date   DEFAULT sysdate   NOT NULL,
   academy_login_fail_count   number(1)   DEFAULT 0   NULL,
   academy_account_banned_date   date      NULL
);
COMMENT ON COLUMN tb_academy.academy_id IS '학원회원ID';
COMMENT ON COLUMN tb_academy.member_type_id IS '회원구분ID';
COMMENT ON COLUMN tb_academy.academy_number IS '학원지정번호(사업자번호)';
COMMENT ON COLUMN tb_academy.academy_join_date IS '가입일자';
COMMENT ON COLUMN tb_academy.academy_passwd IS '비밀번호';
COMMENT ON COLUMN tb_academy.academy_name IS '학원명';
COMMENT ON COLUMN tb_academy.academy_gu_address IS '행정구역명';
COMMENT ON COLUMN tb_academy.academy_dong_address IS '주소(동단위)';
COMMENT ON COLUMN tb_academy.academy_road_address IS '학원도로명주소';
COMMENT ON COLUMN tb_academy.academy_phone IS '학원전화번호';
COMMENT ON COLUMN tb_academy.academy_manager_name IS '담당자이름';
COMMENT ON COLUMN tb_academy.academy_manager_email IS '담당자이메일';
COMMENT ON COLUMN tb_academy.academy_manager_phone IS '담당자전화번호';
COMMENT ON COLUMN tb_academy.academy_target_grade IS '대상학년';
COMMENT ON COLUMN tb_academy.academy_target_subject IS '교습과목';
COMMENT ON COLUMN tb_academy.academy_keyword1 IS '키워드1';
COMMENT ON COLUMN tb_academy.academy_keyword2 IS '키워드2';
COMMENT ON COLUMN tb_academy.academy_keyword3 IS '키워드3';
COMMENT ON COLUMN tb_academy.academy_keyword4 IS '키워드4';
COMMENT ON COLUMN tb_academy.academy_keyword5 IS '키워드5';
COMMENT ON COLUMN tb_academy.academy_fee IS '수강료';
COMMENT ON COLUMN tb_academy.academy_passwd_change_date IS '비밀번호 최종 변경 일자';
COMMENT ON COLUMN tb_academy.academy_login_fail_count IS '로그인실패횟수';
COMMENT ON COLUMN tb_academy.academy_account_banned_date IS '로그인정지일시';
CREATE TABLE tb_withdrawal (
   withdrawal_member_id   varchar2(12)      NOT NULL,
   member_type_id   number(1)      NOT NULL,
   personal_name   varchar2(50)      NULL,
   personal_passwd   varchar2(20)      NOT NULL,
   personal_birth   date      NULL,
   personal_address   varchar2(200)      NULL,
   personal_email   varchar2(50)      NULL,
   personal_phone   char(11)      NULL,
   join_date   date   DEFAULT sysdate   NOT NULL,
   academy_number   char(10)      NULL,
   academy_name   varchar2(200)      NULL,
   academy_gu_address   varchar2(20)      NULL,
   academy_dong_address   varchar2(20)      NULL,
   academy_road_address   varchar2(200)      NULL,
   academy_phone   char(11)      NULL,
   academy_manager_name   varchar2(20)      NULL,
   academy_manager_email   varchar2(50)      NULL,
   academy_manager_phone   char(11)      NULL,
   academy_target_grade   varchar2(15)      NULL,
   academy_target_subject   varchar2(20)      NULL,
   academy_keyword1   varchar2(40)      NULL,
   academy_keyword2   varchar2(40)      NULL,
   academy_keyword3   varchar2(40)      NULL,
   academy_keyword4   varchar2(40)      NULL,
   academy_keyword5   varchar2(40)      NULL,
   academy_fee   varchar2(40)      NULL
);
COMMENT ON COLUMN tb_withdrawal.withdrawal_member_id IS '탈퇴회원ID';
COMMENT ON COLUMN tb_withdrawal.member_type_id IS '회원구분ID';
COMMENT ON COLUMN tb_withdrawal.personal_name IS '이름';
COMMENT ON COLUMN tb_withdrawal.personal_passwd IS '비밀번호';
COMMENT ON COLUMN tb_withdrawal.personal_birth IS '생년월일';
COMMENT ON COLUMN tb_withdrawal.personal_address IS '주소';
COMMENT ON COLUMN tb_withdrawal.personal_email IS '이메일';
COMMENT ON COLUMN tb_withdrawal.personal_phone IS '전화번호';
COMMENT ON COLUMN tb_withdrawal.join_date IS '가입일자';
COMMENT ON COLUMN tb_withdrawal.academy_number IS '학원지정번호';
COMMENT ON COLUMN tb_withdrawal.academy_name IS '학원명';
COMMENT ON COLUMN tb_withdrawal.academy_gu_address IS '행정구역명';
COMMENT ON COLUMN tb_withdrawal.academy_dong_address IS '주소(동단위)';
COMMENT ON COLUMN tb_withdrawal.academy_road_address IS '학원주소';
COMMENT ON COLUMN tb_withdrawal.academy_phone IS '학원전화번호';
COMMENT ON COLUMN tb_withdrawal.academy_manager_name IS '담당자이름';
COMMENT ON COLUMN tb_withdrawal.academy_manager_email IS '담당자이메일';
COMMENT ON COLUMN tb_withdrawal.academy_manager_phone IS '담당자전화번호';
COMMENT ON COLUMN tb_withdrawal.academy_target_grade IS '대상학년';
COMMENT ON COLUMN tb_withdrawal.academy_target_subject IS '교습과목';
COMMENT ON COLUMN tb_withdrawal.academy_keyword1 IS '키워드1';
COMMENT ON COLUMN tb_withdrawal.academy_keyword2 IS '키워드2';
COMMENT ON COLUMN tb_withdrawal.academy_keyword3 IS '키워드3';
COMMENT ON COLUMN tb_withdrawal.academy_keyword4 IS '키워드4';
COMMENT ON COLUMN tb_withdrawal.academy_keyword5 IS '키워드5';
COMMENT ON COLUMN tb_withdrawal.academy_fee IS '수강료';
CREATE TABLE  tb_academy_source  (
    academy_gu_address    varchar2(20)      NULL,
    academy_type    varchar2(10)      NULL,
    academy_number    char(10)      NOT NULL,
    academy_name    varchar2(100)      NULL,
    academy_road_address    varchar2(200)      NULL,
    academy_dong_address    varchar2(200)      NULL,
    academy_field_name    varchar2(30)      NULL,
    academy_curriculum_series_name    varchar2(200)      NULL,
    academy_curriculum_list_name    varchar2(200)      NULL,
    academy_curriculum_name    varchar2(200)      NULL,
    academy_total_capacity    number(8)      NULL,
    academy_total_capacity_per_day    number(8)      NULL,
    academy_tuition_per_person    varchar2(3000)      NULL,
    academy_tuition_open_status    char(1)      NULL,
    academy_dormitory_academy_status    char(1)      NULL,
    academy_road_postal_number    char(6)      NULL,
    academy_register_status_name    char(6)      NULL,
    academy_register_date    varchar2(10)      NULL,
    academy_closed_start_date    varchar2(10)      NULL,
    academy_closed_end_date    varchar2(10)      NULL,
    academy_open_date    varchar2(10)      NULL,
    academy_loading_date_time    varchar2(10)   DEFAULT   NULL
);
COMMENT ON COLUMN  tb_academy_source . academy_number  IS '학원지정번호';
COMMENT ON COLUMN  tb_academy_source . academy_gu_address  IS '행정구역명';
COMMENT ON COLUMN  tb_academy_source . academy_type  IS '학원교습소구분';
COMMENT ON COLUMN  tb_academy_source . academy_name  IS '학원명';
COMMENT ON COLUMN  tb_academy_source . academy_road_address  IS '도로명주소';
COMMENT ON COLUMN  tb_academy_source . academy_dong_address  IS '도로명상세주소';
COMMENT ON COLUMN  tb_academy_source . academy_field_name  IS '분야명';
COMMENT ON COLUMN  tb_academy_source . academy_curriculum_series_name  IS '교습계열명';
COMMENT ON COLUMN  tb_academy_source . academy_curriculum_list_name  IS '교습과정목록명';
COMMENT ON COLUMN  tb_academy_source . academy_curriculum_name  IS '교습과정명';
COMMENT ON COLUMN  tb_academy_source . academy_total_capacity  IS '정원합계';
COMMENT ON COLUMN  tb_academy_source . academy_total_capacity_per_day  IS '일시수용능력인원합계';
COMMENT ON COLUMN  tb_academy_source . academy_tuition_per_person  IS '인당수강료내용';
COMMENT ON COLUMN  tb_academy_source . academy_tuition_open_status  IS '수강료공개여부';
COMMENT ON COLUMN  tb_academy_source . academy_dormitory_academy_status  IS '기숙사학원여부';
COMMENT ON COLUMN  tb_academy_source . academy_road_postal_number  IS '도로명우편번호';
COMMENT ON COLUMN  tb_academy_source . academy_register_status_name  IS '등록상태명';
COMMENT ON COLUMN  tb_academy_source . academy_register_date  IS '등록일자';
COMMENT ON COLUMN  tb_academy_source . academy_closed_start_date  IS '휴원시작일자';
COMMENT ON COLUMN  tb_academy_source . academy_closed_end_date  IS '휴원종료일자';
COMMENT ON COLUMN  tb_academy_source . academy_open_date  IS '개설일자';
COMMENT ON COLUMN  tb_academy_source . academy_loading_date_time  IS '적재일시';
CREATE TABLE tb_common_board (
   common_no   number(5)      NOT NULL,
   personal_id   varchar2(12)      NULL,
   academy_id   varchar2(12)      NULL,
   admin_id   varchar2(12)      NULL,
   member_type_id   number(1)      NOT NULL,
   common_nickname   varchar2(50)      NULL,
   common_title   varchar2(100)      NOT NULL,
   common_content   clob      NOT NULL,
   common_register_date   date   DEFAULT sysdate   NOT NULL,
   common_edit   date   DEFAULT sysdate   NULL,
   common_readcnt   number(7)   DEFAULT 0   NOT NULL,
   common_block_confirm   char(1)   DEFAULT 'N'   NOT NULL,
   common_block_date   date   DEFAULT sysdate   NULL,
   common_thumb varchar2(500) null,
   common_file varchar2(500) null
);


comment on column tb_common_board.common_thumb is '게시판 썸네일 이미지 경로 및 파일명';
comment on column tb_common_board.common_file is '게시판 이미지 경로 및 파일명';
COMMENT ON COLUMN tb_common_board.common_no IS '게시글번호';
COMMENT ON COLUMN tb_common_board.personal_id IS '개인회원ID';
COMMENT ON COLUMN tb_common_board.academy_id IS '학원회원ID';
COMMENT ON COLUMN tb_common_board.admin_id IS '관리자ID';
COMMENT ON COLUMN tb_common_board.member_type_id IS '회원구분ID';
COMMENT ON COLUMN tb_common_board.common_nickname IS '작성자';
COMMENT ON COLUMN tb_common_board.common_title IS '게시글제목';
COMMENT ON COLUMN tb_common_board.common_content IS '게시글내용';
COMMENT ON COLUMN tb_common_board.common_register_date IS '게시글등록일자';
COMMENT ON COLUMN tb_common_board.common_edit IS '게시글수정일자';
COMMENT ON COLUMN tb_common_board.common_readcnt IS '조회수';
COMMENT ON COLUMN tb_common_board.common_block_confirm IS '게시글차단여부';
COMMENT ON COLUMN tb_common_board.common_block_date IS '게시글차단일자';
CREATE TABLE tb_matching_board (
   matching_no   number(5)      NOT NULL,
   personal_id   varchar2(12)      NOT NULL,
   matching_private   char(1)   DEFAULT 'N'   NOT NULL,
   matching_passwd   char(4)      NULL,
   matching_register_date   date   DEFAULT sysdate   NOT NULL,
   matching_edit_date   date   DEFAULT sysdate   NULL,
   matching_gu_address varchar2(20),
   matching_dong_address varchar2(20),
   matching_target_grade varchar2(15),
   matching_target_subject varchar2(20),
   matching_fee varchar2(40),
   matching_keyword1 varchar2(40),
   matching_keyword2 varchar2(40),
   matching_keyword3 varchar2(40),
   matching_comment varchar2(1000)
);
COMMENT ON COLUMN tb_matching_board.matching_no IS '게시글번호';
COMMENT ON COLUMN tb_matching_board.personal_id IS '개인회원id';
COMMENT ON COLUMN tb_matching_board.matching_private IS '비밀글여부';
COMMENT ON COLUMN tb_matching_board.matching_passwd IS '비밀번호';
COMMENT ON COLUMN tb_matching_board.matching_register_date IS '등록일자';
COMMENT ON COLUMN tb_matching_board.matching_edit_date IS '수정일자';
CREATE TABLE tb_common_comment (
    common_no   number(5)      NOT NULL,
   common_comment_no   number(5)      NOT NULL,
   personal_id   varchar2(12)      NOT NULL,
   common_comment_content   varchar2(4000)      NOT NULL,
   common_commentt_date   date   DEFAULT sysdate   NOT NULL
);
COMMENT ON COLUMN tb_common_comment.common_no IS '게시글번호';
COMMENT ON COLUMN tb_common_comment.common_comment_no IS '댓글번호';
COMMENT ON COLUMN tb_common_comment.personal_id IS '개인회원id';
COMMENT ON COLUMN tb_common_comment.common_comment_content IS '댓글내용';
COMMENT ON COLUMN tb_common_comment.common_commentt_date IS '작성일시';
CREATE TABLE tb_matching_comment (
   matching_comment_no   number(5)      NOT NULL,
   academy_id   varchar2(12)      NOT NULL,
   matching_no   number(5)      NOT NULL,
   matching_comment_nickname   varchar2(50)      NULL,
   matching_comment_content   varchar2(4000)      NOT NULL,
   mathcing_comment_date   date   DEFAULT sysdate   NOT NULL
);
COMMENT ON COLUMN tb_matching_comment.matching_comment_no IS '댓글번호';
COMMENT ON COLUMN tb_matching_comment.academy_id IS '학원id';
COMMENT ON COLUMN tb_matching_comment.matching_no IS '게시글번호';
COMMENT ON COLUMN tb_matching_comment.matching_comment_nickname IS '작성자';
COMMENT ON COLUMN tb_matching_comment.matching_comment_content IS '댓글내용';
COMMENT ON COLUMN tb_matching_comment.mathcing_comment_date IS '작성일시';
ALTER TABLE tb_payment ADD CONSTRAINT PK_TB_PAYMENT PRIMARY KEY (
   payment_id
);
ALTER TABLE tb_like ADD CONSTRAINT PK_TB_LIKE PRIMARY KEY (
   like_member_id,
   common_no
);
ALTER TABLE tb_payment ADD CONSTRAINT PK_TB_PAYMENT PRIMARY KEY (
	payment_id
);
ALTER TABLE tb_file ADD CONSTRAINT PK_TB_FILE PRIMARY KEY (
   file_no,
   common_no
);
ALTER TABLE tb_personal ADD CONSTRAINT PK_TB_PERSONAL PRIMARY KEY (
   personal_id
);
ALTER TABLE tb_admin ADD CONSTRAINT PK_TB_ADMIN PRIMARY KEY (
   admin_id
);
ALTER TABLE tb_academy ADD CONSTRAINT PK_TB_ACADEMY PRIMARY KEY (
   academy_id
);
ALTER TABLE tb_withdrawal ADD CONSTRAINT PK_TB_WITHDRAWAL PRIMARY KEY (
   withdrawal_member_id
);
ALTER TABLE tb_academy_source ADD CONSTRAINT PK_TB_ACADEMY_SOURCE PRIMARY KEY (
   academy_number
);
ALTER TABLE tb_common_board ADD CONSTRAINT PK_TB_COMMON_BOARD PRIMARY KEY (
   common_no
);
ALTER TABLE tb_matching_board ADD CONSTRAINT PK_TB_MATCHING_BOARD PRIMARY KEY (
   matching_no
);
ALTER TABLE tb_common_comment ADD CONSTRAINT PK_TB_COMMON_COMMENT PRIMARY KEY (
   common_comment_no,
   personal_id,
   common_no
);
ALTER TABLE tb_matching_comment ADD CONSTRAINT PK_TB_MATCHING_COMMENT PRIMARY KEY (
   matching_comment_no,
   academy_id,
   matching_no
);
ALTER TABLE tb_payment ADD CONSTRAINT FK_tb_academy_TO_tb_payment_1 FOREIGN KEY (
   academy_id
)
REFERENCES tb_academy (
   academy_id
);
ALTER TABLE tb_like ADD CONSTRAINT FK_tb_common_board_TO_tb_like_1 FOREIGN KEY (
   common_no
)
REFERENCES tb_common_board (
   common_no
);
ALTER TABLE tb_file ADD CONSTRAINT FK_tb_common_board_TO_tb_file_1 FOREIGN KEY (
   common_no
)REFERENCES tb_common_board (
   common_no
);
ALTER TABLE tb_common_board ADD CONSTRAINT FK_tb_personal_TO_tb_common_board_1 FOREIGN KEY (
   personal_id
)
REFERENCES tb_personal (
   personal_id
);
ALTER TABLE tb_common_board ADD CONSTRAINT FK_tb_academy_TO_tb_common_board_1 FOREIGN KEY (
   academy_id
) 
REFERENCES tb_academy (
   academy_id
);
ALTER TABLE tb_common_board ADD CONSTRAINT FK_tb_admin_TO_tb_common_board_1 FOREIGN KEY (
   admin_id
)
REFERENCES tb_admin (
   admin_id
);
ALTER TABLE tb_matching_board ADD CONSTRAINT FK_tb_personal_TO_tb_matching_board_1 FOREIGN KEY (
   personal_id
)
REFERENCES tb_personal (
   personal_id
);
ALTER TABLE tb_common_comment ADD CONSTRAINT FK_tb_common_board_TO_tb_common_comment_1 FOREIGN KEY (
   common_no
)
REFERENCES tb_common_board (
   common_no
);
ALTER TABLE tb_matching_comment ADD CONSTRAINT FK_tb_matching_board_TO_tb_matching_comment_1 FOREIGN KEY (
   matching_no
)
REFERENCES tb_matching_board (
   matching_no
);

---- 매칭게시판 시퀀스
create sequence matching_board_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
---- 매칭게시판 댓글 시퀀스
create sequence matching_board_comment_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
---- 자유게시판 시퀀스
create sequence free_board_seq
start with 10001
increment by 1
minvalue 1
maxvalue 20000
cycle
cache 2;
---- 자유게시판 댓글 시퀀스
create sequence free_board_comment_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
--- 자유게시판 첨부파일 시퀀스
create sequence free_board_file_seq
start with 1
increment by 1
maxvalue 10
nocycle
cache 2;
---- 홍보게시판 시퀀스
create sequence advertise_board_seq
start with 20001
increment by 1
minvalue 1
maxvalue 30000
cycle
cache 2;
---- 홍보게시판 댓글 시퀀스
create sequence advertise_board_comment_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
--- 홍보게시판 첨부파일 시퀀스
create sequence advertise_board_file_seq
start with 1
increment by 1
maxvalue 10
nocycle
cache 2;
---- 공지게시판 시퀀스
create sequence notice_board_seq
start with 30001
increment by 1
minvalue 1
maxvalue 40000
cycle
cache 2;
--- 공지게시판 첨부파일 시퀀스
create sequence notice_board_file_seq
start with 1
increment by 1
maxvalue 10
nocycle
cache 2;

---- 결제 테이블 결제ID 시퀀스
create sequence payment_seq
start with 1
increment by 1
minvalue 1
maxvalue 50000
cycle
cache 2;


commit;
select * from tb_admin;
