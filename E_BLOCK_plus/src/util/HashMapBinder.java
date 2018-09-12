package util;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HashMapBinder {
		HttpServletRequest req = null;
		//÷������ ó���� �ʿ��� ���� ����
		MultipartRequest multi = null;
		String realFolder = "";
		//÷������ �ѱ�ó��
		String encType = "utf-8";
		
		
		//÷�������� ũ��      -------------------------------------���ؾ���-------------------------
		int maxSize = 5*1024*1024;//5MB
		
		public HashMapBinder(HttpServletRequest req) {
			this.req = req;
			//÷�������� ������ ������ �������� ��ġ -
			realFolder = "C:\\git\\E_BLOCK_plus\\E_BLOCK_plus\\WebContent\\attached";
		}
		//÷�������� �ִ� ��� ����� �� ����ڰ� �Է��� ���� pMap�� ���
		public void multiBind(Map<String,Object> pMap) {
			pMap.clear();
			try {
				multi = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			} catch (IOException e) {
				e.printStackTrace();
			}
			Enumeration<String> en = multi.getParameterNames();
			while(en.hasMoreElements()) {
				String key = en.nextElement();
				pMap.put(key, multi.getParameter(key));
			}
			//÷�����Ͽ� ���� ������ �޾ƿ��� �ڵ� �߰�
			Enumeration<String> files = multi.getFileNames();
			//�̷��� �о�� �����̸��� ��ü�� ������ش�.
			File file = null;
			while(files.hasMoreElements()) {
				String fname = files.nextElement();
				String filename = multi.getFilesystemName(fname);
				pMap.put("b_file", filename);
				//file��ü �����ϱ� -> �ֳ��ϸ� ÷�������� ũ�⸦ �˰� �;��....
				file = multi.getFile(fname);
			}
			//÷�������� ũ�⸦ ���� �� �ִ� ����
			double size = 0;
			if(file != null) {
				size = file.length();//���� ũ�Ⱑ ���� 5.2MB
				size = size/(1024*1024);
				pMap.put("b_size", size);
			}
			
		}
		public void bind(Map<String,Object> pMap) {
			pMap.clear();
			Enumeration<String> en = req.getParameterNames();
			while(en.hasMoreElements()) {
				String key = en.nextElement();
				pMap.put(key, req.getParameter(key));
			}
		}
}
