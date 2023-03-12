create database kurlymoly;
use kurlymoly;

-- 적립 목록 SQL Data 
create table tb_point (
	po_idx bigint auto_increment primary key, -- 적립번호
    po_memidx bigint, -- 회원번호
	po_regdate datetime default now(), -- 등록일시	
    po_type varchar(10), -- 구분(적립/사용/만료)
    po_code varchar(20), -- 적립코드 (APO123 : 상품후기 적립코드 / ACO123 : 쿠폰 적립코드 )
    po_details varchar(100), -- 적립내용
    po_points int, -- 적립금액
    po_duedate datetime default null, -- 만료일시(유효기간)
    po_sumpoints int, -- 누적적립금
	po_duepoints int -- 소멸예정적립금
);

select * from tb_point;
drop table tb_point;

-- ===================================================적립======================================================================
INSERT INTO tb_point (po_memidx, po_regdate, po_type, po_code, po_details, po_points, po_duedate,po_sumpoints, po_duepoints) VALUES (1, '2020-11-23', '적립', 'APO123', '[구매적립]주문5%적립', 447, '2022-05-22', 0, 0);

INSERT INTO tb_point (po_memidx, po_regdate, po_type, po_code, po_details, po_points, po_duedate,po_sumpoints, po_duepoints) VALUES (2, '2020-11-05', '적립', 'APO123', '[구매적립]주문5%적립', 447, '2022-07-29', 0, 0);

INSERT INTO tb_point (po_memidx, po_regdate, po_type, po_code, po_details, po_points, po_duedate,po_sumpoints, po_duepoints) VALUES (3, '2020-11-25', '적립', 'APO123', '[구매적립]주문5%적립', 447, '2022-03-15', 0, 0);


-- ===================================================사용======================================================================
INSERT INTO tb_point (po_memidx, po_regdate, po_type, po_code, po_details, po_points, po_duedate,po_sumpoints, po_duepoints) VALUES (1, '2020-11-23', '사용', 'APO123', '[구매적립]주문5%적립', 447, '2021-07-25', 0, 0);

INSERT INTO tb_point (po_memidx, po_regdate, po_type, po_code, po_details, po_points, po_duedate,po_sumpoints, po_duepoints) VALUES (2, '2020-11-05', '사용', 'APO123', '[구매적립]주문5%적립', 447, '2021-08-30', 0, 0);

INSERT INTO tb_point (po_memidx, po_regdate, po_type, po_code, po_details, po_points, po_duedate,po_sumpoints, po_duepoints) VALUES (3, '2020-11-25', '사용', 'APO123', '[구매적립]주문5%적립', 447, '2021-05-15', 0, 0);
