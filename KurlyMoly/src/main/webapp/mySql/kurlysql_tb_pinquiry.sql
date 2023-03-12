create database kurlymoly;
use kurlymoly;

-- 상품문의 목록 SQL Data 
create table tb_pinquiry (
	piq_idx bigint auto_increment primary key, -- 상품문의번호
    piq_prodidx bigint not null, -- 상품번호
    piq_userid varchar(20), -- 작성자 ID
    piq_issecret varchar(5), -- 비밀글여부(일반/비밀)
    piq_title varchar(100), -- 제목
    piq_content text, -- 내용
    piq_inquirydate datetime default now(), -- 문의일시
    piq_reply text default null, -- 답변
    piq_replydate datetime default null, -- 답변일시
    piq_isreply varchar(5) -- 답변여부(미답변/답변완료)
);

select * from tb_pinquiry;
select * from tb_pinquiry WHERE piq_prodidx = 1;
drop table tb_pinquiry;

-- =================================================================무농약 브로콜리2종=====================================================================================
INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'apple11', 
'일반', '브로콜리만 없어요', '브로콜리만 없네요?어떻게 된건지 확인부탁드립니다', '2021-02-26', '죄송스럽지만 해당 내용은 고객센터로 문의 주시면 감사하겠습니다.', '2021-02-26', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'banana11', 
'비밀', '배송누락', '배송이 계속 누락되네요..확인 부탁드립니다', '2020-11-21', '안녕하세요. 마켓컬리입니다. 믿고 찾아주신 상품에 불편을 드려 정말 죄송합니다. 고객님의 불편하셨던 사항은 유선으로 안내 받으신 점 확인하였습니다. 불편을 드려 정말 죄송할 따름이며, 
고객님께 늘 신선하고 최상의 상품을 불편 없이 전달드리기 위해 최선을 다하는 컬리가 되겠습니다 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다.', '2020-11-23', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'orange11', 
'일반', '문의에 사진은 못올리나요 썩은거 보상해주나요', '절차가 뭐죠?이정도로 계속 썩은게 나오면 구매자는 그냥 받고 버리고 그러고 끝인가요?', '2020-12-24', '우선 쇼핑에 불편을 드려 대단히 죄송합니다. 고객님께서 문의주신 내용은 유선상담을 통해 처리 도움드린점 확인하였습니다.', '2021-01-20', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'plum11', 
'일반', '가격이?', '브로콜리가격 오류인가요? 아니면 가격이 오른건가요?', '2020-09-22', '관심을 가지고 문의 주셔서 감사합니다. 문의 주신 상품의 경우, 긴 장마와 태풍으로 인해 전반적인 채소류의 가격 폭등으로 인하여 가격이 인상된 점 양해부탁드립니다.', '2020-10-16', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'pineapple11', 
'일반', '무농약 인증마크 붙어 있나요?', 'ㅇㅇ', '2020-09-13', '안녕하세요. 마켓컬리입니다. 네 패키지에 무농약 인증마크 붙어있으며, 인증번호도 함께 기재되어 있어 번호로 조회 가능한 점 답변드립니다.', '2020-09-28', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'pear11', 
'비밀', '이거 먹어도 되는건지 봐주세요:)', '이거 먹어도 될까요?', '2020-08-16', '남겨주신 사진과 문의만으로 확인 시에는 해당 상품의 거뭇한 부분은 흙자국으로 판단이 됩니다. 다만, 해당 상품의 껍질을 벗겨 주신 후에도 거뭇한 자국이 
지속 남아 있을 경우 사진과 함께 1:1문의게시판 또는 카카오톡 채팅 상담으로 문의주시면 담당부서에 전달 드리어 정확한 확인 도움 드리겠습니다.', '2020-08-17', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'peach11', 
'비밀', '이럴 수 가..', '상품의 상태가..?', '2020-08-01', '고객님께 보내드리는 포장 과정 중 실수가 있었던 것으로 확인됩니다. 남겨주신 문의 확인 후 해당 상품은 요청해주신대로 금일 재배송 접수 도와드린 점 안내드립니다.', '2020-08-03', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'papaya11', 
'일반', '원산지가 어딘지 궁금합니다', '~!', '2021-02-26', '문의하신 상품 정확히 고객님께 어떤 국내 산지의 상품이 배송될지는 말씀드리기 어려우나 컬리에서는 3개의 협력사로 부터 브로콜리를 받고 있으며, 3개이상의 산지를 갖고 있습니다.', '2020-04-27', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'orange11', 
'비밀', '다른상품이 왔어요', '상품이 다른게 왔습니다..', '2020-04-26', '저희 컬리를 이용하심에 있어 큰 불편을 드린 점 사과말씀 드립니다. 다행히도 신속히 문의 주시어 안내 받으신 부분 확인하였습니다. 
고객님의 소중한 제보는 담당 부서 및 공급사로 전달 드리었으며 차후 보다 만족스러운 상품과 서비스로 보답드릴 수 있도록 최선을 다하는 컬리가 되겠습니다.', '2021-05-02', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (1, 'melon11', 
'일반', '세척법', '세척법이 궁금합니다!', '2021-02-23', '해당 상품 흐른는 물에 깨끗이 세척 후 섭취 부탁드립니다.', '2021-02-26', '답변완료');

-- =================================================================국산콩 무농약 콩나물 300g=====================================================================================
INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'apple11', 
'일반', '콩나물만 없어요', '콩나물만 없네요?어떻게 된건지 확인부탁드립니다', '2021-02-26', '죄송스럽지만 해당 내용은 고객센터로 문의 주시면 감사하겠습니다.', '2021-02-26', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'banana11', 
'비밀', '배송누락', '배송이 계속 누락되네요..확인 부탁드립니다', '2020-11-21', '안녕하세요. 마켓컬리입니다. 믿고 찾아주신 상품에 불편을 드려 정말 죄송합니다. 고객님의 불편하셨던 사항은 유선으로 안내 받으신 점 확인하였습니다. 불편을 드려 정말 죄송할 따름이며, 
고객님께 늘 신선하고 최상의 상품을 불편 없이 전달드리기 위해 최선을 다하는 컬리가 되겠습니다 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다.', '2020-11-23', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'orange11', 
'일반', '문의에 사진은 못올리나요 썩은거 보상해주나요', '절차가 뭐죠?이정도로 계속 썩은게 나오면 구매자는 그냥 받고 버리고 그러고 끝인가요?', '2020-12-24', '우선 쇼핑에 불편을 드려 대단히 죄송합니다. 고객님께서 문의주신 내용은 유선상담을 통해 처리 도움드린점 확인하였습니다.', '2021-01-20', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'plum11', 
'일반', '가격이?', '가격 오류인가요?? 가격이 갑자기좀 올랐네요', '2020-09-22', '관심을 가지고 문의 주셔서 감사합니다. 문의 주신 상품의 경우, 긴 장마와 태풍으로 인해 전반적인 채소류의 가격 폭등으로 인하여 가격이 인상된 점 양해부탁드립니다.', '2020-10-16', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'pineapple11', 
'일반', '무농약 인증마크 붙어 있나요?', 'ㅇㅇ', '2020-09-13', '안녕하세요. 마켓컬리입니다. 네 패키지에 무농약 인증마크 붙어있으며, 인증번호도 함께 기재되어 있어 번호로 조회 가능한 점 답변드립니다.', '2020-09-28', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'pear11', 
'비밀', '이거 먹어도 되는건지 봐주세요:)', '이거 먹어도 될까요?', '2020-08-16', '남겨주신 사진과 문의만으로 확인 시에는 해당 상품의 거뭇한 부분은 흙자국으로 판단이 됩니다. 다만, 해당 상품의 껍질을 벗겨 주신 후에도 거뭇한 자국이 
지속 남아 있을 경우 사진과 함께 1:1문의게시판 또는 카카오톡 채팅 상담으로 문의주시면 담당부서에 전달 드리어 정확한 확인 도움 드리겠습니다.', '2020-08-17', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'peach11', 
'비밀', '이럴 수 가..', '상품의 상태가..?', '2020-08-01', '고객님께 보내드리는 포장 과정 중 실수가 있었던 것으로 확인됩니다. 남겨주신 문의 확인 후 해당 상품은 요청해주신대로 금일 재배송 접수 도와드린 점 안내드립니다.', '2020-08-03', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'papaya11', 
'일반', '원산지가 어딘지 궁금합니다', '~!', '2021-02-26', '문의하신 상품 정확히 고객님께 어떤 국내 산지의 상품이 배송될지는 말씀드리기 어려우나 컬리에서는 3개의 협력사로 부터 배를 받고 있으며, 3개이상의 산지를 갖고 있습니다.', '2020-04-27', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'orange11', 
'비밀', '다른상품이 왔어요', '상품이 다른게 왔습니다..', '2020-04-26', '저희 컬리를 이용하심에 있어 큰 불편을 드린 점 사과말씀 드립니다. 다행히도 신속히 문의 주시어 안내 받으신 부분 확인하였습니다. 
고객님의 소중한 제보는 담당 부서 및 공급사로 전달 드리었으며 차후 보다 만족스러운 상품과 서비스로 보답드릴 수 있도록 최선을 다하는 컬리가 되겠습니다.', '2021-05-02', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (2, 'melon11', 
'일반', '재입고 문의', '재입고 언제쯤 될까요 ?ㅠㅠ', '2021-02-23', '문의주신 상품은 현재 협력사와 입고 협의중임에 따라, 정확한 재입고일을 말씀드리기 어려운 부분 양해 부탁드립니다.', '2021-02-26', '답변완료');

-- =================================================================친환경 시금치 200g=====================================================================================
INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'apple11', 
'일반', '시금치가 없어요', '시금치만 없네요?어떻게 된건지 확인부탁드립니다', '2021-02-26', '죄송스럽지만 해당 내용은 고객센터로 문의 주시면 감사하겠습니다.', '2021-02-26', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'banana11', 
'비밀', '배송누락', '배송이 계속 누락되네요..확인 부탁드립니다', '2020-11-21', '안녕하세요. 마켓컬리입니다. 믿고 찾아주신 상품에 불편을 드려 정말 죄송합니다. 고객님의 불편하셨던 사항은 유선으로 안내 받으신 점 확인하였습니다. 불편을 드려 정말 죄송할 따름이며, 
고객님께 늘 신선하고 최상의 상품을 불편 없이 전달드리기 위해 최선을 다하는 컬리가 되겠습니다 혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우 언제든 컬리 고객센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다.', '2020-11-23', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'orange11', 
'일반', '문의에 사진은 못올리나요 썩은거 보상해주나요', '절차가 뭐죠?이정도로 계속 썩은게 나오면 구매자는 그냥 받고 버리고 그러고 끝인가요?', '2020-12-24', '우선 쇼핑에 불편을 드려 대단히 죄송합니다. 고객님께서 문의주신 내용은 유선상담을 통해 처리 도움드린점 확인하였습니다.', '2021-01-20', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'plum11', 
'일반', '가격이?', '연어 가격 오류인가요?? 아니면 오른건가요?', '2020-09-22', '관심을 가지고 문의 주셔서 감사합니다. 문의 주신 상품의 경우, 요즘 환경문제가 심각한지라.. 가격이 인상된 점 양해부탁드립니다.', '2020-10-16', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'pineapple11', 
'일반', '무농약 인증마크 붙어 있나요?', 'ㅇㅇ', '2020-09-13', '안녕하세요. 마켓컬리입니다. 네 패키지에 무농약 인증마크 붙어있으며, 인증번호도 함께 기재되어 있어 번호로 조회 가능한 점 답변드립니다.', '2020-09-28', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'pear11', 
'비밀', '이거 먹어도 되는건지 봐주세요:)', '이거 먹어도 될까요?', '2020-08-16', '색깔은 보기에는 멀쩡해 보이므로 먹으셔도 무관할거같습니다.', '2020-08-17', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'peach11', 
'비밀', '이럴 수 가..', '상품의 상태가..?', '2020-08-01', '고객님께 보내드리는 포장 과정 중 실수가 있었던 것으로 확인됩니다. 남겨주신 문의 확인 후 해당 상품은 요청해주신대로 금일 재배송 접수 도와드린 점 안내드립니다.', '2020-08-03', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'papaya11', 
'일반', '원산지가 어딘지 궁금합니다', '~!', '2021-02-26', '문의하신 상품 정확히 고객님께 어떤 국내 산지의 상품이 배송될지는 말씀드리기 어려우나 컬리에서는 3개의 협력사로 부터 시금치를 받고 있으며, 3개이상의 산지를 갖고 있습니다.', '2020-04-27', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'orange11', 
'비밀', '다른상품이 왔어요', '상품이 다른게 왔습니다..', '2020-04-26', '저희 컬리를 이용하심에 있어 큰 불편을 드린 점 사과말씀 드립니다. 다행히도 신속히 문의 주시어 안내 받으신 부분 확인하였습니다. 
고객님의 소중한 제보는 담당 부서 및 공급사로 전달 드리었으며 차후 보다 만족스러운 상품과 서비스로 보답드릴 수 있도록 최선을 다하는 컬리가 되겠습니다.', '2021-05-02', '답변완료');

INSERT INTO tb_pinquiry (piq_prodidx, piq_userid, piq_issecret, piq_title, piq_content, piq_inquirydate, piq_reply, piq_replydate, piq_isreply) VALUES (3, 'melon11', 
'일반', '세척법', '세척법이 궁금합니다!', '2021-02-23', '해당 상품 흐른는 물에 깨끗이 세척 후 섭취 부탁드립니다.', '2021-02-26', '답변완료');