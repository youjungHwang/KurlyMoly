create database kurlymoly; 
use kurlymoly;  

-- 고객 1:1문의 목록 SQL Data
CREATE TABLE tb_cinquiry(
 ciq_idx bigint auto_increment primary key, -- 고객문의번호
 ciq_about varchar(10), -- 문의구분(배송지연 불만 / 컬리패스 (무료배송) / 반품문의 / A/S문의 / 환불문의 / 주문결제문의 / 회원벙보문의 / 취소문의 / 교환문의 / 상품정보문의 / 기타문의) 
 ciq_orderidx bigint, -- 주문번호
 ciq_userid varchar(20), -- 작성자ID
 ciq_title varchar(100), -- 제목
 ciq_content text, -- 내용
 ciq_filename varchar(200), -- 첨부파일이름 저장
 ciq_filepath varchar(200), -- 첨부파일 경로 저장 추가함 
 ciq_inquirydate datetime default now(), -- 문의일시
 ciq_reply text default null, -- 답변
 ciq_replydate datetime default null, -- 답변일시
 ciq_isreply varchar(5) -- 답변여부(미답변 / 답변완료)
);


select * from tb_cinquiry;
drop table tb_cinquiry; 
-- 리뷰테이블과 문의테이블 똑같은 상품으로 3개씩 10개 달기

-- 답변완료 목록
 -- ciq_orderidx :  1
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("교환문의", 1, "apple11", "교환문의~", "플라스틱 통에 넣으려고 뿌리 절단해서 보내던데저희집은 윗부분까지 다먹어서 절단안한제품은 없나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의하신 부분 절단 안한 제품은 현재로서는 없는 점 안내드립니다. 
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "banana11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "orange11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "papaya11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "berry11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "cherry11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "grape11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "grapefruit11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "guava11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "kiwi11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 1, "lime11", "제주 배송문의", "제주 지역에서도 마켓컬리를 이용할 수 있나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"안녕하세요. 마켓컬리입니다. 상품에 관심을 가지고 문의 주셔서 감사합니다. 저희 컬리를 이용해주셔서 너무나 감사드립니다. 
 죄송하게도 현재 제주도를 포함한 도서산간지역은 컬리가 배송을 진행하지 않고 있는점 안내드립니다. 보다 많은 곳에서 컬리 제품을 받아볼 수 있도록 노력하고 있으니 양해부탁드립니다.
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
 
 -- ciq_orderidx :  2
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "apple11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "banana11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "orange11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "avocado11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "berry11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "cherry11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "grape11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "grapefruit11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "guava11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");
 
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_reply, ciq_replydate, ciq_isreply)
VALUES("배송문의", 2, "kiwi11", "배송문의~", "제품 구매하면 샛별배송오나요 택배배송오나요??", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"Love food, Love life!
안녕하세요. 마켓컬리입니다.
문의 주신 상품은 샛별 배송/ 택배 배송 모두 가능 한 점 알려드리며
고객님 거주지 주소가 샛별배송 가능 지역일 경우 샛별배송으로 배송 드립니다.
언제나 마켓컬리를 이용해 주셔서 감사합니다. 
 답변드린 내용을 통해 궁금하신 사항이 해결 되셨길 바라며, 늘 신선하고 최상의 상품을 통해 풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.
 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다. 마켓컬리 드림.", "2021-03-19 15:00:29", "답변완료");

 
  -- 미답변 목록
INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "apricot11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "avocado11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "cherry11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "grape11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "grapefruit11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "guava11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "kiwi11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "lime11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 1, "mango11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "melon11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "orange11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "papaya11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "peach11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "pear11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "pineapple11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "plum11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "raisin11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "tomato11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("기타문의", 2, "watermelon11", "품절상품 문의", "품절된 OO 상품을 구입하고 싶습니다. 언제 입고되나요?", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "apple11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "banan11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "orange11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "berry11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "cherry11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "grape11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "grapefruit11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "guava11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "kiwi11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");

 INSERT INTO tb_cinquiry (ciq_about, ciq_orderidx, ciq_userid, ciq_title, ciq_content, ciq_filename, ciq_filepath, ciq_inquirydate, ciq_isreply)
VALUES("배송지연/불만", 3, "lime11", "오배송", "아니 새벽에 다른집으로 배송되서 정신이없었어요.주소확인잘하고 배송해주셔야죠", "none.png", "C:\KurlyMoly\cinquiryImages", "2021-03-19 03:00:29", 
"미답변");
