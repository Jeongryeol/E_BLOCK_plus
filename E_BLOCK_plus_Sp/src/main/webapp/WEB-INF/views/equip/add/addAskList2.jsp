<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 관리</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>
	<!--=============== 작성부분 ===============-->

	<script type="text/javascript">

	function empUpdate(data) {
		$.ajax({
			method : "post",
			url : "/E_BLOCK_plus/emp/cntr/list?e_no="+data,
			success : function(result) {
				$("#UpdEmp").html(result);
				$("#emp_modal").modal('show');
			},
			error : function(xhrObject) {
				alert(xhrObject.responseText);
			}
		});
	}
	
	function deptUpdate(data) {
		//alert(data);
		$.ajax({
			method : "post",
			url : "/E_BLOCK_plus/emp/cntr/list?e_no="+data,
			success : function(result) {
				$("#SetDept").html(result);
				$("#dept_modal").modal('show');
			},
			error : function(xhrObject) {
				alert(xhrObject.responseText);
			}
		});
	}
	function emp_updata(e_no){
		$("#emp_form").attr("method","post");
		$("#emp_form").attr("action","/E_BLOCK_plus/emp/cntr/addEmp?e_no="+e_no);
		$("#emp_form").submit();
	}

	function dept_updata(e_no){
		$("#dept_form").attr("method","post");
		$("#dept_form").attr("action","/E_BLOCK_plus/emp/cntr/setDeptAuth?e_no="+e_no);
		$("#dept_form").submit();
	}

	</script>

	<div class="ui container" style="margin-top: 10px;">
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="clipboard outline icon"></i>
					<div class="content">구매신청</div>
				</h2>
			</div>
		</div>

		<div class="ui segment">
			<table id="taable" class="ui grey fixed single line celled table">
				<thead>
					<tr>
						<th>비품번호</th>
						<th>비품분류</th>
						<th>비품이름</th>
						<th>가격</th>
						<th>날짜</th>
						<th>신청</th>
					</tr>
				</thead>
			</table>
			<div align="center">
				<button class="ui button" onclick="newaa()">추가신청</button>
				<button class="ui button" onclick="back()">뒤로가기</button>
			</div>
		</div>
	</div>
	<div class="ui modal mini" id="modal">
		<div class="header">구매 신청</div>
		<div class="content">
			<div class="bady">
				<form id="f_insert">
					<div class="text">수량</div>
					<div class="ui input" style="width: 100%">
						<input type="text" name="num">
					</div>
					<div class="text">비품번호</div>
					<div class="ui input" style="width: 100%">
						<input type="text" name="eq_no" id="eq_no" readonly="readonly">
					</div>
					<div class="actions">
						<br>
						<div class="ui a button" onclick="insert()">등록</div>
						<div class="ui cancel button">취소</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		/* $('#taable').DataTable( {
			  ajax: {
			  	url:"./jsonTest.json",
				type:"POST",
				dataType:"JSON",
				dataSrc: ""
			  },
		      columns: [
		    	  
		          { data: "band" },
		          { data: "song" }
		      ]
		} );
		 */
		 $.fn.dataTable.ext.errMode ='';
		var table = $('#taable').DataTable({
			//"lengthChange": false, //페이지메뉴 없음 설정
			//페이지 메뉴 조회 수량 설정 
			//"lengthMenu": [[10, 25, 50, -1], ["10개", "25개", "50개", "All"]],
			aLengthMenu : [ 5, 10, 15 ],
				language : {
				/* 				  "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
				"info" : "", //테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				"infoEmpty" : "", //검색 후 테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				"infoFiltered" : "", //검색 후 테이블 하단에 나오는 (filtered from 100 total entries) 빈칸으로 지정
				"emptyTable" : "데이터가 없습니다", //테이블에 데이터가 없을 때 나오는 문구 지정
				"zeroRecords" : "검색 결과가 없습니다", //검색 결과 없을때 나오는 문구 지정
				"sLoadingRecords" : "읽는중...",
				"sProcessing" : "처리중...",
				"search" : "검색 : ",
				"lengthMenu" : "_MENU_", //디폴트: "sLengthMenu": "Show _MENU_ entries",
				"paginate" : {
					"previous" : "이전",
					"next" : "다음"
				} //페이지 네이션 버튼 한글로 변경
			},
			ajax : {
				url : "/E_BLOCK_plus/equip/add/equipList",
				dataSrc : 'data'
			},
	
			columns : [
				{
					"data" : "eq_no"
				},
				{
					"data" : "eq_sort"
				},
				{
					"data" : "eq_name"
				},
				{
					"data" : "cost"
				},
				{
					"data" : "eq_date"
				},
				{
					//계약 변경 버튼
				}
	
			],
			columnDefs : [
				{
					targets : /* "_all" */ [ 0, 1, 2, 3, 4, 5 ],
					className : 'center aligned'
				},
				{
					targets : [ 5 ],
					data : null,
					defaultContent : "<div class='ui small button' id='b_click' value ='신청' >신청</div>"
				}
			/* 
				    {
				         "targets": [ 6 ],
				         "visible": false, //화면에 출력, 비출력 설정
				         "searchable": false //화면에서 검색가능, 검색 불가 설정
				    },
				    {
				         "targets": [ 7 ],
				         "visible": false, //화면에 출력, 비출력 설정
				         "searchable": false //화면에서 검색가능, 검색 불가 설정
				    } 
				    {
				         "targets": [ 1 ],
				         "visible": false,
				         "searchable": false
				    },
				    {
				         "targets": [ 1 ],
				         "visible": true,
				         "searchable": false
				    } 
				    */
			]
		});	
		$('#taable th').attr("class", "center aligned");
//===================================버튼 아이디 비교===========================		
		$('#taable tbody').on('click', 'div', function() {
			if (this.id == 'b_click') {
			    //alert(this.id);
			var data = table.row($(this).parents('tr')).data();
			$('#eq_no').val(data["eq_no"]);
				
				/* Sign_up(data["eq_no"], data["eq_sort"]) */
					
			$("#modal").modal('show');
					
			} 
		});
		function newaa(){
		location.href="/E_BLOCK_plus/equip/add/newArticleAsk";
		}function back(){
			location.href="/E_BLOCK_plus/equip/add/addAskList.jsp";
			}
		function insert(){
			$("#f_insert").attr("method","post")
			$("#f_insert").attr("action","/E_BLOCK_plus/equip/purc/ask")
			$("#f_insert").submit()
		}
	</script>
	<!--=============== 작성부분 ===============-->
	<%@ include file="/front/_includePage/sticky"%>

</body>
</html>