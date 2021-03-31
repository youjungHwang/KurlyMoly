use kurlymoly;

CREATE TABLE tb_notice(
	n_idx bigint auto_increment primary key,
    n_title varchar(100) not null, 
    n_content text not null,
    n_hit bigint default 0,
    n_isdisplay varchar(10) not null,
    n_isimpt varchar(10) not null,
    n_regdate datetime default current_timestamp()
);

select * from tb_notice;
drop table tb_notice;

CREATE TABLE tb_member(
	m_idx bigint auto_increment primary key, -- 회원번호
    m_userid varchar(20), -- 회원id
    m_password varchar(50), -- 비밀번호
    m_name varchar(20), -- 이름
    m_tel varchar(20), -- 전화번호
    m_email varchar(50), -- 이메일
    m_birth varchar(10) default null, -- 생년월일
    m_gender varchar(10), -- 성별
    m_zipcode varchar(200), -- 우편번호
    m_address1 varchar(200), -- 주소
    m_address2 varchar(200), -- 상세주소
    m_recomid varchar(20) default null, -- 추천인 아이디
    m_regdate datetime default now(), -- 회원가입일시
    m_membership varchar(10), -- 멤버십 등급
    m_kurlypass varchar(10), -- 컬리패스 여부 (가입/비가입)
    m_state int, -- 회원상태 / 일반(1), 탈퇴(2), 관리자(9)
    m_withdrawwhy varchar(20) default null, -- 불편사항 선택
    m_withdrawwhy2 text default null, -- 불편사항 기타내용
    m_withdrawdate datetime default null -- 탈퇴일시
);

select * from tb_member;
drop table tb_member;
insert into tb_member(m_userid, m_password, m_name, m_tel, m_email, m_birth, m_gender, m_zipcode, m_address1, m_address2, m_recomid, m_membership, m_kurlypass, m_state, m_withdrawwhy, m_withdrawwhy2, m_withdrawdate) values ('apple', '1111', '김사과', '010-1111-1111', 'apple@apple.com', null, 'woman', '12345', '서울시 강남구 역삼동', '1001호', null, '일반', '비가입', 1, null, null, null);
insert into tb_member(m_userid, m_password, m_name, m_tel, m_email, m_birth, m_gender, m_zipcode, m_address1, m_address2, m_recomid, m_membership, m_kurlypass, m_state, m_withdrawwhy, m_withdrawwhy2, m_withdrawdate) values ('orange', '2222', '오렌지', '010-2222-2222', 'orange@orange.com', null, 'woman', '54321', '서울시 용산구 청파동', '1002호', null, '일반', '가입', 1, null, null, null);
insert into tb_member(m_userid, m_password, m_name, m_tel, m_email, m_birth, m_gender, m_zipcode, m_address1, m_address2, m_recomid, m_membership, m_kurlypass, m_state, m_withdrawwhy, m_withdrawwhy2, m_withdrawdate) values ('banana', '3333', '반하나', '010-3333-3333', 'banana@banana.com', null, 'woman', '56789', '서울시 용산구 이태원동', '1003호', null, '일반', '비가입', 1, null, null, null);
insert into tb_member(m_userid, m_password, m_name, m_tel, m_email, m_birth, m_gender, m_zipcode, m_address1, m_address2, m_recomid, m_membership, m_kurlypass, m_state, m_withdrawwhy, m_withdrawwhy2, m_withdrawdate) values ('admin', '1111', '관리자', '010-9999-9999', 'admin@admin.com', null, 'woman', '98765', '서울시 강남구 청담동', '1004호', null, '일반', '가입', 9, null, null, null);
-- 임시 정보 select
set sql_safe_updates=0;
UPDATE tb_member SET m_password="1234", m_name="김사과", m_email="apple@naver.com", m_tel="010-1111-2222", m_gender="man", m_birth="1990-12-01", m_recomid="banana" WHERE m_userid="apple";

CREATE TABLE tb_product(
	p_idx bigint auto_increment primary key,
    p_category1 varchar(20) not null,
    p_category2 varchar(20) not null,
    p_title varchar(100) not null,
    p_subtitle varchar(100) not null,
    p_brand varchar(20) not null,
    p_price int not null,
    p_discprice int default 0,
    p_point int default 0,
    p_stock int default 100 not null,
    p_deliverytype varchar(10) not null, -- 샛별배송/택배배송/기타
    p_packingtype varchar(10) not null, -- 냉동/냉장/상온/기타
    p_salesunit varchar(20) default null,
    p_weight varchar(20) default null,
    p_origin varchar(20) default null,
    p_mainimg varchar(200) not null,
    p_description text not null,
    p_salestate varchar(10) not null, -- 판매대기/판매중/품절/판매중지/판매종료
    p_display varchar(10) not null,
    p_regdate datetime default now()
);

select * from tb_product;
drop table tb_product;
insert into tb_product(p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_mainimg, p_description, p_salestate, p_display) values ('베이커리·치즈·델리', '식빵·빵류', '[픽어베이글] 베이글 8종', '뉴욕에서 맛본 바로 그 맛', '픽어베이글', 2800, 560, 0, 100, '샛별배송', '상온', 'EA', '100g', '뉴욕', 'goods1.jpg', '상세설명란', '판매중', '전시중');
insert into tb_product(p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_mainimg, p_description, p_salestate, p_display) values ('과일·견과·쌀', '제철과일', 'GAP 논산 설향 딸기 500g', '당도가 높은 고품질 딸기 (1팩/500g)', '', 9900, null, 90, 100, '샛별배송', '냉장', '팩', '500g', '국산', 'goods2.jpg', '상세설명란', '판매중', '전시중');
insert into tb_product(p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_mainimg, p_description, p_salestate, p_display) values ('채소', '고구마·감자·당근', '무농약 햇 감자 600g', '2020년 갓 수확한 무농약 햇 감자 (1봉/600g)', '', 4990, null, null, 100, '샛별배송', '냉장', '봉지', '600g', '국내', 'goods3.jpg', '상세설명란', '판매중', '전시중');
insert into tb_product(p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_mainimg, p_description, p_salestate, p_display) values ('베이커리·치즈·델리', '식빵·빵류', '[깁펠] 데니쉬 식빵 3종', 'NEW 데니쉬 꽈트로 치즈 추가 (전국배송 가능)', '깁펠', 9400, null, 47, 100, '샛별배송', '상온', '봉', '옵션별 상이', '국내', 'goods4.jpg', '상세설명란', '판매중', '전시중');
insert into tb_product(p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_mainimg, p_description, p_salestate, p_display) values ('베이커리·치즈·델리', '식빵·빵류', '[우드앤브릭] 빵콩플레', '아침을 시작하는 식사 빵', '우드앤브릭', 4500, 450, 20, 100, '샛별배송', '상온', '봉', '260g', '국내', 'goods5.jpg', '상세설명란', '판매중', '전시중');
insert into tb_product(p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_mainimg, p_description, p_salestate, p_display) values ('베이커리·치즈·델리', '식빵·빵류', '[우드앤브릭] 6 그레인 브레드', '6가지 곡물을 한 번에!', '우드앤브릭', 7500, 750, 34, 100, '샛별배송', '상온', '봉', '430g', '국내', 'goods6.jpg', '상세설명란', '판매중', '전시중');
insert into tb_product(p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_mainimg, p_description, p_salestate, p_display) values ('베이커리·치즈·델리', '식빵·빵류', '[우드앤브릭] 호밀빵 3종', '호밀 마니아를 위한 맞춤형 브레드', '우드앤브릭', 4600, 460, 21, 100, '샛별배송', '상온', '봉', '옵션별 상이', '국내', 'goods7.jpg', '상세설명란', '판매중', '전시중');
insert into tb_product(p_category1, p_category2, p_title, p_subtitle, p_brand, p_price, p_discprice, p_point, p_stock, p_deliverytype, p_packingtype, p_salesunit, p_weight, p_origin, p_mainimg, p_description, p_salestate, p_display) values ('베이커리·치즈·델리', '식빵·빵류', '[바로크] 올리브 식빵', '올리브 오일 향을 머금은 쫄깃함', '바로크', 5000, null, 25, 100, '샛별배송', '상온', '봉', '200g', '국내', 'goods8.jpg', '상세설명란', '판매중', '전시중');

CREATE TABLE tb_basket(
	bk_idx bigint auto_increment primary key, -- 장바구니 번호
    bk_memidx bigint not null, -- 회원번호
    foreign key(bk_memidx) references tb_member(m_idx),
    bk_prodidx bigint not null, -- 상품번호
    foreign key(bk_prodidx) references tb_product(p_idx),
    bk_quantity int not null, -- 수량
    bk_regdate datetime default now() -- 등록일시
);

select * from tb_basket;
drop table tb_basket;
insert into tb_basket(bk_memidx, bk_prodidx, bk_quantity) values (1, 1, 2);
insert into tb_basket(bk_memidx, bk_prodidx, bk_quantity) values (3, 2, 1);

CREATE TABLE tb_order(
	o_idx bigint auto_increment primary key, -- 주문번호
    o_userid varchar(20), -- 주문자아이디
    o_orderer varchar(20), -- 주문자명
    o_receiver varchar(20), -- 수취인명
    o_tel varchar(20), -- 전화번호
    o_zipcode varchar(10), -- 우편번호
    o_address1 varchar(50), -- 주소1
    o_address2 varchar(50), -- 주소2
    o_address3 varchar(50), -- 주소3
    o_address4 varchar(50) default null, -- 수령장소
    o_prodamount int, -- 상품금액
    o_discount int default 0, -- 상품할인금액
    o_usecoupon int default 0, -- 쿠폰할인금액
    o_usepoint int default 0, -- 적립금사용액
    o_deliveryfee int default 0, -- 배송비
    o_amountpaid int, -- 결제금액
    o_addpoint int default 0, -- 적립예정금액
    o_paidtype varchar(50), -- 결제방식
    o_paiddate datetime default now(), -- 결제일시
    o_shipnumber varchar(50) default null, -- 대표송장번호
    o_shipstart datetime default null, -- 배송시작일시
    o_shipdone datetime default null, -- 배송완료일시
    o_shipdtate varchar(10), -- 처리상태 / 미확인/상품준비중/배송중/배송완료/구매확정
    o_renewdate datetime default now() -- 처리일시
);

select * from tb_order;
insert into tb_order(o_userid, o_orderer, o_receiver, o_tel, o_zipcode, o_address1, o_address2, o_address3, o_address4, o_prodamount, o_discount, o_usecoupon, o_usepoint, o_deliveryfee, o_amountpaid, o_addpoint, o_paidtype, o_shipnumber, o_shipdtate) values ('apple', '김사과', '김박하', '010-1111-2222', '02340', '서울시 강남구', '역삼동 731-4', '', '', 50000, 5000, 1200, 800, 2500, 45000, 450, '카드결제', '123451234512', '미확인');
insert into tb_order(o_userid, o_orderer, o_receiver, o_tel, o_zipcode, o_address1, o_address2, o_address3, o_address4, o_prodamount, o_discount, o_usecoupon, o_usepoint, o_deliveryfee, o_amountpaid, o_addpoint, o_paidtype, o_shipnumber, o_shipdtate) values ('orange', '오렌지', '오레오', '010-3333-4444', '12345', '서울시 강남구', '청담동 34', '코리아it아카데미', '부재시 문앞', 43000, 2000, 600, 150, 2500, 40250, 400, '현금결제', '543215432154', '상품준비중');

CREATE TABLE tb_orderdetail(
	od_idx bigint auto_increment primary key, -- 주문내역번호
    od_orderidx bigint, -- 주문번호 foreign key
    od_productidx bigint, -- 상품번호 foreign key
    od_quantity int, -- 수량
    od_deliverytype varchar(10), -- 배송구분 : 냉동/냉장/상온/기타
    od_shipnumber varchar(50) default null, -- 송장번호 foreign key
    od_shipstart datetime default null, -- 배송시작일시
    od_shipdone datetime default null, -- 배송완료일시
    od_shipstate varchar(10), -- 처리상태 : 미확인/상품준비중/배송중/배송완료/구매확정
    od_renewdate datetime default now() -- 처리일시
);

select * from tb_orderdetail;
drop table tb_orderdetail;
insert into tb_orderdetail(od_orderidx, od_productidx, od_quantity, od_deliverytype, od_shipnumber, od_shipstate) values(1, 2, 2, '상온', '543215432154', '상품준비중');
insert into tb_orderdetail(od_orderidx, od_productidx, od_quantity, od_deliverytype, od_shipnumber, od_shipstate) values(2, 2, 2, '상온', '543215432154', '상품준비중');

CREATE TABLE tb_claim(
	c_idx bigint auto_increment primary key, -- 클레임 번호
    c_orderidx bigint, -- 주문번호 foreign key
    c_claimtype bigint, -- 클레임유형 : 취소(1)/교환(2)/반품(3)
    c_claimwhy varchar(100), -- 사유
    c_claimdate datetime default now(), -- 요청일시
    c_state varchar(10), -- 처리상태 : 취소요청/취소완료/취소거부
    c_statedate datetime default now(), -- 처리일시
    c_refusalwhy varchar(100) default null -- 거부사유
);

drop table tb_claim;
select * from tb_claim;
insert into tb_claim(c_orderidx, c_claimtype, c_claimwhy,  c_state, c_refusalwhy) values(1, 2, '사이즈 미스', '취소요청', '');
insert into tb_claim(c_orderidx, c_claimtype, c_claimwhy,  c_state, c_refusalwhy) values(2, 3, '사진과 실물이 다름', '취소완료', '');
insert into tb_claim(c_orderidx, c_claimtype, c_claimwhy,  c_state, c_refusalwhy) values(3, 2, '검은색이 갖고싶어요', '취소거부', '재고없음');

CREATE TABLE tb_review(
	rv_idx bigint auto_increment primary key, -- 리뷰번호
    rv_productidx bigint, -- 상품번호 foreign key
    rv_userid varchar(20), -- 작성자아이디
    rv_stars int, -- 별점
    rv_title varchar(100), -- 제목
    rv_content text, -- 내용
    rv_helped int default 0, -- 도움이 돼요(1), 안돼요(0)
    rv_regdate datetime default now() -- 리뷰등록일시
);

select * from tb_review;
drop table tb_review;
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(1, 'apple', 4.5, '달고 맛있어요', '당도가 높은 듯 맛있습니다', 1);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(2, 'banana', 3.5, '맛있는 딸기', '신선해요', 0);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(4, 'orange', 2, '생각보다 딱딱해요', '생각보다 딱딱해요<br>아이들 먹기에는 좋지 않은듯..', 0);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(5, 'apple', 4, '맛있어요', '아침식사 대용으로 좋아요', 0);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(6, 'orange', 3.5, '건강식같네요', '곡물 좋아하시는 분이라면 추천합니다', 0);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(8, 'banana', 2, '쫄깃하지 않은걸요', '괜히 산듯', 0);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(3, 'apple', 3, '맛있어요', '다음에 또 사먹을게요', 1);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(4, 'apple', 5, '부드러워요', '맛있습니다 다음에 또 사러 올게요', 0);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(5, 'orange', 1.5, '음 딜리셔스', '아침에 든든합니다', 0);
insert into tb_review(rv_productidx, rv_userid, rv_stars, rv_title, rv_content, rv_helped) values(6, 'banana', 3, '건강해지는 기분', '세번째 구매 중입니다.', 0);

CREATE TABLE tb_reviewimg(
	rvd_idx bigint auto_increment primary key, -- 리뷰이미지 번호
    rvd_rvidx bigint, -- 리뷰 번호
    rvd_file varchar(200) -- 리뷰이미지 경로
);

select * from tb_reviewimg;
insert into tb_reviewimg(rvd_rvidx, rvd_file) values(1, '경로 들어갈 자리');
insert into tb_reviewimg(rvd_rvidx, rvd_file) values(2, '경로 들어갈 자리');

-- ==================================================

select * from tb_member;
select * from tb_product;
select * from tb_basket;
select * from tb_order;
select * from tb_orderdetail;
select * from tb_claim;
select * from tb_review;
select * from tb_reviewimg;

SELECT * FROM tb_review where rv_productidx=4;
SELECT COUNT(*) FROM tb_review where rv_productidx=4;