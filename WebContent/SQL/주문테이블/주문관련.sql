select * from product

sp_help product

/*-----------------------------------------------
�ֹ� ���� ���̺�
1.�ֹ��� ���� 
2.����� ����
3.�ֹ�����
-----------------------------------------------*/

--�ֹ� ���� ���̺�
/*
������
�ֹ��ڵ� 
�ֹ���ǰ�ڵ�
�ֹ�����
�ѱ��űݾ�

�������
�Ա�����
�Ա����̸�
���������

�Ա��Ѿ�(��ۺ�����)

�ֹ���
��۽� ���� �޼���
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


--�ֹ��� ���̺� 
/*
�ֹ��ڵ�
�ֹ��� 
����ó
�޴���ȭ
�����ȣ1
�����ȣ2
�ּ�1
�ּ�2
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
--����� ���̺� 
/*
�ֹ��ڵ�
��۹޴� �� 
����ó
�޴���ȭ
�����ȣ1
�����ȣ2
�ּ�1
�ּ�2

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