--<��Ī�Խ��� �Խñ� ���õ�����>
insert into tb_matching_board
values (matching_board_seq.nextval, 'jaewook19', 'N', NULL, sysdate, NULL, '������', '���嵿', '�ʵ�(��)', '����', '30���� �̻� 40���� �̸�', '�ڱ��ֵ���', '', '');
insert into tb_matching_board
values (matching_board_seq.nextval, 'yerin777', 'Y', '1234', sysdate, NULL, '���ʱ�', '�Ż絿', '���', '�̼�', '����', '�Խô��', '�Ĳ��� ����', '');

insert into tb_matching_board
values (matching_board_seq.nextval, 'icandoit4765', 'Y', '1234', sysdate, NULL, '����fasdf��', '�Ż絿', '���', '�̼�', '����', '�Խô��', '�Ĳ��� ����', '');
insert into tb_matching_board
values (matching_board_seq.nextval, 'hyunwoo762', 'Y', '1234', sysdate, NULL, '��asdfas��', '�Ż絿', '���', '�̼�', '����', '�Խô��', '�Ĳ��� ����', '');

select * from tb_personal;

select * from tb_matching_board;

desc tb_matching_board
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'tb_matching_board';


--<��Ī�Խ��� ��� ���õ�����>
insert into tb_matching_comment
values(matching_board_comment_seq.nextval, 'angelCom34', 6, '������ǻ���п�', '������ǻ���п��Դϴ�', sysdate);
insert into tb_matching_comment
values(matching_board_comment_seq.nextval, 'jebbang67', 5, '����������������п�', '����������������п��Դϴ�', sysdate);

-- ������ ����
insert into tb_admin values('admin1', 3, 'admin1234', 'team1', '������', 'ydj123@naver.com', '01012341234', sysdate, sysdate);
insert into tb_admin values('admin2', 3, 'admin1234', 'team2', '�ֿ���', 'cym123@naver.com', '01043214321', sysdate, sysdate);
insert into tb_admin values('admin3', 3, 'admin1234', 'team3', '������', 'shj123@naver.com', '01090909090', sysdate, sysdate);

select * from tb_matching_board;


insert into tb_academy
values ('aca111', 2, '1000000714', sysdate, 'Aca12345!', '��ȷε�ʼ����п�', '���빮��', '��ȵ�', '����Ư���� ���빮�� ��õ�� 124', '0212341111', '�ѱ��', 'hgb123@naver.com', '01012345678', '�ߵ�', '����', '���ʺ���', '', '', '', '', '20���� �̻� 30���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('choi77', 2, '3000039755', sysdate, 'CJYwriting77!', '�������������п�', '���ʱ�', '�����', '����Ư���� ���ʱ� �Ź����� 189', '0238779983', '��α�', 'kmk9704@gmail.com', '01017170417', '���', '���', '�Ĳ��� ����', '�ڱ��ֵ���', '', '', '', '30���� �̻� 40���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('aca116', 2, '1000000955', sysdate, 'Pilib16548', '�ʸ��п�', '�߶���', '��ȭ��', '����Ư���� �߶��� ���Ϸ�129�� 54', '0251549871', '�̱���', 'lks123@naver.com', '01084513485', '���', '�̼�', '�Ĳ��� ����', '��մ� ����', '', '', '', '40���� �̻� 50���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('yes35114', 2, '1000004758', sysdate, 'YesorNo35114', '����ž�п�', '������', '������', '����Ư���� ������ ������ 56', '0235154868', '�����', 'Son7@naver.com', '01035414865', '�ʵ�(��)', '���', 'ģ���� ����', '���� ����', '', '', '', '50���� �̻� 60���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('adoteng1', 2, '3000035043', sysdate, 'ADot1234!!', '���̴念���п�', '������', '���ϵ�', '����Ư���� ������ ������71�� 32', '0245226744', '������', 'wonwoo17@naver.com', '01007171996', '�ߵ�', '����', '�Ĳ��� ����', '��ȭ����', '', '', '', '40���� �̻� 50���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('Sky43532', 2, '1000005600', sysdate, 'SkyMath1563', '��ī�̼����п�', '���빮��', '��õ��', '����Ư���� ���빮�� �������� 64', '0243519874', '�̰���', 'Lee841@gmail.com', '01084693121', '�ʵ�(��)', '����', '��մ� ����', '���ǽ� ����', '', '', '', '20���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('wow87455', 2, '1000005736', sysdate, 'Amazing1242!', '�����¡�����п�', '����', '������', '����Ư���� ���� ������ 291-1', '0289461513', '�ڴ��', 'wait77@gmail.com', '01053412714', '���', '����', '��մ� ����', '�Ĳ��� ����', '', '', '', '60���� �̻� 70���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('piarino78', 2, '3000041629', sysdate, 'Mozart78!', '�ǾƸ��뼺���ǾƳ��п�', '������', '��ȭ��', '����Ư���� ������ ��ȭ��� 291', '0256569323', '������', 'jongseo88@naver.com', '01045623421', '����', '�ǾƳ�', '���ʺ���', '', '', '', '', '30���� �̻� 40���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('ganada1245', 2, '1000006364', sysdate, 'ILoveKorea123', '�������ѱ����п�', '������', '������', '����Ư���� ������ ������25�� 15', '0215687354', '����ȣ', 'ImMingho@gmail.com', '01046843215', '����', '�ѱ���', '���� ����', '��մ� ����', '', '', '', '20���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('dachimath1', 2, '3000041630', sysdate, 'mathCrazy33!', '��ġ�Ǽ��б�����', '������', '��ġ��', '����Ư���� ������ ������64�� 6', '0244332464', '������', 'pjm56@naver.com', '01045623411', '�ߵ�', '����', '���ʺ���', '�Ĳ��� ����', '���ǽ� ����', 'ģ���� ����', '', '40���� �̻� 50���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('b2thoven', 2, '3000025641', sysdate, 'beethO12@', '��Ʋ���亥���Ǳ�����', '��õ��', '������', '����Ư���� ��õ�� ������ 260', '0246226788', '�ѿ���', 'seul@gmail.com', '01062224523', '������', '�ǾƳ�', '���ʺ���', '��մ� ����', '�Ĳ��� ����', 'ģ���� ����', '', '20���� �̸�', sysdate, 0, '');
insert into tb_academy
values('yemac3432', 2, '1000000293', sysdate, 'yeyemac34$', '���ƺ����п�', '�߶���', '����', '����Ư���� �߶��� ���Ϸ�151�� 30', '0265822135', '�輭��', 'srkim546@gmail.com', '01078456695', '���', '����', '�ڱ��ֵ���', '�Ĳ��� ����', '', '', '', '20���� �̻� 30���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('koreanKass56', 2, '1000007583', sysdate, 'killmedaling242', '�Ѹ�Ű�����п�', '����', '���̵�', '����Ư���� ���� �����1�� 36', '0265421357', '�迵��', 'kimyounghan11@gmail.com', '01041643541', '�ʵ�(��)', '��ȸ', '��ȭ����', '���� ����', '', '', '', '30���� �̻� 40���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('rosan9943', 2, '3000034125', sysdate, 'ewha0023@', '��ȭ���ܹ����п�', '��걸', '���̵�', '����Ư���� ��걸 ���̷� 46', '0242673422', '������', 'doyeon33@gmail.com', '01098337633', '�ʵ�', '����', '���ʺ���', '��մ� ����', 'ģ���� ����', '', '', '30���� �̻� 40���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('1percent1', 2, '1000008127', sysdate, 'highest8192', '1%���̽�Ʈ��������п�', '����', '���굿', '����Ư���� ���� ���꼭�� 64-14', '0234584153', '������', 'kangodong76@gmail.com', '01068547324', ' �ʵ�(��)', '����', '��մ� ����', '���ʺ���', '', '', '', '40���� �̻� 50���� �̸�', sysdate, 0, '');
insert into tb_academy
values('suhakge342', 2, '3000041988', sysdate, 'shsh322%%', '�����ǰ�ܼ��б�����', '������', '���е�', '����Ư���� ������ �ص�� 312-3', '7512356465', '�����', 'sykte1022@naver.com', '01021359784', '�ʵ�(��)', '����', '���ʺ���', 'ģ���� ����', '', '', '', '20���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('doMath25', 2, '1000008988', sysdate, 'youCandoMath25', '�ϴټ����п�', '����', '���ϵ�', '����Ư���� ���� ����� 228', '0248643211', '������', 'zonkook1513@gmail.com', '01049843575', ' �ʵ�', '����', 'ģ���� ����', '�ڱ��ֵ���', '', '', '', '30���� �̻� 40���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('OpenHallym', 2, '1000009924', sysdate, 'openbook353', '�����Ѹ�������', '���α�', '������', '����Ư���� ���α� ������17��� 25', '0235871354', '����', 'myungsook2154@gmail.com', '01035647632', ' �ʵ�(��)', '���', '�ڱ��ֵ���', '���� ����', '', '', '', '20���� �̸� ', sysdate, 0, '');
insert into tb_academy
values ('letta678', 2, '3000034148', sysdate, 'lettaEng!22', '��Ÿ���п�', '��õ��', '��', '����Ư���� ��õ�� ���߾ӺϷ�10�� 7-7', '0290083844', '�۰�', 'songkang@naver.com', '01045335885', '���', '����', '��ȭ����', '�Ĳ��� ����', '���ǽ� ����', '', '', '50���� �̻� 60���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('Dreamtree94', 2, '1000011692', sysdate, 'namu51232', '�޳��������п�', '��������', '�ű浿', '����Ư���� �������� ���õ�� 187-1', '0298743215', '���߾�', 'center8916@gmail.com', '01053411532', ' �ʵ�', '��Ÿ', '�ڱ��ֵ���', '��մ� ����', '', '', '', '20���� �̸� ', sysdate, 0, '');
insert into tb_academy
values ('newSound51', 2, '1000013463', sysdate, 'sorimusic121', '�����Ҹ������п�', '���α�', '�ŵ�����', '����Ư���� ���α� �ŵ����� 16', '0248334825', '���缷', 'medduki135@gmail.com', '01068471635', '����', '����', '�Ĳ��� ����', '��մ� ����', '', '', '', '70���� �̻�', sysdate, 0, '');
insert into tb_academy
values ('marronnier00', 2, '3000037071', sysdate, 'Japan33!!', '���δϿ��Ϻ������', '��õ��', '���ﵿ', '����Ư���� ��õ�� �����41�� 22', '0278783921', '������', 'eunwoocha@gmail.com', '01034211913', '����', '�ܱ���', '���ʺ���' ,'��մ� ����', '', '', '', '20���� �̻� 30���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('ynpeng0213', 2, '1000009111', sysdate, 'dmsvud556#', '������ǻ�;�Ʈ�п�', '����', '���굿', '����Ư���� ���� ������ 131', '0241266458', '������', 'yspcom78@hanmail.net', '01074125468', '����', '��ǻ��', '���ʺ���', '�Ĳ��� ����', '', '', '', '20���� �̻� 30���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('angelCom34', 2, '1000014911', sysdate, 'ComputerAng12@', '������ǻ���п�', '������', 'â��', '����Ư���� ������ ���ط�65�� 7-12', '0246225643', '�̵���', 'skydohyun@gmail.com', '01036131515', '����', '��ǻ��', '���ʺ���', '�ڱ��ֵ���', '', '', '', '20���� �̻� 30���� �̸�', sysdate, 0, '');
insert into tb_academy
values('jebbang67', 2, '1000010267', sysdate, 'ehddkdk267%', '����������������п�', '��������', '��������6��', '����Ư���� �������� ���� 186', '0243585214', '���Ѻ�', 'lhbb186@naver.com', '01041415213', '����', '�丮/����', '���ʺ���', '��մ� ����', '', '', '', '20���� �̸�', sysdate, 0, '');
insert into tb_academy
values('minyeol433', 2, '1000011057', sysdate, 'eoqjd#$223', '���ο���������п�', '��������', '��������1��', '����Ư���� �������� ���η� 872', '0243849203', '���ο�', 'sungmy3234@gmail.com', '01009890988', '���', '�������', '��ȭ����', '', '', '', '', '30���� �̻� 40���� �̸�', sysdate, 0, '');
insert into tb_academy
values ('bigStar77', 2, '1000043977', sysdate, 'bs153842', 'ū�������п�', '���ϱ�', '������', '����Ư���� ���ϱ� �ֻ���4�� 46', '0213548741', '�̸���', '20000star@gmail.com', '01045673481', '���', '����', '���ʺ���', '�Ĳ��� ����', '', '', '', '70���� �̻�', sysdate, 0, '');
insert into tb_academy
values ('artis0012', 2, '3000023630', sysdate, 'theArtist23!', '��Ƽ���̼�������', '���ʱ�', '�Ż絿', '����Ư���� ������ ������159�� 17', '0212524744', '�����', 'ggone12@naver.com', '01036299932', '���', '�̼�', '�Խô��', '��ȭ����', '�Ĳ��� ����', '', '', '70���� �̻�', sysdate, 0, '');
insert into tb_academy
values ('C1Math153', 2, '1000043685', sysdate, 'c1c2c3haha', '���������п�', '������', '���嵿', '����Ư���� ������ ������� 499', '0235417891', '������', 'northFace12@gmail.com', '01046837891', '�ʵ�(��)', '����', '�ڱ��ֵ���', '�Խô��', '', '', '', '30���� �̻� 40���� �̸�', sysdate, 0, '');


--<����ȸ�� ���õ����� - 26��>
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit3058','����ȣ','iCandoit3058!','icandoit3058@naver.com', '2000-09-04', '����Ư���� ������ ������180�� 6-23 (������, ���������ƿ��ں�����Ʈ) 102�� 1605ȣ)','01030583643');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit3643','������', 'Deokjungyun12!!', 'icandoit3643@naver.com', '1989-09-09', '����Ư���� ����� �����19�� 31 (�߰赿, �߰��ȭ4��������Ʈ) 101�� 1504ȣ)','01040583640');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit4765', '�ֿ���', 'Yeongminchoi12!!','icandoit4765@naver.com', '1998-09-14', '����Ư���� �߶��� ���� 355 (���, ���Ͼ���Ʈ) 103�� 101ȣ)','01065642365');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit5678','��ÿ�','Sionkim12!!','icandoit5678@naver.com', '2001-01-15', '����Ư���� ������ �Ｚ�� 14 (������, ������������������) 405�� 2002ȣ', '01012345678');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit6789','�質��','Nayeonkim12!!', 'icandoit1241@gmail.com', '2002-02-25', '����Ư���� ������ ������� 195 (������, �������̾�Ǫ������) 106�� 1803ȣ', '01023456789');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit7890','��浿','Gildong2022','taelent2022@yahoo.com', '1977-03-10', '����Ư���� ���ı� �ø��ȷ� 435 (��õ��, �����ũ��������Ʈ) 107�� 2104ȣ', '01034567890');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit8901','��ö��','Hihi1212!!!','haehaehae@hotmail.com', '2000-04-20', '����Ư���� ������ õȣ��� 1077 (õȣ��, ���̾Ȱ����Ӹ���) 108�� 1905ȣ', '01045678901');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit9012','�ȿ���','Pal000ja!','pal000ja@naver.com', '1979-05-30', '����Ư���� �������� �������� ����������7�� 27 (���ǵ���, ��ξ���Ʈ) 109�� 2206ȣ', '01056789012');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit0123','�ڿ���','yeongPark12!','yeongpark12@gmail.com', '1998-06-05', '����Ư���� ���Ǳ� ��õ�� 93 (��õ��, ���Ǻ������1������Ʈ) 110�� 2307ȣ', '01067890123');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit1234','�Ͽ���','Hiwelcome12!','hiwelcome@yahoo.com', '2003-07-15', '����Ư���� ������ ������ 26 (ȭ�, ����������ũe���Ѽ���) 111�� 2408ȣ', '01078901234');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('eunbi123','������','eunbi0226!','eunbi123@yahoo.com', '1998-02-26', '����Ư���� ������ ȫ�ͷ� 10 (������, ����Ǫ����������Ʈ) 101�� 208ȣ', '01020144423');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('bogum88','�ں���','Bogummi!22','bogum88@naver.com', '1993-06-16', '����Ư���� ���� ���Ϸ�30�� 16 (���ϵ�, ��û�SK�������ũ����Ʈ) 109�� 502ȣ', '01046114625');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('hyunwoo762','������','woowoo@46','hwloo77@naver.com', '1997-11-25', '����Ư���� �߱� �ٻ��46�� 17 (���ε�, û��õ�λ���������Ͻ�����Ʈ) 101�� 1202ȣ', '01036365266');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('itzy1234','�ŷ���','ryuryu33!','itzy1234@naver.com', '2001-04-21', '����Ư���� ������ ��սʸ��� �սʸ��� 410 (��սʸ���, �սʸ���Ÿ�Ʈ�󽺾���Ʈ) 108�� 302ȣ', '01035379898');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('yoona0044','������','loveyoona2!','yoona@naver.com', '1984-05-15', '����Ư���� ������ �սʸ��� 16 (������, ���｣Ʈ������) 103�� 2104ȣ', '01038668789');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('yoonko07', '������', 'heyhey!!22', 'yoonko07@gmail.com', '2007-09-30', '����Ư���� ���۱� ���� 220 (�󵵵�, �󵵿� �Ե�ĳ�� ��ũ��) 113�� 1502ȣ', '01046776887');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('jang10jang', '�����', 'iveive1234!', 'jang10jang@naver.com', '2008-03-23', '����Ư���� ���۱� ���۴��29�� 91 (��絿, ���켺2��������Ʈ) 203�� 502ȣ', '01099820436');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('yujin5678', '������', 'iveahn00!!', 'yujinjin@naver.com', '2010-09-10', '����Ư���� ���ʱ� ���ʴ��65�� 13-10 (���ʵ�, ���ʷ��̾Ⱦ���Ʈ) 104�� 301ȣ', '01087369878');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('wonbin34', '�ڿ���', 'handsome1!', 'wonbin34@gmail.com', '2009-02-14', '����Ư���� ������ ������� 637 (���嵿, ��Ŀ������Ʈ) 12�� 502ȣ', '01033783624');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('junghaha88', '������', 'hahasmile!2', 'jungha11@gmail.com', '2009-11-23', '����Ư���� ���ı� ǳ����26�� 31 (ǳ����, ����������������Ʈ) 202�� 1102ȣ', '01087342334');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('squid123', '������', 'game2game!', 'jungjae123@gmail.com', '2010-09-23', '����Ư���� ���빮�� �����32�� 20 (����, �븲����Ʈ) 3�� 503ȣ', '01047347878');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('mama3812', '������', 'onepunch!12', 'mama3812@naver.com', '2008-03-15', '����Ư���� ���� ���Ϸ� 796 (�ұ���, ���ѻ���������Ʈ7������Ʈ) 106�� 1203ȣ', '01036779870');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('junhyuk05', '������', 'nacho55@@', 'ljh0505@gmail.com', '2007-07-21', '����Ư���� ���α� ���Ϲ�ȣ 260-9 (�ξϵ�, ��������) 2�� 201ȣ', '01047346678');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('dabin978', 'ȫ�ٺ�', 'dprlive!22', 'dabin978@naver.com', '2006-04-12', '����Ư���� ���ϱ� ������ 16 (������, ������Ÿ��̾�6��������Ʈ) 604�� 1204ȣ', '01098344622');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('yerin777', '�鿹��', 'paikyr@77', 'yerin777@naver.com', '2009-09-22', '����Ư���� ���빮�� ����ڷ� 534 (���⵿, ���⵿�ѽ����÷�������Ʈ) 107�� 902ȣ', '01076990034');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('jaewook19', '�����', 'leejae@11', 'jaewook19@gmail.com', '2008-04-19', '����Ư���� ������ ������� 262 (�ھ絿, ������Ÿ��Ƽ) C�� 503ȣ', '01000244639'); 










select * from tb_academy_source;
desc tb_academy_source;
select count(*) from tb_academy_source;
select * from tb_academy_source where ACADEMY_CURRICULUM_NAME IS NULL;
select distinct ACADEMY_CURRICULUM_NAME, count(ACADEMY_NUMBER) as ccount
from tb_academy_source
group by ACADEMY_CURRICULUM_NAME
order by ccount desc ;

select * from tb_academy_source
where ACADEMY_GU_ADDRESS ='������'
and ACADEMY_DONG_ADDRESS like '%����%';

select * from tb_personal;

select academy_name, academy_type,  from tb_academy_source
where ACADEMY_CURRICULUM_NAME like '%����(��)%';

select * from tb_academy_source where rownum <= 10;

select * from 
(select * from tb_academy_source
where
ACADEMY_GU_ADDRESS ='���ϱ�'
and ACADEMY_DONG_ADDRESS like '%����%')
where academy_field_name like '%����%';

SELECT * FROM
(
SELECT * FROM
    tb_academy_source
WHERE
    academy_gu_address = '���ϱ�'
    AND academy_dong_address LIKE '%����%'
)
WHERE (academy_field_name || academy_curriculum_series_name || academy_curriculum_list_name || academy_curriculum_name) like '%�Խ�%';

SELECT * FROM (
		SELECT * FROM
		    tb_academy_source
		WHERE
		    ACADEMY_GU_ADDRESS = '���ϱ�'
		    and ACADEMY_DONG_ADDRESS LIKE '%' || '����' || '%'
		)
		WHERE (academy_field_name || academy_curriculum_series_name || academy_curriculum_list_name || academy_curriculum_name)
		like '%' || '����' || '%';
        
        		SELECT * FROM
		( SELECT * FROM tb_academy_source WHERE ACADEMY_GU_ADDRESS
		= '���ϱ�'
		AND ACADEMY_DONG_ADDRESS LIKE '%' ||  '����'	|| '%' )
		WHERE (
		academy_field_name || academy_curriculum_series_name || academy_curriculum_list_name
		|| academy_curriculum_name
		) like '%' || '����' || '%';









desc tb_academy_source;
delete from tb_academy_source;
select * from tb_admin;


insert into tb_academy_source values(
'��õ��',
'������',
'16739',
'���ؼ��б�����',	'����Ư���� ��õ�� �񵿼��� 77',
'�������Ÿ�� 505ȣ (��)',
'�Խ�.���� �� ����',
'���뱳��',
'����',
'����',
'4',
'2',
'����:443160, ����:531800',
'Y',
'N',	
'158735',
'����',
'20070328',
'0',	
'99999999',
'20070328',
'20231018');

insert into tb_academy_source values('��õ��','�п�','3000043571','������Ī�������п�','����Ư���� ��õ�� �񵿼��� 213',', 604ȣ, 605ȣ (��, ���ź���������)','�Խ�.���� �� ����','���뱳��','','����?���','50','30','','Y','N','07995','����','20230313','','99991231','20230313','20231018');
ALTER TABLE tb_academy_source
MODIFY (academy_tuition_per_person    varchar2(3000));
commit;

alter table tb_matching_board add matchingGuAddress varchar2(20);
alter table tb_matching_board add matchingDongAddress varchar2(20);
alter table tb_matching_board add matchingTargetGrade varchar2(15);
alter table tb_matching_board add matchingTargetSubject varchar2(20);
alter table tb_matching_board add matchingFee varchar2(40);
alter table tb_matching_board add matchingKeyword1 varchar2(40);
alter table tb_matching_board add matchingKeyword2 varchar2(40);
alter table tb_matching_board add matchingKeyword3 varchar2(40);
ALTER TABLE tb_matching_board DROP COLUMN matchingGuAddress;
ALTER TABLE tb_matching_board DROP COLUMN matchingDongAddress;
ALTER TABLE tb_matching_board DROP COLUMN matchingTargetGrade;
ALTER TABLE tb_matching_board DROP COLUMN matchingTargetSubject;
ALTER TABLE tb_matching_board DROP COLUMN matchingFee;
ALTER TABLE tb_matching_board DROP COLUMN matchingKeyword1;
ALTER TABLE tb_matching_board DROP COLUMN matchingKeyword2;
ALTER TABLE tb_matching_board DROP COLUMN matchingKeyword3;



desc tb_academy_source;
ALTER TABLE tb_academy_source
MODIFY (academy_closed_start_date  varchar2(10));
commit;


ALTER TABLE tb_academy_source MODIFY (academy_register_date  varchar2(10));
ALTER TABLE tb_academy_source MODIFY (academy_closed_end_date  varchar2(10));
ALTER TABLE tb_academy_source MODIFY (academy_open_date  varchar2(10));
ALTER TABLE tb_academy_source MODIFY (academy_loading_date_time varchar2(10));
commit;




ALTER TABLE tb_academy_source MODIFY (academy_total_capacity number(8));
ALTER TABLE tb_academy_source MODIFY (academy_total_capacity_per_day number(8));

commit;

select * from tb_common_board;
board_1710487472892_KakaoTalk_20240307_120128213.jpg
select * from tb_admin;
desc tb_admin;

select * from tb_admin;
insert into tb_admin
values('admin1', 3, '1234', 'team1', ' ������', 'ydj123@naver.com', '01012341234', sysdate, sysdate);
insert into tb_admin
values('a', 3, 'a', 'team1', ' ��', 'yydj123@naver.com', '01012341234', sysdate, sysdate);

insert into tb_admin
values('admin2', 3, '1234', 'team2', '�ֿ���', 'cym123@naver.com', '01043214321', sysdate, sysdate);

desc tb_admin;

		SELECT 
			*
		FROM tb_admin
		WHERE (admin_id = 'admin1' and admin_password = '1234') and member_type_id = 3;




SELECT count(*) FROM tb_academy_source
		WHERE (
		academy_field_name || academy_curriculum_series_name ||
		academy_curriculum_list_name
		|| academy_curriculum_name
		) like '%' ||
		'����' || '%';



select * from tb_common_board order by common_register_date desc;

desc tb_common_board;


insert into tb_common_board values(notice_board_seq.nextval, '', '', 'admin1', 3, '������1', '�����Խ���1', '�����Խ��� ���볻�볻��1 ���볻�볻��1 ���볻�볻��1', sysdate, sysdate, 0, 'N', sysdate);

CREATE OR REPLACE PROCEDURE BOARD_PAGING_INSERT
IS
BEGIN
    FOR cnt IN 1 .. 120 LOOP
        INSERT INTO tb_common_board VALUES(notice_board_seq.nextval, '', '', 'admin1', 3, '������1', '�����Խ���' || cnt, '���� �̷� �� ���� �����ٰ�,
        ���� �̷���� �� ���� ����� �ϰ�, 
        ���� �ߵ� �� ���� ������ �ߵ��,
        ���� �밨�� �ڵ� ���� ���� ���� ����,
        ���� ���� ���� �� ���ϴ��� ���� �̸��ٴ� ��.
        
        �̰��� ���� �����̸�
        �� ���� ���󰡴� ���� ���� ���̶��
        �ƹ��� ����� ���� ����,
        ���� �ƹ��� �ָ� ���� ����......', sysdate, sysdate, 0, 'N', sysdate
        );
    END LOOP;
    COMMIT;
END;
/
SHOW ERROR;

EXECUTE BOARD_PAGING_INSERT;
select * from tb_common_board order by common_register_date desc;
desc tb_common_board;
		SELECT
			common_no, admin_id, member_type_id, common_nickname,
			common_title, common_content, to_char(common_register_date, 'YYYY-MM-DD') as common_register_date,
			to_char(common_edit, 'YYYY-MM-DD') as common_edit, common_readcnt,
			common_block_confirm, to_char(common_block_date, 'YYYY-MM-DD') as common_block_date, common_file
		FROM tb_common_board
		WHERE member_type_id = 3;






