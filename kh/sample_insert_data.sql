--<매칭게시판 게시글 샘플데이터>
insert into tb_matching_board
values (matching_board_seq.nextval, 'jaewook19', 'N', NULL, sysdate, NULL, '광진구', '광장동', '초등(저)', '수학', '30만원 이상 40만원 미만', '자기주도적', '', '');
insert into tb_matching_board
values (matching_board_seq.nextval, 'yerin777', 'Y', '1234', sysdate, NULL, '서초구', '신사동', '고등', '미술', '무관', '입시대비', '꼼꼼한 관리', '');








--<매칭게시판 댓글 샘플데이터>
insert into tb_matching_comment
values(matching_board_comment_seq.nextval, 'angelCom34', 6, '엔젤컴퓨터학원', '엔젤컴퓨터학원입니다', sysdate);
insert into tb_matching_comment
values(matching_board_comment_seq.nextval, 'jebbang67', 4, '동아제과제빵기술학원', '동아제과제빵기술학원입니다', sysdate);