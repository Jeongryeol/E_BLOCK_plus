package util;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//MapperConfig.xml�� ��ϵ� DB�� �����ϴ� ������ ��� ���� SQL������ �������ִ� �����ڵ�
public class MybatisSession {
	//Logger logger = Logger.getLogger(DBConnection.class);
	static String resource = "eblock/mybatis/MapperConfig.xml";//Ŀ�ؼǿ� �ʿ��� ������ ���� xml����
	public static SqlSession getSqlSession() {
		//logger.info("getConnection ȣ�� ����");
		SqlSession sqlSes = null;
		SqlSessionFactory sqlMapper = null;

		//mybatis-3.4.6.pdf 2������  �ϴ� ����
		//InputStream ��� Reader class��� : �ѱ۹���Ʈ ����
		
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			sqlSes = sqlMapper.openSession();//SqlSession ����
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(reader!=null) reader.close();//�ڿ��ݳ�
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return sqlSes;
	}
}