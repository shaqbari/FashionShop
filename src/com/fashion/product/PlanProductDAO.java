package com.fashion.product;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class PlanProductDAO {
	FactoryManager manager=FactoryManager.getInstance();	
	
	//1�� ���
	public int insert(ArrayList<PlanProduct> list){
		int result=0;
		SqlSession session=manager.getSession();
		
		try {//�츮�� try catch�� ����� rollback ó������
			for(int i=0; i<list.size(); i++){
				PlanProduct planProduct=list.get(i);
				/*if(i==1){//�����ڰ� �Ϻη� ������ ������ �׽�Ʈ ����. throw�� �̿��Ѵ�.
					//cf) throws�� ȣ���ѻ������ ����ó���� �̷궧 ����Ѵ�. �����ڰ� �ƴ� �Ϲ��ε鿡�� ���� �޼����� ���� ȭ�鿡 �Ѹ��� ����Ѵ�.
					throw new Exception();//���⼭ ���� exception�� catch�� exception�� �ȴ�.
				}*/		
				result=session.insert("PlanProduct.insert", planProduct);
				//������ ���������� result�� 1�λ��·� catch�� ���� ������ catch���� result�� 0���� ����
			}
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			result=0;
		}
		
		//.commit();
		//select�� �����ϰ�� �� commit�� ������. ���� ����ġ�� �ùٸ��� ���� transaction�� for����ŭ ���������. for�� ������ commit����
		manager.closeSession(session);
		return result;
	}
	
	/*public void commit(){
		SqlSession session=manager.getSession();
		session.commit(); //�̼��ǿ����� ���� session�� commit�� �� �� ����.
		
	}*/
	
	public List selectJoin(int plan_id){
		List list=null;
		SqlSession session=manager.getSession();
		list=session.selectList("PlanProduct.selectJoin", plan_id);
		manager.closeSession(session);		
		return list;
	}
}
