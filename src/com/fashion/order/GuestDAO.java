package com.fashion.order;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class GuestDAO {
	FactoryManager manager =FactoryManager.getInstance();
	
	public int insert(Guest guest) {
		int guest_id=0;
		SqlSession session=manager.getSession();
		session.insert("Guest.insert", guest);
		guest_id=guest.getGuest_id();
		session.commit();
		manager.closeSession(session);		
		return guest_id;
	}
	
	//원래 테이블이 다르면 session을 하나만 만들어서 tranjection처리 해줘야 한다. 
}
