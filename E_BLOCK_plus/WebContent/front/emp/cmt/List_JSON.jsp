<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%
       
	String targetName = "";//���⿡ request��ü�� ���� ����Ʈ�� name�� ������
	
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Map<String,Object> pMap = null;
	for(int i=1;i<6;i++){
	   pMap = new HashMap<String,Object>();
	   pMap.put("title", "���");
	   pMap.put("start", "2018-10-0"+i+"T08:1"+i+":55");
	   list.add(pMap);
	   pMap = new HashMap<String,Object>();
	   pMap.put("title", "���");
	   pMap.put("start", "2018-10-0"+i+"T20:1"+i+":55");
	   list.add(pMap);
	}
	Gson gs = new Gson();
	String json = gs.toJson(list);
	out.println(json);
%>