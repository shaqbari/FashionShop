package com.fashion.mybatis;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * @author user1
 *Mybatis���� �������� �����ϱ� ���ؼ��� SqlSession�� �ʿ��ѵ�, �� SqlSession��
 *��� ���ؼ��� ���� SqlSessionFactory ��ü�� �ʿ��ϸ�, �� Factory�� ��� ���ؼ���
 *ȯ�漳�� xml�� ��Ʈ���� �̿��Ͽ� �о�� �Ѵ�.
 *���� �� ������ �ڵ带 DAO�� ������ �ۼ����� �ʱ� ���� �� ���� Ŭ������ �����ϵ��� �Ѵ�.
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
	
	//session ���
	public SqlSession getSession() {		
		return sqlSessionFactory.openSession();
	}
	
	//session �ݱ�
	public void closeSession(SqlSession session) {
		session.close();
	}
	
	
	
}
