create database kurlymoly; 
use kurlymoly;  

 -- 공지사항 SQL Data 
create table tb_notice (
	n_idx bigint auto_increment primary key, -- 공지번호
    n_title varchar(100) not null, -- 제목	
    n_content text, -- 내용
    n_hit bigint default 0, -- 조회수
    n_isimpt varchar(10), -- 중요공지여부(중요, 일반)
    n_isdisplay varchar(10), -- 전시상태(전시중, 전시중단)
    n_regdate datetime default now() -- 등록일시
);
-- 총 20개만!! 
select * from tb_notice;
drop table tb_notice;

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('컬리러버스 혜택 변경 사전 공지',  '다가오는 5월1일에 컬리러버스 혜택이 소폭 변경될 예정입니다. 매월 1일 한번에 발급되던 등급쿠폰 대신, 등급별 최대 6천원 ~ 2만원의 추가 혜택이 월 중 나누어 지급될 예정입니다.', 233, '일반', '전시중', '2021-04-01');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[마켓컬리] 고객마다 가격이 다르다?는 SBS 8시 뉴스 방송 관련 안내문', ' 1. 컬리가 판매하는 상품의 정상가는 고객이나 물류센터에 따라 달라지지 않습니다.고객분들이 최상의 품질과 좋은 가격으로 제품을 구매하실 수 있도록 하고 있습니다. 3. 이러한 판매 방식은, 오프라인 마트들이 지점별로 마감세일을 하는 상품과 할인 폭이 다른 것과 동일합니다.  4. 컬리는 판매 예측과 실제 재고의 오차를 줄이기 위해 수억개의 데이터를 분석해 고객의 수요를 정확하게 예측하고자 노력하고 있으며  5. 재고 소진용 추가할인을 제외한 모든 상품 할인은 전 고객/물류센터 동일하게 적용됩니다. 6. 이처럼 배송지에 따라 상품 정보가 달라질 수 있다는 점은 마켓컬리 앱의 배송지 관리 부분에서 안내 되고 있습니다.  이러한 점 널리 양해 부탁드리며, 컬리는 앞으로도 고객분들께 더 좋은 상품을 합리적인 가격으로 선보일 수 있도록 최선을 다하겠습니다. 감사합니다.', 671, '중요', '전시중', '2021-03-31');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[마켓컬리] 일용직 1인 코로나19 확진 관련 안내.',  '고객님 안녕하세요. 마켓컬리입니다. 3.30(화) 일용직 근무자 1인이 코로나19 확진 판정을 받아 안내 말씀드립니다. 확진 판정을 받으신 분은 3.27(토)~3.28(일) 냉장센터에서 근무하였습니다. 컬리는 코로나19 확산 방지를 위해 선제 검사 중에 있으며, 해당 근무자는3.29(월) 코로나19 검사를 진행 결과 3월 30일(화) 최종  확진 판정 받았습니다.  해당 직원은 근무 시 방역당국의 지침에 따라 상시 마스크와 장갑 등을 착용하였습니다. 마켓컬리에서는 아래와 같이 조치하였습니다. - 확진자가 근무하거나 지나간 모든 지역의 방역을 완료했습니다. - 방역 당국과 역학 조사를 진행하여 밀접 접촉자를 확인 중에 있으며, 확인된 밀접 접촉자 분들의 검사 결과가 확인되어지면 빠르게 업데이트하겠습니다. - 현재 컬리는 무중단 운영을 위해 확진자 발생 시나리오를 기반으로 센터별 운영을 개별화하여 각 센터 간 교류를 금지하고 있습니다. 여전히 높은 확진자 수로 인해 많은 직원들이 코로나 바이러스 위험에 노출될 수 밖에 없습니다. 이에 감염 가능성이 조금이라도 있을 경우 적극적인 선제적 검사를 시행하고 있으며, 그 결과를 투명하게 고객 여러분께 결과를 알려드리고 있습니다. 앞으로도 컬리는 코로나19 확산을 방지하고, 관련된 모든 상황을 고객님께 빠르게 전달하도록 하겠습니다. 이번 사안으로 불편을 겪으신 고객님께 다시 한번 진심으로 사과 말씀드립니다. 감사합니다. 마켓컬리 드림.', 398, '중요', '전시중', '2021-03-30');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [스키니랩] 애플페논 풋사과 다이어트 젤리 (2021 4. 5 ~)', 
'고객님 안녕하세요. 마켓컬리입니다. [스키니랩] 애플페논 풋사과 다이어트 젤리 가격을 조정하게 되어 안내드립니다. 가격인상 요인에의해 공급가가 상승함에따라 컬리에서도 부득이하게 일정부분 가격조정을 하게된점 양해 부탁드립니다. 변경전 판대가: ￦12,900 변경후 판매가 : ￦19,900', 245, '일반', '전시중', '2021-03-30');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인하공지] [트라이앵글] 요리 핀셋20cm외 13건(2021.3.30~)', '[트라이앵글] 요리 핀셋 20cm 외 13건" 가격을 조정하게되어 안내드립니다. #가격인하 요인 -판매 촉진을 위한판매가 인하', 333, '일반', '전시중', '2021-03-22');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [오뚜기] 마요네스 제품 6건(2021 3. 29 ~)', '[오뚜기]마요네스 제품 6건 가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 656, '일반', '전시중', '2021-03-24');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [더오담] 소내장탕(2021 3. 29 ~)', '[더오담] 소내장탕 가격을 조정하게되어 안내드립니다.
 #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 343, '일반', '전시중', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [서원당] 상품군 3종 (2021 3. 29 ~)', '[서원당] 상품군 3종
가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 543, '일반', '전시중', '2021-03-23');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [온맘] 국탕 삼품군 3종 (2021 3. 29 ~)', '[온맘] 국탕 상품군 3종
 가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 654, '일반', '전시중', '2021-03-23');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[마켓컬리] 일용직 1인 코로나19 확진 관련 안내_밀접 접촉 음성 판정', '지난 3.18(목) 박스 분류업을 하셨던 일용직 근무자 1인이 코로나19 확진 판정을 받아 안내 말씀드립니다. 
하지만 마켓컬리는 - 확진자 근무하거나 지나간 모든지역 방역완료했습니다. - 해당직원과 접촉자 모두 검사하여 음성판정 받았습니다.', 232, '일반', '전시중', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [정식품] 제품 8종 (2021 4. 01 ~)', '[정식품] 제품 8종 
가격을 조정하게되어 안내드립니다. #가격인상 요인 -주요 원부자재 공급가격 인상', 678, '일반', '전시중', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [부탇해쭈꾸미] 주꾸미볶음 매운맛 500g외 3종 (2021 3. 26 ~)', '[부탇해쭈꾸미] 주꾸미 볶음 매운맛 500g외 3종
 가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 334, '일반', '전시중', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [GODIVA] 컵아이스크림5종 (2021 3. 22 ~)', '[GODIVA] 컵 아이스크림 5종" 
가격을 조정하게되어 안내드립니다. #가격인상 요인 -환율 인상으로 인한 판매가 조정', 234, '일반', '전시중', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[마켓컬리] 일용직 2인 코로나19 확진 관련 안내_밀접 접촉 전원 음성 판정, 추가확진자 0명', '3.18(목), 
일용직 근무자 2인이 코로나19 확진 판정을 받아 안내 말씀드립니다. 해당 직원은 근무 시 방역당국의 지침에 따라 상시 마스크와 장갑 등을 착용하였습니다. 마켓컬리에서는 아래와 같이 조치하였습니다. - 확진자가 근무하거나 지나간 모든 지역의 방역을 완료했습니다.
- 해당 직원과 접촉 가능성이 있는 밀접 접촉자 16명 전원 검사 결과 음성 판정 받았습니다 ', 454, '일반', '전시중', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [달구지푸드] 훈제 삼겹 500g (2021 3. 29 ~)', '[달구지푸드] 훈제 삼겹 500g
가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 232, '일반', '전시중단', '2021-03-23');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [마리꼬] 스딩 밀크 클랜저 500ml외 3건 (2021 3. 20 ~)', '[마리꼬] 스딩 밀크 클랜저 500ml외 3건 
가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 454, '일반', '전시중', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [오아] 에이블나인 제빙기 외 1건 (2021 3. 29 ~)', '[오아] 에이블 나인 제빙기 외 1건" 
가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 141, '일반', '전시중', '2021-03-20');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [벽제갈비] 한우곰탕 외 2건 (2021 3. 22 ~)', '[벽제갈비] 한우곰탕 외 2건  
가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 254, '일반', '전시중단', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [삼청동 에그롤] 부드러운 에그롤 4종 (2021 3. 19 ~)', '[삼청동 에그롤] 부드러운 에그롤 4종 
가격을 조정하게되어 안내드립니다. #가격인상 요인 -원물가 상승으로 인한 판매가 조정', 145, '일반', '전시중', '2021-03-26');

insert into tb_notice (n_title, n_content, n_hit, n_isimpt, n_isdisplay, n_regdate) values ('[가격인상공지] [밀도]스콘 8종 (2021 3. 15 ~)', '[밀도]스콘 8종
가격을 조정하게되어 안내드립니다. #가격인상 요인 -인권비 상승으로 인한 판매가 조정', 232, '일반', '전시중', '2021-03-26');
