create database kurlymoly; 
use kurlymoly;  

-- 쿠폰 목록 SQL Data
CREATE TABLE tb_coupon(
	cp_idx bigint auto_increment primary key, -- 쿠폰발급번호 연번(자동생성)
    cp_memidx bigint, -- 회원번호
    cp_code varchar(10) not null, -- 쿠폰코드 (ACO123 / ACO456)
    cp_name varchar(100), -- 쿠폰명	(ACO123 : [대한민국순산대전] 수산인의 날  / ACO456 : [농활갑시다]토마토 기획전
    cp_details varchar(100), -- 쿠폰발급사유 (ACO123, ACO456 : 첫주문 감사쿠폰)
    cp_amount int, -- 쿠폰금액
    cp_regdate datetime default now(), -- 발급일시
    cp_duedate datetime default null, -- 만료일시
    cp_isused int -- 사용여부(0:미사용/1:사용)
);

-- 인원수당 1~2개 하기 총6개
select * from tb_coupon;
drop table tb_coupon; 

-- 미사용(0) / ACO123 : 1회 무료배송 쿠폰 
INSERT INTO tb_coupon (cp_memidx, cp_code, cp_name, cp_details, cp_amount, cp_regdate, cp_duedate, cp_isused ) VALUES(1, "ACO123", "[대한민국순산대전] 수산인의 날", "수산인의 날 특별전 할인쿠폰", 5000, "2021-02-26 03:43:36", "2021-03-06 23:00:00", 0);

INSERT INTO tb_coupon (cp_memidx, cp_code, cp_name, cp_details, cp_amount, cp_regdate, cp_duedate, cp_isused ) VALUES(2, "ACO123", "[대한민국순산대전] 수산인의 날", "수산인의 날 특별전 할인쿠폰", 5000, "2021-02-26 03:43:36", "2021-03-06 23:00:00", 0);

INSERT INTO tb_coupon (cp_memidx, cp_code, cp_name, cp_details, cp_amount, cp_regdate, cp_duedate, cp_isused ) VALUES(3, "ACO123", "[대한민국순산대전] 수산인의 날", "수산인의 날 특별전 할인쿠폰", 5000, "2021-02-26 03:43:36", "2021-03-06 23:00:00", 0);


-- 사용(1) / ACO456 : 첫주문 감사 무료 할인 쿠폰
INSERT INTO tb_coupon (cp_memidx, cp_code, cp_name, cp_details, cp_amount, cp_regdate, cp_duedate, cp_isused ) VALUES(1, "ACO456", "[농활갑시다]토마토 기획전", "농활쿠폰 스티커 부착 상품 할인", 5000, "2021-02-26 03:43:36", "2021-03-06 11:00:00", 0);

INSERT INTO tb_coupon (cp_memidx, cp_code, cp_name, cp_details, cp_amount, cp_regdate, cp_duedate, cp_isused ) VALUES(2, "ACO456", "[농활갑시다]토마토 기획전", "농활쿠폰 스티커 부착 상품 할인", 5000, "2021-02-26 03:43:36", "2021-03-06 11:00:00", 0);

INSERT INTO tb_coupon (cp_memidx, cp_code, cp_name, cp_details, cp_amount, cp_regdate, cp_duedate, cp_isused ) VALUES(3, "ACO456", "[농활갑시다]토마토 기획전", "농활쿠폰 스티커 부착 상품 할인", 5000, "2021-02-26 03:43:36", "2021-03-06 11:00:00", 0);
