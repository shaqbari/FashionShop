package com.fashion.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class ProductDAO {
	FactoryManager manager=FactoryManager.getInstance();
	
	public int insert(Product dto){
		//int result=0;
		int product_id=0;
		SqlSession session=manager.getSession();		
		session.insert("Product.insert", dto);//���� product_id�� ��ä������.
		product_id=dto.getProduct_id();//������ ���� product_id�� ���� �� �ִ�.
		session.commit(); //DML�� ���
		manager.closeSession(session);
		return product_id;
	}
	
	//��� ��ǰ ��������
	public List selectAll(){
		List list=null;
		SqlSession session=manager.getSession();
		list=session.selectList("Product.selectAll");
		manager.closeSession(session);	
		return list;
	}
}
