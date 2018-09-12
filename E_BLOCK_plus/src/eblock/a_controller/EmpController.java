package eblock.a_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.b_logic.EmpLogic;
import util.HashMapBinder;

public class EmpController implements Controller {
	Logger logger = Logger.getLogger(EmpController.class);
	String work = null;
	String crud = null;
	EmpLogic empLogic = null;

	public EmpController(String work, String crud) {
		this.work = work;
		this.crud = crud;
		empLogic = new EmpLogic();
	}
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("excute ȣ�� ����, work:"+work+", crud:"+crud);
		
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		
		
		String name = null; //attribute�� name
		String path = null; //forward:xxx.jsp
		Object robj = null; //
		
		//work�� crud�� �־�� ��Ʈ�ѷ��� �����ǹǷ� NullPointerException�� �������� ������ �����̴�.
		if(work.equals("login")) {
			//�α����ϱ�
			if(crud.equals("check")) {
				robj = empLogic.login_check(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
		}
		//������ȸ
		else if(work.equals("info")) {
			//������տ� ���� ���ǿ� ������ȸ�ϱ�
			if(crud.equals("empList")) {
				robj = empLogic.info_empList(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
			//��� �������� ��ȸ�ϱ�
			else if(crud.equals("persList")) {
				robj = empLogic.info_persList(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
			//��� �������� ���úκ� �����ϱ�
			else if(crud.equals("persUpd")) {
				robj = empLogic.info_persUpd(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
		}
		//�λ���
		else if(work.equals("pev")) {
			//�λ��� �Ⱓ�� �λ��� �Է��ϱ�
			if(crud.equals("add")) {
				robj = empLogic.pev_add(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
			//�λ��� �Ⱓ�� �λ��� �����ϱ�
			else if(crud.equals("update")) {
				robj = empLogic.pev_upd(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
			//���� ���ѳ��� ��ȸ�ϱ�(Ÿ���� �����Ұ�)
			else if(crud.equals("myList")) {
				robj = empLogic.pev_myList(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
		}
		//���
		else if(work.equals("cmt")) {
			//��� üũ�ϱ�
			if(crud.equals("checkIn")) {
				robj = empLogic.cmt_checkIn(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
			//��� ��ȸ�ϱ�
			else if(crud.equals("myList")) {
				robj = empLogic.cmt_myList(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
		}
		//�λ����
		else if(work.equals("cntr")) {
			//�λ��� ����ϱ�
			if(crud.equals("addEmp")) {
				robj = empLogic.cntr_addEmp(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
			//�μ������ϱ� �� �̵��ϱ�
			else if(crud.equals("setDept")) {
				robj = empLogic.cntr_setDept(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
		}
		//���
		else if(work.equals("retire")) {
			//��� ��û�ϱ�
			if(crud.equals("ask")) {
				robj = empLogic.retire_ask(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
				
			}
			//����û ��ȸ�ϱ�
			else if(crud.equals("list")) {
				robj = empLogic.retire_list(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
			//����û ó���ϱ�
			else if(crud.equals("sign")) {
				robj = empLogic.retire_sign(pMap);
				name ="attribute�� name";
				path="forward:xxx.jsp";
			}
		}

		if(path.contains("forward")) {
			req.setAttribute(name, robj);
		}
		return path;
	}
}
