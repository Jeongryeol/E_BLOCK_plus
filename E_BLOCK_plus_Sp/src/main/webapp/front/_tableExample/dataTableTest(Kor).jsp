<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 기본 베이스</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>



	<!--=============== 작성부분 ===============-->

	<div class="ui container" style="margin-top: 5px;">
		<!-- 검색창 시작  -->
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="users icon"></i>
					<div class="content">제목을 적어주세욥</div>
				</h2>
			</div>
		</div>
		<table id="taable" class="ui grey fixed single line celled table">
			<thead>
				<tr>
					<th>Band</th>
					<th>Song</th>
					<th>Band</th>
					<th>Song</th>
					<th>Band</th>
					<th>Song</th>
				</tr>
			</thead>
		</table>
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
		var table = $('#taable').DataTable({

				aLengthMenu : [10, 20, 30],
				language : {
/* 				"info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
				"info"            : "", //테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				"infoEmpty"       : "", //검색 후 테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				"infoFiltered" 	  : "", //검색 후 테이블 하단에 나오는 (filtered from 100 total entries) 빈칸으로 지정
				"emptyTable"      : "데이터가 없습니다", //테이블에 데이터가 없을 때 나오는 문구 지정
				"zeroRecords"     : "검색 결과가 없습니다", //검색 결과 없을때 나오는 문구 지정
				"sLoadingRecords" : "읽는중...",
				"sProcessing"     : "처리중...",
				"search"          : "검색 : ",
				"lengthMenu"      : "_MENU_", //디폴트: "sLengthMenu": "Show _MENU_ entries",
				"paginate" : {
								"previous" : "이전",
								"next" : "다음"
							 } //페이지 네이션 버튼 한글로 변경
			},
			ajax : {
				url : "./List_JSON.jsp",
				dataSrc : 'data'
			},
			columns : [
				{
					"data" : "band"
				},
				{
					"data" : "song"
				},
				{
					"data" : "band"
				},
				{
					"data" : "song"
				},
				{
					"data" : "band"
				},
				{
					"data" : "song"
				}
			],
			columnDefs : [
				{
					targets : [ 0, 1, 2, 3, 4, 5 ],
					className : 'right aligned'
				},
/* 				{
					"targets" : [ 1 ],
					"visible" : false,
					"searchable" : false
				},
				{
					"targets" : [ 0 ],
					"visible" : true,
					"searchable" : false
				} */
	
			]
		});
	
		$('#taable th').attr("class", "center aligned");
	
		$('#taable tbody').on('click', 'tr', function() {
			var data = table.row(this).data();
			alert(data["band"]);
	
			if ($(this).hasClass('active')) {
				$(this).removeClass('active');
			} else {
				table.$('tr.active').removeClass('active');
				$(this).addClass('active');
			}
		});
	</script>
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>