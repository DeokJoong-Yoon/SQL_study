------------------------------------------------------------------------------------------------------------------------tb_academy_source
CREATE TABLE tb_academy_source (
   academy_number   char(10)      NOT NULL,
   academy_gu_address   varchar2(20)      NOT NULL,
   academy_type   varchar2(10)      NOT NULL,
   academy_name   varchar2(100)      NOT NULL,
   academy_open_date   date      NULL,
   academy_register_date   date      NULL,
   academy_register_status_name   char(6)      NULL,
   academy_closed_start_date   date      NULL,
   academy_closed_end_date   date      NULL,
   academy_total_capacity   number(5)      NULL,
   academy_total_capacity_per_day   number(5)      NULL,
   academy_field_name   varchar2(30)      NOT NULL,
   academy_curriculum_series_name   varchar2(30)      NULL,
   academy_curriculum_list_name   varchar2(30)      NULL,
   academy_curriculum_name   varchar2(30)      NOT NULL,
   academy_tuition_per_person   varchar2(200)      NULL,
   academy_tuition_open_status   char(1)      NULL,
   academy_dormitory_academy_status   char(1)      NULL,
   academy_road_postal_number   char(6)      NULL,
   academy_road_address   varchar2(200)      NOT NULL,
   academy_road_address_detail   varchar2(200)      NOT NULL,
   academy_loading_date_time   date   DEFAULT sysdate   NOT NULL
);
ALTER TABLE tb_academy_source ADD CONSTRAINT PK_TB_ACADEMY_SOURCE PRIMARY KEY (
   academy_number
);
INSERT INTO tb_academy_source VALUES('1000002272', '동대문구','학원', '수재학원', TO_DATE('1994-07-06'), TO_DATE('1994-07-06'), '개원', TO_DATE('1994_07_06'), TO_DATE('9999_12_31'), 370,132, '입시.검정 및 보습', '', '보통교과', '보습', '','Y','N',02542, '서울특별시 동대문구 답십리로 133', ', 1층, 2층 (답십리동)', TO_DATE('20231018'));
INSERT INTO tb_academy_source VALUES('1000003333', '서대문구','학원', '영재학원', TO_DATE('1994-07-06'), TO_DATE('1994-07-06'), '개원', TO_DATE('1994_07_06'), TO_DATE('9999_12_31'), 370,132, '입시.검정 및 보습', '', '보통교과', '보습', '','Y','N',02542, '서울특별시 서대문구 연희로로 133', ', 1층, 2층 (연희동)', TO_DATE('20231018'));
INSERT INTO tb_academy_source VALUES('1000005555', '마포구','학원', '천재학원', TO_DATE('1994-07-06'), TO_DATE('1994-07-06'), '개원', TO_DATE('1994_07_06'), TO_DATE('9999_12_31'), 370,132, '입시.검정 및 보습', '', '보통교과', '보습', '','Y','N',02542, '서울특별시 마포구 와우산로 133', ', 1층, 2층 (서교동)', TO_DATE('20231018'));





------------------------------------------------------------------------------------------------------------------------tb_total_academy
CREATE TABLE tb_total_academy (
   academy_number   char(10)      NOT NULL,
   academy_name   varchar2(100)      NOT NULL,
   academy_field_name   varchar2(20)      NOT NULL,
   academy_target_subject   varchar2(20)      NOT NULL,
   academy_gu_address   varchar2(20)      NOT NULL,
   academy_dong_address   varchar2(20)      NOT NULL,
   academy_road_address   varchar2(200)      NOT NULL
);
ALTER TABLE tb_total_academy ADD CONSTRAINT PK_TB_TOTAL_ACADEMY PRIMARY KEY (
   academy_number
);
ALTER TABLE tb_total_academy ADD CONSTRAINT FK_tb_academy_source_TO_tb_total_academy_1 FOREIGN KEY (
   academy_number
)
REFERENCES tb_academy_source (
   academy_number
);







------------------------------------------------------------------------------------------------------------------------tb_academy
CREATE TABLE tb_academy (
   academy_id   varchar2(12)      NOT NULL,
   member_type_id   number(1)      NOT NULL,
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
   academy_target_grade   varchar2(10)      NOT NULL,
   academy_target_subject   varchar2(20)      NOT NULL,
   academy_keyword1   varchar2(20)      NOT NULL,
   academy_keyword2   varchar2(20)      NULL,
   academy_keyword3   varchar2(20)      NULL,
   academy_fee   varchar2(40)      NOT NULL,
   academy_passwd_change_date   date   DEFAULT sysdate   NOT NULL,
   academy_login_fail_count   number(1)   DEFAULT 0   NULL,
   academy_account_banned_date   date      NULL
);
ALTER TABLE tb_academy ADD CONSTRAINT PK_TB_ACADEMY PRIMARY KEY (
   academy_id,
   member_type_id,
   academy_number
);
ALTER TABLE tb_academy ADD CONSTRAINT FK_tb_total_academy_TO_tb_academy_1 FOREIGN KEY (
   academy_number
)
REFERENCES tb_total_academy (
   academy_number
);
--학원회원 정보
INSERT INTO tb_academy VALUES('user1', 2, '1000003333', sysdate, 'passwd01', '영재학원', '서대문구', '1층, 2층 (연희동)', '서울특별시 서대문구 연희로로 133', '01011112222', '홍길동', 'manager01@gmail.com', '01011111111', '초등 저학년', '국어', '기초부터', sysdate, 0, sysdate);
INSERT INTO tb_academy VALUES('user2', 2, '1000002272', sysdate, 'passwd01', '수재학원', '동대문구', '1층, 2층 (답십리동)', '서울특별시 동대문구 답십리로 133', '01033334444', '김철수', 'manager02@gmail.com', '01022222222', '초등 고학년', '수학', '심화과정', sysdate, 0, sysdate);
INSERT INTO tb_academy VALUES('user3', 2, '1000005555', sysdate, 'passwd01', '천재학원', '마포구', '1층, 2층 (서교동)', '서울특별시 마포구 와우산로 133', '01055556666', '이영희', 'manager03@gmail.com', '01033333333', '성인', '영어', '꼼꼼한 관리', sysdate, 0, sysdate);




------------------------------------------------------------------------------------------------------------------------tb_personal
CREATE TABLE tb_personal (
   personal_id   varchar2(12)      NOT NULL,
   member_type_id   number(1)      NOT NULL,
   personal_name   varchar2(50)      NOT NULL,
   personal_passwd   varchar2(20)      NOT NULL,
   personal_email   varchar2(50)      NOT NULL,
   personal_birth   date      NOT NULL,
   personal_address   varchar2(200)      NOT NULL,
   personal_phone   char(11)      NOT NULL,
   personal_join_date   date   DEFAULT sysdate   NOT NULL,
   personal_login_fail_count   number(1)   DEFAULT 0   NULL,
   personal_account_banned_date   date      NULL,
   personal_passwd_change_date   date   DEFAULT sysdate   NULL
);
ALTER TABLE tb_personal ADD CONSTRAINT PK_TB_PERSONAL PRIMARY KEY (
   personal_id,
   member_type_id
);
INSERT INTO tb_personal VALUES('abc123', 1, '김시온', 'zxc123', 'kimzion9812@gmail.com', TO_DATE('1998-12-17'), '경기도 시흥시', '01011112222', TO_DATE('2022-11-11'), 0, sysdate, sysdate); 
INSERT INTO tb_personal VALUES('kkk123', 1, '강민호', 'nnn123', 'minho00@gmail.com', TO_DATE('2000-01-01'), '서울시 노원구', '01033334444', TO_DATE('2022-10-10'), 0, '', sysdate); 
INSERT INTO tb_personal VALUES('yoon123', 1, '윤덕중', 'ydj123', 'yoon12@gmail.com', TO_DATE('2000-03-03'), '서울시 송파구', '01055556666', TO_DATE('2022-04-10'), 0, '', sysdate); 
ALTER TABLE tb_personal ADD CONSTRAINT PK_tb_personal PRIMARY KEY (personal_id);
ALTER TABLE tb_personal ADD CONSTRAINT UQ_tb_personal_personal_id UNIQUE (personal_id);



------------------------------------------------------------------------------------------------------------------------tb_admin
CREATE TABLE tb_admin (
	admin_id	varchar2(12)		NOT NULL,
	member_type_id	number(1)		NOT NULL,
	admin_password	varchar2(20)		NOT NULL,
	admin_team	varchar2(30)		NULL,
	admin_name	varchar2(50)		NOT NULL,
	admin_email	varchar2(50)		NOT NULL,
	admin_phone	char(11)		NOT NULL,
	admin_assigned_date	date		NOT NULL,
	admin_password_change_date	date		NULL
);
ALTER TABLE tb_admin ADD CONSTRAINT PK_TB_ADMIN PRIMARY KEY (
	admin_id,
	member_type_id
);

INSERT INTO tb_admin VALUES('admin11', 3, 'pwd1', 'team1', '김나연', 'kny123@naver.com', '01012341234', sysdate, sysdate);
INSERT INTO tb_admin VALUES('admin22', 3, 'pwd2', 'team2', '최영민', 'cym123@naver.com', '01043214321', sysdate, sysdate);
INSERT INTO tb_admin VALUES('admin33', 3, 'pwd3', 'team3', '서현진', 'shj123@naver.com', '01090909090', sysdate, sysdate);


------------------------------------------------------------------------------------------------------------------------ 매칭 게시판

CREATE TABLE tb_matching_board (
   matching_no   number(5)      NOT NULL,
   personal_id   varchar2(12)      NOT NULL,
   matching_private   char(1)   DEFAULT 'N'   NOT NULL,
   matching_passwd   char(4)      NULL,
   matching_register_date   date   DEFAULT sysdate   NOT NULL,
   matching_edit_date   date   DEFAULT sysdate   NULL
);
ALTER TABLE tb_matching_board ADD CONSTRAINT PK_TB_MATCHING_BOARD PRIMARY KEY (
   matching_no
);

ALTER TABLE tb_matching_board ADD CONSTRAINT FK_tb_personal_TO_tb_matching_board_1 FOREIGN KEY (
   personal_id
)
REFERENCES tb_personal (
   personal_id
);
INSERT INTO tb_matching_board VALUES(1, 'abc123', 'N', '', sysdate, sysdate);
INSERT INTO tb_matching_board VALUES(2, 'kkk123', 'Y', '1234', sysdate, sysdate);
INSERT INTO tb_matching_board VALUES(3, 'yoon123', 'N', '', sysdate, sysdate);



-- 매칭 게시판 댓글
CREATE TABLE tb_matching_comment (
   matching_comment_no   number(5)      NOT NULL,
   member_id   varchar2(12)      NOT NULL,
   matching_no   number(5)      NOT NULL,
   matching_comment_nickname   varchar2(50)      NULL,
   matching_comment_content   varchar2(4000)      NOT NULL,
   mathcing_comment_date   date   DEFAULT sysdate   NOT NULL
);

ALTER TABLE tb_matching_comment ADD CONSTRAINT PK_TB_MATCHING_COMMENT PRIMARY KEY (
   matching_comment_no,
   member_id,
   matching_no
);
ALTER TABLE tb_matching_comment ADD CONSTRAINT FK_tb_matching_board_TO_tb_matching_comment_1 FOREIGN KEY (
   matching_no
)
REFERENCES tb_matching_board (
   matching_no
);






------------------------------------------------------------------------------------ 게시판 공통 ------------------------------------------------------------------------------------

CREATE TABLE tb_common_board (
   common_no   number(5)      NOT NULL,
   common_type   number(1)      NOT NULL,
   member_id   varchar2(12)      NOT NULL,
   member_type_id   number(1)      NOT NULL,
   common_nickname   varchar2(50)      NULL,
   common_title   varchar2(100)      NOT NULL,
   common_content   clob      NOT NULL,
   common_register_date   date   DEFAULT sysdate   NOT NULL,
   common_edit   date   DEFAULT sysdate   NULL,
   common_readcnt   number(7)   DEFAULT 0   NOT NULL,
   common_block_confirm   char(1)   DEFAULT 'N'   NOT NULL,
   common_block_date   date   DEFAULT sysdate   NULL,
   
   FOREIGN key (member_id) references tb_admin(admin_id) on delete cascade,
   FOREIGN key (member_id) references tb_personal(personal_id) on delete cascade,
   FOREIGN key (member_id) references tb_academy(academy_id) on delete cascade,

);

select * from tb_admin;
select * from tb_academy;
ALTER TABLE tb_personal ADD CONSTRAINT UQ_personal UNIQUE (personal_id);
ALTER TABLE tb_admin ADD CONSTRAINT UQ_admin UNIQUE (admin_id);
ALTER TABLE tb_academy ADD CONSTRAINT UQ_academy UNIQUE (academy_id);

ALTER TABLE tb_personal ADD CONSTRAINT U_mpeasdfrsonal UNIQUE (member_type_id);
ALTER TABLE tb_admin ADD CONSTRAINT UQ_madmasdfin UNIQUE (member_type_id);
ALTER TABLE tb_academy ADD CONSTRAINT UQ_macadeasdfmy UNIQUE (member_type_id);


drop table tb_common_board;
ALTER TABLE tb_common_board ADD CONSTRAINT PK_TB_COMMON_BOARD PRIMARY KEY (
   common_no,
   common_type,
   member_type_id
);
ALTER TABLE tb_common_board ADD CONSTRAINT FK_tb_personal_TO_tb_common_board_1 FOREIGN KEY (
   member_id
)
REFERENCES tb_personal (
   personal_id
);
ALTER TABLE tb_common_board ADD CONSTRAINT FK_tb_admin_TO_tb_common_board_1 FOREIGN KEY (
   member_id
)
REFERENCES tb_admin (
   admin_id
);
ALTER TABLE tb_common_board ADD CONSTRAINT FK_tb_academy_TO_tb_common_board_1 FOREIGN KEY (
   member_type_id
)
REFERENCES tb_academy (
   member_type_id
);

drop table tb_common_board;

------------------------------------------------------------------------------------ 댓글(공통) ------------------------------------------------------------------------------------
CREATE TABLE tb_common_comment (
   common_comment_no   number(5)      NOT NULL,
   member_type_id   number(1)      NOT NULL,
   member_id   varchar2(12)      NOT NULL,
   common_no   number(5)      NOT NULL,
   common_type   number(1)      NOT NULL,
   common_nickname   varchar2(50)      NULL,
   common_comment_content   varchar2(4000)      NOT NULL,
   common_commentt_date   date   DEFAULT sysdate   NOT NULL
);
ALTER TABLE tb_common_comment ADD CONSTRAINT PK_TB_COMMON_COMMENT PRIMARY KEY (
   common_comment_no,
   member_type_id,
   member_id,
   common_no,
   common_type
);
ALTER TABLE tb_common_comment ADD CONSTRAINT FK_tb_common_board_TO_tb_common_comment_1 FOREIGN KEY (
   common_no
)
REFERENCES tb_common_board (
   common_no
);

ALTER TABLE tb_common_comment ADD CONSTRAINT FK_tb_common_board_TO_tb_common_comment_2 FOREIGN KEY (
   common_type
)
REFERENCES tb_common_board (
   common_type
);


------------------------------------------------------------------------------------ 첨부파일 ------------------------------------------------------------------------------------
CREATE TABLE tb_file (
   file_no   number(1)      NOT NULL,
   common_no   number(5)      NOT NULL,
   common_type   number(1)      NOT NULL,
   file_path   varchar2(200)      NOT NULL,
   file_name   varchar2(200)      NOT NULL
);

ALTER TABLE tb_file ADD CONSTRAINT PK_TB_FILE PRIMARY KEY (
   file_no,
   common_no,
   common_type
);
ALTER TABLE tb_file ADD CONSTRAINT FK_tb_common_board_TO_tb_file_1 FOREIGN KEY (
   common_no
)
REFERENCES tb_common_board (
   common_no
);
ALTER TABLE tb_file ADD CONSTRAINT FK_tb_common_board_TO_tb_file_2 FOREIGN KEY (
   common_type
)
REFERENCES tb_common_board (
   common_type
);
------------------------------------------------------------------------------------ 좋아요/찜 ------------------------------------------------------------------------------------
CREATE TABLE tb_like (
   like_member_id   varchar2(12)      NOT NULL,
   common_no   number(5)      NOT NULL,
   member_type_id   number(1)      NOT NULL,
   common_type   number(1)      NOT NULL
);




























drop table TB_PERSONAL;

select * from tabs;
