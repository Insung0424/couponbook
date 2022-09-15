-- ----------------------------------------- 팀 프로젝트 테이블 : 거래내역
select * from pj_trade_test 
		where pd_status = 1 
		and trade_time between to_char( to_date('22/08/20')-7, 'YY/MM/DD')  
		and to_char(to_date('22/08/20'), 'YY/MM/DD') 
		order by trade_time;


-- 거래내역 전체 목록 가져오기
    
select t.product_id, t.sell_user_id, u.nickname, t.pd_status, t.trade_time
from pj_trade_test t, pj_user u
where pd_status = 1 
and trade_time >= to_char(SYSDATE-3, 'YY/MM/DD')
and t.buyer_user_id = u.user_id
order by trade_time;

select ROWNUM, t.product_id, t.sell_user_id, u.nickname, t.pd_status, t.trade_time
		from pj_trade_test t, pj_user u
		where trade_time >= to_char(SYSDATE-3, 'YY/MM/DD')  
		and t.buyer_user_id = u.user_id
		order by trade_time;

-- 사용쿼리
select ROWNUM, product_id, sell_user_id, buyer_user_id, pd_status, trade_time
		from pj_trade_test 
    where pd_status = 1 
    and trade_time >= to_char(SYSDATE-5, 'YY/MM/DD')
		order by trade_time;

-- 페이징을 위한 처리
select 
    product_id, sell_user_id, buyer_user_id, pd_status, trade_time 
  from 
    (
    select ROWNUM rn, product_id, sell_user_id, buyer_user_id, pd_status, trade_time 
    from pj_trade_test  
    where rownum <= 20
    )
where rn > 10;


-- 검색용 쿼리
select  * 
  from 
    (
    select ROWNUM rn, product_id, sell_user_id, buyer_user_id, pd_status, trade_time
    from pj_trade_test  
    where  trade_time between '220801' and '220802' 
      and rownum <= 20 
    )
where rn > 10;


-- 거래내역 전체 개수 
select count(*) from pj_trade_test where product_id is not null;

select count(*) from pj_trade_test 
		where trade_time between '220801' and '220802' 
		and product_id is not null;


-- REFERENCES 없이 생성, 테스트
select * from pj_trade_test;
-- TRUNCATE TABLE pj_trade;

-- 최근 1주일 거래내역
select * from pj_trade_test
where pd_status = 1 
and trade_time >= to_char(SYSDATE-7, 'YY/MM/DD')
order by trade_time;

-- 지정 날짜부터 1주일 거래내역 to_date
select trade_time, count(*) from pj_trade_test
where pd_status = 1 
and trade_time between to_char( to_date('22/08/08')-7, 'YY/MM/DD') 
and to_char(to_date('22/08/08'), 'YY/MM/DD')
group by trade_time
order by trade_time;

select sysdate-30 from dual;

select * from pj_trade_test order by trade_time;

select * from pj_trade_test 
		where  
		trade_time between to_date('22/08/08') and to_date('22/08/12')
		and pd_status = 1 
		order by trade_time;


-- UPDATE pj_trade_test SET trade_time ='2022-08-31'  where trade_time ='2022-08-08';

-- 테스트용 시퀀스
create SEQUENCE seq_trade_pdtId_test
  increment by 1
  start with 1
  minvalue 1;

create table pj_trade_test(
  product_id number not null,
  sell_user_id number not null,
  buyer_user_id number not null,
  pd_status NUMBER,
  trade_time date
);

-- 데이터 입력: 상품id, 판매자id, 구매자id, 거래상태(1:완료), 거래일자
/*  INSERT INTO pj_trade_test VALUES (seq_trade_pdtId_test.nextval, 1, 2, 1, '2022-08-01');
    INSERT INTO pj_trade_test VALUES (seq_trade_pdtId_test.nextval, 1, 2, 1, '2022-08-02');
    INSERT INTO pj_trade_test VALUES (seq_trade_pdtId_test.nextval, 1, 2, 1, '2022-08-03');
    INSERT INTO pj_trade_test VALUES (seq_trade_pdtId_test.nextval, 4, 1, 1, '2022-08-04');
    INSERT INTO pj_trade_test VALUES (seq_trade_pdtId_test.nextval, 4, 1, 1, '2022-08-05');
    INSERT INTO pj_trade_test VALUES (seq_trade_pdtId_test.nextval, 2, 1, 1, '2022-08-06');
  INSERT INTO pj_trade_test VALUES (seq_trade_pdtId_test.nextval, 3, 1, 1, '2022-08-07');
;*/
-- 여기까지 데이터 입력

commit;


-- ----------------------------------------- 팀 프로젝트 테이블 : 상품 테이블
-- 테스트용 시퀀스
create SEQUENCE seq_pdtId_test
  increment by 1
  start with 1
  minvalue 1;

-- 카테고리 references 없이 생성, 테스트 함 
create table pj_Product(
  product_id number constraint product_id2_pk primary key,
  category_id number not null,
  company_name varchar2(30) not null,
  pd_name varchar2(30) not null,
  pd_price varchar2(30) not null,
  pd_status number default 1,
  pd_img varchar2(50),
  pd_desc varchar2(500),
  location_id number,
  pd_discount number,
  pd_date date
);

select * from pj_Product;
-- select * from pj_Product_test;
INSERT INTO pj_Product VALUES (seq_pdtId_test.nextval, 1, '회사1', '쿠폰1', '20000', 1, 'img1', '중구 이마트', '111', '10', '2022-09-01');
INSERT INTO pj_Product VALUES (seq_pdtId_test.nextval, 2, '회사2', '쿠폰2', '25000', 1, 'img1', '부산 교대 스타벅스', '111', '20', '2022-09-01');
INSERT INTO pj_Product VALUES (seq_pdtId_test.nextval, 3, '회사3', '쿠폰3', '10000', 1, 'img1', '강남 cgv', '111', '15', '2022-09-02');
INSERT INTO pj_Product VALUES (seq_pdtId_test.nextval, 4, '회사4', '쿠폰4', '55000', 1, 'img1', '금천구 뚜레쥬르', '111', '50', '2022-09-03');
INSERT INTO pj_Product VALUES (seq_pdtId_test.nextval, 1, '회사5', '쿠폰5', '30000', 1, 'img1', '성심당본점', '111', '10', '2022-09-05');

select 
  product_id, category_id, company_name, pd_name, pd_price, pd_status, pd_desc, pd_discount, pd_date
from pj_Product;



-- -------------------------------------------------- 팀 프로젝트 테이블 : 댓글
create table pj_comment(
  product_id number not null REFERENCES pj_Product(product_id),
  user_id number not null REFERENCES pj_user(user_id),
  comment_content varchar2(500),
  comment_write_time date not null
);

select * from pj_comment;

INSERT INTO pj_comment VALUES (21, 1, '코멘트1', '2022-09-01');
INSERT INTO pj_comment VALUES (21, 2, '코멘트11', '2022-09-01');
INSERT INTO pj_comment VALUES (22, 3, '코멘트21', '2022-09-02');
INSERT INTO pj_comment VALUES (22, 4, '코멘트22', '2022-09-01');
INSERT INTO pj_comment VALUES (22, 5, '코멘트23', '2022-09-03');
INSERT INTO pj_comment VALUES (23, 6, '코멘트31', '2022-09-05');
INSERT INTO pj_comment VALUES (24, 1, '코멘트41', '2022-09-04');
INSERT INTO pj_comment VALUES (25, 141, '코멘트51', '2022-09-06');
INSERT INTO pj_comment VALUES (25, 161, '코멘트52', '2022-09-07');



-- ----------------------------------------- 팀 프로젝트 테이블 : 사용자
create table pj_user(
  user_id number constraint user_id_pk primary key,
  email varchar2(50) not null,
  nickname varchar2(20) not null,
  password varchar2(50),
  user_name varchar2(50),
  phone varchar2(20),
  addr varchar2(50),
  user_grade number DEFAULT 1,
  zip_no varchar(10),
  addr2 varchar(50)
);

-- 시퀀스 생성
create SEQUENCE seq_user_id
increment by 1
start with 1
minvalue 1;

-- 관리자 아이디 삽입
insert into pj_user(user_id, email, nickname, password, user_name, phone, addr, user_grade) 
values (seq_user_id.nextval, 'admin1@naver.com', '관리자1', '1111', '김관리', '010-1000-1000', '서울시 중구', 2);


insert into pj_user(user_id, email, nickname, password, user_name, phone, addr, user_grade) 
values (seq_user_id.nextval, 'admin22@naver.com', '관리자2', '1111', '최관리자', '010-2200-2200', '부산시 동래구', 2);

-- 테스트 유저 삽입: user_id 시퀀스 미적용 해서 등록했음
insert into pj_user(user_id, email, nickname, password, user_name, phone, addr) 
values (4, '1111@naver.com', '테스트유저1', '1111', '오테스', '010-0001-0001', '서울시 용산구');

insert into pj_user(user_id, email, nickname, password, user_name, phone, addr) 
values (5, 'test55@naver.com', '홍익한', '1111', '홍익한', '010-0055-0033', '부산시 중구');
insert into pj_user(user_id, email, nickname, password, user_name, phone, addr) 
values (6, 'test66@naver.com', '전봉준', '1111', '전봉준', '010-0066-0044', '제주시 동구');
insert into pj_user(user_id, email, nickname, password, user_name, phone, addr) 
values (7, 'test77@naver.com', '김옥균', '1111', '김옥균', '010-0077-0044', '광주시 중구');

-- 전체 목록 출력 쿼리
select 
			user_id, email, nickname, password, user_name, phone, addr, user_grade  
		from
			(
			select ROWNUM rn,  user_id, email, nickname, password, user_name, phone, addr, user_grade 
			from pj_user
			where rownum <= 20 
			) 
		where rn > 10; 

-- 검색용 쿼리 : 이름, 닉네임, 이메일, 전화번호
select  * 
  from 
    (
    select ROWNUM rn, user_id, email, nickname, password, user_name, phone, addr, user_grade
    from pj_user  
    where 
      ( nickname like '%관리%' or  user_name like '%관리%' or email like '%관리%' )
      and rownum <= 20 
    )
where rn > 10;

select  *
  from 
    (
    select ROWNUM rn, user_id, email, nickname, password, user_name, phone, addr, user_grade
    from pj_user  
    where ( nickname like '%관리%' or  user_name like '%관리%' )
    );


COMMIT;
-- 테스트 쿼리문
select * from pj_user;
select seq_user_id.nextval from dual;
-- alter table pj_user add zip_no varchar(10);
-- delete from pj_user where user_id = 129;
-- UPDATE pj_user SET email ='test22@naver.com'  where user_id=24;
-- select * from pj_user where user_id = 1 and password = 1111; 
-- select * from pj_user where email = 'test1@naver.com' and password = '1111';
select count(*) from pj_user where email='test1@naver.com';
SELECT COUNT(email) FROM pj_user WHERE email='test1@naver.com';

select count(*) from pj_user where email is not null;


-- ----------------------------------------------------------------- 카카오 로그인
create sequence seq_kakao;

create table kakao_table (
    k_number number(10,0),
    k_name varchar2(20) not null,
    k_email varchar2(100) not null
);

alter table kakao_table add constraint kakao_board 
primary key (k_number);

select * from kakao_table;

insert into kakao_table(k_number, k_name, k_email)
values (seq_kakao.nextval, 'testUser1', 'testUser1@naver.com');


-- ------------------------------------------------------------------------

-- 로그인 연습용 테이블
-- user_id : 인덱스 역할을 한다. 
-- 일반 로그인 일때는 시퀀스로 증가, 카카오 로그인 일때는 "id" 값을 저장한다
-- 중복 확인은 이메일을 통해서 확인한다
create table ex1_User(
  user_id number,
  email	Varchar2(50) not null,
  nickname Varchar2(50) not null,
  password	Varchar2(50),
  user_name	Varchar2(50),
  phone	Varchar2(20),
  addr	Varchar2(50),
  user_grade Number not null
);
-- pk설정
alter table ex1_User add constraint pk_ex1User 
primary key (user_id);

-- 시퀀스 생성
create sequence seq_ex1_User;
select seq_ex1_User.nextval from dual;
-- drop sequence seq_ex1_User;
select seq_ex1_User.currval from dual;

select * from ex1_User;
select * from ex1_User where user_id = 2;

-- insert into ex1_User(user_id, email, nickname, password, user_name, phone, addr, user_grade) values (...);
-- UPDATE ex1_User SET user_id = 1 where user_id=3;

