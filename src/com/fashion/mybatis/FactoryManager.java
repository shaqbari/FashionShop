package com.fashion.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * @author user1
 *Mybatis에서 쿼리문을 실행하기 위해서는 SqlSession이 필요한데, 이 SqlSession을
 *얻기 위해서는 먼저 SqlSessionFactory 객체가 필요하며, 이 Factory를 얻기 위해서는
 *환경설정 xml을 스트림을 이용하여 읽어야 한다.
 *따라서 이 복잡한 코드를 DAO에 일일이 작성하지 않기 위해 이 공통 클래스를 정의하도록 한다.
 */
public class FactoryManager {
	private static FactoryManager instance;
	private SqlSessionFactory sqlSessionFactory;
	
	private FactoryManager() {
		String resource = "com/fashion/mybatis/config.xml";
		InputStream inputStream=null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
	}
	
	public static FactoryManager getInstance() {
		if (instance==null) {
			instance=new FactoryManager();
		}
		
		return instance;
	}
	
	//session 얻기
	public SqlSession getSession() {		
		return sqlSessionFactory.openSession();
	}
	
	//session 닫기
	public void closeSession(SqlSession session) {
		session.close();
	}
	
	
	
}
