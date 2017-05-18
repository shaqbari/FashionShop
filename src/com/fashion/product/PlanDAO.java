package com.fashion.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class PlanDAO {
	FactoryManager manager=FactoryManager.getInstance();
	
	public List selectAll(){
		List list=null;		
		SqlSession session=manager.getSession();
		list=session.selectList("Plan.selectAll");
		manager.closeSession(session);		
		return list;
	}
	
}
