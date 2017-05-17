package com.fashion.product;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class ProductDAO {
	FactoryManager manager=FactoryManager.getInstance();
	
	public int insert(Product dto){
		//int result=0;
		int product_id=0;
		SqlSession session=manager.getSession();		
		session.insert("Product.insert", dto);//아직 product_id는 안채워졌다.
		product_id=dto.getProduct_id();//성공한 이후 product_id를 받을 수 있다.
		session.commit(); //DML의 경우
		manager.closeSession(session);
		return product_id;
	}
}
