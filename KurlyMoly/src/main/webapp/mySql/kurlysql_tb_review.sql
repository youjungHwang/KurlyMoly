
create database kurlymoly;
use kurlymoly;

create table tb_review (
	rv_idx bigint auto_increment primary key, -- 리뷰번호
    rv_productidx bigint, -- 상품번호
    rv_userid varchar(20), -- 작성자 ID
    rv_title varchar(100), -- 제목
    rv_content text, -- 내용
    rv_helped int default 0, -- 도움
    rv_regdate datetime default now(), -- 리뷰일시
    rv_imgname varchar(200), -- 이미지 이름
    rv_imgpath varchar(200) -- 이미지 경로
);

select * from tb_review;
SELECT * FROM tb_review WHERE rv_productidx=1;
SELECT COUNT(*) FROM tb_review WHERE rv_productidx=1;
drop table tb_review;
-- =================================================================무농약 브로콜리2종=====================================================================================
INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'apple11', '신선해요', '브로콜리 하나여도 큼직해서 좋아요', 0, '2021-04-06', 'broccoli1.jpg', 'broccoli1.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'banana11', '꾸준히 사먹고 있어요', '찜해서 먹으면 맛있더라구요', 0, '2021-04-02', 'broccoli2.jpg', 'broccoli2.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'orange11', '사이즈가 적당하고 딱 좋아요.', '친환경당근인데 마트보다 저렴한것 같아요. 사이즈도 딱 쓰기 좋은 사이즈고 싱싱하고 좋아요.', 0, '2021-04-02', 'broccoli3.jpg', 'broccoli3.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'cherry11', '간편해요', '손질되어있어 사용하기 간편해요^^', 0, '2021-04-01', 'broccoli4.jpg', 'broccoli4.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'kiwi11', '싱싱 but 쓴맛', '싱싱한게 배달되긴 했는데 익히니 쓴 맛이 나서 아쉬웠어요.', 0, '2021-04-01', 'broccoli5.jpg', 'broccoli5.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'mango11',  '친환경 브로콜리', ' 브로콜리 친환경이라 믿음직. ', 0, '2021-03-31', 'broccoli6.jpg', 'broccoli6.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'melon11', '이유식용', '아기 이유식만들려샀어요 조각되어있어 음쓰덜나와 좋아요 30g 큐브 6~7개 나왔네요', 0, '2021-04-02', 'broccoli7.jpg', 'broccoli7.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'raisin11',  '조아요', '새벽에 신선하게받았어요~', 0, '2021-03-30', 'broccoli8.jpg', 'broccoli8.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'tomato11', '적당', '양이 적어서 좋네요 ~', 0, '2021-03-30', 'broccoli9.jpg', 'broccoli9.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (1, 'watermelon11',  '야채는', '컬리 야채는 신선도 별로', 0, '2021-03-30', 'broccoli10.jpg', 'broccoli10.jpg');

-- =================================================================국산콩 무농약 콩나물 300g=====================================================================================
INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'apple11',  '친환경', '콩나물밥 해서 먹었는데 싱싱하고 맛있어요', 0, '2021-04-02', 'beansprouts1.jpg', 'beansprouts1.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'banana11', '양이별로 없네요?', '그래서 추가로 더 구매 했슴닿ㅎㅎ', 0, '2021-04-02', 'beansprouts2.jpg', 'beansprouts2.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'orange11', '싱싱하고 맛있어요.', '콩나물국이나 무침 해먹으면 좋아요', 0, '2021-04-02', 'beansprouts3.jpg', 'beansprouts3.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'cherry11', '만족', '싱싱하고 맛있어서 또 구매합니다', 0, '2021-04-01', 'beansprouts4.jpg', 'beansprouts4.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'kiwi11',  '자주먹음', '자주 시켜 먹어요.', 0, '2021-04-01', 'beansprouts5.jpg', 'beansprouts5.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'mango11', '콩나물', '아삭,비린맛없이 맛나요', 0, '2021-03-31', 'beansprouts6.jpg', 'beansprouts6.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'melon11',  '시원한 콩나물국', '콩나물국 끓였어요 맛있어요', 0, '2021-04-02', 'beansprouts7.jpg', 'beansprouts7.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'raisin11',  '무농약', '무농약이라 좋아요. 찌개에 최고예요', 0, '2021-03-30', 'beansprouts8.jpg', 'beansprouts8.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'tomato11', '첨샀는데', '국산콩에 무농약 콩나물 맛도좋고 가격도 좋네요', 0, '2021-03-30', 'beansprouts9.jpg', 'beansprouts9.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (2, 'watermelon11',  '양많아요', '양도많고 싱싱합니다', 0, '2021-03-30', 'beansprouts10.jpg', 'beansprouts10.jpg');

-- =================================================================친환경 시금치 200g=====================================================================================
INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'apple11', '된장국', '된장국끓이기 딱좋은 양이에요. 싱싱합니다', 0, '2021-04-02', 'spinach1.jpg', 'spinach1.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'banana11', '양이별로 없네요?', '그래서 추가 구매 했어요ㅎㅎㅎㅎ', 0, '2021-04-02', 'spinach2.jpg', 'spinach2.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'orange11', '사이즈가 적당하고 딱 좋아요.', '마트보다 저렴한것 같아요. 사이즈도 딱 먹기 좋은 사이즈고 싱싱하고 좋아요.', 0, '2021-04-02', 'spinach3.jpg', 'spinach3.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'cherry11',  '좋아요', '크기도 적당하고 신선해요', 0, '2021-04-01', 'spinach4.jpg', 'spinach4.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'kiwi11', '친환경', '싱싱하고 좋아요 시킬때마다 재구매', 0, '2021-04-01', 'spinach5.jpg', 'spinach5.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'mango11', '싱싱', '시금치 싱싱하고 맛있어요~ 좋아요~', 0, '2021-03-31', 'spinach6.jpg', 'spinach6.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'melon11',  '오', '시금치 된장찌개 구우욷', 0, '2021-04-02', 'spinach7.jpg', 'spinach7.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'raisin11', '시금치 신선해요', '집채만들어먹었어요 맛있어요', 0, '2021-03-30', 'spinach8.jpg', 'spinach8.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'tomato11', '링', '싱싱해요 아기 반찬용으로 구매해요', 0, '2021-03-30', 'spinach9.jpg', 'spinach9.jpg');

INSERT INTO tb_review (rv_productidx, rv_userid, rv_title, rv_content, rv_helped, rv_regdate, rv_imgname, rv_imgpath) VALUES (3, 'watermelon11',  '굵은', '너무 굵은 시금치 ;;', 0, '2021-03-30', 'spinach10.jpg', 'spinach10.jpg');