<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- phase1_table 시작 -->
<table id="phase2_table" class="ui grey single line celled table" style="width:100%">
	<thead>
		<tr>
			<th>신청번호</th>
			<th>제품번호</th>
			<th>제품명</th>
			<th>단가</th>
			<th>신청일자</th>
			<th>결재부서장</th>
			<th>결재상태</th>
			<th>결재일자</th>
			<th>신청이메일주소</th>
			<th>비고</th>
		</tr>
	</thead>
</table>
<!-- mini_table 끝-->

<!-- DataTables스크립트 시작 -->
<script type="text/javascript">
	//데이터테이블 자료뿌리기
	var ph2_table = $('#phase2_table').DataTable({
		//조회개수 조정
		aLengthMenu : [ 5, 10, 15 ],
	       //페이지 네이션 버튼 한글로 변경
		language : {
	           /*
	           "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
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
	           }
		},
		//json데이터를 요청하는 ajax옵션
		ajax:{
			//내가 요청한 견적시신청건 중 2단계결재가 완료된 건(2단계)
			url : "/E_BLOCK_plus/esti/list/list/phase2",//"./esti_phase2_JSON.jsp",
	           dataSrc : 'data' //넘겨오는 자료 매핑이름
		},
		columns : [ {
	           "data" : "ESTI_ANO" //견적신청번호
	        }, {
	           "data" : "EC_NO" //카탈로그번호
	        }, {
	           "data" : "EC_NAME"//제품명
	        }, {
	           "data" : "ESTI_PRICE"//가격
	        }, {
	           "data" : "ASK_DATE"//신청일자
	        }, {
	           "data" : "SIGN_ENO2"//결재차장 사원번호
	        }, {
	           "data" : "OUTCOME2"//차장급 결재상태
	        }, {
	           "data" : "SIGN_DATE2"//결재일자
	        }, {
	           "data" : "ESTI_EMAIL"//신청이메일주소
	        }, {
	           "data" : "NOTE"//비고
	        } ],
	       columnDefs : [ {
	          targets : [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
	           //width: "12%",
	        className : 'center aligned'
	        
	       }
	       ,{
	            targets : [ 6 ], // 결재상태
	            render : function ( data, type, row ) {
	               //해당 로우의 문자를 잘랐을때를 비교해서 렌더할 태그를 결정함
	                  return "<font color='red'>"+data+"</font>";
	                }
	         }
	       ]
	});
	
	//테이블 헤더 가운데 정렬
	$('#phase2_table th').attr("class", "center aligned");
</script>
<!-- DataTables스크립트 끝-->