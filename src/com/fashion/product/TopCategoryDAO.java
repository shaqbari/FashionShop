package com.fashion.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class TopCategoryDAO {
	FactoryManager manager=FactoryManager.getInstance();
	
	//모든 레코드 가져오기
	public List selectAll(){
		List list=null;
		SqlSession session=manager.getSession();
		list=session.selectList("TopCategory.selectAll");
		manager.closeSession(session);
		return list;
	}
}
