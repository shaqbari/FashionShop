package com.fashion.order;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class CustomerDAO {
	FactoryManager manager =FactoryManager.getInstance();
	
	public int insert(Customer customer) {
		int customer_id=0;
		SqlSession session=manager.getSession();
		session.insert("Customer.insert", customer);
		customer_id=customer.getCustomer_id();
		session.commit();
		manager.closeSession(session);		
		return customer_id;
	}
}
