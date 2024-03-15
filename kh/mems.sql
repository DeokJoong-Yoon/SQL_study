
--������


select * from tabs;

-- ��� ���̺� ���� ��ɾ�
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

-- ��� ���̺� ���� ��ɾ�
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;



select * from tb_payment;
-- ��ü ���̺� ����
--======================================================================================================================================================
--���� ���̺�
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

COMMENT ON COLUMN tb_payment.payment_id IS '����ID';

COMMENT ON COLUMN tb_payment.pg IS 'pg �� �̸�';

COMMENT ON COLUMN tb_payment.pay_method IS '�������';

COMMENT ON COLUMN tb_payment.merchant_uid IS '�ŷ�UID';

COMMENT ON COLUMN tb_payment.name IS '������';

COMMENT ON COLUMN tb_payment.amount IS '�����ݾ�';

COMMENT ON COLUMN tb_payment.academy_id IS '�п�ȸ��ID';

COMMENT ON COLUMN tb_payment.academy_number IS '�п�������ȣ';

COMMENT ON COLUMN tb_payment.academy_name IS '�п���';

COMMENT ON COLUMN tb_payment.academy_manager_name IS '������̸�';

COMMENT ON COLUMN tb_payment.academy_manager_email IS '������̸���';

COMMENT ON COLUMN tb_payment.academy_manager_phone IS '�������ȭ��ȣ';

COMMENT ON COLUMN tb_payment.payment_status IS '�������� 0 : �̰���, 1 : ����';

COMMENT ON COLUMN tb_payment.payment_date IS '��������';



CREATE TABLE tb_like (
    common_no   number(5)      NOT NULL,
   like_member_id   varchar2(12)      NOT NULL
);
COMMENT ON COLUMN tb_like.common_no IS '�Խñ۹�ȣ';
COMMENT ON COLUMN tb_like.like_member_id IS '���ƿ��ۼ���ID';
CREATE TABLE tb_file (
   common_no   number(5)      NOT NULL,
   file_no   number(1)      NOT NULL,
   file_path   varchar2(200)      NOT NULL,
   file_name   varchar2(200)      NOT NULL
);
COMMENT ON COLUMN tb_file.common_no IS '�Խñ۹�ȣ';
COMMENT ON COLUMN tb_file.file_no IS '÷�����Ϲ�ȣ';
COMMENT ON COLUMN tb_file.file_path IS '���ϰ��';
COMMENT ON COLUMN tb_file.file_name IS '÷�����ϸ�';
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
COMMENT ON COLUMN tb_personal.personal_id IS '����ȸ��ID';
COMMENT ON COLUMN tb_personal.member_type_id IS 'ȸ������ID';
COMMENT ON COLUMN tb_personal.personal_name IS '�̸�';
COMMENT ON COLUMN tb_personal.personal_passwd IS '��й�ȣ';
COMMENT ON COLUMN tb_personal.personal_email IS '�̸���';
COMMENT ON COLUMN tb_personal.personal_birth IS '�������';
COMMENT ON COLUMN tb_personal.personal_address IS '�ּ�';
COMMENT ON COLUMN tb_personal.personal_phone IS '��ȭ��ȣ';
COMMENT ON COLUMN tb_personal.personal_join_date IS '��������';
COMMENT ON COLUMN tb_personal.personal_login_fail_count IS '�α��ν���Ƚ��';
COMMENT ON COLUMN tb_personal.personal_account_banned_date IS '�α��������Ͻ�';
COMMENT ON COLUMN tb_personal.personal_passwd_change_date IS '��й�ȣ������������';
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
COMMENT ON COLUMN tb_admin.admin_id IS '������ID';
COMMENT ON COLUMN tb_admin.member_type_id IS 'ȸ������ID';
COMMENT ON COLUMN tb_admin.admin_password IS '������ ��й�ȣ';
COMMENT ON COLUMN tb_admin.admin_team IS '���Ҽ�';
COMMENT ON COLUMN tb_admin.admin_name IS '�������̸�';
COMMENT ON COLUMN tb_admin.admin_email IS '�������̸���';
COMMENT ON COLUMN tb_admin.admin_phone IS '��������ȭ��ȣ';
COMMENT ON COLUMN tb_admin.admin_assigned_date IS '��糯¥';
COMMENT ON COLUMN tb_admin.admin_password_change_date IS '��й�ȣ ���� ���� ����';
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
COMMENT ON COLUMN tb_academy.academy_id IS '�п�ȸ��ID';
COMMENT ON COLUMN tb_academy.member_type_id IS 'ȸ������ID';
COMMENT ON COLUMN tb_academy.academy_number IS '�п�������ȣ(����ڹ�ȣ)';
COMMENT ON COLUMN tb_academy.academy_join_date IS '��������';
COMMENT ON COLUMN tb_academy.academy_passwd IS '��й�ȣ';
COMMENT ON COLUMN tb_academy.academy_name IS '�п���';
COMMENT ON COLUMN tb_academy.academy_gu_address IS '����������';
COMMENT ON COLUMN tb_academy.academy_dong_address IS '�ּ�(������)';
COMMENT ON COLUMN tb_academy.academy_road_address IS '�п����θ��ּ�';
COMMENT ON COLUMN tb_academy.academy_phone IS '�п���ȭ��ȣ';
COMMENT ON COLUMN tb_academy.academy_manager_name IS '������̸�';
COMMENT ON COLUMN tb_academy.academy_manager_email IS '������̸���';
COMMENT ON COLUMN tb_academy.academy_manager_phone IS '�������ȭ��ȣ';
COMMENT ON COLUMN tb_academy.academy_target_grade IS '����г�';
COMMENT ON COLUMN tb_academy.academy_target_subject IS '��������';
COMMENT ON COLUMN tb_academy.academy_keyword1 IS 'Ű����1';
COMMENT ON COLUMN tb_academy.academy_keyword2 IS 'Ű����2';
COMMENT ON COLUMN tb_academy.academy_keyword3 IS 'Ű����3';
COMMENT ON COLUMN tb_academy.academy_keyword4 IS 'Ű����4';
COMMENT ON COLUMN tb_academy.academy_keyword5 IS 'Ű����5';
COMMENT ON COLUMN tb_academy.academy_fee IS '������';
COMMENT ON COLUMN tb_academy.academy_passwd_change_date IS '��й�ȣ ���� ���� ����';
COMMENT ON COLUMN tb_academy.academy_login_fail_count IS '�α��ν���Ƚ��';
COMMENT ON COLUMN tb_academy.academy_account_banned_date IS '�α��������Ͻ�';
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
COMMENT ON COLUMN tb_withdrawal.withdrawal_member_id IS 'Ż��ȸ��ID';
COMMENT ON COLUMN tb_withdrawal.member_type_id IS 'ȸ������ID';
COMMENT ON COLUMN tb_withdrawal.personal_name IS '�̸�';
COMMENT ON COLUMN tb_withdrawal.personal_passwd IS '��й�ȣ';
COMMENT ON COLUMN tb_withdrawal.personal_birth IS '�������';
COMMENT ON COLUMN tb_withdrawal.personal_address IS '�ּ�';
COMMENT ON COLUMN tb_withdrawal.personal_email IS '�̸���';
COMMENT ON COLUMN tb_withdrawal.personal_phone IS '��ȭ��ȣ';
COMMENT ON COLUMN tb_withdrawal.join_date IS '��������';
COMMENT ON COLUMN tb_withdrawal.academy_number IS '�п�������ȣ';
COMMENT ON COLUMN tb_withdrawal.academy_name IS '�п���';
COMMENT ON COLUMN tb_withdrawal.academy_gu_address IS '����������';
COMMENT ON COLUMN tb_withdrawal.academy_dong_address IS '�ּ�(������)';
COMMENT ON COLUMN tb_withdrawal.academy_road_address IS '�п��ּ�';
COMMENT ON COLUMN tb_withdrawal.academy_phone IS '�п���ȭ��ȣ';
COMMENT ON COLUMN tb_withdrawal.academy_manager_name IS '������̸�';
COMMENT ON COLUMN tb_withdrawal.academy_manager_email IS '������̸���';
COMMENT ON COLUMN tb_withdrawal.academy_manager_phone IS '�������ȭ��ȣ';
COMMENT ON COLUMN tb_withdrawal.academy_target_grade IS '����г�';
COMMENT ON COLUMN tb_withdrawal.academy_target_subject IS '��������';
COMMENT ON COLUMN tb_withdrawal.academy_keyword1 IS 'Ű����1';
COMMENT ON COLUMN tb_withdrawal.academy_keyword2 IS 'Ű����2';
COMMENT ON COLUMN tb_withdrawal.academy_keyword3 IS 'Ű����3';
COMMENT ON COLUMN tb_withdrawal.academy_keyword4 IS 'Ű����4';
COMMENT ON COLUMN tb_withdrawal.academy_keyword5 IS 'Ű����5';
COMMENT ON COLUMN tb_withdrawal.academy_fee IS '������';
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
COMMENT ON COLUMN  tb_academy_source . academy_number  IS '�п�������ȣ';
COMMENT ON COLUMN  tb_academy_source . academy_gu_address  IS '����������';
COMMENT ON COLUMN  tb_academy_source . academy_type  IS '�п������ұ���';
COMMENT ON COLUMN  tb_academy_source . academy_name  IS '�п���';
COMMENT ON COLUMN  tb_academy_source . academy_road_address  IS '���θ��ּ�';
COMMENT ON COLUMN  tb_academy_source . academy_dong_address  IS '���θ���ּ�';
COMMENT ON COLUMN  tb_academy_source . academy_field_name  IS '�о߸�';
COMMENT ON COLUMN  tb_academy_source . academy_curriculum_series_name  IS '�����迭��';
COMMENT ON COLUMN  tb_academy_source . academy_curriculum_list_name  IS '����������ϸ�';
COMMENT ON COLUMN  tb_academy_source . academy_curriculum_name  IS '����������';
COMMENT ON COLUMN  tb_academy_source . academy_total_capacity  IS '�����հ�';
COMMENT ON COLUMN  tb_academy_source . academy_total_capacity_per_day  IS '�Ͻü���ɷ��ο��հ�';
COMMENT ON COLUMN  tb_academy_source . academy_tuition_per_person  IS '�δ�����᳻��';
COMMENT ON COLUMN  tb_academy_source . academy_tuition_open_status  IS '�������������';
COMMENT ON COLUMN  tb_academy_source . academy_dormitory_academy_status  IS '������п�����';
COMMENT ON COLUMN  tb_academy_source . academy_road_postal_number  IS '���θ�����ȣ';
COMMENT ON COLUMN  tb_academy_source . academy_register_status_name  IS '��ϻ��¸�';
COMMENT ON COLUMN  tb_academy_source . academy_register_date  IS '�������';
COMMENT ON COLUMN  tb_academy_source . academy_closed_start_date  IS '�޿���������';
COMMENT ON COLUMN  tb_academy_source . academy_closed_end_date  IS '�޿���������';
COMMENT ON COLUMN  tb_academy_source . academy_open_date  IS '��������';
COMMENT ON COLUMN  tb_academy_source . academy_loading_date_time  IS '�����Ͻ�';
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


comment on column tb_common_board.common_thumb is '�Խ��� ����� �̹��� ��� �� ���ϸ�';
comment on column tb_common_board.common_file is '�Խ��� �̹��� ��� �� ���ϸ�';
COMMENT ON COLUMN tb_common_board.common_no IS '�Խñ۹�ȣ';
COMMENT ON COLUMN tb_common_board.personal_id IS '����ȸ��ID';
COMMENT ON COLUMN tb_common_board.academy_id IS '�п�ȸ��ID';
COMMENT ON COLUMN tb_common_board.admin_id IS '������ID';
COMMENT ON COLUMN tb_common_board.member_type_id IS 'ȸ������ID';
COMMENT ON COLUMN tb_common_board.common_nickname IS '�ۼ���';
COMMENT ON COLUMN tb_common_board.common_title IS '�Խñ�����';
COMMENT ON COLUMN tb_common_board.common_content IS '�Խñ۳���';
COMMENT ON COLUMN tb_common_board.common_register_date IS '�Խñ۵������';
COMMENT ON COLUMN tb_common_board.common_edit IS '�Խñۼ�������';
COMMENT ON COLUMN tb_common_board.common_readcnt IS '��ȸ��';
COMMENT ON COLUMN tb_common_board.common_block_confirm IS '�Խñ����ܿ���';
COMMENT ON COLUMN tb_common_board.common_block_date IS '�Խñ���������';
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
COMMENT ON COLUMN tb_matching_board.matching_no IS '�Խñ۹�ȣ';
COMMENT ON COLUMN tb_matching_board.personal_id IS '����ȸ��id';
COMMENT ON COLUMN tb_matching_board.matching_private IS '��бۿ���';
COMMENT ON COLUMN tb_matching_board.matching_passwd IS '��й�ȣ';
COMMENT ON COLUMN tb_matching_board.matching_register_date IS '�������';
COMMENT ON COLUMN tb_matching_board.matching_edit_date IS '��������';
CREATE TABLE tb_common_comment (
    common_no   number(5)      NOT NULL,
   common_comment_no   number(5)      NOT NULL,
   personal_id   varchar2(12)      NOT NULL,
   common_comment_content   varchar2(4000)      NOT NULL,
   common_commentt_date   date   DEFAULT sysdate   NOT NULL
);
COMMENT ON COLUMN tb_common_comment.common_no IS '�Խñ۹�ȣ';
COMMENT ON COLUMN tb_common_comment.common_comment_no IS '��۹�ȣ';
COMMENT ON COLUMN tb_common_comment.personal_id IS '����ȸ��id';
COMMENT ON COLUMN tb_common_comment.common_comment_content IS '��۳���';
COMMENT ON COLUMN tb_common_comment.common_commentt_date IS '�ۼ��Ͻ�';
CREATE TABLE tb_matching_comment (
   matching_comment_no   number(5)      NOT NULL,
   academy_id   varchar2(12)      NOT NULL,
   matching_no   number(5)      NOT NULL,
   matching_comment_nickname   varchar2(50)      NULL,
   matching_comment_content   varchar2(4000)      NOT NULL,
   mathcing_comment_date   date   DEFAULT sysdate   NOT NULL
);
COMMENT ON COLUMN tb_matching_comment.matching_comment_no IS '��۹�ȣ';
COMMENT ON COLUMN tb_matching_comment.academy_id IS '�п�id';
COMMENT ON COLUMN tb_matching_comment.matching_no IS '�Խñ۹�ȣ';
COMMENT ON COLUMN tb_matching_comment.matching_comment_nickname IS '�ۼ���';
COMMENT ON COLUMN tb_matching_comment.matching_comment_content IS '��۳���';
COMMENT ON COLUMN tb_matching_comment.mathcing_comment_date IS '�ۼ��Ͻ�';
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

---- ��Ī�Խ��� ������
create sequence matching_board_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
---- ��Ī�Խ��� ��� ������
create sequence matching_board_comment_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
---- �����Խ��� ������
create sequence free_board_seq
start with 10001
increment by 1
minvalue 1
maxvalue 20000
cycle
cache 2;
---- �����Խ��� ��� ������
create sequence free_board_comment_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
--- �����Խ��� ÷������ ������
create sequence free_board_file_seq
start with 1
increment by 1
maxvalue 10
nocycle
cache 2;
---- ȫ���Խ��� ������
create sequence advertise_board_seq
start with 20001
increment by 1
minvalue 1
maxvalue 30000
cycle
cache 2;
---- ȫ���Խ��� ��� ������
create sequence advertise_board_comment_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
--- ȫ���Խ��� ÷������ ������
create sequence advertise_board_file_seq
start with 1
increment by 1
maxvalue 10
nocycle
cache 2;
---- �����Խ��� ������
create sequence notice_board_seq
start with 30001
increment by 1
minvalue 1
maxvalue 40000
cycle
cache 2;
--- �����Խ��� ÷������ ������
create sequence notice_board_file_seq
start with 1
increment by 1
maxvalue 10
nocycle
cache 2;

---- ���� ���̺� ����ID ������
create sequence payment_seq
start with 1
increment by 1
minvalue 1
maxvalue 50000
cycle
cache 2;


commit;
select * from tb_admin;
