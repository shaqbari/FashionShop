package com.fashion.admin;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class AdminDAO {
	FactoryManager manager=FactoryManager.getInstance();
		
	//로그인 체크(레코드 1건 가져오기)
	//인자가 많지 않으면 dto가 아니어도 괜찮다. 인자가 하나만 가능하므로 dto로 가자 map을 만들어줘도 되지만 옛날방식, dto로 가자
	//public Admin select(String user_id, String password){
	public Admin select(Admin dto){
		Admin admin=null;
		SqlSession session=manager.getSession();
		admin=session.selectOne("Admin.select", dto);
		manager.closeSession(session);
		
		return admin;
	}
}
