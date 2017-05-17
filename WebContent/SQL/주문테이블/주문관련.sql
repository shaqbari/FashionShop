select * from product

sp_help product

/*-----------------------------------------------
주문 관련 테이블
1.주문자 정보 
2.배송자 정보
3.주문내역
-----------------------------------------------*/

--주문 내역 테이블
/*
고유값
주문코드 
주문상품코드
주문갯수
총구매금액

결제방법
입금은행
입금자이름
사용적립금

입금총액(배송비포함)

주문일
배송시 남길 메세지
*/
create table orderList(
idx int identity
,order_code int 
,product_code int
,ea int
,totalprice int
,settlement int
,paymethod varchar(15)
,bank varchar(20)
,remitter varchar(20)
,usepoint int
,orderday smalldatetime default getdate()
,msg varchar(50)
)
sp_help orderList
select * from orderList


--주문자 테이블 
/*
주문코드
주문자 
연락처
휴대전화
우편번호1
우편번호2
주소1
주소2
*/
create table customer(
idx int identity
,customer_code int 
,customer_name varchar(20)
,customer_phone1 varchar(4)
,customer_phone2 varchar(4)
,customer_phone3 varchar(4)
,customer_pcs1 varchar(4)
,customer_pcs2 varchar(4)
,customer_pcs3 varchar(4)
,customer_post1 char(3)
,customer_post2 char(3)
,customer_addr1 varchar(50)
,customer_addr2 varchar(50)
)
--배송자 테이블 
/*
주문코드
배송받는 자 
연락처
휴대전화
우편번호1
우편번호2
주소1
주소2

*/
create table receiver(
idx int identity
,receiver_code int 
,receiver_name varchar(20)
,receiver_phone1 varchar(4)
,receiver_phone2 varchar(4)
,receiver_phone3 varchar(4)
,receiver_pcs1 varchar(4)
,receiver_pcs2 varchar(4)
,receiver_pcs3 varchar(4)
,receiver_post1 char(3)
,receiver_post2 char(3)
,receiver_addr1 varchar(50)
,receiver_addr2 varchar(50)
)