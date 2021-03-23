use jspstudy; 

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
