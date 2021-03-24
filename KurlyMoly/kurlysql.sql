create database kurlymoly; 
use kurlymoly; 
-- test

 CREATE TABLE tb_member(
	mem_idx bigint auto_increment primary key,
	mem_userid varchar(20) unique not null,
	mem_userpw varchar(20) not null,
	mem_name varchar(20) not null,
	mem_hp varchar(13) not null,
	mem_email varchar(50),
	mem_hobby varchar(100),
	mem_ssn1 char(6) not null,
	mem_ssn2 char(7) not null,
	mem_zipcode char(5) not null,
	mem_address1 varchar(100),
	mem_address2 varchar(100),
	mem_address3 varchar(100),
	mem_regdate datetime default now()
);

select * from tb_member ;

-- test
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

CREATE TABLE tb_product(
	p_idx bigint auto_increment primary key,
	p_category1 varchar(10) not null, 
    p_category2 varchar(10) not null, 
    p_title varchar(100) not null, 
    p_subtitle varchar(100) not null, 
    p_brand varchar(20) not null, 
    p_price int not null,
    p_discprice int default 0, 
    p_point int default 0, 
    p_stock int not null default 100, 
    p_deliverytype varchar(10) not null, 
    p_packingtype varchar(10) not null,
    p_salesunit varchar(20) default null,
    p_weight varchar(20) default null,
    p_origin varchar(20) default null,
    p_mainimg varchar(200) not null,
    p_description text not null,
    p_salestate varchar(10) not null, 
    p_isdisplay varchar(10) not null,
    p_regdate datetime default now()
); 

select * from tb_product;
drop table tb_product; 


CREATE TABLE tb_pinquiry(
 piq_idx bigint auto_increment primary key,
 piq_prodidx bigint not null,
 piq_userid varchar(20) not null,
 piq_issecret varchar(5) not null, 
 piq_title varchar(100) not null,
 piq_content text not null,
 piq_inquirydate datetime default now(),
 piq_reply text default null, 
 piq_replydate datetime default null,
 piq_isreply varchar(5) not null
);

select * from tb_pinquiry;
drop table tb_pinquiry; 


CREATE TABLE tb_cinquiry(
 ciq_idx bigint auto_increment primary key,
 ciq_about varchar(10) not null,
 ciq_orderidx int not null,
 ciq_userid varchar(20) not null,
 ciq_title varchar(100) not null,
 ciq_content text not null,
 ciq_file varchar(200) not null,
 ciq_inquirydate datetime default now(),
 ciq_reply text default null, 
 ciq_replydate datetime default null,
 ciq_isreply varchar(5) not null
);

select * from tb_cinquiry;
drop table tb_cinquiry; 
