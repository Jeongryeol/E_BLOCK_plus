package eblock;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.a_controller.Controller;
import util.ControllerMapper;


public class FrontServlet extends HttpServlet {
	Logger logger = Logger.getLogger(FrontServlet.class);
	
	private void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("serviceȣ�⼺��");
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length()+1);
		logger.info("command : " + command);
		
		Controller control = null;
		try {
			control = ControllerMapper.getControl(command);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//�����������[ START|if : outter ]�����������
		if(control != null) {
			String[] pageMove = null;
			try {
				String returnString = control.execute(req, res);
				//pageMove[0] ������ �̵����, pageMove[1] ����������
				pageMove = returnString.split(":");//[forward|redirect]:XXX.jsp
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//�����������[ START|if : middle ]�����������
			if(pageMove != null) {
				
				//�����������[ START|if : inner ]�����������
				if("redirect".equals(pageMove[0])) { 
					res.sendRedirect(pageMove[1]);
				}
				else if("forward".equals(pageMove[0])){
					RequestDispatcher view = req.getRequestDispatcher(pageMove[1]);
					view.forward(req, res);
				}
				else {
					res.sendRedirect(contextPath+"/fail/pageMoveFail.jsp");
					logger.info("�̵������ �ùٸ��� �ʽ��ϴ�. pageMove="+pageMove);
				}
				//�����������[ END|if : inner ]�����������
				
				logger.info("�̵����:"+pageMove[0]+", path:"+pageMove[1]);
				
			} else {
				logger.info("pageMove==null");
				res.sendRedirect(contextPath+"/fail/logicFail.jsp");
			}
			//�����������[ END|if : middle ]�����������
		} else {
			logger.info("control==null");
			res.sendRedirect(contextPath+"/fail/controlFail.jsp");
		}
		//�����������[ END|if : outter ]�����������
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doService(req,res);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doService(req,res);
	}
}
