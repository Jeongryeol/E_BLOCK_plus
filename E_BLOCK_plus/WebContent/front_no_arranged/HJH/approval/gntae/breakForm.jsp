<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴가신청페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#r_start1').calendar({
			type: 'date',
			endCalendar: $('#rangeend')
		});
		$('#r_end1').calendar({
			type: 'date',
			startCalendar: $('#rangestart')
		});
		$('#ap_sel').dropdown({
			allowCategorySelection: true
		});
		$('#gt_1').click(function() {
			location.href="breakForm.jsp";
		});
		$('#gt_2').click(function() {
			location.href=".jsp";
		});
		$('#gt_3').click(function() {
			location.href=".jsp";
		});
		$('#gt_4').click(function() {
			location.href=".jsp";
		});
		$('#bp_1').click(function() {
			location.href=".jsp";
		});
		$('#bp_2').click(function() {
			location.href=".jsp";
		});
		$('#bp_3').click(function() {
			location.href=".jsp";
		});
		$('#ts_1').click(function() {
			location.href=".jsp";
		});
		$('#ap_Ok').click(function() {
			location.href=".jsp";
		});
		$('#ap_cancel').click(function() {
			location.href=".jsp";
		});
		$('#approval').attr("class","active item");
		$('#sm_ap').attr("class","active item");
		$('#sm_ap_form').attr("class","active item");
	});
</script>
<!--=============== 작성부분 ===============--><!-- 처리완료 -->
<div class="ui container" style="margin-top:20px">
  <div class="ui compact menu">
	<div class="ui dropdown button" id="ap_sel" style="margin-right: 0px;">
	  <span class="text">결재종류</span>
	  <i class="dropdown icon"></i>
		<div class="menu">
		  <div class="active item">
		  <i class="dropdown icon"></i>
			<span class="text">근태관련</span>
			  <div class="menu">
				<div class="active item" id="gt_1">휴가신청</div>
				<div class="item" id="gt_2">반가신청</div>
				<div class="item" id="gt_3">출장신청</div>
				<div class="item" id="gt_4">외출신청</div>
			  </div>
		  </div>
		  <div class="item">
		  <i class="dropdown icon"></i>
			<span class="text">비품관련</span>
			  <div class="menu">
				<div class="item" id="bp_1">등록신청</div>
				<div class="item" id="bp_2">구매신청</div>
				<div class="item" id="bp_3">사용신청</div>
			  </div>
		  </div>
		  <div class="item">
		  <span class="text" id="ts_1">퇴사신청</span>
		  </div>
		</div>
	  </div>
  </div>
</div>
<div class="ui container" style="margin-top:20px">
  <form class="ui form">
	<h4 class="ui dividing header">휴가신청 결재서</h4>
	<div class="two fields">
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">신청사원</a>
		  <input type="text">
		</div>
	  </div>
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">결재사원</a>
		  <input type="text">
		</div>
	  </div>
	</div>
	<div class="two fields">
	  <div class="field">
		<label>시작일자</label>
		  <div class="ui calendar" id="r_start1">
			<div class="ui input left icon">
			  <i class="calendar icon"></i>
			  <input type="text" placeholder="시작일자">
			</div>
		  </div>
	  </div>
	  <div class="field">
		<label>종료일자</label>
		  <div class="ui calendar" id="r_end1">
			<div class="ui input left icon">
			  <i class="calendar icon"></i>
			  <input type="text" placeholder="종료일자">
			</div>
		  </div>
	  </div>
	</div>
	  <div class="field" style="height:300px">
		<label>결재사유</label>
		<textarea style="resize:none; height:80%"></textarea>
	  </div>
	  <div class="field">
		<div class="ui button" tabindex="0" id="ap_Ok">저장</div>
		<div class="ui button" tabindex="0" id="ap_cancel">취소</div>
	  </div>
  </form>
</div>
<!--=============== 작성부분 ===============-->
<%@ include file="/front/_includePage/sticky" %>
</body>
</html>
