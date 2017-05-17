package com.fashion.admin;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class AdminDAO {
	FactoryManager manager=FactoryManager.getInstance();
		
	//�α��� üũ(���ڵ� 1�� ��������)
	//���ڰ� ���� ������ dto�� �ƴϾ ������. ���ڰ� �ϳ��� �����ϹǷ� dto�� ���� map�� ������൵ ������ �������, dto�� ����
	//public Admin select(String user_id, String password){
	public Admin select(Admin dto){
		Admin admin=null;
		SqlSession session=manager.getSession();
		admin=session.selectOne("Admin.select", dto);
		manager.closeSession(session);
		
		return admin;
	}
}
