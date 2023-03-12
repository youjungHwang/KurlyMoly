create database kurlymoly; 
use kurlymoly;  

CREATE TABLE tb_basket(
	bk_idx bigint auto_increment primary key, -- 장바구니 번호
    bk_userid varchar(50), -- 회원번호
    bk_prodidx bigint, -- 상품번호
    bk_quantity int, -- 수량
	bk_regdate datetime default now() -- 등록일시
);

select * from tb_basket;
select * from tb_basket where bk_userid='apple';
drop table tb_basket;
