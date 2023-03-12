create database kurlymoly;
use kurlymoly;

-- 카테고리(메인메뉴 대분류 / 소분류)
CREATE TABLE tb_category(
	cate_idx bigint auto_increment primary key,
    cate_imgname varchar(200), -- 이미지 이름
    cate_name1 varchar(50), -- 대분류 코드
    cate_name1Kor varchar(50), -- 대분류 명칭
    cate_name2 varchar(50), -- 소분류 코드
    cate_name2Kor varchar(50) -- 소분류 명칭
);

select * from tb_category;
select * from tb_category where cate_name1='001';
drop table tb_category;

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate001.png', '001', '채소', '01', '친환경');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate001.png', '001', '채소', '02', '고구마·감자·당근');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate001.png', '001', '채소', '03', '시금치·쌈채소·나물');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate001.png', '001', '채소', '04', '브로콜리·파프리카·양배추');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate001.png', '001', '채소', '05', '양파·대파·마늘·배추');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate001.png', '001', '채소', '06', '오이·호박·고추');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate001.png', '001', '채소', '07', '냉동·이색·간편채소');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate001.png', '001', '채소', '08', '콩나물·버섯');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate002.png', '002', '과일·견과·쌀', '01', '친환경');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate002.png', '002', '과일·견과·쌀', '02', '제철과일');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate002.png', '002', '과일·견과·쌀', '03', '국산과일');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate002.png', '002', '과일·견과·쌀', '04', '수입과일');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate002.png', '002', '과일·견과·쌀', '05', '간편과일');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate002.png', '002', '과일·견과·쌀', '06', '냉동·건과일');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate002.png', '002', '과일·견과·쌀', '07', '견과류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate002.png', '002', '과일·견과·쌀', '08', '쌀·잡곡');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '01', '제철수산');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '02', '생선류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '03', '굴비·반건류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '04', '오징어·낙지·문어');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '05', '새우·게·랍스터');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '06', '해산물·조개류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '07', '수산가공품');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '08', '김·미역·해조류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate003.png', '003', '수산·해산·건어물', '09', '건어물·다시팩');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate004.png', '004', '정육·계란', '01', '국내산 소고기');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate004.png', '004', '정육·계란', '02', '수입산 소고기');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate004.png', '004', '정육·계란', '03', '돼지고기');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate004.png', '004', '정육·계란', '04', '계란류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate004.png', '004', '정육·계란', '05', '닭·오리고기');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate004.png', '004', '정육·계란', '06', '양념육·돈까스');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate004.png', '004', '정육·계란', '07', '양고기');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate005.png', '005', '국·반찬·메인요리', '01', '국·탕·찌개');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate005.png', '005', '국·반찬·메인요리', '02', '밀키트·메인요리');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate005.png', '005', '국·반찬·메인요리', '03', '밑반찬');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate005.png', '005', '국·반찬·메인요리', '04', '김치·젓갈·장류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate005.png', '005', '국·반찬·메인요리', '05', '두부·어묵·부침개');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate005.png', '005', '국·반찬·메인요리', '06', '베이컨·햄·통조림');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate006.png', '006', '샐러드·간편식', '01', '샐러드·닭가슴살');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate006.png', '006', '샐러드·간편식', '02', '도시락·밥류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate006.png', '006', '샐러드·간편식', '03', '파스타·면류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate006.png', '006', '샐러드·간편식', '04', '떡볶이·튀김·순대');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate006.png', '006', '샐러드·간편식', '05', '피자·핫도그·만두');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate006.png', '006', '샐러드·간편식', '06', '폭립·떡갈비·안주');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate006.png', '006', '샐러드·간편식', '07', '죽·스프·카레');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate006.png', '006', '샐러드·간편식', '08', '선식·시리얼');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate007.png', '007', '면·양념·오일', '01', '파스타·면류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate007.png', '007', '면·양념·오일', '02', '식초·소스·드레싱');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate007.png', '007', '면·양념·오일', '03', '양념·액젓·장류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate007.png', '007', '면·양념·오일', '04', '식용유·참기름·오일');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate007.png', '007', '면·양념·오일', '05', '소금·설탕·향신료');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate007.png', '007', '면·양념·오일', '06', '밀가루·가루·믹스');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate008.png', '008', '생수·음료·우유·커피', '01', '생수·탄산수');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate008.png', '008', '생수·음료·우유·커피', '02', '음료·주스');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate008.png', '008', '생수·음료·우유·커피', '03', '우유·두유·요거트');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate008.png', '008', '생수·음료·우유·커피', '04', '커피');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate008.png', '008', '생수·음료·우유·커피', '05', '차');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate009.png', '009', '간식·과자·떡', '01', '과자·스낵·쿠키');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate009.png', '009', '간식·과자·떡', '02', '초콜릿·젤리·캔디');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate009.png', '009', '간식·과자·떡', '03', '떡·한과');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate009.png', '009', '간식·과자·떡', '04', '아이스크림');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate010.png', '010', '베이커리·치즈·델리', '01', '식빵·빵류');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate010.png', '010', '베이커리·치즈·델리', '02', '잼·버터·스프레드');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate010.png', '010', '베이커리·치즈·델리', '03', '케이크·파이·디저트');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate010.png', '010', '베이커리·치즈·델리', '04', '치즈');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate010.png', '010', '베이커리·치즈·델리', '05', '델리');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate010.png', '010', '베이커리·치즈·델리', '06', '올리브·피클');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate011.png', '011', '건강식품', '01', '영양제');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate011.png', '011', '건강식품', '02', '유산균');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate011.png', '011', '건강식품', '03', '홍삼·인삼·꿀');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate011.png', '011', '건강식품', '04', '건강즙·건강음료');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate011.png', '011', '건강식품', '05', '건강분말·건강환');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate011.png', '011', '건강식품', '06', '다이어트·이너뷰티');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate011.png', '011', '건강식품', '07', '유아동');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate012.png', '012', '생활용품·리빙', '01', '휴지·티슈');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate012.png', '012', '생활용품·리빙', '02', '여성·위생용품');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate012.png', '012', '생활용품·리빙', '03', '세제·청소용품');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate012.png', '012', '생활용품·리빙', '04', '화훼·인테리어소품');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate012.png', '012', '생활용품·리빙', '05', '의약외품·마스크');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate012.png', '012', '생활용품·리빙', '06', '생활잡화·문구');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate013.png', '013', '뷰티·바디케어', '01', '스킨케어');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate013.png', '013', '뷰티·바디케어', '02', '구강·면도');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate013.png', '013', '뷰티·바디케어', '03', '바디·제모');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate013.png', '013', '뷰티·바디케어', '04', '헤어케어');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate013.png', '013', '뷰티·바디케어', '05', '미용기기·소품');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate014.png', '014', '주방용품', '01', '주방소모품·잡화');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate014.png', '014', '주방용품', '02', '주방·조리도구');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate014.png', '014', '주방용품', '03', '냄비·팬·솥');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate014.png', '014', '주방용품', '04', '보관용기·텀블러');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate014.png', '014', '주방용품', '05', '식기·테이블웨어');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate014.png', '014', '주방용품', '06', '컵·잔·커피도구');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate015.png', '015', '가전제품', '01', '주방가전');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate015.png', '015', '가전제품', '02', '생활가전');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate015.png', '015', '가전제품', '03', '계절가전');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '01', '분유·간편 이유식');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '02', '이유식 재료');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '03', '간식·음식·음료');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '04', '건강식품');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '05', '이유·수유용품');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '06', '기저귀·물티슈');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '07', '세제·위생용품');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '08', '스킨·구강케어');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate016.png', '016', '베이비·키즈', '09', '완구·잡화류');

insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate017.png', '017', '반려동물', '01', '강아지 간식');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate017.png', '017', '반려동물', '02', '강아지 주식');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate017.png', '017', '반려동물', '03', '고양이 간식');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate017.png', '017', '반려동물', '04', '고양이 주식');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate017.png', '017', '반려동물', '05', '반려동물 용품');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate017.png', '017', '반려동물', '06', '배변·위생');
insert into tb_category (cate_imgname, cate_name1, cate_name1Kor, cate_name2, cate_name2Kor) values ('ico_cate017.png', '017', '반려동물', '07', '소용량·샘플');

