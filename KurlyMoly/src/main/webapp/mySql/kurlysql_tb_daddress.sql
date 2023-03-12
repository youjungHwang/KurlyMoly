create database kurlymoly; 
use kurlymoly;  

-- 쿠폰 목록 SQL Data
CREATE TABLE tb_daddress(
	da_idx bigint auto_increment primary key, -- 배송지번호 연번(자동생성)
    da_memidx bigint not null, -- 회원번호
    da_receiver varchar(20), -- 수취인명
    da_tel varchar(20), -- 전화번호
    da_address varchar(100), -- 주소
    da_deliverytype varchar(10) -- 배송유형 (냉동/냉장/상온/기타)
);

select * from tb_daddress;
drop table tb_daddress; 


INSERT INTO tb_daddress (da_memidx, da_receiver, da_tel, da_address, da_deliverytype ) VALUES(1, "김사과", "010-1111-1111", "(06236) 서울시 강남구 테헤란로 146 현익빌딩 3층", "상온" );

INSERT INTO tb_daddress (da_memidx, da_receiver, da_tel, da_address, da_deliverytype ) VALUES(2, "반하나", "010-1111-1111", "(06236) 서울시 강남구 테헤란로 146 현익빌딩 3층", "상온" );

INSERT INTO tb_daddress (da_memidx, da_receiver, da_tel, da_address, da_deliverytype ) VALUES(3, "오렌지", "010-1111-1111", "(06236) 서울시 강남구 테헤란로 146 현익빌딩 3층", "상온" );
