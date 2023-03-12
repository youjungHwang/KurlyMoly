create database kurlymoly; 
use kurlymoly;  

-- 상품 목록 SQL Data
CREATE TABLE tb_product(
	p_idx bigint auto_increment primary key, -- 연번(자동생성)
	p_category1 varchar(10), -- 카테고리(대) 데이터 값 :001 002 순서대로 등록
    p_category2 varchar(10), -- 카테고리(중) 데이터 값 :01 02 순서대로 등록
    p_title varchar(100) not null, -- 상품명
    p_subtitle varchar(100), -- 한줄설명(안내사항)
	p_brand varchar(20), -- 브랜드명
    p_price int, -- 가격
    p_discprice int default 0, -- 할인가
    p_point int default 0, -- 적립금(포인트는 일단 임의로 작성)
    p_stock int default 100, -- 재고수량
    p_deliverytype varchar(10), -- 배송구분
    p_packingtype varchar(10), -- 포장타입
    p_salesunit varchar(20) default null, -- 판매단위
    p_weight varchar(20) default null, -- 중량용량	
    p_origin varchar(20) default null, -- 원산지
    p_imgname varchar(200), -- 상품대표이미지(상품썸네일 변수명 변경)
    p_imgpath varchar(200), -- 상품대표이미지 경로(상품썸네일 변수명 변경)
    p_description text, -- 상세설명(text) -> null값 허용
    p_detailimgname varchar(200), -- 상세내용 이미지추가 !! 이미지 파일명만 넣기
    p_detailimgpath varchar(200), -- 상세내용 이미지경로추가 !! 작성금지
    p_salestate varchar(10), -- 판매상태(판매중 / 품절)
    p_isdisplay varchar(10), -- 전시상태
    p_regdate datetime default now() -- 상품등록날짜
);

select * from tb_product;
drop table tb_product; 



-- =============================================================== 채소(001) Data 시작 ================================================================

-- 채소(001) / 친환경(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "01", "무농약 브로콜리2종", "송이송이 길러낸 속이 꽉찬 무농약 브로콜리", "만우청과", 3500, 3000, 15, 20, "샛별배송/택배배송", "냉장/종이포장", "1송이", "150g", "국내산",  
"0010101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010101_subImg.png", "판매중", "등록", "2021-04-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "01", "국산콩 무농약 콩나물 300g", "정성스럽게 길러낸 콩나물", "만우청과", 2000, 1600, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0010102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010102_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "01", "친환경 시금치 200g", "뽀빠이가 좋아하는 바로 그 채소", "만우청과", 2100, 2000, 5, 15, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "200g", "국내산",  
"0010103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010103_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "01", "친환경 당근 500g", "껍질째 먹을 수 있는 친환경 흙당근", "만우청과", 3000, 2800, 5, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "500g", "국내산",  
"0010104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010104_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "01", "무농약 햇 양파 2종", "껍질째 먹을 수 있는 친환경 흙당근", "만우청과", 3000, 2800, 10, 5, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "500g", "국내산",  
"0010105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010105_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "01", "무농약 조각 양배추 400g", "건강하게 재배한 만능채소", "만우청과", 3000, 2800, 10, 5, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "400g", "국내산",  
"0010106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010106_subImg.png", "판매중", "등록", "2021-05-01 03:20:02 ");



-- 채소(001) / 고구마 감자 당근(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "02", "친환경 당근 500g", "껍질째 먹을 수 있는 친환경 흙당근", "만우청과", 3000, 2800, 5, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "500g", "국내산",  
"0010201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010201_subImg.png", "판매중", "등록", "2021-03-03 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "02", "무농약 햇감자 600g", "2020년 갓 수확한 무농약 햇 감자", "만우청과", 5000, 5000, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0010202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010202_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "02", "유기농 달수 고구마 1.5kg", "고구마의 달콤한 변신 햇고구마", "만우청과", 13000, 12000, 50, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "1500g", "국내산",  
"0010203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010203_subImg.png", "품절", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "02", "무농약 세척당근", "달달하니 맛있는 제주 당근을 편리 하게", "만우청과", 4000, 3200, 5, 15, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "500g", "국내산",  
"0010204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010204_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "02", "[맛꾼푸드] 아이스 엿구마 2종", "냉동보관 가능한 촉촉한 고구마", "맛꾼푸드", 2700, 2700, 133, 30, "샛별배송/택배배송", "기타", "1봉지", "150g", "국내산",  
"0010205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010205_subImg.png", "판매중", "등록", "2020-09-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "02", "[연꽃마을] 친환경 우엉채 200g", "깨끗하게 손질되어 바로 조려 먹는 친환경 우엉채", "연꽃마을", 6000, 6000, 30, 30, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0010206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010206_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");


-- 채소(001) / 시금치 쌈채소 나물(03)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "03", "친환경 시금치 200g", "뽀빠이가 좋아하는 바로 그 채소", "만우청과", 2100, 1800, 5, 15, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "200g", "국내산",   
"0010301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010301_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "03", "친환경 잎채소 로메인 100g", "아삭하고 부드러운 매력", "만우청과", 1800, 1500, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "100g", "국내산",  
"0010302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010302_subImg.png", "판매중", "등록", "2021-05-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "03", "무농약 부추 200g", "건강하게 재배한 무농약 부추 200g", "만우청과", 2700, 2500, 50, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "200g", "국내산",  
"0010303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010303_subImg.png", "품절", "등록", "2021-03-13 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "03", "유기농 베이비 채소 100g", "부드럽고 떫은 맛이 나지 않은 싱싱한 어린 채소(100g)", "만우청과", 2600, 2600, 10, 20, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "100g", "국내산",  
"0010304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010304_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "03", "친환경 잎채소 청경채 100g", "중국 요리를 더욱 맛있게", "만우청과", 1600, 1300, 15, 30, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "100g", "국내산",  
"0010305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010305_subImg.png", "판매중", "등록", "2021-05-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "03", "친환경 쌈채소 모둠 200g", "고기 없이 먹어도 맛있을 정도로 신선한 쌈채소", "만우청과", 3500, 3000, 10, 35, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "200g", "국내산",  
"0010306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010306_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");


-- 채소(001) / 브로콜리 파프리카 양배추(04)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "04", "무농약 브로콜리 2종", "송이송이 길러낸 속이 꽉 찬 무농약 브로콜리", "만우청과", 2300, 2100, 5, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "150g", "국내산",   
"0010401_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010401_subImg.png", "판매중", "등록", "2021-03-13 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "04", "무농약 조각 양배추 400g", "건강하게 재배한 만능채소", "만우청과", 2500, 2100, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1개", "400g", "국내산",  
"0010402_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010402_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "04", "파프리카 2입", "요리의 색감을 위한 필수 채소", "만우청과", 2700, 2500, 50, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0010403_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010403_subImg.png", "품절", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "04", "[Dole] 미니 로메인 하트 220g", "겉잎을 떼고, 연한 잎만 소포장한 미니로메인", "돌푸드", 5700, 5700, 30, 20, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "220g", "국내산",  
"0010404_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010404_subImg.png", "판매중", "등록", "2021-03-13 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "04", "미니 양배추(브뤼셀 스프라아우트) 200g", "작아진 양배추, 맛과 영양은 더 커졌어요", "만우청과", 5200, 5200, 15, 30, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "수입산",  
"0010405_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010405_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "04", "무농약 버터헤드레터스", "달콤하고 부드러운 이파리가 한통~", "만우청과", 3400, 3400, 10, 35, "샛별배송/택배배송", "냉장/종이포장", "1개", "70g", "국내산",  
"0010406_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010406_subImg.png", "판매중", "등록", "2021-03-17 03:10:02 ");


-- 채소(001) / 양파 대파 마늘 배추(05)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "05", "무농약 햇 양파 2종", "껍질째 먹을 수 있는 친환경 흙당근", "만우청과", 3000, 2800, 10, 5, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "500g", "국내산",  
"0010501_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010501_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "05", "무농약 깐 양파 1개", "신선하고 깔끔하게 쓰는 양파", "만우청과", 1300, 1200, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1개", "100g", "국내산",  
"0010502_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010502_subImg.png", "판매중", "등록", "2021-05-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "05", "무농약 대파 250g", "향이 진하고 단맛도 강한 싱싱한 대파", "만우청과", 3000, 2800, 50, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "250g", "국내산",  
"0010503_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010503_subImg.png", "품절", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "05", "무농약 조각무 1조각", "한국인의 밥상에 빠질수 없는 시원하고 아삭한 무", "만우청과", 1700, 1700, 15, 20, "샛별배송/택배배송", "냉장/종이포장", "1조각", "400g", "국내산",  
"0010504_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010504_subImg.png", "판매중", "등록", "2018-09-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "05", "흙쪽파 300g", "신선하게 만나는 활용도 만점 쪽파", "만우청과", 3000, 3000, 15, 30, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0010505_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010505_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "05", "친환경 얼갈이 & 열무 2종", "찬바람이 불 때 더 맛있는 채소", "만우청과", 1600, 1600, 10, 35, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0010506_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010506_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");


-- 채소(001) / 오이 호박 고추(06)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "06", "무농약 애호박 1개", "구워 먹어도 나물로 무쳐 먹어도 맛있는 만능 채소 애호박", "만우청과", 2700, 2500, 10, 5, "샛별배송/택배배송", "냉장/종이포장", "1개", "500g", "국내산",  
"0010601_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010601_subImg.png", "판매중", "등록", "2017-03-15 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "06", "친환경 오이 2입", "껍질째 안심하고 먹을 수 있는 무농약 오이", "만우청과", 3400, 2900, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "700g", "국내산",  
"0010602_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010602_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "06", "무농약 고추 5종", "소포장되어 알뜰하게 먹을 수 있는 무농약 고추", "만우청과", 1800, 1800, 50, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "100g", "국내산",  
"0010603_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010603_subImg.png", "품절", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "06", "친환경 가지 2입", "쫄깃쫄깃 수분이 꽉 찬 가지", "만우청과", 3000, 3000, 15, 20, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "200g", "국내산",  
"0010604_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010604_subImg.png", "판매중", "등록", "2015-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "06", "친환경 피망 2입", "간편하게 더하는 알싸한 매력", "마켓컬리", 3800, 3800, 15, 30, "샛별배송/택배배송", "냉장/종이포장", "1봉", "2입(180g 이상)", "국내산",  
"0010605_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010605_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "06", "[Kurly's] 냉동 다진 청양고추", "간편하게 더하는 알싸한 매력", "마켓컬리", 5000, 5000, 15, 30, "샛별배송/택배배송", "냉장/종이포장", "1팩", "150g", "국내산",  
"0010606_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010606_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");


-- 채소(001) / 냉동 이색 간편채소(07)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "07", "무농약 간편 샐러드 6종", "내 마음대로 골라담고 세첵되어 바로 먹을 수 있는 신선한 샐러드", "만우청과", 1800, 1800, 10, 5, "샛별배송/택배배송", "냉장/종이포장", "1개", "100g", "국내산",  
"0010701_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010701_subImg.png", "판매중", "등록", "2021-03-17 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "07", "친환경 채소믹스 500g", "손질 없이 다양한 채소를 한 번에", "만우청과", 5900, 5900, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "100g", "국내산",  
"0010702_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010702_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "07", "유기농 케일 (즙용) 300g", "유기농 케일로 건강한 하루를 시작하세요", "만우청과", 2000, 1800, 20, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "수입산",  
"0010703_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010703_subImg.png", "품절", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "07",  "아스파라거스 200g", "연하고 풍미있는 아스파라거스", "만우청과", 4500, 4500, 20, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "200g", "수입산",  
"0010704_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010704_subImg.png", "판매중", "등록", "2021-03-22 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "07", "무농약 무순 30g", "알싸하고 아삭한 맛으로 입맛을 더욱 깔끔하게 (30g)", "만우청과", 1290, 1290, 3, 20, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "30g", "국내산",   
"0010705_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010705_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "07", "친환경 다진 채소", "큐브타입의 다진 마늘과 다진 생강, 다진 청양고추로 간편하게 요리하세요!", "만우청과", 5600, 5600, 15, 20, "샛별배송/택배배송", "냉장/종이포장", "1팩", "180g", "국내산",   
"0010706_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010706_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");


-- 채소(001) / 콩나물 버섯(08)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "08", "국산콩 무농약 콩나물 300g", "정성스럽게 길러낸 콩나물", "만우청과", 2000, 1600, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0010801_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010801_subImg.png", "판매중", "등록", "2021-03-22 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "08", "무농약 숙주나물", "아삭아삭한 만능 나물", "만우청과", 2500, 2500, 10, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0010802_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010802_subImg.png", "판매중", "등록", "2021-04-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "08", "무농약 GAP 송미향 버섯 200g", "송이와 표고버섯의 맛과 향을 동시에", "만우청과", 9000, 9000, 20, 0, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0010803_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010803_subImg.png", "품절", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "08",  "무농약 표고채 35g", "말려서 더 깊어진 표고버섯의 풍미", "만우청과", 4500, 4500, 20, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "350g", "국내산",  
"0010804_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010804_subImg.png", "판매중", "등록", "2019-07-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "08", "무농약 표고칩 40g", "앙증맞게 썰어낸 건표고 버섯", "만우청과", 5000, 5000, 15, 20, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "40g", "국내산",   
"0010805_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010805_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("001", "08", "무농약 상황버섯 20g", "귀한 버섯을 손쉽게 즐기는 법!", "만우청과", 7500, 7500, 15, 20, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "20g", "국내산",  
"0010806_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0010806_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");
-- =============================================================== 채소(001) Data 종료 ================================================================






-- =============================================================== 과일/견과/쌀(002) Data 시작 ================================================================

-- 과일/견과/쌀(002) / 친환경(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "01", "친환경 대추방울토마토 500g", "씹는 맛이 좋은 친환경 대추방울토마토", "만우청과", 6900, 6900, 32, 20, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산",  
"0020101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020101_subImg.png", "판매중", "등록", "2021-03-07 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "01", "무농약 토마토 1kg", "친환경으로 재배한 무농약 토마토(1kg)", "만우청과", 8200, 8200, 60, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "1000g", "국내산",  
"0020102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020102_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "01", "유기농 깐밤 500g", "건강하고 맛있는 밤을 언제든지 간편하게!", "만우청과", 13900, 13900, 60, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0020103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020103_subImg.png", "판매중", "등록", "2021-03-07 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "01", "[유기샘] 볶은 땅콩 (무농약 땅콩 100%) 200g", "간편해서 좋은 국민 간식", "(주)유기샘", 8500, 8500, 45, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0020104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020104_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "01", "[유가원] 유기농 건과일 3종", "말려서 더 맛있어진 유기농 건과일 (건체리,건블루베리,건크렌베리 총 3종)", "유가원", 9400, 9400, 47, 5, "샛별배송/택배배송", "냉장/종이포장", "1개", "500g", "수입산",  
"0020105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020105_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "01", "[유가원] 유기농 바나나칩 230g", "바삭하게 즐기는 영양 만점 바나나칩", "유가원", 5000, 5000, 27, 5, "샛별배송/택배배송", "냉장/종이포장", "1개", "230g", "수입산",  
"0020106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020106_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");


-- 과일/견과/쌀(002) / 제철과일(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "02", "GAP 신고배 2입", "아삭아삭 시원한 과즙이 가득한 신고배", "만우청과", 11500, 11500, 62, 20, "샛별배송/택배배송", "냉장/종이포장", "1팩", "2입", "국내산",  
"0020201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020201_subImg.png", "판매중", "등록", "2020-03-05 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "02", "유기농 깐밤 500g", "건강하고 맛있는 밤을 언제든지 간편하게!", "만우청과", 13900, 13900, 60, 10, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "국내산",  
"0020202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020202_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "02", "[당일수확] GAP 논산 설향 딸기 500g", "당도가 높은 고품질 딸기", "만우청과", 8500, 8500, 42, 30, "샛별배송 ONLY", "냉장/종이포장", "1팩", "500g", "국내산",  
"0020203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020203_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "02", "[당일수확] GAP 아리향 딸기", "달콤하고 단단한 대왕 딸기", "만우청과", 11500, 11500, 25, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "300g", "국내산",  
"0020204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020204_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "02", "국산 깐밤 150g", "간편하게 즐기는, 어디에나 잘 어울리는 요리 재료", "만우청과", 7700, 7700, 25, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "150g", "국내산",  
"0020205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020205_subImg.png", "판매중", "등록", "2021-05-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "02", "[올프레쉬] 프리미엄 금실 딸기 2팩 (820g)", "넉넉하게 맛보는 제철 딸기", "올프레쉬", 30000, 30000, 150, 10, "샛별배송 ONLY", "냉장/종이포장", "1개", "820g", "국내산",  
"0020206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020206_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 과일/견과/쌀(002) / 국산과일(03)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "03", "유명산지 딸기 500g", "전국 유명산지의 딸기내음을 담은 한판 딸기", "만우청과", 6000, 5200, 15, 20, "샛별배송 ONLY", "냉장/종이포장", "1팩", "500g", "국내산",  
"0020301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020301_subImg.png", "판매중", "등록", "2021-07-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "03", "스테비아 토망고 1kg(4~8입)", "설탕 뿌린듯한 단맛!", "만우청과", 10700, 10700, 54, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "1000g", "국내산",  
"0020302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020302_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "03", "GAP 당도선별 천혜향 1kg 5~7입", "부드러운 과육이 품은 상큼함", "만우청과", 9980, 9980, 50, 30, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "1000g", "국내산",  
"0020303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020303_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "03", "GAP 신고배 2입", "아삭아삭 시원한 과즙이 가득한 신고배", "만우청과", 11500, 11500, 62, 20, "샛별배송/택배배송", "냉장/종이포장", "1팩", "2입", "국내산",  
"0020304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020304_subImg.png", "판매중", "등록", "2021-05-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "03", "GAP 유레카 블루베리 100g 2종", "큼직막한 사이즈를 자랑하는", "만우청과", 9900, 9900, 60, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "100g", "국내산",  
"0020305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020305_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "03", "저탄소 GAP 당도선별 제수용 배 2입", "입안 가득 달콤시원한 과즙", "만우청과", 12900, 12900, 65, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "600g~700g x 2개입", "국내산",  
"0020306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020306_subImg.png", "판매중", "등록", "2021-03-17 03:20:02 ");


-- 과일/견과/쌀(002) / 수입과일(04)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "04", "[KF365] 아보카도 1개", "부드럽고 상큼한 과육, 숲속의 버터(1개)", "만우청과", 2340, 2200, 11, 20, "샛별배송/택배배송", "냉장/종이포장", "1개", "1박스 48과 기준 대 사이즈", "미국산",  
"0020401_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020401_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "04", "썬키스트 팬시 레몬 1개", "레몬청 담그기 딱 좋은 싱싱한 레몬(1개)", "만우청과", 790, 670, 3, 10, "샛별배송/택배배송", "냉장/종이포장", "1개", "100g", "수입산",  
"0020402_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020402_subImg.png", "판매중", "등록", "2021-05-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "04", "자몽 1개", "속이 꽉찬 자몽을 더욱 합리적인 가격에!", "만우청과", 1900, 1900, 3, 20, "샛별배송/택배배송", "냉장/종이포장", "1개", "320g", "미국산",  
"0020403_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020403_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "04", "유기농 바나나 500g", "당일입고 당일배송되는 유기농 바나나", "만우청과", 3200, 3200, 32, 20, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "수입산(페루,멕시코)",  
"0020404_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020404_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");
 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "04", "태국 망고 2입", "항공운송으로 더욱 신선하고 농후한 단맛의 대표 열대과일 (1팩 2입)", "만우청과", 11900, 10700, 54, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "300g", "택국산",  
"0020405_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020405_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "04", "멕시코 생 라임 1개", "뜨거운 남미의 열정을 품은 푸른 과일", "만우청과", 1400, 1400, 7, 10, "샛별배송/택배배송", "냉장/종이포장", "1개", "100g", "멕시코",  
"0020406_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020406_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 과일/견과/쌀(002) / 간편과일(05)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "05", "[Dole] 후룻팝 3종", "주스도 아이스 바도 되는 과일 디저트", "돌푸드", 4600, 4600, 11, 20, "샛별배송/택배배송", "상온/종이포장", "1개", "1박스 496ml", "수입산",  
"0020501_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020501_subImg.png", "판매중", "등록", "2021-07-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "05", "[Dole] 후룻바틀 4종", "후룻바틀 망고, 파인애플, 트로피칼, 황도", "돌푸드", 6980, 6980, 35, 50, "샛별배송/택배배송", "냉장/종이포장", "1개", "660g", "수입산",  
"0020502_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020502_subImg.png", "판매중", "등록", "2021-03-09 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "05", "[Dole] 후룻컵 파인애플", "새콤달콤한 파인애플 한 입", "돌푸드", 2080, 2080, 10, 60, "샛별배송/택배배송", "냉장/종이포장", "1통", "198g", "수입산",  
"0020503_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020503_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "05", "[Dole] 후룻컵 황도", "언제든지 만나는 달콤한 복숭아", "돌푸드", 2080, 2080, 10, 60, "샛별배송/택배배송", "냉장/종이포장", "1통", "198g", "수입산",    
"0020504_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020504_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");
 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "05","[Dole] 후룻컵 망고", "간편하게 맛보는 샛노란 망고", "돌푸드", 2080, 2080, 10, 60, "샛별배송/택배배송", "냉장/종이포장", "1통", "198g", "수입산",    
"0020505_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020505_subImg.png", "판매중", "등록", "2021-07-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "05", "[Dole] 스위티오 파인애플 청크 400g", "손쉽게 즐기는 조각 파인애플", "돌푸드", 5400, 5400, 27, 30, "샛별배송/택배배송", "냉장/종이포장", "1팩", "400g", "필리핀산",  
"0020506_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020506_subImg.png", "판매중", "등록", "2019-03-15 03:20:02 ");


-- 과일/견과/쌀(002) / 냉동 건과일(06)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "06", "냉동과일 4종", "1년 내내 즐기는 제철 과일 본연의 맛! (아보카도, 와이드블루베리, 믹스베리, 파인애플)", "(주)만우식품", 5900, 5900, 30, 20, "샛별배송/택배배송", "냉동/종이포장", "1팩", "500g", "필리핀",  
"0020601_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020601_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "06", "딸기 바나나 믹스 1kg (냉동)", "환상의 궁합 딸기 & 바나나(1봉/1kg)", "(주)만우식품", 6900, 6900, 35, 50, "샛별배송/택배배송", "냉동/종이포장", "1봉지", "1000g", "수입산",  
"0020602_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020602_subImg.png", "판매중", "등록", "2021-03-01 03:10:02");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "06", "청도 반시 감말랭이 200g", "겉은 꼬들하고 속은 쪽득한 천연젤리", "(주)만우식품", 6500, 6500, 33, 70, "샛별배송/택배배송", "냉동/종이포장", "1팩", "200g", "국내산",  
"0020603_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020603_subImg.png", "판매중", "등록", "2019-03-17 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "06", "경산 건대추 200g 2종", "진하고 달콤한 향의 경산대추", "만우청과", 4900, 4900, 10, 5, "샛별배송/택배배송", "냉장/종이포장", "1개", "200g", "국내산",  
"0020604_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020604_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "06", "[유가원] 유기농 건과일 3종", "말려서 더 맛있어진 유기농 건과일 (건체리,건블루베리,건크렌베리 총 3종)", "유가원", 9400, 9400, 47, 5, "샛별배송/택배배송", "냉장/종이포장", "1개", "500g", "수입산",  
"0020605_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020605_subImg.png", "판매중", "등록", "2019-03-18 03:20:02 ");
 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "06","[유가원] 유기농 바나나칩 230g", "바삭하게 즐기는 영양 만점 바나나칩", "유가원", 4900, 4900, 25, 60, "샛별배송/택배배송", "냉장/종이포장", "1개", "230g", "수입산",  
"0020606_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020606_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 과일/견과/쌀(002) / 견과류(07) 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "07", "[유기샘] 볶은 땅콩 (무농약 땅콩 100%) 200g", "간편해서 좋은 국민 간식", "(주)유기샘", 8500, 8500, 45, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0020701_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020701_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "07", "[넛쏘굿] 몸에 좋은 믹스넛 2종", "여자를 위한 믹스넛, 남자를 위한 믹스넛", "넛쏘굿", 13900, 13900, 70, 100, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "300g", "수입산",  
"0020702_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020702_subImg.png", "판매중", "등록", "2021-03-01 03:10:02");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, 
p_regdate ) 
VALUES("002", "07", "매일 색다른 하루 견과 먼투썬 6주", "주7일 하루 한봉씩 총 42봉의 하루 견과", "(주)만우식품", 35900, 32310, 162, 120, "샛별배송/택배배송", "냉장/종이포장", "1박스", "20g x 42봉지", "수입산",  
"0020703_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020703_subImg.png", "판매중", "등록", "2019-07-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "07", "[유기샘] 깐 은행 220g", "영양을 더하는 작은 한 알(1팩 / 220g)", "유기샘", 7000, 7000, 35, 0, "샛별배송/택배배송", "냉장/종이포장", "1팩", "220g", "국내산",  
"0020704_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020704_subImg.png", "품절", "등록", "2021-03-01 03:20:02 ");
 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "07", "[슈퍼견과] 브라질 너트 2종", "셀레늄이 풍부한 브라질 너트를 소개합니다.", "슈퍼견과", 8900, 8900, 65, 60, "샛별배송/택배배송", "냉장/종이포장", "1팩", "150g / 200g", "수입산",  
"0020705_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020705_subImg.png", "판매중", "등록", "2021-03-17 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "07", "와사비맛 땅콩 190g", "달콤하면서도 알싸한", "(주)길림양행", 4950, 4980, 25, 130, "샛별배송/택배배송", "상온/종이포장", "1봉", "190g", "국내산",  
"0020706_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020706_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 과일/견과/쌀(002) / 쌀잡곡(08) 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "08", "[조선마켓] 조선향미 골드퀸 3호", "오감만족 쌀밥의 품격. 구수한 향 가득한 쌀밥 20년산 햅쌀(4kg)", "조선마켓", 25900, 25900, 35, 25, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "4000g", "국내산",  
"0020801_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020801_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "08", "[컬리 ONLY] 슈퍼푸드 크리스피 10종", "[추가 오픈] 건강하게 바삭바삭 즐기는 슈퍼푸드 크리스피", "컬리ONLY", 2500, 2500, 5, 130, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "100g~150g", "수입산",  
"0020802_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020802_subImg.png", "판매중", "등록", "2019-03-01 03:10:02");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "08", "[햇님마을] 국산 100% 볶음참깨 105g", "한번 볶아 향미가 더욱 진해진 (2020년 햇참깨)", "햇님마을", 9000, 9000, 27, 50, "샛별배송/택배배송", "냉장/종이포장", "1개", "105g", "국내산",  
"0020803_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020803_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "08", "[제이식품] 네모난 누룽지 2종", "3번에 걸쳐 오븐에 구워낸 누룽지 (150g)", "제이식품", 3500, 3500, 35, 0, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "150g", "국내산",  
"0020804_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020804_subImg.png", "품절", "등록", "2020-03-22 03:20:02 ");
 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "08",  "[조선마켓] 조선향미 골드퀸 3호", "오감만족 쌀밥의 품격. 20년산 햅쌀(1kg)", "조선마켓", 7800, 7800, 39, 29, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "1000g", "국내산",  
"0020805_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020805_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("002", "08", "[청오건강] 유기농 쌀가루", "어머니의 마음 그대로 믿을 수 있는 100% 국산 유기농 쌀가루", "청오건강", 3700, 3300, 25, 130, "샛별배송/택배배송", "상온/종이포장", "1개", "350g", "국내산",  
"0020806_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0020806_subImg.png", "판매중", "등록", "2021-07-01 03:20:02 ");
-- =============================================================== 과일/견과/쌀(002) Data 종료 ================================================================





-- =============================================================== 수산/해산/건어물(003) Data 시작 ================================================================

-- 수산/해산/건어물(003) / 제철수산(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "01", "[어부네] 통암꽃게 2종(냉동)", "봄 해산물의 왕, 흰 살과 노란 알이 꽉 들어찬 암꽃게", "어부네", 38500, 38500, 193, 0, "샛별배송/택배배송", "냉동/종이포장", "1팩", "400g~490g", "국내산",  
"0030101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030101_subImg.png", "품절", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "01", "[황금회] 광어회 (냉장)", "감칠 맛이 살아있는 숙성 광어 회 (300g)", "만우수산", 24900, 24900, 125, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "300g", "국내산",  
"0030102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030102_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "01", "[이호] 국산 자반 고등어 450g(냉장, 2미)", "손쉽게 조리하는 자반 고등어", "이호", 7900, 7900, 25, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "2미(450g)", "국내산",  
"0030103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030103_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "01", "[이호] 바지락 1kg내외(생물)", "감칠맛이 돋보이는 국산 바지락", "이호", 8400, 8400, 25, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "1000g", "국내산",  
"0030104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030104_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "01", "[이호] 새꼬막 1kg내외(생물)", "바다의 향을 담은 쫄깃한 꼬막", "이호", 8800, 8800, 25, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "1000g", "국내산",  
"0030105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030105_subImg.png", "판매중", "등록", "2015-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "01", "[삼삼물산] 손질된 통영멍게 230g내외(생물)", "생물 멍게로 즐기는 바다의 향기", "삼삼물산", 8900, 8900, 55, 3, "샛별배송/택배배송", "냉장/종이포장", "1팩", "230g", "국내산",  
"0030106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030106_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 수산/해산/건어물(003) / 생선류(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "02", "[쌜모네키친] 오로라 생연어(냉장)", "집에서 프로처럼 연어회 즐기기", "쌜모네키친", 11900, 11900, 60, 0, "샛별배송/택배배송", "냉동/종이포장", "1팩", "200g", "노르웨이",  
"0030201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030201_subImg.png", "품절", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "02", "Hello! 노르웨이 고등어", "오일 없이 구워도 촉촉하고 고소한 맛!", "만우수산", 3500, 3500, 15, 10, "샛별배송/택배배송", "냉동/종이포장", "1팩", "170g 이상", "노르웨이",  
"0030202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030202_subImg.png", "판매중", "등록", "2021-07-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "02", "[쌜모네키친] 오로라 그라브락스 연어 200g", "자줏빛 비트를 넣어 이색적이 풍미를 선사합니다.", "쌜모네키친", 16500, 14000, 70, 15, "샛별배송/택배배송", "냉동/종이포장", "1팩", "200g", "노르웨이",  
"0030203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030203_subImg.png", "판매중", "등록", "2021-03-15 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "02", "[제주창해수산] 제주 고등어살 160~180g / 1쪽(냉동)", "제주 남단 청정 바다에서 건저올린 제주 고등어", "제주창해수산", 3200, 3200, 16, 15, "샛별배송/택배배송", "냉동/종이포장", "1팩", "160~180g", "국내산",  
"0030204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030204_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "02", "[대용량기획] One-Frozen 노르웨이 고등어(170~220g) * 3팩)", "촉촉함이 남다른 한정판 고등어", "만우수산", 9600, 7200, 36, 15, "샛별배송/택배배송", "냉동/종이포장", "1세트", "1팩당 170~220g", "노르웨이",  
"0030205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030205_subImg.png", "판매중", "등록", "2019-03-17 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "02", "[CHAM] 노르웨이 고등어 3개 묶음 500g(냉동)", "짭조름한 일품 밥반찬", "CHAM", 6200, 6200, 31, 3, "샛별배송/택배배송", "냉동/종이포장", "1팩", "500g", "노르웨이",  
"0030206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030206_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 수산/해산/건어물(003) / 굴비 반건류(04)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "03", "황금굴비 (부세) 250g 내외 (냉동)", "맛도 황금, 크기도 황금", "만우수산", 9900, 9900, 50, 0, "샛별배송/택배배송", "냉동/종이포장", "1팩", "250g 내외", "중국산",  
"0030301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030301_subImg.png", "품절", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "03", "[법성포참맛] 프리미엄 굴비 오가세트 1.4kg", "통통하게 차오른 감칠맛", "법성포참맛", 20000, 17000, 90, 15, "샛별배송/택배배송", "냉동/종이포장", "1팩", "130g", "국내산", 
"0030302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030302_subImg.png", "판매중", "등록", "2019-11-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "03", "[이호] 참조기 550g내외(6~8미, 냉장)", "맛이 꽉 들어찬 한끼 반찬", "만우수산", 8900, 8900, 45, 10, "샛별배송/택배배송", "냉장/종이포장", "1팩", "6~8미 550g 내외", "국내산",  
"0030303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030303_subImg.png", "판매중", "등록", "2021-08-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "03", "[법성포참맛] 찜부세 보리굴비(대/180g)(냉동)", "없던 입맛도 살리는 밥도둑", "법성포참맛", 11000, 11000, 160, 15, "샛별배송/택배배송", "냉동/종이포장", "1마리", "180g", "중국산",  
"0030304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030304_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "03", "[혜원에스디] 부세굴비 2마리", "손질이 필요 없는 깔끔한 맛", "혜원에스디", 9900, 9900, 25, 15, "샛별배송/택배배송", "냉동/종이포장", "1팩", "160g*2마리", "중국산", 
"0030305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030305_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "03", "[법성포참맛] 대용량 영광굴비 1.2kg(20마리)(냉동)", "푸짐히 맛보는 영광굴비의 참맛", "법성포참맛", 26500, 15900, 80, 15, "샛별배송/택배배송", "냉동/종이포장", "1봉지", "60g 내외 X 20마리", "국내산",  
"0030306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030306_subImg.png", "판매중", "등록", "2021-07-01 03:20:02 ");


-- 수산/해산/건어물(003) / 오징어 낙지 문어(04)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "04", "[어부네] 주꾸미 2종(냉동)", "한입 가득 야들야들한 별미", "어부네", 9700, 9700, 30, 15, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "국내산",  
"0030401_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030401_subImg.png", "품절", "등록", "2021-03-22 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "04", "[어부네] 국산 기절낙지 3종(냉동)", "바다의 활력과 신선함을 그대로 담은 낙지", "어부네", 8500, 8500, 16, 70, "샛별배송/택배배송", "냉동/종이포장", "1팩", "400-600g", "국내산",  
"0030402_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030402_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "04", "다짐 오징어", "내 아이를 위한 새로운 시도", "만우수산", 6900, 6900, 10, 55, "샛별배송/택배배송", "냉동/종이포장", "1팩", "80g", "국내산",  
"0030403_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030403_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "04", "갑오징어 슬라이스", "간편하게 완성하는 갑오징어 요리", "만우수산", 7000, 7000, 58, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산", 
"0030404_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030404_subImg.png", "판매중", "등록", "2021-03-22 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "04",  "[제주창해수산] 한치 175~200g(냉동)", "탱글탱글한 감칠맛", "제주창해수산", 8700, 8700, 10, 55, "샛별배송/택배배송", "냉동/종이포장", "1마리", "175~200g 내외", "국내산",  
"0030405_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030405_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "04", "[삼삼해물] 홍해삼", "꼬들꼬들한 식감이 남다른 홍해삼", "삼삼해물", 33600, 33600, 168, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산", 
"0030406_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030406_subImg.png", "판매중", "등록", "2021-05-01 03:20:02 ");


-- 수산/해산/건어물(003) / 새우 게 랍스터(05)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "05", "가재새우살 230g(냉동)", "제주 딱새우를 간편하게 즐기는 방법", "만우수산", 9590, 9590, 16, 70, "샛별배송/택배배송", "냉동/종이포장", "1팩", "230g", "국내산",  
"0030501_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030501_subImg.png", "품절", "등록", "2019-03-15 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "05", "[제주창해수산] 딱새우 300g", "풍미에 반하고, 식감에 반하는 진한 새우의 맛", "제주창해수산", 6800, 6800, 5, 70, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "국내산",  
"0030502_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030502_subImg.png", "판매중", "등록", "2021-04-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "05", "[어부네] 통암꽃게 2종(냉동)", "봄 해산물의 왕, 흰 살과 노란 알이 꽉 들어찬 암꽃게", "어부네", 38500, 38500, 193, 0, "샛별배송/택배배송", "냉동/종이포장", "1팩", "400g~490g", "국내산",  
"0030503_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030503_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "05", "[해원에스디] 무항생제 손질새우 230g(냉동)", "간편하게 활용하는 친환경 새우", "해원에스디", 14800, 14800, 74, 55, "샛별배송/택배배송", "냉동/종이포장", "1팩", "230g", "국내산",  
"0030504_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030504_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "05", "[해원에스디] 무항생제 프리미엄 새우 500g(냉동)", "큼직한 사이즈로 엄선", "해원에스디", 32500, 32500, 163, 0, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산", 
"0030505_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030505_subImg.png", "품절", "등록", "2021-05-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "05", "[해원에스디] 무항생제 급냉 왕새우 2종(냉동)", "건강하게 자라 깨끗한 왕새우", "해원에스디", 21000, 21000, 105, 15, "샛별배송/택배배송", "냉동/종이포장", "1팩", "500g", "국내산", 
"0030506_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030506_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 수산/해산/건어물(003) / 해산물 조개류(06)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "06", "[어부네] 국내산 바지락살 300g(냉동)", "제 역할 톡톡히 해내는 만능 조개", "어부네", 10800, 10500, 105, 0, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "국내산", 
"0030601_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030601_subImg.png", "품절", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "06", "순 바지락살 200g", "제 역할 톡톡히 해내는 만능 조갯살", "만우수산", 8000, 8000, 5, 50, "샛별배송/택배배송", "냉동/종이포장", "1봉지", "200g", "국내산",  
"0030602_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030602_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "06", "다짐 전복살 80g(냉동)", "이빨과 내장을 깨끗하게 손질한", "만우수산", 15300, 15300, 105, 0, "샛별배송/택배배송", "냉동/종이포장", "1팩", "80g", "국내산",  
"0030603_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030603_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "06", "[어부네] 냉동 관자(냉동)", "365일 간편하고 신선하게 즐기는 냉동 관자", "어부네", 6900, 6900, 35, 7, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "국내산", 
"0030604_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030604_subImg.png", "판매중", "등록", "2018-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "06", "[어부네] 대패관자 140g(냉동)", "슬라이스 되어 간편하게 요리하는", "어부네", 8400, 8400, 35, 0, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "국내산", 
"0030605_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030605_subImg.png", "판매중", "등록", "2021-05-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "06", "[삼삼해물] 키조개 25~28cm(냉장)", "달콤한 육질과 쫄깃한 관자의 환상 조화", "삼삼해물", 6000, 6000, 25, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "(대) 25~28cm내외", "국내산", 
"0030606_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030606_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 수산/해산/건어물(003) / 수산가공품(07)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "07", "[CJ] 삼호 안심 김밥 맛살", "5가지 첨가물을 뺀 맛있는! 안심 맛살", "CJ제일제당", 2100, 2100, 10, 150, "샛별배송/택배배송", "냉장/종이포장", "1팩", "132g", "국내산", 
"0030701_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030701_subImg.png", "품절", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "07", "원래 참치", "건강한 프리미엄 참치 통조림", "(주)만우식품", 2600, 2600, 5, 300, "샛별배송/택배배송", "상온/종이포장", "1통", "100g", "국내산",  
"0030702_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030702_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "07", "[덕화푸드 X 백년가게] 명란 3종", "신선함과 감칠맛이 살아있는 명란젓", "덕화푸드 X 백년가게", 7200, 7200, 15, 25, "샛별배송/택배배송", "냉장/종이포장", "1팩", "80g", "국내산",  
"0030703_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030703_subImg.png", "판매중", "등록", "2019-05-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "07", "[한성젓갈] 멸치 액젓 500g(냉장)", "국산 멸치로 만든 구수한 감칠맛", "한성젓갈", 2900, 2900, 15, 200, "샛별배송/택배배송", "냉장/종이포장", "1개", "500g", "국내산", 
"0030704_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030704_subImg.png", "판매중", "등록", "2021-03-12 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "07", "[한성젓갈] 까나리 액젓 500g(냉장)", "자연 숙성으로 깔끔해진 맛", "한성젓갈", 2900, 2900, 15, 200, "샛별배송/택배배송", "냉장/종이포장", "1개", "500g", "국내산", 
"0030705_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030705_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "07", "[맛의명태자] 짜먹는 명란젓 140g(냉동)", "맛있게 톡톡 입맛 돋우는", "맛의명태자", 9900, 9900, 50, 15, "샛별배송/택배배송", "냉동/종이포장", "1개", "140g", "국내산", 
"0030706_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030706_subImg.png", "판매중", "등록", "2020-12-01 03:20:02 ");


-- 수산/해산/건어물(003) / 수산가공품(08)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "08", "자른 미역 30g(냉장)", "불릴 필요없이 빠르게 쓰는 간편미역", "(주)만우식품", 1900, 1670, 7, 150, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "30g", "국내산", 
"0030801_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030801_subImg.png", "품절", "등록", "2021-11-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "08", "해조류 5종(냉장)", "바다에서 찾은 신선한 해조류 6종", "(주)만우식품", 1700, 1700, 5, 150, "샛별배송/택배배송", "냉장/종이포장", "1팩", "300g", "국내산",  
"0030802_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030802_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "08", "쌈 다시마 150g(냉장)", "바다 내음이 물씬 풍기는", "(주)만우식품", 1700, 1700, 5, 25, "샛별배송/택배배송", "냉장/종이포장", "1팩", "150g", "국내산",  
"0030803_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030803_subImg.png", "판매중", "등록", "2021-11-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "08", "바다모음 자른 미역 30g(냉장)", "불릴 필요 없이 빠르게 쓰는 자른 미역", "해맑은 번영", 1900, 1500, 8, 150, "샛별배송/택배배송", "냉장/종이포장", "1개", "30g", "국내산", 
"0030804_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030804_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "08", "바다모음 매생이 6g(냉장)", "감칠맛과 영양이 가득한 매생이", "해맑은 번영", 5000, 5000, 8, 150, "샛별배송/택배배송", "냉장/종이포장", "1개", "6g", "국내산", 
"0030805_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030805_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "08", "[바다숲] 구운감태 5매", "먹기 좋게 가공된 구운감태", "바다숲", 6800, 6800, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1봉", "18g", "국내산", 
"0030806_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030806_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 수산/해산/건어물(003) / 수산가공품(09)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "09", "바다모음 밥새우 50g(냉장)", "작지만 알찬 영양!", "해맑은 번영", 2700, 2200, 8, 150, "샛별배송/택배배송", "냉장/종이포장", "1개", "50g", "국내산", 
"0030901_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030901_subImg.png", "품절", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "09", "[해말린] 멸치 3종 (냉장)", "바다의 맛이 살아있는 참 멸치 3종", "해말린", 8300, 8300, 5, 150, "샛별배송/택배배송", "냉장/종이포장", "1팩", "300g", "국내산",  
"0030902_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030902_subImg.png", "판매중", "등록", "2021-11-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "09", "바다모음 순멸치 80g(냉장)", "짜지 않고 고소해서 더 야무진 순멸치", "해맑은 번영", 5500, 5500, 18, 150, "샛별배송/택배배송", "냉장/종이포장", "1개", "80g", "국내산", 
"0030903_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030903_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "09", "[마루사야] 하나가쓰오부시 2종", "일본 정통 가쓰오부시의 대표 주자", "해맑은 번영", 5900, 5900, 30, 150, "샛별배송/택배배송", "상온/종이포장", "1팩", "60g", "일본산", 
"0030904_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030904_subImg.png", "판매중", "등록", "2021-12-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "09", "[동보물산] 황태 3종", "황금빛 진한 맛 프리미엄 황태 3종", "동보물산", 5500, 5500, 100, 50, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "100g", "러시아", 
"0030905_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030905_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("003", "09", "[해말린] 명품 멸치", "깊고 진한 국물 맛을 위한 국물용 멸치", "해말린", 4300, 4300, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "95g", "국내산", 
"0030906_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0030906_subImg.png", "판매중", "등록", "2021-12-01 03:20:02 ");
-- =============================================================== 수산/해산/건어물(003) Data 종료 ================================================================







-- =============================================================== 정육/계란(004) Data 시작 ================================================================

-- 정육/계란(004) / 국내산 소고기(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "01", "[일상미소] 다짐육 200g(냉장)", "100g당 판매가 3,750원(냉장)", "일상미소", 7500, 7500, 60, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0040101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040101_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "01", "[일상미소] 차돌박이 (냉동)", "100g당 판매가 6,333원(냉동)", "일상미소", 9500, 9500, 60, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "150g", "국내산",  
"0040102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040102_subImg.png", "판매중", "등록", "2021-12-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "01", "[일상미소] 육전용 200g(냉동)", "100g당 판매가 4,400원(냉장)", "일상미소", 8800, 8800, 60, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "200g", "국내산",  
"0040103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040103_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "01", "[일상미소] 등심 2종", "100g당 판매가 5,500(냉장)", "일상미소", 11000, 11000, 110, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0040104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040104_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "01", "[일상미소] 안심 200g(냉장)", "100g당 판매가 7,750원(냉장)", "일상미소", 15500, 15500, 60, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0040105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040105_subImg.png", "판매중", "등록", "2021-12-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "01", "[일상미소] 양지 200g(냉장)", "100g당 판매가 4,500원(냉장)", "일상미소", 9000, 9000, 60, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0040106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040106_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 정육/계란(004) / 수입산 소고기(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "02", "호주산 MB4 블랙앵거스 토마호크 스테이크 700g(냉장)", "100g당 판매가 8423원(냉장)", "만우정육", 59000, 59000, 1050, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "700g", "수입산",  
"0040201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040201_subImg.png", "판매중", "등록", "2021-11-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "02", "[오가니아] 호주산 유기농 소고기 다짐육 180g(냉동)", "100g당 판매가 6666원", "오가니아", 12000, 12000, 60, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "180g", "수입산",  
"0040202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040202_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "02", "[젝스크릭] 호주산 와규 척아이롤 구이용 300g(냉장)", "100g당 판매가 6333원", "젝스크릭", 8800, 8800, 60, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "수입산",  
"0040203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040203_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "02",  "[오가니아] 호주산 유기농 목심 불고기용 300g(냉동)", "100g당 판매가 5333원", "오가니아", 14400, 14400, 60, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "수입산",  
"0040204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040204_subImg.png", "판매중", "등록", "2021-09-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "02", "[젝스크릭] 무항생제 호주산 와규 안심 스테이크 200g(냉장)", "100g당 판매가 14000원", "젝스크릭", 28000, 28000, 1500, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "수입산", 
"0040205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040205_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "02",  "[오가니아] 호주산 유기농 안심(냉동)", "100g당 판매가 15,666원", "오가니아", 23500, 23500, 60, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "150g", "수입산",  
"0040206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040206_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");


-- 정육/계란(004) / 돼지고기(03)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "03", "[돈마루] 한돈 삼겹살 2종(냉장)", "100g당 판매가 3,200원", "돈마루", 9600, 9600, 48, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산",  
"0040301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040301_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "03", "[해올림] 무항생제 삼겹살 2종(냉장)", "100g당 판매가 3,180원", "해올림", 15900, 14310, 72, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "수입산",  
"0040302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040302_subImg.png", "판매중", "등록", "2018-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "03", "[해올림] 무항생제 돼지 앞다리살 찌개용 300g(냉장)", "100g당 판매가 1,967원", "해올림", 5900, 5900, 60, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "수입산",  
"0040303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040303_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "03",  "[해올림] 무항생제 돼지 등심 다짐육", "100g당 판매가 1,967원", "해올림", 5900, 5900, 60, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "수입산",  
"0040304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040304_subImg.png", "판매중", "등록", "2021-07-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "03", "[버크셔세상] 버크셔K 흑돼지 앞다리살", "100g 당 판매가: 2,066원", "버크셔세상", 6200, 6200, 420, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "수입산", 
"0040305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040305_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("004", "03",  "[DEHER] 이베리코 돼지 목살(냉동)", "100g 당 판매가: 4,600원", "DEHER", 13800, 13800, 23, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "국내산",  
"0040306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0040306_subImg.png", "판매중", "등록", "2019-05-01 03:20:02 ");
-- =============================================================== 정육/계란(004) Data 종료 ================================================================




-- =============================================================== 국/탕/찌개(005) Data 시작 ================================================================

-- 국 반찬 메인요리(005) / 국/탕/찌개(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "01", "[앤쿡] 무항생제 어린이 한우 사골 곰국", "뚝딱 완성되는 영양 만점 국물 요리", "앤쿡", 15900, 15900, 60, 9, "샛별배송/택배배송", "냉장/종이포장", "1박스", "200g * 8개입", "국내산",  
"0050101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050101_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "01", "[벽제갈비] 한우 설렁탕 & 양곰탕 & 곰탕", "허영만의 <식객>에 나온 최고의 한그릇!", "벽제갈비", 14000, 14000, 60, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "500g", "국내산",  
"0050102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050102_subImg.png", "판매중", "등록", "2019-03-17 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "01", "[서강유업] 가족을 위한 사골곰탕", "7가지 원물로 만든 진한 육수", "서강유업", 3500, 3500, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "1000ml", "국내산",  
"0050103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050103_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "01", "[Everyday] 비지찌개", "김치와 돼지고기를 푸짐하게 넣은 비지찌개(100당 가격: 1300원)", "Everyday", 6500, 6500, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산",  
"0050104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050104_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "01", "[소중한식사] 소고기버섯전골", "취향대로 끓여서 완성하는", "소중한식사", 18000, 18000, 60, 30, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산",  
"0050105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050105_subImg.png", "판매중", "등록", "2021-05-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "01", "[비비고] 육개장 500g", "집에서 끓인 방식 그대로의 정성! 맛있는 비비고 육개장", "비비고", 2980, 2980, 10, 55, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산",  
"0050106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050106_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");



-- 국 반찬 메인요리(005) / 밀키트 메인요리(02) 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "02", "[Everyday] 군산갑오징어 삼겹살 볶음(냉동)", "매콤한 온가족 밥도둑", "Everyday", 13500, 13500, 68, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0050201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050201_subImg.png", "판매중", "등록", "2019-05-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "02", "[소중한식사의 봄] 냉이 소불고기 김밥키트", "김밥으로 완성하는 봄의 식탁", "소중한식사의 봄", 8500, 8500, 10, 15, "샛별배송 ONLY", "냉장/종이포장", "1개", "210g", "국내산",  
"0050202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050202_subImg.png", "판매중", "등록", "2018-12-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "02", "[명인등심] 차돌된장밥(270g*2입)", "고소하고 부드러운 된장죽", "명인등심", 9700, 8730, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1봉지/2입", "270g*2", "국내산",  
"0050203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050203_subImg.png", "판매중", "등록", "2021-03-12 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "02", "[벤탄마켓] 감바스 알 아히요", "한팩으로 완성하는 일품 새우 요리", "벤탄마켓", 8500, 8500, 60, 30, "샛별배송/택배배송", "냉장/종이포장", "1팩", "300g", "국내산",  
"0050204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050204_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "02", "[Traiteur de Paris] 감자 그라탕", "집에서 간편하게 즐기는 프렌치 디쉬", "Traiteur de Paris", 9900, 9900, 10, 55, "샛별배송/택배배송", "냉장/종이포장", "1박스", "120g * 4개입", "국내산",  
"0050205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050205_subImg.png", "판매중", "등록", "2021-03-11 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "02", "[미트클레버] 소갈비찜", "식탁을 빛내는 간편한 메인 요리", "미트클레버", 19900, 19900, 1050, 55, "샛별배송/택배배송", "냉장/종이포장", "1팩", "520g", "국내산",  
"0050206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050206_subImg.png", "판매중", "등록", "2021-03-13 03:20:02 ");


-- 국 반찬 메인요리(005) / 밑반찬(03) 
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "03",  "[진가네반찬] 순한 진미채볶음", "반찬계의 영원한 스테디셀러", "진가네반찬", 3500, 3500, 10, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "75g", "국내산",  
"0050301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050301_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "03",  "[진가네반찬] 지리멸치볶음", "견과류와 멸치의 맛있는 만남", "진가네반찬", 3500, 3500, 10, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "75g", "국내산",  
"0050302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050302_subImg.png", "판매중", "등록", "2021-03-14 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "03",  "[진가네반찬] 우엉채조림", "쫀득한 식감, 달콤 짭잘한 맛", "진가네반찬", 3500, 3500, 10, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "75g", "국내산",  
"0050303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050303_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "03", "[미마리] 황태채강정", "크리스피하게 튀겨내 달콤하게 버무려진", "미마리", 4000, 4000, 20, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "100g", "국내산",  
"0050304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050304_subImg.png", "판매중", "등록", "2021-11-15 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "03", "[종가집] 무말랭이&보쌈무말랭이", "오독오독 씹는 맛이 즐거운", "종가집", 3900, 3900, 10, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "100g", "국내산",  
"0050305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050305_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("005", "03",  "[진가네반찬] 땅콩조림", "고소한 영양 반찬", "진가네반찬", 4000, 4000, 20, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "100g", "국내산",  
"0050306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0050306_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");
-- =============================================================== 국/탕/찌개(005) Data 종료 ================================================================







-- =============================================================== 샐러드/간편식(006) Data 시작 ================================================================

-- 샐러드/간편식(006) / 샐러드 닭가슴살(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "01", "무농약 간편 샐러드 6종", "내 마음대로 골라담고 세척되어 바로 먹을 수 있는 신선한 샐러드", "(주)만우식품", 1800, 1800, 5, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "40g", "국내산",  
"0060101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060101_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "01", "친환경 채소믹스 500g", "손질 없이 다양한 채소를 한 번에", "(주)만우식품", 5900, 5900, 20, 9, "샛별배송/택배배송", "냉장/종이포장", "1봉지", "500g", "국내산",  
"0060102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060102_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "01", "[파워닭] 닭가슴살 5종 (냉동)", "100g당 가격: 1,700원(상품 패키지 리뉴얼)", "파워닭", 1700, 1700, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "100g", "국내산",  
"0060103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060103_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "01", "[크레이브푸드] 시저 샐러드 200g", "정통 미국식 샐러드의 깊은 맛", "크레이브푸드", 5900, 5900, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200g", "국내산",  
"0060104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060104_subImg.png", "판매중", "등록", "2019-03-11 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "01", "[Better me] 오리지널 닭가슴살 (냉장)", "100g당 가격 : 1,650원", "Better me", 9900, 9900, 60, 30, "샛별배송/택배배송", "냉장/종이포장", "1팩", "500g", "국내산",  
"0060105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060105_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "01", "[크레이브푸드] 아시안 치킨 샐러드 240g", "부드러운 치킨에 고소한 드레싱 한 스푼", "크레이브푸드", 6900, 6900, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "240g", "국내산", 
"0060106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060106_subImg.png", "판매중", "등록", "2021-03-11 03:20:02 ");


-- 샐러드/간편식(006) / 도시락 밥류(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "02", "[집으로ON] 팔선생 볶음밥 3종", "집에서 맛보는 소문난 맛집의 볶음밥", "집으로ON", 2200, 2200, 5, 9, "샛별배송/택배배송", "냉동/종이포장", "1개", "230g", "국내산",  
"0060201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060201_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "02", "[LOTS OF LOVE] 봄맛듬뿍 곤드레밥", "강원도산 곤드레가 주는 깊은 풍미", "LOTS OF LOVE", 6800, 6800, 34, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "230g X 2개입", "국내산",  
"0060202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060202_subImg.png", "판매중", "등록", "2021-11-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "02", "[조선호텔] 호경전 볶음밥 3종", "집에서 즐기는 프리미엄 중식 볶음밥", "조선호텔", 9900, 9900, 34, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "230g X 2개입", "국내산",  
"0060203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060203_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "02", "[LOTS OF LOVE] 입맛듬뿍 불낙볶음", "불고기와 낙지가 만나 감칠맛 두 배", "LOTS OF LOVE", 6800, 6800, 34, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "230g X 2개입", "국내산",  
"0060204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060204_subImg.png", "판매중", "등록", "2021-12-12 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "02", "[LOTS OF LOVE] 손맛듬뿍 새우볶음밥", "탱글탱글 새우와 부드러운 밥알의 하모니", "LOTS OF LOVE", 6800, 6800, 34, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "230g X 2개입", "국내산",  
"0060205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060205_subImg.png", "판매중", "등록", "2021-11-11 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "02", "[더바른도시락] 퀴노아 영양밥 & 매콤제육볶음", "슈퍼 곡물 퀴노아와 매콤한 제육볶음의 만남", "더바른도시락", 3700, 3500, 10, 30, "샛별배송/택배배송", "냉동/종이포장", "1팩", "205g", "국내산",  
"0060206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060206_subImg.png", "판매중", "등록", "2021-11-11 03:20:02 ");


-- 샐러드/간편식(006) / 파스타 면류(03)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "03", "[피코크] 홍대 초마 짬뽕", "3대를 이어온 불캇의 고수! 칼칼한 국물과 쫄깃한 중화면발까지 그대로 재현하였습니다!", "피코크", 8480, 8480, 42, 9, "샛별배송/택배배송", "냉동/종이포장", "1개", "1240g(2인분)", "국내산",  
"0060301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060301_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "03", "[피코크] 홍대 초마 하얀짬뽕", "불 맛 고수의 특별한 백짬뽕! 시원하고 담백한 불맛을 보여드립니다.", "피코크", 8480, 8480, 42, 9, "샛별배송/택배배송", "냉동/종이포장", "1개", "1240g(2인분)", "국내산",    
"0060302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060302_subImg.png", "판매중", "등록", "2021-11-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "03", "[피코크] 홍대 초마 짜장", "담백하고 부드러운 불맛 짜장소스와 중화 면발로 만든 홍대 초마 짜장면", "피코크", 6980, 6980, 22, 9, "샛별배송/택배배송", "냉동/종이포장", "1개", "1240g(2인분)", "국내산",  
"0060303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060303_subImg.png", "판매중", "등록", "2021-03-11 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "03", "[스테파노스 키친] 까르보나라 스파게티 세트", "셰프가 준비하고 집에서 간편하게 만드는 까르보나라 스파게티 세트", "스테파노스 키친", 6800, 6800, 24, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "450g", "국내산",  
"0060304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060304_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "03", "[스테파노스 키친] 로제 스파게티 세트", "셰프가 준비하고 집에서 간편하게 만드는 로제 스파게티 세트", "스테파노스 키친", 6800, 6800, 24, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "450g", "국내산",  
"0060305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060305_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("006", "03", "[스테파노스 키친] 뽀모도로 스파게티 세트", "셰프가 준비하고 집에서 간편하게 만드는 뽀모도로 스파게티 세트", "스테파노스 키친", 6800, 6800, 24, 9, "샛별배송/택배배송", "냉장/종이포장", "1팩", "450g", "국내산",  
"0060306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0060306_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");
-- =============================================================== 샐러드/간편식(006) Data 종료 ================================================================





-- =============================================================== 면/양념/오일(007) Data 시작 ================================================================

-- 면 양념 오일(007) / 파스타 면류(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "01", "[데체코] 롱 파스타 6종", "롱 파스타 6종 - 스파게티 / 링귀네 / 카펠리니 / 탈리아텔레 / 시금치 페투치네 / 라자냐", "데체코", 3070, 3070, 5, 9, "샛별배송/택배배송", "상온/종이포장", "1봉지", "500g", "수입산",  
"0070101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070101_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "01", "[백설] 국내산 100% 햇당면", "탱글탱글 만능 요리재료", "백설", 5400, 5400, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "300g", "국내산",  
"0070102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070102_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "01", "[제일제면소] 국수 3종", "60년 전통의 맛! 대한민국 대표브랜드 '제일제면소' ", "제일제면소", 2400, 2400, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "300g", "국내산", 
"0070103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070103_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "01", "[데체코] 숏 파스타 5종", "숏 파스타 5종 - 펜네/푸실리/파르펠레/라가토니/카사레체", "데체코", 3900, 3900, 5, 9, "샛별배송/택배배송", "상온/종이포장", "1봉지", "500g", "수입산",  
"0070104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070104_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "01", "[남향푸드] 우리밀 또띠아 (냉동)", "신선한 야채와 맛있는 고기를 말아 간편하게!", "남향푸드", 5400, 5400, 10, 30, "샛별배송/택배배송", "상온/종이포장", "1봉지", "500g", "국내산",  
"0070105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070105_subImg.png", "판매중", "등록", "2019-11-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "01", "[루스티켈라] 파스타면 7종", "스파게티/링귀네/카펠리니/탈리아탈레/페투치네/리가토니/토니렐리 알네로 디세피아", "루스트켈라", 8900, 8900, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "500g", "수입산", 
"0070106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070106_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 면 양념 오일(007) / 식초 소스 드레싱(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "02", "[풀무원] 드레싱 4종", "다채롭게 더하는 자연의 맛", "풀무원", 3580, 3580, 5, 9, "샛별배송/택배배송", "냉장/종이포장", "1병", "245g", "국내산",  
"0070201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070201_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "02", "[후이펑] 닭표 스리라차 소스", "매콤 새콤 만능 핫소스! 닭표를 확인하세요", "후이펑", 4000, 4000, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "250g", "수입산",  
"0070202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070202_subImg.png", "판매중", "등록", "2021-11-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "02", "[르네디종] 디종 머스터드 & 홀 그레인 머스터드", "프랑스의 다종지방의 겨자를 이용하여 만든 머스타드 2종", "르네디종", 3900, 3900, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1병", "200g", "국내산", 
"0070203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070203_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "02", "[ITAL LEMON] 피오디 레몬즙", "필요할 때마다 하나씩 꺼내 쓰는", "ITAL LEMON", 5900, 5900, 20, 9, "샛별배송/택배배송", "냉장/종이포장", "1묶음", "120g", "수입산",  
"0070204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070204_subImg.png", "판매중", "등록", "2021-11-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "02", "[일 티넬로 델 바사미코] 발사믹 글레이즈", "이탈리아 본고장에서 온 포도의 진한 맛과 향", "일 티넬로 델 바사미코", 12900, 12900, 10, 30, "샛별배송/택배배송", "냉장/종이포장", "1병", "250ml", "수입산",  
"0070205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070205_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "02",  "[맹가졸리] 발사믹 모데나 식초", "정통 발사믹의 절묘한 풍미", "맹가졸리", 9900, 9900, 10, 30, "샛별배송/택배배송", "냉장/종이포장", "1병", "250ml", "수입산",  
"0070206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070206_subImg.png", "판매중", "등록", "2021-11-01 03:20:02 ");


-- 면 양념 오일(007) / 양념 액젓 장류(03)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "03", "[신앙촌] 양조 간장 3종", "음식에 깊은 맛을 더하는 간장", "신앙촌", 4300, 4300, 5, 9, "샛별배송/택배배송", "냉장/종이포장", "1병", "360ml", "국내산",  
"0070301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070301_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "03", "[서강유업] 삼천포아침 멸치육수", "신선한 남해산 멸치의 진한 감칠맛", "서강유업", 3500, 3500, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "1000ml", "국내산",  
"0070302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070302_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "03", "[한국맥꾸룸] 맥된장 2종", "12개월 이상 자연 숙성시킨 전통 된장", "한국맥꾸룸", 4250, 4250, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "120g", "국내산", 
"0070303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070303_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "03", "[서강유업] 가족을 위한 사골곰탕", "7가지 원물로 만든 진한 육수", "서강유업", 3500, 3500, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "1000ml", "국내산",  
"0070304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070304_subImg.png", "판매중", "등록", "2019-11-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "03", "[테레오카] 계란에 뿌려먹는 간장", "숙성된 천연 양조간장에 가쓰오부시와 다시마, 표고버섯등을 혼합하여 만능간장", "테레오카", 4900, 4900, 10, 30, "샛별배송/택배배송", "냉장/종이포장", "1병", "250ml", "수입산",  
"0070305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070305_subImg.png", "판매중", "등록", "2021-03-12 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("007", "03", "[샘표] 우리아이 순한 간장 2종", "이제 막 맛을 알아가는 우리아이를 위해", "샘표", 5900, 5900, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "200g", "국내산", 
"0070306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0070306_subImg.png", "판매중", "등록", "2021-04-01 03:20:02 ");
-- =============================================================== 면/양념/오일(007) Data 종료 ================================================================




-- =============================================================== 생수/음료/우유/커피(008)Data 시작 ================================================================

-- 생수 음료 우유 커피(008) / 생수 탄산수(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "01", "[샛별배송] 제주 삼다수 2종", "500mx20개입 / 2Lx6개입", "제주특별자치도개발공사", 5980, 5980, 5, 9, "샛별배송 ONLY", "기타", "1박스", "500mx20개입 / 2Lx6개입", "국내산",  
"0080101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080101_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "01", "[샛별배송] 백산수 2종", "500mx20개입 / 2Lx6개입", "농심", 5400, 5400, 10, 15, "샛별배송 ONLY", "기타", "1박스", "500mx20개입 / 2Lx6개입", "국내산",  
"0080102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080102_subImg.png", "판매중", "등록", "2021-11-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "01", "[싱하] 소다 워터 (탄산수)", "세계가 인정하는 탄산수! 고품질의 지하수를 사용 / 오래 지속되는 강한 탄산을 선보입니다.' ", "싱하", 940, 940, 3, 15, "샛별배송/택배배송", "냉장/종이포장", "1병", "325ml", "수입산", 
"0080103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080103_subImg.png", "판매중", "등록", "2021-03-11 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "01", "[빅토리아] 키위 스파클링 2종", "생그러운 키위향과 깔끔한 칼로리", "빅토리아", 600, 600, 5, 9, "샛별배송/택배배송", "냉장/종이포장", "1병", "300ml", "수입산",  
"0080104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080104_subImg.png", "판매중", "등록", "2021-03-12 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "01", "[미네랄워커] 딥스 해양심층수 블루 2L", "2L(낱개)", "미네랄워커", 1800, 1800, 10, 30, "샛별배송/택배배송", "냉장/종이포장", "1개", "2L", "국내산",  
"0080105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080105_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "01", "[산펠레그리노] 탄산수 250ml", "알프스 산맥에서 솟아나는 천연 탄산수", "산펠레그리노", 1600, 1600, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1병", "250ml", "수입산", 
"0080106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080106_subImg.png", "판매중", "등록", "2019-12-12 03:20:02 ");


-- 생수 음료 우유 커피(008) / 음료 주스(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "02", "[말리] 코코넛 워터 100% 2종", "태국 코코넛 속의 코코넛 워터를 그대로 포장했어요!", "말리", 2000, 1700, 3, 9, "샛별배송/택배배송", "냉장/종이포장", "1개", "330ml", "수입산",  
"0080201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080201_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "02", "[콜린스그린] 더 오렌지", "물 한방울 넣지 않고 순순한 오렌지 과육을 짜낸 100% 착즙 오렌지 주스", "콜린스그린", 17600, 12320, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1병", "1000ml", "국내산",  
"0080202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080202_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "02", "[돈시몬] 과일 주스 3종 (1L)", "설탕 한 톨 물 한 방울 섞지 않은 100% 착즙 스페인 국민 주스' ", "돈시몬", 4100, 4100, 3, 15, "샛별배송/택배배송", "냉장/종이포장", "1병", "1000ml", "수입산", 
"0080203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080203_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "02", "[콜린스그린] 원데이 클렌즈 (1일)", "클렌즈 입문자용 하루 클렌즈 프로그램!", "콜린스그린", 42500, 42500, 1050, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "350ml * 5", "국내산",  
"0080204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080204_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "02",  "[채움] 국산 과채주스 4종(10개입)", "[박스판매] 100% 국내산 재료로 채운 주스 한 잔", "채움", 12000, 10200, 500, 15, "샛별배송/택배배송", "냉장/종이포장", "1박스팩", "230ml* 10", "국내산",  
"0080205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080205_subImg.png", "판매중", "등록", "2021-11-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "02", "[돈시몬] 과일 주스 3종", "스페이인에서 온 과즙 100% 음료' ", "돈시몬", 3200, 3200, 3, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200ml * 3개입", "수입산", 
"0080206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080206_subImg.png", "판매중", "등록", "2021-11-01 03:20:02 ");


-- 생수 음료 우유 커피(008) / 우유 두유 요거트(03)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "03", "[이영애의 건강미식] 평창 약선공 100 두유 플러스", "약선콩을 통째로 갈아 만든 프리미엄 두유", "이영애의 건강미식", 15900, 13520, 1050, 9, "샛별배송/택배배송", "상온/종이포장", "1박스", "180ml*15포", "국내산",  
"0080301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080301_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "03", "[상하목장] 유기농 요구르트 플레인", "100% 유기농 유산균만으로 만든 자연 그대로의 플레인 요구르트' ", "상하목장", 3200, 2500, 3, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "400g", "국내산", 
"0080302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080302_subImg.png", "판매중", "등록", "2021-03-12 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "03", "[유니드마이요거트] 유기농 그릭 요거트", "유기농 우유로 만든 고농축 그릭요거트!", "유니드마이요거트", 15000, 10500, 1050, 15, "샛별배송/택배배송", "냉장/종이포장", "1병", "400g * 5", "수입산",  
"0080303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080303_subImg.png", "판매중", "등록", "2021-03-14 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "03", "[상하목장] 유기농 우유", "스트레스 없이 행복한 자연의 맛' ", "상하목장", 1050, 1050, 3, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "125ml", "국내산", 
"0080304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080304_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "03", "[매일] 아몬드 브리즈 2종", "365일 즐기는 100% 캘리포니아산 아몬드' ", "매일", 650, 650, 3, 15, "샛별배송/택배배송", "냉장/종이포장", "1팩", "200ml", "국내산",   
"0080305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080305_subImg.png", "판매중", "등록", "2021-11-15 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("008", "03", "[총각네] 검은콩 두유", "든든한 하루의 시작' ", "총각네", 12000, 12000, 3, 15, "샛별배송/택배배송", "냉장/종이포장", "1박스", "290ml * 12팩", "국내산", 
"0080306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0080306_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");
-- =============================================================== 생수/음료/우유/커피(008)Data 종료 ================================================================








-- =============================================================== 간식/과자/떡(009)Data 시작 ================================================================

-- 간식 과자 떡(009) / 과자 스낵 쿠키(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "01", "[컬리 ONLY] 슈퍼푸드 크리스피 10종", "[추가 오픈] 건강하게 바삭바삭 즐기는 슈퍼푸드 크리스피", "(주)만우식품", 2500, 2500, 5, 9, "샛별배송/택배배송", "상온/종이포장", "1봉지", "100g", "국내산",  
"0090101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090101_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "01", "[Lay's] 감자칩 4종", "전 세계 판매량 1위에 빛나는 생 감자칩", "Lay's", 3700, 3700, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "100g", "수입산",  
"0090102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090102_subImg.png", "판매중", "등록", "2019-03-11 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "01", "[우리밀] 두부과자", "바삭하게 즐기는 두부의 색다른 맛", "우리밀", 2300, 2200, 3, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "100g", "수입산", 
"0090103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090103_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "01", "[네이처밸리] 그래놀라 바 5종", "식사대용으로 간편하게 즐기는 건강 스낵 바", "네이처밸리", 4900, 3430, 5, 9, "샛별배송/택배배송", "상온/종이포장", "1봉지", "100g", "수입산",  
"0090104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090104_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "01", "[미주라] 통밀 도너츠", "부드럽고 푹신푹신한 미주라 통밀 도너츠", "미주라", 4200, 4200, 10, 30, "샛별배송/택배배송", "상온/종이포장", "1봉지", "100g", "수입산",  
"0090105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090105_subImg.png", "판매중", "등록", "2019-03-16 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "01", "[총각네] 강냉이", "Non-Gmo 옥수수로 만든 추억의 주전부리", "총각네", 3000, 3000, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "120g", "국내산", 
"0090106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090106_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 간식 과자 떡(009) / 초콜릿 젤리 캔디(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "02", "[캐빈디쉬 하비] 과일 캔디 틴케이스 6종", "입안 가독 퍼지는 달콤한 행복", "캐빈디쉬 하비", 2900, 2900, 5, 9, "샛별배송/택배배송", "상온/종이포장", "1개", "175g", "수입산",  
"0090201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090201_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "02", "[비바니] 유기농 초콜릿 7종", "유기농 식물성 원료로 더 깔끔하고 건강한 비바니 초콜릿", "비바니", 4300, 4300, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "80g", "수입산",  
"0090202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090202_subImg.png", "판매중", "등록", "2021-11-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "02", "[애니스] 유기농 버니 푸룻 젤리 3종", "천연 과일 향료의 맛있는 유기농 젤리", "애니스", 5500, 5500, 3, 15, "샛별배송/택배배송", "상온/종이포장", "1개", "100g", "수입산", 
"0090203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090203_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "02", "[린트] 엑셀런스 다크 초콜릿 4종", "고급 카카오만을 사용한 진짜 초콜릿", "린트", 6500, 6500, 5, 9, "샛별배송/택배배송", "상온/종이포장", "1개", "80g", "수입산",  
"0090204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090204_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "02", "[롯데제과] ABC초코 65g", "먹을수록 중독적인 달콤한", "롯데제과", 1500, 1500, 10, 30, "샛별배송/택배배송", "상온/종이포장", "1봉지", "65g", "국내산",  
"0090205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090205_subImg.png", "판매중", "등록", "2019-03-15 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "02", "[질리맥스] 핀란드 자일리톨 2종", "사랑스러운 첫 번째 자일리톨", "질리맥스", 7900, 7900, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1개", "120g", "수입산", 
"0090206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090206_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 간식 과자 떡(009) / 떡 한과(03)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "03", "[떡미당] 굳지않는 앙꼬절편 2종", "언제나 말랑하게 즐기는 절편", "떡미당", 5200, 5200, 5, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "국내산",  
"0090301_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090301_subImg.png", "판매중", "등록", "2019-03-17 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "03", "[유기방아] 떡볶이떡 & 떡국떡 (냉동)", "냉동상태 그대로 조리해서 먹는 쫀득함의 절정", "유기방아", 4300, 3010, 10, 15, "샛별배송/택배배송", "냉동/종이포장", "1봉지", "500g", "국내산",  
"0090302_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090302_subImg.png", "판매중", "등록", "2021-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "03", "[유기방아] 쑥개떡", "향긋한 쑥 내음이 폴폴", "유기방아", 6300, 5980, 10, 15, "샛별배송/택배배송", "냉동/종이포장", "1봉지", "500g", "국내산",  
"0090303_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090303_subImg.png", "판매중", "등록", "2019-03-18 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "03", "[유기방아] 인절미", "유기농 찹쌀과 국산 대두 콩고물이 만난 쫄깃, 고소 영양간식", "유기방아", 3800, 3230, 10, 15, "샛별배송/택배배송", "냉동/종이포장", "1팩", "500g", "국내산",  
"0090304_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090304_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "03", "[떡미당] 밥알찹쌀떡", "통 찹쌀이 선사하는 남다른 쫀득함", "떡미당", 6200, 6200, 5, 9, "샛별배송/택배배송", "냉동/종이포장", "1팩", "300g", "국내산",  
"0090305_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090305_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("009", "03", "[바오담] 호두강정", "달콤 바삭 영양 가득한 우리 주전부리", "질리맥스", 12800, 12800, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1개", "120g", "국내산", 
"0090306_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0090306_subImg.png", "판매중", "등록", "2019-03-16 03:20:02 ");
-- =============================================================== 간식/과자/떡(009)Data 종료 ================================================================






-- =============================================================== 베이커리/치즈/델리(010)Data 시작 ================================================================

-- 베이커리 치즈 델리(010) / 식빵 빵류(01)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "01", "[픽어베이글] 베이글 8종", "뉴욕에서 맛본 바로 그 맛", "픽어베이글", 2800, 2800, 5, 9, "샛별배송/택배배송", "상온/종이포장", "1개", "100g", "수입산",  
"0100101_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100101_subImg.png", "판매중", "등록", "2021-03-17 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "01", "[갑펠] 데니쉬 식빵3종", "격이 다른 식빵", "갑펠", 4500, 4500, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "260g", "수입산",  
"0100102_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100102_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "01", "[우드앤브릭] 빵콩플레", "아침을 시작하는 식사 빵", "우드앤브릭", 4500, 4500, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "260g", "수입산",  
"0100103_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100103_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "01", "[우드앤브릭] 6 그레인 브레드", "6가지 곡물을 한 번에!", "우드앤브릭", 7500, 7500, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "260g", "수입산",  
"0100104_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100104_subImg.png", "판매중", "등록", "2019-12-12 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "01", "[우드앤브릭] 호밀빵 3종", "호밀 마니아를 위한 맞춤형 브레드", "우드앤브릭", 4600, 4600, 10, 15, "샛별배송/택배배송", "상온/종이포장", "1봉지", "260g", "수입산",  
"0100105_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100105_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "01", "MY FIRST 처음 만나는 진짜 식빵", "마침내 찾은 든든한 행복", "(주)만우식품", 4900, 4900, 10, 30, "샛별배송/택배배송", "상온/종이포장", "1봉지", "424g", "국내산",  
"0100106_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100106_subImg.png", "판매중", "등록", "2021-12-12 03:20:02 ");


-- 베이커리 치즈 델리(010) / 잼 버터 스프레드(02)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "02", "[알라] 크림치즈 2종", "덴마크에서 온 100년 전통 치즈", "알라", 3400, 3400, 5, 9, "샛별배송/택배배송", "냉장/종이포장", "1개", "150g", "수입산",  
"0100201_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100201_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "02", "[마담로익] 크림치즈 5종", "부드럽고 담백한 컬리의 인기 크림치즈", "우드앤브릭", 11900, 11900, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "150g", "수입산",  
"0100202_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100202_subImg.png", "판매중", "등록", "2019-03-01 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "02", "[멘즈앤가서] 과일잼 7종", "MD추천! 과일함량 70%이상 함유된 과일 가득 이탈리아잼", "멘즈앤가서", 5500, 4400, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "150g", "수입산",  
"0100203_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100203_subImg.png", "판매중", "등록", "2021-05-05 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "02", "[라콩비에트] 프랑스 AOP 버터 2종", "AOP인증 버터! 샤랑트 푸아트의 신선함을 그대로", "라콩비에트", 34800, 26100, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "150g", "수입산",  
"0100204_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100204_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "02", "[알라] 포션 크림치즈 6개입", "소량 포장하여 깔끔하게 즐기는 크림치즈", "알라", 3200, 3200, 10, 30, "샛별배송/택배배송", "냉장/종이포장", "1박스", "150g * 6개입", "수입산",  
"0100205_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100205_subImg.png", "판매중", "등록", "2019-05-05 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "02", "[버나드] 메이플 시럽", "CANADA NO.2 단풍나무 수액으로 만든 100% 천연시럽", "버나드", 9900, 9900, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1병", "250ml", "수입산",  
"0100206_mainImg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100206_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");


-- 베이커리 치즈 델리(010) / 케이크 파이 디저트(03)
INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "03", "[몽슈슈] 도지마롤 2종", "오사카에서 탄생한 원조 롤케이크", "몽슈슈", 13000, 13000, 65, 25, "샛별배송/택배배송", "냉장/종이포장", "1개", "175g", "수입산",  
"0100301_mainimg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100301_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "03", "[오뗄두스] 구움과자 2종", "사랑스러운 프랑스 티푸드", "오뗄두스", 2000, 2000, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1개", "150g", "수입산",  
"0100302_mainimg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100302_subImg.png", "판매중", "등록", "2021-11-13 03:10:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "03", "[리치몬드 과자점] 공주밤 파이 (10개입)", "통밤 하나가 쏙 들어간 공주밤파이", "리치몬드 과자점", 34000, 30600, 153, 9, "샛별배송/택배배송", "기타", "1개", "650g", "국내산",  
"0100303_mainimg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100303_subImg.png", "판매중", "등록", "2019-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "03", "[르까도드마비] 타르트 2종", "달콤하게 부서지는 작은 사치", "르까도드마비", 24000, 19200, 960, 9, "샛별배송/택배배송", "냉동/종이포장", "1상자", "120g", "수입산",  
"0100304_mainimg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100304_subImg.png", "판매중", "등록", "2021-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "03", "[노아베이커리] 케이크 2종", "함께 나누고 싶은 케이크", "노아베이커리", 36500, 27380, 10, 15, "샛별배송/택배배송", "냉장/종이포장", "1박스", "500g", "국내산",  
"0100305_mainimg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100305_subImg.png", "판매중", "등록", "2018-03-01 03:20:02 ");

INSERT INTO tb_product (p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, 
p_imgname, p_imgpath, p_description, p_detailimgname, p_salestate, p_isdisplay, p_regdate ) 
VALUES("010", "03", "[아워홈] 우유 생크림 롤케이크", "우유 본연의 순수하고 부드러운 맛", "아워홈", 12800, 12800, 65, 25, "샛별배송/택배배송", "냉장/종이포장", "1개", "180g", "국내산",  
"0100306_mainimg.jpg", "C:\KurlyMoly\img\categoryImages", "상품은 현지 직송으로 발송됩니다.", "0100306_subImg.png", "판매중", "등록", "2018-11-11 03:20:02 ");
-- =============================================================== 베이커리/치즈/델리(010)Data 종료 ================================================================


