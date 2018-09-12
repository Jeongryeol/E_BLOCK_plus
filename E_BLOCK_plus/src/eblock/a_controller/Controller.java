package eblock.a_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	/*******************************
	 * ��� Controller�� �����ؾ��ϴ� Interface
	 * @param req
	 * @param res
	 * @return String - ex)forward:XXX.jsp | redirect:XXX.jsp
	 * @throws Exception - ����뿡 �����ϵ��� ��ȹ
	 *******************************/
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception;
}

