package eblock.c_dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSession;


public class BudgetDao {
	public BudgetDao() {
		SqlSession sqlSession = MybatisSession.getSqlSession();
	}

	public List<Map<String,Object>> ��������(Map<String, Object> pMap) {
		
		return null;
	}

	public int ������������(Map<String, Object> pMap) {
		int result = 0;
		
		return result;
	}
	
}
