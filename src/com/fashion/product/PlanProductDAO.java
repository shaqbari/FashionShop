package com.fashion.product;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.FactoryManager;

public class PlanProductDAO {
	FactoryManager manager=FactoryManager.getInstance();	
	
	//1건 등록
	public int insert(ArrayList<PlanProduct> list){
		int result=0;
		SqlSession session=manager.getSession();
		
		try {//우리가 try catch를 만들어 rollback 처리하자
			for(int i=0; i<list.size(); i++){
				PlanProduct planProduct=list.get(i);
				/*if(i==1){//개발자가 일부러 에러를 일으켜 테스트 보자. throw를 이용한다.
					//cf) throws는 호출한사람에게 예외처리를 미룰때 사용한다. 개발자가 아닌 일반인들에게 예외 메세지를 직접 화면에 뿌릴때 사용한다.
					throw new Exception();//여기서 만든 exception이 catch의 exception이 된다.
				}*/		
				result=session.insert("PlanProduct.insert", planProduct);
				//위에서 에러가나면 result는 1인상태로 catch로 들어가기 때문에 catch에서 result를 0으로 두자
			}
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			result=0;
		}
		
		//.commit();
		//select를 제외하고는 꼭 commit을 해주자. 원래 이위치는 올바르지 않음 transaction이 for문만큼 만들어진다. for문 끝내고 commit하자
		manager.closeSession(session);
		return result;
	}
	
	/*public void commit(){
		SqlSession session=manager.getSession();
		session.commit(); //이세션에서는 위의 session의 commit를 할 수 없다.
		
	}*/
	
	public List selectJoin(int plan_id){
		List list=null;
		SqlSession session=manager.getSession();
		list=session.selectList("PlanProduct.selectJoin", plan_id);
		manager.closeSession(session);		
		return list;
	}
}
