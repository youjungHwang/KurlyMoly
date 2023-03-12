create database kurlymoly;
use kurlymoly;


create table tb_like (
	l_idx bigint auto_increment primary key, -- 찜번호
	l_userid varchar(50) not null, -- 회원ID
	l_prodidx bigint, -- 상품번호	
    l_regdate datetime default now() -- 등록일시
);
-- 상품카테고리 연번과 연동하기!!
select * from tb_like;
drop table tb_like;

-- [연꽃마을] 친환경 우엉채 200g
INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('apple11', 12, '2020-03-31');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('banana11', 12, '2020-04-29');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('orange11', 12, '2020-03-31');

-- [올프레쉬] 프리미엄 금실 딸기 2팩 (820g)
INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('apple11', 60, '2019-03-31');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('banana11', 60, '2020-03-31');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('orange11', 60, '2020-03-31');

-- [Dole] 후룻컵 망고
INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('apple11', 77, '2019-08-29');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('banana11', 77, '2019-08-29');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('orange11', 77, '2020-03-31');

-- 딸기 바나나 믹스 1kg (냉동)
INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('apple11', 80, '2020-04-24');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('banana11', 80, '2020-04-24');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('orange11', 80, '2020-02-21');

-- [몽슈슈] 도지마롤 2종
INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('apple11', 271, '2020-03-31');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('banana11', 271, '2019-03-21');

INSERT INTO tb_like (l_userid, l_prodidx, l_regdate) VALUES ('orange11', 271, '2019-03-21');

