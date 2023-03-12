create database kurlymoly; 
use kurlymoly;  

-- 주문 목록 SQL Data
CREATE TABLE tb_order(
	o_idx bigint auto_increment primary key, -- 주문번호 연번(자동생성)
	o_userid varchar(20), -- 주문자ID
	o_orderer  varchar(20), -- 주문자명
	o_receiver varchar(20), -- 수취인명
	o_tel varchar(20), -- 전화번호
	o_zipcode varchar(10), -- 우편번호
	o_address1 varchar(50), -- 주소1
    o_address2 varchar(50), -- 주소2
    o_address3 varchar(50), -- 주소3
    o_address4 varchar(50) default null, -- 받는장소 
	o_prodamount int, -- 상품금액
	o_discount  int default null, -- 상품할인금액
    o_usecoupon int default null, -- 쿠폰할인금액
	o_usepoint  int default null, -- 적립금사용액
	o_deliveryfee int default null, -- 배송비
	o_amountpaid int, -- 결제금액
	o_addpoint int default null, -- 적립예정금액
	o_paidtype varchar(50), -- 결제방법
	o_paiddate datetime default now(), -- 결제일시
	o_shipnumber varchar(50) default null, -- 대표송장번호
	o_shipstart datetime default null, -- 배송시작일시
	o_shipdone datetime default null, -- 배송완료일시
	o_shipstate varchar(10) default null, -- 처리상태 (미확인/상품준비중/배송중/배송완료/구매확정)
	o_renewdate datetime default now() -- 처리일시
);

select * from tb_order;
drop table tb_order; 

-- 테스트
SELECT * FROM tb_order where o_userid="apple" ORDER BY o_idx DESC;
