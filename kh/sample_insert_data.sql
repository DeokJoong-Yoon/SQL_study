--<매칭게시판 게시글 샘플데이터>
insert into tb_matching_board
values (matching_board_seq.nextval, 'jaewook19', 'N', NULL, sysdate, NULL, '광진구', '광장동', '초등(저)', '수학', '30만원 이상 40만원 미만', '자기주도적', '', '');
insert into tb_matching_board
values (matching_board_seq.nextval, 'yerin777', 'Y', '1234', sysdate, NULL, '서초구', '신사동', '고등', '미술', '무관', '입시대비', '꼼꼼한 관리', '');

insert into tb_matching_board
values (matching_board_seq.nextval, 'icandoit4765', 'Y', '1234', sysdate, NULL, '서초fasdf구', '신사동', '고등', '미술', '무관', '입시대비', '꼼꼼한 관리', '');
insert into tb_matching_board
values (matching_board_seq.nextval, 'hyunwoo762', 'Y', '1234', sysdate, NULL, '서asdfas구', '신사동', '고등', '미술', '무관', '입시대비', '꼼꼼한 관리', '');

select * from tb_personal;

select * from tb_matching_board;

desc tb_matching_board
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'tb_matching_board';


--<매칭게시판 댓글 샘플데이터>
insert into tb_matching_comment
values(matching_board_comment_seq.nextval, 'angelCom34', 6, '엔젤컴퓨터학원', '엔젤컴퓨터학원입니다', sysdate);
insert into tb_matching_comment
values(matching_board_comment_seq.nextval, 'jebbang67', 5, '동아제과제빵기술학원', '동아제과제빵기술학원입니다', sysdate);

-- 관리자 정보
insert into tb_admin values('admin1', 3, 'admin1234', 'team1', '윤덕중', 'ydj123@naver.com', '01012341234', sysdate, sysdate);
insert into tb_admin values('admin2', 3, 'admin1234', 'team2', '최영민', 'cym123@naver.com', '01043214321', sysdate, sysdate);
insert into tb_admin values('admin3', 3, 'admin1234', 'team3', '서현진', 'shj123@naver.com', '01090909090', sysdate, sysdate);

select * from tb_matching_board;


insert into tb_academy
values ('aca111', 2, '1000000714', sysdate, 'Aca12345!', '장안로드맵수학학원', '동대문구', '장안동', '서울특별시 동대문구 한천로 124', '0212341111', '한기범', 'hgb123@naver.com', '01012345678', '중등', '보습', '기초부터', '', '', '', '', '20만원 이상 30만원 미만', sysdate, 0, '');
insert into tb_academy
values ('choi77', 2, '3000039755', sysdate, 'CJYwriting77!', '최지연국어논술학원', '서초구', '잠원동', '서울특별시 서초구 신반포로 189', '0238779983', '김민규', 'kmk9704@gmail.com', '01017170417', '고등', '논술', '꼼꼼한 관리', '자기주도적', '', '', '', '30만원 이상 40만원 미만', sysdate, 0, '');
insert into tb_academy
values ('aca116', 2, '1000000955', sysdate, 'Pilib16548', '필립학원', '중랑구', '중화동', '서울특별시 중랑구 동일로129길 54', '0251549871', '이광수', 'lks123@naver.com', '01084513485', '고등', '미술', '꼼꼼한 관리', '재밌는 수업', '', '', '', '40만원 이상 50만원 미만', sysdate, 0, '');
insert into tb_academy
values ('yes35114', 2, '1000004758', sysdate, 'YesorNo35114', '예스탑학원', '마포구', '망원동', '서울특별시 마포구 망원로 56', '0235154868', '손흥민', 'Son7@naver.com', '01035414865', '초등(고)', '토목', '친절한 강사', '숙제 없음', '', '', '', '50만원 이상 60만원 미만', sysdate, 0, '');
insert into tb_academy
values ('adoteng1', 2, '3000035043', sysdate, 'ADot1234!!', '에이닷영어학원', '강동구', '명일동', '서울특별시 강동구 동남로71길 32', '0245226744', '전원우', 'wonwoo17@naver.com', '01007171996', '중등', '영어', '꼼꼼한 관리', '심화수업', '', '', '', '40만원 이상 50만원 미만', sysdate, 0, '');
insert into tb_academy
values ('Sky43532', 2, '1000005600', sysdate, 'SkyMath1563', '스카이수학학원', '서대문구', '냉천동', '서울특별시 서대문구 독립문로 64', '0243519874', '이강인', 'Lee841@gmail.com', '01084693121', '초등(저)', '영어', '재밌는 수업', '강의식 수업', '', '', '', '20만원 미만', sysdate, 0, '');
insert into tb_academy
values ('wow87455', 2, '1000005736', sysdate, 'Amazing1242!', '어메이징사운드학원', '은평구', '갈현동', '서울특별시 은평구 갈현로 291-1', '0289461513', '박대기', 'wait77@gmail.com', '01053412714', '고등', '음악', '재밌는 수업', '꼼꼼한 관리', '', '', '', '60만원 이상 70만원 미만', sysdate, 0, '');
insert into tb_academy
values ('piarino78', 2, '3000041629', sysdate, 'Mozart78!', '피아리노성인피아노학원', '강서구', '방화동', '서울특별시 강서구 방화대로 291', '0256569323', '전종서', 'jongseo88@naver.com', '01045623421', '성인', '피아노', '기초부터', '', '', '', '', '30만원 이상 40만원 미만', sysdate, 0, '');
insert into tb_academy
values ('ganada1245', 2, '1000006364', sysdate, 'ILoveKorea123', '가나다한국어학원', '마포구', '동교동', '서울특별시 마포구 동교로25길 15', '0215687354', '걍밍호', 'ImMingho@gmail.com', '01046843215', '성인', '한국어', '숙제 없음', '재밌는 수업', '', '', '', '20만원 미만', sysdate, 0, '');
insert into tb_academy
values ('dachimath1', 2, '3000041630', sysdate, 'mathCrazy33!', '대치의수학교습소', '강남구', '대치동', '서울특별시 강남구 선릉로64길 6', '0244332464', '박정민', 'pjm56@naver.com', '01045623411', '중등', '수학', '기초부터', '꼼꼼한 관리', '강의식 수업', '친절한 강사', '', '40만원 이상 50만원 미만', sysdate, 0, '');
insert into tb_academy
values ('b2thoven', 2, '3000025641', sysdate, 'beethO12@', '리틀베토벤음악교습소', '양천구', '신정동', '서울특별시 양천구 신정로 260', '0246226788', '한예슬', 'seul@gmail.com', '01062224523', '미취학', '피아노', '기초부터', '재밌는 수업', '꼼꼼한 관리', '친절한 강사', '', '20만원 미만', sysdate, 0, '');
insert into tb_academy
values('yemac3432', 2, '1000000293', sysdate, 'yeyemac34$', '예맥보습학원', '중랑구', '묵동', '서울특별시 중랑구 동일로151길 30', '0265822135', '김서라', 'srkim546@gmail.com', '01078456695', '고등', '보습', '자기주도적', '꼼꼼한 관리', '', '', '', '20만원 이상 30만원 미만', sysdate, 0, '');
insert into tb_academy
values ('koreanKass56', 2, '1000007583', sysdate, 'killmedaling242', '한맥키스톤학원', '은평구', '역촌동', '서울특별시 은평구 진흥로1길 36', '0265421357', '김영한', 'kimyounghan11@gmail.com', '01041643541', '초등(저)', '사회', '심화과정', '숙제 없음', '', '', '', '30만원 이상 40만원 미만', sysdate, 0, '');
insert into tb_academy
values ('rosan9943', 2, '3000034125', sysdate, 'ewha0023@', '이화로잔무용학원', '용산구', '이촌동', '서울특별시 용산구 이촌로 46', '0242673422', '전도연', 'doyeon33@gmail.com', '01098337633', '초등', '무용', '기초부터', '재밌는 수업', '친절한 강사', '', '', '30만원 이상 40만원 미만', sysdate, 0, '');
insert into tb_academy
values ('1percent1', 2, '1000008127', sysdate, 'highest8192', '1%하이스트영어수학학원', '은평구', '증산동', '서울특별시 은평구 증산서길 64-14', '0234584153', '강오동', 'kangodong76@gmail.com', '01068547324', ' 초등(고)', '영어', '재밌는 수업', '기초부터', '', '', '', '40만원 이상 50만원 미만', sysdate, 0, '');
insert into tb_academy
values('suhakge342', 2, '3000041988', sysdate, 'shsh322%%', '수학의계단수학교습소', '도봉구', '방학동', '서울특별시 도봉구 해등로 312-3', '7512356465', '서용기', 'sykte1022@naver.com', '01021359784', '초등(저)', '보습', '기초부터', '친절한 강사', '', '', '', '20만원 미만', sysdate, 0, '');
insert into tb_academy
values ('doMath25', 2, '1000008988', sysdate, 'youCandoMath25', '하다수학학원', '은평구', '응암동', '서울특별시 은평구 은평로 228', '0248643211', '김존국', 'zonkook1513@gmail.com', '01049843575', ' 초등', '수학', '친절한 강사', '자기주도적', '', '', '', '30만원 이상 40만원 미만', sysdate, 0, '');
insert into tb_academy
values ('OpenHallym', 2, '1000009924', sysdate, 'openbook353', '개봉한림독서실', '구로구', '개봉동', '서울특별시 구로구 개봉로17라길 25', '0235871354', '방명숙', 'myungsook2154@gmail.com', '01035647632', ' 초등(저)', '논술', '자기주도적', '숙제 없음', '', '', '', '20만원 미만 ', sysdate, 0, '');
insert into tb_academy
values ('letta678', 2, '3000034148', sysdate, 'lettaEng!22', '레타어학원', '양천구', '목동', '서울특별시 양천구 목동중앙북로10길 7-7', '0290083844', '송강', 'songkang@naver.com', '01045335885', '고등', '영어', '심화수업', '꼼꼼한 관리', '강의식 수업', '', '', '50만원 이상 60만원 미만', sysdate, 0, '');
insert into tb_academy
values ('Dreamtree94', 2, '1000011692', sysdate, 'namu51232', '꿈나무웅변학원', '영등포구', '신길동', '서울특별시 영등포구 대방천로 187-1', '0298743215', '정중앙', 'center8916@gmail.com', '01053411532', ' 초등', '기타', '자기주도적', '재밌는 수업', '', '', '', '20만원 미만 ', sysdate, 0, '');
insert into tb_academy
values ('newSound51', 2, '1000013463', sysdate, 'sorimusic121', '새고운소리음악학원', '구로구', '신도림동', '서울특별시 구로구 신도림로 16', '0248334825', '유재섭', 'medduki135@gmail.com', '01068471635', '성인', '음악', '꼼꼼한 관리', '재밌는 수업', '', '', '', '70만원 이상', sysdate, 0, '');
insert into tb_academy
values ('marronnier00', 2, '3000037071', sysdate, 'Japan33!!', '마로니에일본어교습소', '금천구', '시흥동', '서울특별시 금천구 독산로41길 22', '0278783921', '차은우', 'eunwoocha@gmail.com', '01034211913', '성인', '외국어', '기초부터' ,'재밌는 수업', '', '', '', '20만원 이상 30만원 미만', sysdate, 0, '');
insert into tb_academy
values ('ynpeng0213', 2, '1000009111', sysdate, 'dmsvud556#', '은평컴퓨터아트학원', '은평구', '구산동', '서울특별시 은평구 연서로 131', '0241266458', '은서평', 'yspcom78@hanmail.net', '01074125468', '성인', '컴퓨터', '기초부터', '꼼꼼한 관리', '', '', '', '20만원 이상 30만원 미만', sysdate, 0, '');
insert into tb_academy
values ('angelCom34', 2, '1000014911', sysdate, 'ComputerAng12@', '엔젤컴퓨터학원', '도봉구', '창동', '서울특별시 도봉구 노해로65길 7-12', '0246225643', '이도현', 'skydohyun@gmail.com', '01036131515', '성인', '컴퓨터', '기초부터', '자기주도적', '', '', '', '20만원 이상 30만원 미만', sysdate, 0, '');
insert into tb_academy
values('jebbang67', 2, '1000010267', sysdate, 'ehddkdk267%', '동아제과제빵기술학원', '영등포구', '영등포동6가', '서울특별시 영등포구 양산로 186', '0243585214', '이한별', 'lhbb186@naver.com', '01041415213', '성인', '요리/제빵', '기초부터', '재밌는 수업', '', '', '', '20만원 미만', sysdate, 0, '');
insert into tb_academy
values('minyeol433', 2, '1000011057', sysdate, 'eoqjd#$223', '성민열관리기술학원', '영등포구', '영등포동1가', '서울특별시 영등포구 경인로 872', '0243849203', '성민열', 'sungmy3234@gmail.com', '01009890988', '고등', '직업기술', '심화과정', '', '', '', '', '30만원 이상 40만원 미만', sysdate, 0, '');
insert into tb_academy
values ('bigStar77', 2, '1000043977', sysdate, 'bs153842', '큰별음악학원', '성북구', '정릉동', '서울특별시 성북구 솔샘로4길 46', '0213548741', '이만별', '20000star@gmail.com', '01045673481', '고등', '음악', '기초부터', '꼼꼼한 관리', '', '', '', '70만원 이상', sysdate, 0, '');
insert into tb_academy
values ('artis0012', 2, '3000023630', sysdate, 'theArtist23!', '아티스미술교습소', '서초구', '신사동', '서울특별시 강남구 논현로159길 17', '0212524744', '김고은', 'ggone12@naver.com', '01036299932', '고등', '미술', '입시대비', '심화과정', '꼼꼼한 관리', '', '', '70만원 이상', sysdate, 0, '');
insert into tb_academy
values ('C1Math153', 2, '1000043685', sysdate, 'c1c2c3haha', '씨원수학학원', '광진구', '광장동', '서울특별시 광진구 아차산로 499', '0235417891', '김정흔', 'northFace12@gmail.com', '01046837891', '초등(저)', '수학', '자기주도적', '입시대비', '', '', '', '30만원 이상 40만원 미만', sysdate, 0, '');


--<개인회원 샘플데이터 - 26개>
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit3058','강민호','iCandoit3058!','icandoit3058@naver.com', '2000-09-04', '서울특별시 도봉구 도봉로180길 6-23 (도봉동, 도봉동동아에코빌아파트) 102동 1605호)','01030583643');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit3643','윤덕중', 'Deokjungyun12!!', 'icandoit3643@naver.com', '1989-09-09', '서울특별시 노원구 노원로19길 31 (중계동, 중계목화4단지아파트) 101동 1504호)','01040583640');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit4765', '최영민', 'Yeongminchoi12!!','icandoit4765@naver.com', '1998-09-14', '서울특별시 중랑구 면목로 355 (면목동, 삼일아파트) 103동 101호)','01065642365');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit5678','김시온','Sionkim12!!','icandoit5678@naver.com', '2001-01-15', '서울특별시 강남구 삼성로 14 (개포동, 개포자이프레지던스) 405동 2002호', '01012345678');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit6789','김나연','Nayeonkim12!!', 'icandoit1241@gmail.com', '2002-02-25', '서울특별시 마포구 마포대로 195 (아현동, 마포래미안푸르지오) 106동 1803호', '01023456789');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit7890','김길동','Gildong2022','taelent2022@yahoo.com', '1977-03-10', '서울특별시 송파구 올림픽로 435 (신천동, 잠실파크리오아파트) 107동 2104호', '01034567890');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit8901','나철수','Hihi1212!!!','haehaehae@hotmail.com', '2000-04-20', '서울특별시 강동구 천호대로 1077 (천호동, 래미안강동팰리스) 108동 1905호', '01045678901');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit9012','팔용자','Pal000ja!','pal000ja@naver.com', '1979-05-30', '서울특별시 영등포구 영등포로 국제금융로7길 27 (여의도동, 삼부아파트) 109동 2206호', '01056789012');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit0123','박영희','yeongPark12!','yeongpark12@gmail.com', '1998-06-05', '서울특별시 관악구 은천로 93 (봉천동, 관악벽산블루밍1차아파트) 110동 2307호', '01067890123');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('icandoit1234','하연수','Hiwelcome12!','hiwelcome@yahoo.com', '2003-07-15', '서울특별시 강서구 강서로 26 (화곡동, 우장산아이파크e편한세상) 111동 2408호', '01078901234');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('eunbi123','이은비','eunbi0226!','eunbi123@yahoo.com', '1998-02-26', '서울특별시 마포구 홍익로 10 (서교동, 서교푸르지오아파트) 101동 208호', '01020144423');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('bogum88','박보검','Bogummi!22','bogum88@naver.com', '1993-06-16', '서울특별시 은평구 응암로30길 16 (응암동, 백련산SK뷰아이파크아파트) 109동 502호', '01046114625');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('hyunwoo762','이현우','woowoo@46','hwloo77@naver.com', '1997-11-25', '서울특별시 중구 다산로46길 17 (흥인동, 청계천두산위브더제니스아파트) 101동 1202호', '01036365266');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('itzy1234','신류진','ryuryu33!','itzy1234@naver.com', '2001-04-21', '서울특별시 성동구 상왕십리동 왕십리로 410 (상왕십리동, 왕십리뉴타운센트라스아파트) 108동 302호', '01035379898');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values('yoona0044','임윤아','loveyoona2!','yoona@naver.com', '1984-05-15', '서울특별시 성동구 왕십리로 16 (성수동, 서울숲트리마제) 103동 2104호', '01038668789');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('yoonko07', '고윤정', 'heyhey!!22', 'yoonko07@gmail.com', '2007-09-30', '서울특별시 동작구 양녕로 220 (상도동, 상도역 롯데캐슬 파크엘) 113동 1502호', '01046776887');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('jang10jang', '장원영', 'iveive1234!', 'jang10jang@naver.com', '2008-03-23', '서울특별시 동작구 동작대로29길 91 (사당동, 사당우성2단지아파트) 203동 502호', '01099820436');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('yujin5678', '안유진', 'iveahn00!!', 'yujinjin@naver.com', '2010-09-10', '서울특별시 서초구 서초대로65길 13-10 (서초동, 서초래미안아파트) 104동 301호', '01087369878');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('wonbin34', '박원빈', 'handsome1!', 'wonbin34@gmail.com', '2009-02-14', '서울특별시 광진구 아차산로 637 (광장동, 워커힐아파트) 12동 502호', '01033783624');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('junghaha88', '이정하', 'hahasmile!2', 'jungha11@gmail.com', '2009-11-23', '서울특별시 송파구 풍성로26길 31 (풍납동, 송파현대힐스테이트) 202동 1102호', '01087342334');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('squid123', '이정재', 'game2game!', 'jungjae123@gmail.com', '2010-09-23', '서울특별시 서대문구 연희로32길 20 (연희동, 대림아파트) 3동 503호', '01047347878');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('mama3812', '마동석', 'onepunch!12', 'mama3812@naver.com', '2008-03-15', '서울특별시 은평구 통일로 796 (불광동, 북한산힐스테이트7차아파트) 106동 1203호', '01036779870');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('junhyuk05', '이준혁', 'nacho55@@', 'ljh0505@gmail.com', '2007-07-21', '서울특별시 종로구 자하문호 260-9 (부암동, 유원빌라) 2동 201호', '01047346678');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('dabin978', '홍다빈', 'dprlive!22', 'dabin978@naver.com', '2006-04-12', '서울특별시 성북구 길음로 16 (길음동, 길음뉴타운래미안6단지아파트) 604동 1204호', '01098344622');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('yerin777', '백예린', 'paikyr@77', 'yerin777@naver.com', '2009-09-22', '서울특별시 동대문구 고산자로 534 (제기동, 제기동한신휴플러스아파트) 107동 902호', '01076990034');
insert into tb_personal(personal_id, personal_name, personal_passwd, personal_email, personal_birth, personal_address, personal_phone)
values ('jaewook19', '이재욱', 'leejae@11', 'jaewook19@gmail.com', '2008-04-19', '서울특별시 광진구 아차산로 262 (자양동, 더샵스타시티) C동 503호', '01000244639'); 










select * from tb_academy_source;
desc tb_academy_source;
select count(*) from tb_academy_source;
select * from tb_academy_source where ACADEMY_CURRICULUM_NAME IS NULL;
select distinct ACADEMY_CURRICULUM_NAME, count(ACADEMY_NUMBER) as ccount
from tb_academy_source
group by ACADEMY_CURRICULUM_NAME
order by ccount desc ;

select * from tb_academy_source
where ACADEMY_GU_ADDRESS ='강동구'
and ACADEMY_DONG_ADDRESS like '%번동%';

select * from tb_personal;

select academy_name, academy_type,  from tb_academy_source
where ACADEMY_CURRICULUM_NAME like '%예능(중)%';

select * from tb_academy_source where rownum <= 10;

select * from 
(select * from tb_academy_source
where
ACADEMY_GU_ADDRESS ='강북구'
and ACADEMY_DONG_ADDRESS like '%번동%')
where academy_field_name like '%예능%';

SELECT * FROM
(
SELECT * FROM
    tb_academy_source
WHERE
    academy_gu_address = '강북구'
    AND academy_dong_address LIKE '%번동%'
)
WHERE (academy_field_name || academy_curriculum_series_name || academy_curriculum_list_name || academy_curriculum_name) like '%입시%';

SELECT * FROM (
		SELECT * FROM
		    tb_academy_source
		WHERE
		    ACADEMY_GU_ADDRESS = '강북구'
		    and ACADEMY_DONG_ADDRESS LIKE '%' || '번동' || '%'
		)
		WHERE (academy_field_name || academy_curriculum_series_name || academy_curriculum_list_name || academy_curriculum_name)
		like '%' || '보습' || '%';
        
        		SELECT * FROM
		( SELECT * FROM tb_academy_source WHERE ACADEMY_GU_ADDRESS
		= '강북구'
		AND ACADEMY_DONG_ADDRESS LIKE '%' ||  '번동'	|| '%' )
		WHERE (
		academy_field_name || academy_curriculum_series_name || academy_curriculum_list_name
		|| academy_curriculum_name
		) like '%' || '보습' || '%';









desc tb_academy_source;
delete from tb_academy_source;
select * from tb_admin;


insert into tb_academy_source values(
'양천구',
'교습소',
'16739',
'강해수학교습소',	'서울특별시 양천구 목동서로 77',
'현대월드타워 505호 (목동)',
'입시.검정 및 보습',
'보통교과',
'수학',
'보습',
'4',
'2',
'수학:443160, 수학:531800',
'Y',
'N',	
'158735',
'개원',
'20070328',
'0',	
'99999999',
'20070328',
'20231018');

insert into tb_academy_source values('양천구','학원','3000043571','영재코칭리드인학원','서울특별시 양천구 목동서로 213',', 604호, 605호 (목동, 세신비젼프라자)','입시.검정 및 보습','보통교과','','보습?논술','50','30','','Y','N','07995','개원','20230313','','99991231','20230313','20231018');
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
values('admin1', 3, '1234', 'team1', ' 윤덕중', 'ydj123@naver.com', '01012341234', sysdate, sysdate);
insert into tb_admin
values('a', 3, 'a', 'team1', ' 윤', 'yydj123@naver.com', '01012341234', sysdate, sysdate);

insert into tb_admin
values('admin2', 3, '1234', 'team2', '최영민', 'cym123@naver.com', '01043214321', sysdate, sysdate);

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
		'보습' || '%';



select * from tb_common_board order by common_register_date desc;

desc tb_common_board;


insert into tb_common_board values(notice_board_seq.nextval, '', '', 'admin1', 3, '관리자1', '공지게시판1', '공지게시판 내용내용내용1 내용내용내용1 내용내용내용1', sysdate, sysdate, 0, 'N', sysdate);

CREATE OR REPLACE PROCEDURE BOARD_PAGING_INSERT
IS
BEGIN
    FOR cnt IN 1 .. 120 LOOP
        INSERT INTO tb_common_board VALUES(notice_board_seq.nextval, '', '', 'admin1', 3, '관리자1', '공지게시판' || cnt, '감히 이룰 수 없는 꿈을꾸고,
        감히 이루어질 수 없는 사랑을 하고, 
        감히 견딜 수 없는 고통을 견디며,
        감히 용감한 자도 가지 못한 곳을 가며,
        감히 닿지 못할 저 밤하늘의 별에 이른다는 것.
        
        이것이 나의 순례이며
        저 별을 따라가는 것이 나의 길이라오
        아무리 희망이 없을 지라도,
        또한 아무리 멀리 있을 지라도......', sysdate, sysdate, 0, 'N', sysdate
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






