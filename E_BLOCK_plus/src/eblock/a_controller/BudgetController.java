package eblock.a_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eblock.b_logic.BudgetLogic;
import util.HashMapBinder;

public class BudgetController implements Controller {
	String work = null;
	String crud = null;
	BudgetLogic budgetLogic = null;
	
	public BudgetController(String work, String crud){
		this.work = work;
		this.crud = crud;
		budgetLogic = new BudgetLogic();
	}

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String path = null;
		
		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		
		if(work.equals("")) {
			if(crud.equals("")) {
				List<Map<String,Object>> ��������  = budgetLogic.��������_crud(pMap);
				req.setAttribute("��������", ��������); //mod
				path = "";
			}
			else if(crud.equals("")) {
				int �⼮ = budgetLogic.�⼮_crud(pMap);
				req.setAttribute("�⼮", �⼮); 
				path = "";
			}
		}
		else if(work.equals("")) {
			
			
		}
		
		return path;
	}

}
