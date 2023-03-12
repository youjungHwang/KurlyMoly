create database kurlymoly; 
use kurlymoly;  

-- 주문 상세목록 SQL Data
CREATE TABLE tb_orderdetail(
	od_idx bigint auto_increment primary key, -- 주문번호 연번(자동생성)
    od_orderidx bigint, -- 주문번호, o_idx 같은지 확인
    od_productidx bigint, -- 상품번호, p_idx 같은지 확인
    od_quantity int, -- 수량
    od_deliverytype varchar(10), -- 배송구분 (냉동,냉장,상온,기타) 
    od_shipnumber varchar(50) default null, -- 송장번호
    od_shipstart datetime default now(), -- 배송시작일시
    od_shipdone datetime default now(), -- 배송완료일시
    od_shipstate varchar(10) default '상품준비중', -- 처리상태(미확인/상품준비중/배송중/배송완료/구매확정)
    od_renewdate datetime default now() -- 처리일시
);

select * from tb_orderdetail;
drop table tb_orderdetail; 

