package com.fashion.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class SubCategoryDAO {
	FactoryManager manager=FactoryManager.getInstance();
	
	//��� ���ڵ� ��������
	public List select(int top_id){
		List list=null;
		SqlSession session=manager.getSession();
		list=session.selectList("SubCategory.select", top_id);
		manager.closeSession(session);
		return list;
	}
}
