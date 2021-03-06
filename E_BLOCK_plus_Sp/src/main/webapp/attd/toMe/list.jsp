<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태신청내역</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>
   <!-- sidebar -->
   <%@ include file="/front/_includePage/sidemenu.jsp"%>
   <!-- main -->
   <%@ include file="/front/_includePage/mainpage.jsp"%>

   <!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■[비품구매신청조회]■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

   <!--=============== 작성부분 ===============-->

   <div class="ui container" style="margin-top: 20px;">
      <div class="ui segment">
         <!-- 검색창 시작  -->
         <div class="ui column stackable grid container">
            <div class="column" align="center" style="padding-left: 0px;">
               <h2 class="ui header" style="padding-top: 5px;">
                  <i class="green tasks icon"></i>
                  <div class="content">근태 신청내역</div>
               </h2>
            </div>
         </div>
         <table id="taable" class="ui grey fixed single line celled table">
            <thead>
               <tr>
                  <th>번호</th>
                  <th>신청사원</th>
                  <th>신청일자</th>
                  <th>분류</th>
                  <th>신청사유</th>
                  <th>시작일자</th>
                  <th>종료일자</th>
                  <th>소요일</th>
                  <th>상태</th>
               </tr>
            </thead>
         </table>
         <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ결재버튼 시작ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
         <div align="center">
            <div class="ui orange buttons" id="btn_approval">
               <div class="ui button">선택</div>
                  <div class="ui floating dropdown icon button">
                  <i class="dropdown icon"></i>
                  <div class="menu">
                     <div class="item" id="btn_permit"><i class="thumbs up icon"></i> 승인</div>
                     <div class="item" id="btn_dismiss"><i class="thumbs down icon"></i> 기각</div>
                  </div>
               </div>
            </div>
            <script type="text/javascript">
               $('.ui.dropdown').dropdown();
            </script>
         </div>
         <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ결재버튼 종료ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
      </div>
   </div>
   <div class="ui modal" id="modal_1">
      <div class="header">상세보기</div>
      <div class="ui segment" style="margin-right: 20px; margin-left: 20px">
         <div class="ui form">
            <div class="four fields">
               <div class="field">
                  <label>신청번호</label> <input type="text" id="text_1" readonly>
               </div>
               <div class="field">
                  <label>신청사원</label> <input type="text" id="text_2" readonly>
               </div>
               <div class="field">
                  <label>신청일자</label> <input type="text" id="text_3" readonly>
               </div>
               <div class="field">
                  <label>종류</label> <input type="text" id="text_4" readonly>
               </div>
            </div>
         </div>
         <div class="ui form">
            <div class="four fields">
               <div class="field">
                  <label>소요일</label> <input type="text" id="text_5" readonly>
               </div>
               <div class="field">
                  <label>시작일자</label> <input type="text" id="text_6" readonly>
               </div>
               <div class="field">
                  <label>종료일자</label> <input type="text" id="text_7" readonly>
               </div>
               <div class="field">
                  <label>결재상태</label> <input type="text" id="text_8" readonly>
               </div>
            </div>
            <div class="field">
                  <label>결재사유</label> <input type="text" id="text_9" readonly>
               </div>
         </div>

      </div>
      <div class="actions">
         <div class="ui black deny button">닫기</div>
      </div>
   </div>
   <script>
   
	$('#sm_toMe').attr("class", "active item");
	$('#sm_toMe_attd').attr("class", "active item");
	
   $(function(){
      $('#ap_bp').attr('class', 'item active');
   });
      $.fn.dataTable.ext.errMode = '';//null 에러 오류 따로 안띄우게
      var table = $('#taable').DataTable({

         aLengthMenu : [ 10, 20, 30 ],
         language : {
            /*             "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
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
         //페이지 네이션 버튼 한글로 변경
         },
         ajax : {
            url : "/E_BLOCK_plus/attd/toMe/list.ebp",
            dataSrc : 'data'
         },
         columns : [ {
            "data" : "at_no"
         }, {
            "data" : "ask_ename"
         }, {
            "data" : "ask_date"
         }, {
            "data" : "at_sort"
         }, {
            "data" : "at_rsn"
         }, {
            "data" : "at_sdate"
         }, {
            "data" : "at_fdate"
         }, {
            "data" : "at_days"
         }, {
            "data" : "outcome"
         } ],
         columnDefs : [ {
            targets : [ 0, 3 ],
            width: "12%",
            className : 'right aligned'
         },
         {
            targets : [ 1 ], //비품이름
            width: "15%",
            className : 'right aligned'
         },
         {
            targets : [ 2 ], //수량
            width: "20%",
            className : 'center aligned'
         },
         {
            targets : [ 4 ], //수량
            width: "25%",
            className : 'center aligned'
         },
         {
            targets : [ 5,6,7 ], //수량
            width: "20%",
            className : 'center aligned'
         },
         {
            targets : [ 8 ], // 상태
            width: "20%",
            className : 'center aligned',
            render : function ( data, type, row ) {
               //해당 로우의 문자를 잘랐을때를 비교해서 렌더할 태그를 결정함
               if(data.trim()=="대기"){
                  return "<div class='ui left icon transparent input loading'>"
                        +"<i class='search icon'></i>"
                        +"<input type='text' style='width: 1px;'/>"+data+"</div>";
                  //return "<div class='ui active inline tiny loader'>"+data+"</div>";
               }
               else{
                  return data;
               }               
                }
         }

         ]
      });

      $('#taable th').attr("class", "center aligned");

      //다중선택 이벤트 설정
      $('#taable tbody').on('click', 'tr', function() {
         
         //로우의 outcome값이 '취소' 또는 '기각' 또는 '입고완료'가 아닌 로우에 대하여
         if(table.row(this).data()["outcome"]=="대기"){
            
            //취소하기
            if ($(this).hasClass('active ro')) {
               $(this).removeClass('active ro');
               $('#btn_approval').transition('jiggle')//버튼 흔들어줌
            }
            
            //선택하기
            else {
               //선택되어져 있던 로우들 중 최초의 outcome값
               var f_outcome = null;
               $('.active.ro').each(function(index, element){
                  f_outcome = $(this).children().eq(8).text();
                  return;//먼저 선택된 결재상태의 문자값만 담고 반복each문 탈출
               });
               //(이후에)현재 선택한 로우의  outcome값
               var t_outcome = $(this).children().eq(8).text();
               
               //둘을 비교해서 같거나, 혹은 먼저 선택된 로우의 outcome값이 없으면
               if(f_outcome == t_outcome || f_outcome == null){
                  $(this).addClass('active ro');//선택되도록 해줌
                  $('#btn_approval').transition('jiggle')//버튼 흔들어줌
               }
            }
         }
         
      });

      $('#btn_permit').on('click', function() {
         approval('attd-3');//승인
      });
      $('#btn_dismiss').on('click', function() {
         approval('attd-2');//기각
      });
      
      $('#taable tbody').on('dblclick', 'tr', function() {
         var data = table.row(this).data();
         $('#text_1').val(data["at_no"]);
         $('#text_2').val(data["ask_ename"]);
         $('#text_3').val(data["ask_date"]);
         $('#text_4').val(data["at_sort"]);
         $('#text_5').val(data["at_days"]);
         $('#text_6').val(data["at_sdate"]);
         $('#text_7').val(data["at_fdate"]);
         $('#text_8').val(data["outcome"]);
         $('#text_9').val(data["at_rsn"]);
         // attach events to buttons
         $('#modal_1').modal('setting', 'closable', false).modal('show');
         
      });
      
      function approval(outcome){
         //수정할 로우의 첫번째 셀(신청번호)의 값을 배열에 담음
         var tdArr = new Array();
         tdArr.push(outcome);//상태 담음
         
         $('.active.ro').each(function(index, element){
            var td = $(this).children();
            tdArr.push(td.eq(0).text());
            return;
            /* 
            td.each(function(i){//전체돌기
            tdArr.push(td.eq(i).text());
            }); */
         });
         //alert(tdArr);//배열에 담기 확인
         var param = tdArr.toString();
         //alert(param);//문자열로 전환 확인
         
         //결재진행(서버요청)
         $.ajax({
             method:'post'
            ,data:{//승인상태와 변경대상을 배열에 담아서 넘김 (ibp-3,X,X,X,..)
               "param":param
            }
            ,url:'/E_BLOCK_plus/attd/toMe/sign.ebp'
                  //결재사원번호는 로직에서 쿠키로 얻음
            ,success:function(html){
               alert('결재되었습니다.');
               location.href = "./list.jsp";//자기자신에게 페이지이동(새로고침)
            }
         });
      }
   </script>
   <!--=============== 작성부분 ===============-->


   <%@ include file="/front/_includePage/sticky"%>
</body>
</html>