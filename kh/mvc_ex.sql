-- ���̺� ����

-- board �Խ��� ���̺�
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

-- �亯 �Խ����� ���� �÷�  
-- reproot, repstep,  repindent 

-- drop table board;
comment on table  board is '�Խ��� ���̺�';
comment on column board.num is '�Խ��� ��ȣ';
comment on column board.author is '�Խ��� �ۼ���';
comment on column board.title is '�Խ��� ����';    
comment on column board.content is '�Խ��� ����';
comment on column board.writeday is '�Խ��� �����';     
comment on column board.readcnt is '�Խ��� ��ȸ��';     
comment on column board.reproot is '�Խ��� �亯��(�������� ��ȣ ���� - �׷��ȣ)';
comment on column board.repstep is '�Խ��� �亯��(�亯���� ��ġ��ȣ ����)';
comment on column board.repindent is '�Խ��� �亯��(�亯���� ������ȣ ����)';
comment on column board.passwd is '�Խ��� ��й�ȣ';

-- board �Խ��� ���̺� ������ �۹�ȣ ������ (������: ��������.nextval / ���簪: ��������.currval)
create sequence board_seq start with 1
increment by 1
minvalue 1
nocycle
cache 2;

-- drop sequence board_seq; 
desc board;
-- �Ϲ� �Խñ� �Է� �� reproot: num�� ��. repstep/repindent : 0���� �Է��ϸ� �˴ϴ�
-- insert into board( num, author, title, content, reproot, repstep, repindent, passwd )
-- values (board_seq.nextval, ?, ?, ?, board_seq.currval, 0, 0, ?)
select * from board;

insert into board( num, author, title, content, reproot, repstep, repindent, passwd )
values ( board_seq.nextval , 'ȫ�浿', '��¿� ���õ� ���' , 
'�߿��� ���� ��ǥ�� �̷�� ���� �ƴ϶� �� �������� ������ ���� �󸶳� �����ߴ����̴� - �ص�� ��Ʃ��' ,
board_seq.currval, 0,0, '1234' );


-- ��ü�� ��ȸ
SELECT num, title, passwd FROM board;

-- ��й�ȣ Ȯ�� (1 : ��й�ȣ ��ġ / 0 : ��й�ȣ ����ġ)
SELECT NVL((SELECT 1 FROM board WHERE num = 3 AND passwd = '1234'), 0) as result FROM dual;

--SELECT NVL((SELECT 1 FROM board WHERE num = #{num} AND passwd = #{passwd} ), 0) as result FROM dual

-- �Խ��� ����

UPDATE board SET title = '����Ȯ��', content = '�����մϴ�.', passwd = '4321' WHERE num = 1;

-- UPDATE board SET title = ?, content = ?, passwd = ?  WHERE num = ?;

-- �Խ��� ����
DELETE FROM board WHERE num = 1;
-- DELETE FROM board WHERE num = ?;

-- ȸ������ ���̺�
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

comment on table member is 'ȸ�� ����';
comment on column member.num is 'ȸ�� ��ȣ';
comment on column member.m_id is 'ȸ�� ���̵�';
comment on column member.m_passwd is 'ȸ�� ��й�ȣ';
comment on column member.m_name is 'ȸ����';
comment on column member.m_email is 'ȸ�� �̸���';   
comment on column member.m_tel is 'ȸ�� ��ȭ��ȣ';   
comment on column member.reg_date is 'ȸ�� �����'; 

-- ��� ������ ����
create sequence member_seq start with 1
increment by 1
nocycle;

select * from member;