create database kurlymoly; 
use kurlymoly;  

-- 상품 목록 SQL Data
CREATE TABLE tb_member(
	m_idx bigint auto_increment primary key, -- 회원번호 연번(자동생성)
	m_userid varchar(20), -- 회원ID
    m_password varchar(50), -- 비밀번호
    m_name varchar(20), -- 이름
    m_tel varchar(20), -- 전화번호
    m_email varchar(50), -- 이메일
    m_birth varchar(10) default null, -- 생년월일
    m_gender varchar(10), -- 성별
    m_zipcode varchar(200), -- 우편번호
    m_address1 varchar(200), -- 주소1
    m_address2	varchar(200), -- 주소2
    m_recomid varchar(20) default null, -- 추천인ID
    m_regdate datetime default now(), -- 회원가입일시
    m_membership varchar(10), -- 멤버십등급 
    m_kurlypass varchar(10), -- 컬리패스여부 (가입/비가입)
    m_state int, -- 회원상태(1: 일반, 2: 탈퇴, 9: 관리자)
    m_withdrawwhy varchar(20) default null, -- 불편사항선택 (고객서비스(상담, 포장 등) 불만 / 배송불만 / 교환 환불 판품 불만 / 방문 빈도가 낮음 / 상품가격 불만 / 개인 정보유출 우려 / 쇼핑몰의 실뢰도 불만 / 쇼핑 기능 불만)
    m_withdrawwhy2 text default null, -- 불편사항기타내용
	m_withdrawdate datetime default null -- 탈퇴일시
);

select * from tb_member;
drop table tb_member; 


-- 회원가입 member
INSERT INTO tb_member (m_userid, m_password, m_name, m_tel, m_email, m_birth, m_gender, m_zipcode, m_address1, m_address2, 
m_recomid, m_membership, m_kurlypass, m_state, m_withdrawwhy, m_withdrawwhy2, m_withdrawdate) 
VALUES("apple11", "aassddff11!", "김사과", "010-1111-1111", "apple@apple.com", "2020-04-01", "여자", "06236", "서울시 강남구 테헤란로 146", "현익빌딩 3층",
"qqwwee11", "프렌즈", "가입", 1, "없음", "없음", "2021-00-00 00:00:00");

INSERT INTO tb_member (m_userid, m_password, m_name, m_tel, m_email, m_birth, m_gender, m_zipcode, m_address1, m_address2, 
m_recomid, m_membership, m_kurlypass, m_state, m_withdrawwhy, m_withdrawwhy2, m_withdrawdate) 
VALUES("banana11", "aassddff11!", "반하나", "010-1111-1111", "banana@banana.com", "2020-04-04", "여자", "06236", "서울시 강남구 테헤란로 146", "현익빌딩 3층",
"qqwwee11", "프렌즈", "가입", 1, "없음", "없음", "2021-00-00 00:00:00");

INSERT INTO tb_member (m_userid, m_password, m_name, m_tel, m_email, m_birth, m_gender, m_zipcode, m_address1, m_address2, 
m_recomid, m_membership, m_kurlypass, m_state, m_withdrawwhy, m_withdrawwhy2, m_withdrawdate) 
VALUES("orange11", "aassddff11!", "오렌지", "010-1111-1111", "orange@orange.com", "2020-04-14", "남자", "06236", "서울시 강남구 테헤란로 146", "현익빌딩 3층",
"qqwwee11", "프렌즈", "가입", 1, "없음", "없음", "2021-00-00 00:00:00");


-- 관리자
INSERT INTO tb_member (m_userid, m_password, m_name, m_tel, m_email, m_gender, m_zipcode, m_address1, m_address2, 
m_membership, m_kurlypass, m_state) 
VALUES("admin", "1234", "관리자", "010-9999-9999", "admin@admin.com", "남자", "06236", "서울시 강남구 테헤란로 146", "현익빌딩 3층",
"관리자", "비가입", 9);







